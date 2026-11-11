<#
.SYNOPSIS
  Checks every page of the site: structure, RTL/accessibility, links, orphans, CSS and security.
  Exit code 1 if any ERROR is found (warnings do not fail the run).

.DESCRIPTION
  Run from anywhere (no installs needed, Windows PowerShell 5.1 or PowerShell 7):
    powershell -NoProfile -ExecutionPolicy Bypass -File tools/check-site.ps1
  GitHub runs the same script on every push (.github/workflows/checks.yml).

  What it checks
    build      generated lecture pages are up to date with src/ (build.ps1 -Check)
    structure  doctype, <html lang="ar" dir="rtl">, charset, viewport, title, one aria-current,
               one <h1> per lecture, balanced tags, every <svg> labelled (role="img" + aria-label) or aria-hidden
    css        right shared stylesheet linked with the right ../ depth, no copied <style> in lecture
               pages, shared CSS has dark mode and closed comments (a stray */ silently drops a rule)
    ids        no duplicate ids; #fragment links and url(#x) references resolve
    links      every internal link points to a real file (and a real #fragment); no root-absolute links;
               no page that cannot be reached from the home page (orphans)
    security   no external scripts or http://, no inline handlers, no HTML-injection sinks in scripts,
               target=_blank has rel="noopener noreferrer", iframes sandboxed, no trackers,
               no local paths / emails / keys in published files

  Keep this file ASCII-only: Windows PowerShell 5.1 reads BOM-less scripts as ANSI.
#>
[CmdletBinding()]
param()

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

trap {
    $e = $_.Exception
    while ($null -ne $e.InnerException) { $e = $e.InnerException }
    Write-Host "check-site.ps1 crashed: $($e.Message)"
    Write-Host $_.ScriptStackTrace
    exit 2
}

$root = Split-Path -Parent $PSScriptRoot
$utf8 = New-Object System.Text.UTF8Encoding($false)
$inCI = ($env:GITHUB_ACTIONS -eq 'true')

$script:errors = 0
$script:warnings = 0

function Add-Issue([string]$level, [string]$file, [int]$line, [string]$msg) {
    if ($level -eq 'error') { $script:errors++ } else { $script:warnings++ }
    $where = $file
    if ($line -gt 0) { $where = "${file}:$line" }
    if ($inCI) {
        $ann = if ($level -eq 'error') { 'error' } else { 'warning' }
        $lineArg = if ($line -gt 0) { ",line=$line" } else { '' }
        Write-Host "::$ann file=$file$lineArg::$msg"
    } else {
        Write-Host ("{0,-7} {1}  {2}" -f $level.ToUpper(), $where, $msg)
    }
}
function Fail([string]$file, [int]$line, [string]$msg) { Add-Issue 'error' $file $line $msg }
function Warn([string]$file, [int]$line, [string]$msg) { Add-Issue 'warning' $file $line $msg }

function Read-Text([string]$path) {
    return ([System.IO.File]::ReadAllText($path, $utf8)).Replace("`r`n", "`n")
}
function Line-Of([string]$text, [int]$index) {
    if ($index -le 0) { return 1 }
    return $text.Substring(0, [Math]::Min($index, $text.Length)).Split("`n").Count
}
function Rel([string]$full) {
    return $full.Substring($root.Length).TrimStart('\', '/').Replace('\', '/')
}
# Replace matches with the same number of newlines so line numbers of what remains stay right.
function Blank-Out([string]$text, [string]$pattern) {
    $ev = [System.Text.RegularExpressions.MatchEvaluator]{ param($m) return ("`n" * ($m.Value.Split("`n").Count - 1)) }
    return [regex]::Replace($text, $pattern, $ev, 'IgnoreCase,Singleline')
}
# 'a/b' + '../c' -> 'a/c' ; $null when the link climbs above the repository root.
function Resolve-Link([string]$fromDir, [string]$href) {
    $parts = New-Object System.Collections.Generic.List[string]
    if ($fromDir -ne '') { $parts.AddRange([string[]]$fromDir.Split('/')) }
    foreach ($seg in $href.Split('/')) {
        if ($seg -eq '' -or $seg -eq '.') { continue }
        if ($seg -eq '..') {
            if ($parts.Count -eq 0) { return $null }
            $parts.RemoveAt($parts.Count - 1)
        } else { $parts.Add($seg) }
    }
    return ($parts -join '/')
}

# ---------------------------------------------------------------------------------------
# Collect files
# ---------------------------------------------------------------------------------------
$skipDirs = '/.git/', '/src/', '/.claude/', '/node_modules/'
$allFiles = @(Get-ChildItem -Path $root -Recurse -File -Force | Where-Object {
    $r = '/' + (Rel $_.FullName)
    $keep = $true
    foreach ($d in $skipDirs) { if ($r.Contains($d)) { $keep = $false } }
    $keep
})
$pages = @($allFiles | Where-Object { $_.Extension -eq '.html' })
$cssFiles = @($allFiles | Where-Object { $_.Extension -eq '.css' })
if ($pages.Count -eq 0) { throw 'No .html pages found - wrong folder?' }

$fileExists = @{}                       # every published file, by repo-relative path
foreach ($f in $allFiles) { $fileExists[(Rel $f.FullName)] = $true }

$pageInfo = @{}                         # rel -> @{ ids = HashSet; links = list }

# ---------------------------------------------------------------------------------------
# 0. Generated pages are up to date
# ---------------------------------------------------------------------------------------
$buildScript = Join-Path $root 'build.ps1'
if (Test-Path -LiteralPath $buildScript) {
    $exe = (Get-Process -Id $PID).Path
    $argList = @('-NoProfile')
    if ([System.Environment]::OSVersion.Platform -eq 'Win32NT') { $argList += @('-ExecutionPolicy', 'Bypass') }
    $argList += @('-File', $buildScript, '-Check')
    $out = (& $exe @argList 2>&1 | ForEach-Object { "$_" }) -join ' | '
    if ($LASTEXITCODE -ne 0) { Fail 'build.ps1' 0 "generated pages are stale or the build failed. Run build.ps1 and commit the result. ($out)" }
}

# ---------------------------------------------------------------------------------------
# 1. Per-page checks
# ---------------------------------------------------------------------------------------
$balanceTags = 'div', 'section', 'nav', 'header', 'footer', 'main', 'svg', 'g', 'defs', 'marker', 'pattern',
               'text', 'tspan', 'details', 'summary', 'ul', 'ol', 'table', 'thead', 'tbody', 'form', 'label',
               'button', 'a', 'span', 'b', 'strong', 'em', 'h1', 'h2', 'h3', 'h4'
$fontHosts = 'fonts.googleapis.com', 'fonts.gstatic.com'
$trackers = 'google-analytics|googletagmanager|gtag\(|doubleclick|facebook\.net|connect\.facebook|hotjar|clarity\.ms|mixpanel|segment\.(io|com)|plausible\.io|matomo|fullstory|sentry\.io|statcounter|yandex\.ru/metrika'
$sinks = 'innerHTML|outerHTML|insertAdjacentHTML|document\.write|\beval\s*\(|new\s+Function|\bsrcdoc\b|javascript:|setTimeout\s*\(\s*[''"`]|setInterval\s*\(\s*[''"`]'
$untrustedSources = 'location\.(search|hash)|document\.referrer|localStorage|sessionStorage'
$network = '\bfetch\s*\(|XMLHttpRequest|sendBeacon|WebSocket|EventSource|new\s+Image\s*\('

# Rules for JavaScript, whether inline in a page or a file under assets/.
function Test-ScriptCode([string]$rel, [string]$code, [int]$line) {
    if ($code -match $sinks) { Fail $rel $line "HTML-injection sink in script ($($Matches[0])); use textContent/classList/dataset instead" }
    if ($code -match $network) { Fail $rel $line "network call in script ($($Matches[0])); this static site must not send or load data from scripts" }
    if ($code -match 'addEventListener\(\s*[''"]message[''"]|postMessage') { Fail $rel $line 'postMessage/message listener needs a manual security review (event.origin check)' }
    if ($code -match $untrustedSources) { Warn $rel $line "script reads $($Matches[0]); make sure the value is never used as HTML, a URL or a class name, and storage access is in try/catch" }
}

# Share previews: the public address of the site (src/site.json) decides what og:url and og:image must look like.
$siteJson = Join-Path $root 'src/site.json'
$baseUrl = ''
if (Test-Path -LiteralPath $siteJson) { $baseUrl = [string]((Read-Text $siteJson) | ConvertFrom-Json).baseUrl }
$ogImages = @{}          # og:image path (relative to the repo) -> first page that uses it

function Get-Meta([string]$html, [string]$attr, [string]$name) {
    $m = [regex]::Match($html, "<meta\s+$attr=""$([regex]::Escape($name))""\s+content=""([^""]*)""", 'IgnoreCase')
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

foreach ($pf in $pages) {
    $rel = Rel $pf.FullName
    $dir = ''
    if ($rel.Contains('/')) { $dir = $rel.Substring(0, $rel.LastIndexOf('/')) }
    $depth = 0
    if ($dir -ne '') { $depth = $dir.Split('/').Count }
    $up = '../' * $depth
    $raw = Read-Text $pf.FullName

    # Split out scripts and styles so HTML checks do not look inside them.
    $scripts = [regex]::Matches($raw, '<script\b([^>]*)>(.*?)</script>', 'IgnoreCase,Singleline')
    $styles = [regex]::Matches($raw, '<style\b[^>]*>(.*?)</style>', 'IgnoreCase,Singleline')
    $body = Blank-Out $raw '<!--.*?-->'
    $body = Blank-Out $body '<script\b[^>]*>.*?</script>'
    $body = Blank-Out $body '<style\b[^>]*>.*?</style>'

    $isLecture = ($pf.Name -match '^lecture\d+\.html$')
    $isIndex = ($pf.Name -eq 'index.html')

    # --- structure ---------------------------------------------------------------
    if ($raw -notmatch '^\s*<!doctype html>') { Fail $rel 1 'page must start with <!doctype html>' }
    if ($raw -notmatch '<html\b[^>]*\blang="ar"') { Fail $rel 0 'missing <html lang="ar">' }
    if ($raw -notmatch '<html\b[^>]*\bdir="rtl"') { Fail $rel 0 'missing <html dir="rtl">' }
    if ($raw -notmatch '<meta\s+charset="utf-8"') { Fail $rel 0 'missing <meta charset="utf-8">' }
    if ($raw -notmatch '<meta\s+name="viewport"[^>]*width=device-width') { Fail $rel 0 'missing viewport meta (width=device-width)' }
    $t = [regex]::Match($raw, '<title>(.*?)</title>', 'Singleline')
    if (-not $t.Success -or $t.Groups[1].Value.Trim() -eq '') { Fail $rel 0 'missing or empty <title>' }

    # search and share previews (WhatsApp, Telegram...): description, Open Graph block, icons
    $desc = Get-Meta $raw 'name' 'description'
    if ($null -eq $desc -or $desc.Trim().Length -lt 20) { Fail $rel 0 'missing or too short <meta name="description"> (at least 20 characters)' }
    elseif ($desc.Length -gt 300) { Warn $rel 0 "meta description is $($desc.Length) characters; search and chat apps cut it, keep it under about 300" }
    foreach ($prop in 'og:title', 'og:description', 'og:type', 'og:url', 'og:image', 'og:site_name') {
        if ($null -eq (Get-Meta $raw 'property' $prop)) { Fail $rel 0 "missing <meta property=""$prop""> (share preview)" }
    }
    if ($raw -notmatch '<link\s+rel="icon"') { Fail $rel 0 'missing <link rel="icon"> (favicon)' }
    if ($raw -notmatch '<link\s+rel="apple-touch-icon"') { Fail $rel 0 'missing <link rel="apple-touch-icon">' }
    if ($baseUrl -ne '') {
        $expectedUrl = $baseUrl + $rel
        if ($rel -eq 'index.html') { $expectedUrl = $baseUrl }
        elseif ($rel.EndsWith('/index.html')) { $expectedUrl = $baseUrl + $rel.Substring(0, $rel.Length - 'index.html'.Length) }
        $ogUrl = Get-Meta $raw 'property' 'og:url'
        if ($null -ne $ogUrl -and $ogUrl -ne $expectedUrl) { Fail $rel 0 "og:url is $ogUrl but this page lives at $expectedUrl" }
        $ogImg = Get-Meta $raw 'property' 'og:image'
        if ($null -ne $ogImg) {
            if (-not $ogImg.StartsWith($baseUrl)) { Fail $rel 0 "og:image must be an absolute address under $baseUrl (chat apps cannot read relative ones)" }
            else {
                $imgRel = $ogImg.Substring($baseUrl.Length)
                if (-not $ogImages.ContainsKey($imgRel)) { $ogImages[$imgRel] = $rel }
            }
        }
    }

    $cur = [regex]::Matches($body, 'aria-current="page"').Count
    if ($cur -ne 1) { Fail $rel 0 "expected exactly one aria-current=""page"" (the current breadcrumb item), found $cur" }
    if ($isLecture) {
        $h1 = [regex]::Matches($body, '<h1\b').Count
        if ($h1 -ne 1) { Fail $rel 0 "lecture page needs exactly one <h1>, found $h1" }
    }

    # tags that are always closed must balance
    foreach ($tag in $balanceTags) {
        $opens = [regex]::Matches($body, "<$tag(?=[\s>/])(?:[^>""']|""[^""]*""|'[^']*')*(?<!/)>", 'IgnoreCase').Count
        $closes = [regex]::Matches($body, "</$tag\s*>", 'IgnoreCase').Count
        if ($opens -ne $closes) { Fail $rel 0 "unbalanced <$tag>: $opens opening vs $closes closing" }
    }

    # every svg is either decorative (aria-hidden) or labelled
    foreach ($m in [regex]::Matches($body, '<svg\b[^>]*>', 'IgnoreCase')) {
        $tag = $m.Value
        $hidden = ($tag -match 'aria-hidden="true"')
        $labelled = ($tag -match 'role="img"') -and ($tag -match 'aria-label="[^"]+"')
        if (-not $hidden -and -not $labelled) { Fail $rel (Line-Of $body $m.Index) '<svg> needs role="img" + aria-label, or aria-hidden="true" if decorative' }
    }

    # quizzes: assets/quiz.js scores them, so every question needs exactly one marked right answer
    $quizNames = New-Object 'System.Collections.Generic.HashSet[string]'
    foreach ($q in [regex]::Matches($body, '<div class="mcq">(.*?)(?=<div class="mcq">|</form>|</section>|\z)', 'Singleline')) {
        $qLine = Line-Of $body $q.Index
        $okCount = [regex]::Matches($q.Groups[1].Value, 'class="opt ok"').Count
        if ($okCount -ne 1) { Fail $rel $qLine "quiz question must have exactly one right answer (class=""opt ok""), found $okCount" }
        $names = @([regex]::Matches($q.Groups[1].Value, '<input\b[^>]*type="radio"[^>]*\bname="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique)
        $radioCount = [regex]::Matches($q.Groups[1].Value, 'type="radio"').Count
        if ($radioCount -lt 2) { Fail $rel $qLine "quiz question needs at least 2 radio options, found $radioCount" }
        if ($names.Count -ne 1) { Fail $rel $qLine 'all options of one quiz question must share one radio name' }
        elseif (-not $quizNames.Add($names[0])) { Fail $rel $qLine "radio name ""$($names[0])"" is used by two questions, so they would interfere" }
        if ($q.Groups[1].Value -notmatch 'class="exp"') { Warn $rel $qLine 'quiz question has no explanation (class="exp")' }
    }

    # diagrams drawn with fixed hex colours only follow dark mode inside a .dia panel (the CSS re-tones that panel)
    $outsideDia = Blank-Out $body '<div class="dia">.*?</svg>'
    foreach ($m in [regex]::Matches($outsideDia, '<svg\b[^>]*>.*?</svg>', 'IgnoreCase,Singleline')) {
        if ($m.Value -match 'aria-hidden="true"') { continue }
        # white labels on coloured badges (<text fill="#fff">) are handled by a dark-mode CSS rule, so they are fine
        $withoutWhiteLabels = [regex]::Replace($m.Value, '<text\b[^>]*\bfill="#fff"[^>]*>', '')
        if ($withoutWhiteLabels -match '(?:fill|stroke)="#[0-9A-Fa-f]{3,8}"') {
            Warn $rel (Line-Of $outsideDia $m.Index) 'svg uses fixed hex colours outside a .dia panel, so it will not follow dark mode. Use var(--...) colours, or wrap it in <div class="dia">.'
        }
    }

    # --- stylesheet --------------------------------------------------------------
    $linkedCss = @([regex]::Matches($body, '<link\b[^>]*\brel="stylesheet"[^>]*\bhref="([^"]+)"', 'IgnoreCase') | ForEach-Object { $_.Groups[1].Value })
    if ($isIndex) {
        if ($linkedCss -notcontains ($up + 'assets/site.css')) { Fail $rel 0 "index page must link ${up}assets/site.css" }
    }
    if ($isLecture) {
        if ($linkedCss -notcontains ($up + 'assets/lecture.css')) { Fail $rel 0 "lecture page must link ${up}assets/lecture.css" }
        foreach ($s in $styles) {
            if ($s.Groups[1].Value -match ':root') { Fail $rel (Line-Of $raw $s.Index) 'lecture page carries its own copy of the shared styles (:root); keep styles in assets/lecture.css' }
        }
    }

    # --- ids and references ------------------------------------------------------
    $ids = New-Object 'System.Collections.Generic.HashSet[string]'
    foreach ($m in [regex]::Matches($body, '[\s"''<]id="([^"]+)"')) {
        if (-not $ids.Add($m.Groups[1].Value)) { Fail $rel (Line-Of $body $m.Index) "duplicate id=""$($m.Groups[1].Value)"" (SVG url(#id) references would hit the wrong element)" }
    }
    foreach ($m in [regex]::Matches($body, 'url\(\s*#([^)\s]+)\s*\)')) {
        if (-not $ids.Contains($m.Groups[1].Value)) { Fail $rel (Line-Of $body $m.Index) "url(#$($m.Groups[1].Value)) points to no element" }
    }

    # --- links -------------------------------------------------------------------
    $links = New-Object System.Collections.Generic.List[object]    # internal links, resolved later
    foreach ($m in [regex]::Matches($body, '<(\w+)\b((?:[^>"'']|"[^"]*"|''[^'']*'')*)>', 'IgnoreCase')) {
        $tagName = $m.Groups[1].Value.ToLower()
        $attrs = $m.Groups[2].Value
        $line = Line-Of $body $m.Index

        # inline event handlers
        if ($attrs -match '(?:^|\s)on[a-z]+\s*=') { Fail $rel $line "inline event handler in <$tagName>; use addEventListener in a script instead" }

        # target=_blank
        if ($attrs -match 'target="_blank"') {
            $relAttr = [regex]::Match($attrs, 'rel="([^"]*)"').Groups[1].Value
            if ($relAttr -notmatch 'noopener' -or $relAttr -notmatch 'noreferrer') { Fail $rel $line 'target="_blank" needs rel="noopener noreferrer"' }
        }
        if ($tagName -eq 'iframe' -and $attrs -notmatch '\ssandbox') { Fail $rel $line '<iframe> without sandbox' }

        foreach ($am in [regex]::Matches($attrs, '(?:^|\s)(href|src|xlink:href)\s*=\s*"([^"]*)"')) {
            $attr = $am.Groups[1].Value
            $href = $am.Groups[2].Value.Trim()
            if ($href -eq '' -or $href -eq '#') { continue }
            if ($href -match '^(mailto:|tel:|data:image/)') { continue }
            if ($href -match '^javascript:') { Fail $rel $line 'javascript: URL'; continue }
            if ($href -match '^http://') { Fail $rel $line "insecure http:// URL ($href)"; continue }
            if ($href -match '^//') { Fail $rel $line "protocol-relative URL ($href)"; continue }
            if ($href -match '^https://') {
                $h = ([uri]$href).Host.ToLower()
                if ($tagName -ne 'a' -and $fontHosts -notcontains $h) { Fail $rel $line "external resource from $h (only Google Fonts may be loaded from outside; an <a> link is fine)" }
                continue
            }
            if ($href.StartsWith('/')) { Fail $rel $line "root-absolute link ($href) breaks on a GitHub Pages project site; use a relative path"; continue }
            if ($href -match '^[a-zA-Z][a-zA-Z0-9+.-]*:') { Fail $rel $line "unexpected URL scheme ($href)"; continue }

            $frag = ''
            $pathPart = $href
            if ($href.Contains('#')) { $pathPart = $href.Substring(0, $href.IndexOf('#')); $frag = $href.Substring($href.IndexOf('#') + 1) }
            if ($pathPart.Contains('?')) { $pathPart = $pathPart.Substring(0, $pathPart.IndexOf('?')) }
            $links.Add(@{ line = $line; path = $pathPart; frag = $frag; attr = $attr; tag = $tagName; href = $href })
        }
    }

    # --- scripts -----------------------------------------------------------------
    foreach ($s in $scripts) {
        $attrs = $s.Groups[1].Value
        $code = $s.Groups[2].Value
        $line = Line-Of $raw $s.Index
        $srcM = [regex]::Match($attrs, '\bsrc\s*=\s*"([^"]*)"')
        if ($srcM.Success -and $srcM.Groups[1].Value -match '^(https?:)?//') { Fail $rel $line "external script ($($srcM.Groups[1].Value)); scripts must be inline or a local file under assets/" }
        elseif ($srcM.Success -and $srcM.Groups[1].Value.Trim() -ne '') {
            # a local script file must exist (scripts are blanked out of $body, so the link loop never saw this src)
            $sp = $srcM.Groups[1].Value.Trim()
            if ($sp.StartsWith('/')) { Fail $rel $line "root-absolute script path ($sp); use a relative path" }
            else { $links.Add(@{ line = $line; path = $sp.Split('?')[0]; frag = ''; attr = 'src'; tag = 'script'; href = $sp }) }
        }
        Test-ScriptCode $rel $code $line
    }

    # --- trackers ----------------------------------------------------------------
    if ($raw -match $trackers) { Fail $rel 0 "tracking/analytics reference ($($Matches[0]))" }

    $pageInfo[$rel] = @{ ids = $ids; links = $links; dir = $dir; isHtml = $true }
}

# ---------------------------------------------------------------------------------------
# 2. Cross-page: links resolve, fragments exist, no orphans
# ---------------------------------------------------------------------------------------
$edges = @{}                            # page -> html pages it links to
foreach ($rel in $pageInfo.Keys) {
    $info = $pageInfo[$rel]
    $edges[$rel] = New-Object System.Collections.Generic.List[string]
    foreach ($l in $info.links) {
        $target = $rel
        if ($l.path -ne '') {
            $decoded = [uri]::UnescapeDataString($l.path)
            $target = Resolve-Link $info.dir $decoded
            if ($null -eq $target) { Fail $rel $l.line "link climbs above the repository root ($($l.href))"; continue }
            if ($decoded.EndsWith('/') -or $target -eq '') {
                $target = (($target + '/index.html').TrimStart('/'))
            }
            if (-not $fileExists.ContainsKey($target)) {
                $asDir = $target + '/index.html'
                if ($fileExists.ContainsKey($asDir)) { $target = $asDir }
                else { Fail $rel $l.line "broken link: $($l.href) (no such file: $target)"; continue }
            }
        }
        if ($target.EndsWith('.html') -and $pageInfo.ContainsKey($target)) {
            if ($target -ne $rel) { $edges[$rel].Add($target) }
            if ($l.frag -ne '') {
                $f = [uri]::UnescapeDataString($l.frag)
                if (-not $pageInfo[$target].ids.Contains($f)) { Fail $rel $l.line "link to #$f, but $target has no element with that id" }
            }
        }
    }
}

# orphans: everything must be reachable from the home page
$homePage = 'index.html'
if (-not $pageInfo.ContainsKey($homePage)) {
    Fail $homePage 0 'home page index.html is missing'
} else {
    $seen = New-Object 'System.Collections.Generic.HashSet[string]'
    $queue = New-Object System.Collections.Generic.Queue[string]
    [void]$seen.Add($homePage); $queue.Enqueue($homePage)
    while ($queue.Count -gt 0) {
        $p = $queue.Dequeue()
        foreach ($n in $edges[$p]) { if ($seen.Add($n)) { $queue.Enqueue($n) } }
    }
    foreach ($rel in ($pageInfo.Keys | Sort-Object)) {
        if (-not $seen.Contains($rel)) { Fail $rel 0 'orphan page: no link path leads to it from index.html' }
    }
}

# share-preview images must exist and be 1200x630 PNGs (read from the PNG header, no image library needed)
foreach ($k in $ogImages.Keys) {
    $imgPath = Join-Path $root $k
    if (-not (Test-Path -LiteralPath $imgPath)) { Fail $ogImages[$k] 0 "og:image points to $k, which does not exist in the repository"; continue }
    $bytes = [System.IO.File]::ReadAllBytes($imgPath)
    $isPng = ($bytes.Length -gt 24 -and $bytes[0] -eq 0x89 -and $bytes[1] -eq 0x50 -and $bytes[2] -eq 0x4E -and $bytes[3] -eq 0x47)
    if (-not $isPng) { Fail $k 0 'share-preview image must be a PNG'; continue }
    $w = ($bytes[16] * 16777216) + ($bytes[17] * 65536) + ($bytes[18] * 256) + $bytes[19]
    $h = ($bytes[20] * 16777216) + ($bytes[21] * 65536) + ($bytes[22] * 256) + $bytes[23]
    if ($w -ne 1200 -or $h -ne 630) { Fail $k 0 "share-preview image is ${w}x${h}; the og:image tags declare 1200x630" }
    if ($bytes.Length -gt 5MB) { Warn $k 0 'share-preview image is over 5 MB; WhatsApp may skip it' }
}

# ---------------------------------------------------------------------------------------
# 3. Shared CSS
# ---------------------------------------------------------------------------------------
foreach ($cf in $cssFiles) {
    $rel = Rel $cf.FullName
    $css = Read-Text $cf.FullName
    $noComments = [regex]::Replace($css, '/\*.*?\*/', '', 'Singleline')
    if ($noComments.Contains('/*')) { Fail $rel 0 'unclosed /* comment: everything after it is ignored by browsers' }
    if ($noComments.Contains('*/')) { Fail $rel 0 'stray */ (a comment closed early, so the rule right after it is silently dropped; do not put */ inside comment text)' }
    $open = $noComments.Split('{').Count - 1
    $close = $noComments.Split('}').Count - 1
    if ($open -ne $close) { Fail $rel 0 "unbalanced braces: $open { vs $close }" }
    if ($noComments -notmatch ':root\s*\{') { Fail $rel 0 'no :root{...} colour variables' }
    if ($noComments -notmatch 'prefers-color-scheme:\s*dark') { Fail $rel 0 'no dark mode (@media (prefers-color-scheme: dark))' }
    if ($noComments -notmatch ':root\[data-theme="dark"\]') { Fail $rel 0 'no :root[data-theme="dark"] rule' }
    foreach ($m in [regex]::Matches($noComments, '(?:url\(\s*[''"]?|@import\s+[''"]?)(https?:)?//([^/''")\s]+)')) {
        if ($fontHosts -notcontains $m.Groups[2].Value.ToLower()) { Fail $rel 0 "CSS loads from external host $($m.Groups[2].Value)" }
    }
    if ($css -match 'http://') { Fail $rel 0 'insecure http:// URL in CSS' }
}

# ---------------------------------------------------------------------------------------
# 3b. Shared scripts (assets/*.js)
# ---------------------------------------------------------------------------------------
$jsFiles = @($allFiles | Where-Object { $_.Extension -eq '.js' })
foreach ($jf in $jsFiles) {
    Test-ScriptCode (Rel $jf.FullName) (Read-Text $jf.FullName) 0
}

# ---------------------------------------------------------------------------------------
# 4. Secrets and local paths in anything that gets published
# ---------------------------------------------------------------------------------------
$secretPatterns = @(
    @{ re = '[A-Za-z]:\\(Users|projects|Documents)\\'; what = 'Windows local path' },
    @{ re = '/(Users|home)/[A-Za-z0-9._-]+/'; what = 'local home path' },
    @{ re = '[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+\.[A-Za-z]{2,}'; what = 'email address' },
    @{ re = 'AKIA[0-9A-Z]{16}'; what = 'AWS access key' },
    @{ re = 'gh[pousr]_[A-Za-z0-9]{30,}'; what = 'GitHub token' },
    @{ re = 'sk-[A-Za-z0-9]{20,}'; what = 'API key' },
    @{ re = '-----BEGIN [A-Z ]*PRIVATE KEY'; what = 'private key' },
    @{ re = '(?i)\bapi[_-]?key\s*[:=]\s*["''][^"'']{8,}'; what = 'API key assignment' }
)
$textExt = '.html', '.css', '.js', '.json', '.yml', '.yaml', '.svg', '.txt', '.xml'
foreach ($f in $allFiles) {
    if ($textExt -notcontains $f.Extension.ToLower()) { continue }
    $rel = Rel $f.FullName
    $text = Read-Text $f.FullName
    foreach ($p in $secretPatterns) {
        $m = [regex]::Match($text, $p.re)
        if ($m.Success) { Fail $rel (Line-Of $text $m.Index) "$($p.what) in a published file ($($m.Value))" }
    }
}

# ---------------------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------------------
Write-Host ""
Write-Host ("Checked {0} pages, {1} stylesheets, {2} script file(s): {3} error(s), {4} warning(s)." -f $pages.Count, $cssFiles.Count, $jsFiles.Count, $script:errors, $script:warnings)
if ($script:errors -gt 0) { exit 1 }
Write-Host 'All checks passed.'
