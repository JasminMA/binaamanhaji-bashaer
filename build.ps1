<#
.SYNOPSIS
  Generates the lecture pages (level2/stage3/<course>/lectureN.html) from src/, and sw.js (the offline service worker) from src/sw.template.js.

.DESCRIPTION
  Every course folder under src/ holds:
    course.json      course name, wording, and the ordered list of lessons (number + title)
    lectureN.html    ONLY the lesson body: from <header> to the end of the last <section>
  The shared page shell, breadcrumb and previous/next bars live once in src/templates/.
  src/site.json names the folders above a course (level / stage) for the breadcrumb.

  Output goes to the same path outside src/ (src/level2/stage3/x/lecture1.html ->
  level2/stage3/x/lecture1.html). The generated pages are committed, so GitHub Pages and
  opening a file straight from disk keep working with no build step on the server.

  Run from the repository root (no installs needed, Windows PowerShell 5.1 or PowerShell 7):
    powershell -NoProfile -ExecutionPolicy Bypass -File build.ps1            # write pages
    powershell -NoProfile -ExecutionPolicy Bypass -File build.ps1 -Check     # exit 1 if any page is stale

  Keep this file ASCII-only: Windows PowerShell 5.1 reads BOM-less scripts as ANSI.
#>
[CmdletBinding()]
param(
    [switch]$Check
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

# Any error: print only the human-readable message (not a stack trace) and fail.
trap {
    $e = $_.Exception
    while ($null -ne $e.InnerException) { $e = $e.InnerException }
    Write-Host "build.ps1 failed: $($e.Message)"
    exit 1
}

$root   = $PSScriptRoot
$srcDir = Join-Path $root 'src'
$utf8   = New-Object System.Text.UTF8Encoding($false)   # UTF-8, no BOM

function Read-Text([string]$path) {
    # UTF-8 in, LF line endings out (working copies may be CRLF because of git autocrlf).
    return ([System.IO.File]::ReadAllText($path, $utf8)).Replace("`r`n", "`n")
}

function Read-Json([string]$path) {
    return (Read-Text $path) | ConvertFrom-Json
}

function Get-Template([string]$name) {
    $path = Join-Path (Join-Path $srcDir 'templates') ($name + '.html')
    if (-not (Test-Path -LiteralPath $path)) { throw "Missing template: src/templates/$name.html" }
    return (Read-Text $path).TrimEnd("`n")
}

function Esc([string]$s) {
    return $s.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;').Replace('"', '&quot;')
}

# Replaces {{token}} in one pass; the inserted values are never scanned again, so lesson
# content may contain anything. An unknown token is an error (catches template typos).
function Render([string]$template, [hashtable]$vars, [string]$what) {
    $evaluator = [System.Text.RegularExpressions.MatchEvaluator]{
        param($m)
        $key = $m.Groups[1].Value
        if (-not $vars.ContainsKey($key)) { throw "Template '$what' uses unknown token {{$key}}" }
        return [string]$vars[$key]
    }
    return [regex]::Replace($template, '\{\{(\w+)\}\}', $evaluator)
}

function ConvertTo-ArabicDigits([int]$n) {
    $chars = $n.ToString().ToCharArray() | ForEach-Object { [char](0x0660 + [int][string]$_) }
    return -join $chars
}

# ---------------------------------------------------------------------------------------

$site = Read-Json (Join-Path $srcDir 'site.json')
foreach ($field in 'baseUrl', 'siteName', 'ancestors') {
    if ($null -eq $site.PSObject.Properties[$field]) { throw "src/site.json is missing '$field'" }
}
$baseUrl = [string]$site.baseUrl
if (-not $baseUrl.StartsWith('https://') -or -not $baseUrl.EndsWith('/')) { throw "src/site.json baseUrl must start with https:// and end with /" }
$ancestorLabel = @{}
foreach ($a in $site.ancestors) { $ancestorLabel[[string]$a.path] = [string]$a.label }

$tpl = @{}
foreach ($name in 'lecture', 'breadcrumb', 'crumb-link', 'crumb-sep', 'crumb-current', 'crumb-review', 'crumb-search', 'pager', 'pager-prev', 'pager-next') {
    $tpl[$name] = Get-Template $name
}

$courseFiles = @(Get-ChildItem -Path $srcDir -Recurse -Filter 'course.json')
if ($courseFiles.Count -eq 0) { throw 'No course.json found under src/' }

$stale = New-Object System.Collections.Generic.List[string]
$written = 0
$unchanged = 0
$pages = 0
$deckLessons = New-Object System.Collections.Generic.List[object]   # lesson bodies kept for the flashcard deck

foreach ($cf in $courseFiles) {
    $rel = $cf.DirectoryName.Substring($srcDir.Length).Trim('\', '/').Replace('\', '/')   # level2/stage3/<course>
    $segments = @($rel.Split('/'))
    $depth = $segments.Count
    $up = '../' * $depth                                                                   # path back to the repo root

    $course = Read-Json $cf.FullName
    foreach ($field in 'name', 'titleSuffix', 'labels', 'lessons') {
        if ($null -eq $course.PSObject.Properties[$field]) { throw "$rel/course.json is missing '$field'" }
    }
    foreach ($field in 'lesson', 'all', 'prev', 'next') {
        if ($null -eq $course.labels.PSObject.Properties[$field]) { throw "$rel/course.json is missing labels.$field" }
    }

    # Breadcrumb trail above the lesson: site root, level, stage, then this course's index page.
    $trail = New-Object System.Collections.Generic.List[object]
    for ($i = 0; $i -lt $depth; $i++) {
        $prefix = ''                                                                       # folder path of this ancestor
        if ($i -gt 0) { $prefix = $segments[0..($i - 1)] -join '/' }
        if (-not $ancestorLabel.ContainsKey($prefix)) { throw "src/site.json has no ancestor label for '$prefix'" }
        $trail.Add(@{ href = ('../' * ($depth - $i)) + 'index.html'; label = $ancestorLabel[$prefix] })
    }
    $trail.Add(@{ href = 'index.html'; label = [string]$course.name })

    # Lessons: ordered by number, and they must match the lectureN.html files exactly.
    $lessons = @($course.lessons | Sort-Object { [int]$_.n })
    $wanted = @($lessons | ForEach-Object { 'lecture' + $_.n + '.html' })
    if (@($wanted | Select-Object -Unique).Count -ne $wanted.Count) { throw "$rel/course.json lists a lesson number twice" }
    $have = @(Get-ChildItem -Path $cf.DirectoryName -Filter 'lecture*.html' | ForEach-Object { $_.Name })
    foreach ($w in $wanted) { if ($have -notcontains $w) { throw "$rel/course.json lists $w but src/$rel/$w does not exist" } }
    foreach ($h in $have)   { if ($wanted -notcontains $h) { throw "src/$rel/$h exists but is not listed in $rel/course.json" } }

    for ($k = 0; $k -lt $lessons.Count; $k++) {
        $lesson = $lessons[$k]
        $file = 'lecture' + $lesson.n + '.html'
        $srcRel = "src/$rel/$file"

        $content = (Read-Text (Join-Path $cf.DirectoryName $file)).Trim("`n")
        # Every section gets an id (sec-1, sec-2...) so search results can open the exact section.
        $secParts = $content -split '<section>'
        $content = $secParts[0]
        for ($si = 1; $si -lt $secParts.Count; $si++) { $content += ('<section id="sec-' + $si + '">') + $secParts[$si] }
        $deckLessons.Add(@{ course = $segments[$segments.Count - 1]; courseName = [string]$course.name; n = [int]$lesson.n; title = [string]$lesson.title; path = "$rel/$file"; content = $content })
        if ($content -match '(?i)<!doctype|<html[\s>]|<head[\s>]|<body[\s>]|</body>|</html>') {
            throw "$srcRel must contain only the lesson body (no doctype/html/head/body); the template adds those."
        }
        if ($content -notmatch '^<header id="main" tabindex="-1">') { throw "$srcRel should start with <header id=""main"" tabindex=""-1""> (the skip-link target)" }

        # Breadcrumb
        $items = New-Object System.Collections.Generic.List[string]
        foreach ($t in $trail) {
            $items.Add((Render $tpl['crumb-link'] @{ href = $t.href; label = (Esc $t.label) } 'crumb-link'))
            $items.Add($tpl['crumb-sep'])
        }
        $currentLabel = [string]$course.labels.lesson + ' ' + (ConvertTo-ArabicDigits ([int]$lesson.n))
        $items.Add((Render $tpl['crumb-current'] @{ label = (Esc $currentLabel) } 'crumb-current'))
        $items.Add((Render $tpl['crumb-review'] @{ href = ($up + 'review/index.html') } 'crumb-review'))
        $items.Add((Render $tpl['crumb-search'] @{ href = ($up + 'search/index.html') } 'crumb-search'))
        $breadcrumb = Render $tpl['breadcrumb'] @{ items = ($items -join '') } 'breadcrumb'

        # Previous / next bar (printed above and below the lesson)
        $links = ''
        if ($k -gt 0) {
            $links += (Render $tpl['pager-prev'] @{ href = ('lecture' + $lessons[$k - 1].n + '.html'); label = (Esc ([string]$course.labels.prev)) } 'pager-prev') + "`n"
        }
        if ($k -lt $lessons.Count - 1) {
            $links += (Render $tpl['pager-next'] @{ href = ('lecture' + $lessons[$k + 1].n + '.html'); label = (Esc ([string]$course.labels.next)) } 'pager-next') + "`n"
        }
        $pager = Render $tpl['pager'] @{ all = (Esc ([string]$course.labels.all)); links = $links } 'pager'

        if ($null -eq $lesson.PSObject.Properties['description'] -or ([string]$lesson.description).Trim() -eq '') {
            throw "$rel/course.json: lesson $($lesson.n) needs a non-empty description (used for search and share previews)"
        }

        $page = Render $tpl['lecture'] @{
            source      = $srcRel
            title       = (Esc ([string]$lesson.title + [string]$course.titleSuffix))
            description = (Esc ([string]$lesson.description))
            siteName    = (Esc ([string]$site.siteName))
            pageUrl     = ($baseUrl + "$rel/$file")
            imageUrl    = ($baseUrl + 'assets/og-card.png')
            root       = $up
            breadcrumb = $breadcrumb
            pager      = $pager
            content    = $content
        } 'lecture'
        $page += "`n"

        $outPath = Join-Path $root ("$rel/$file").Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        $pages++
        $current = $null
        if (Test-Path -LiteralPath $outPath) { $current = Read-Text $outPath }
        if ($current -ceq $page) { $unchanged++; continue }

        if ($Check) {
            $stale.Add("$rel/$file")
        } else {
            [System.IO.File]::WriteAllText($outPath, $page, $utf8)
            $written++
        }
    }
}

# ---------------------------------------------------------------------------------------------
# Site search: assets/search-index.js holds the text of every page, one entry per section, for
# search/index.html + assets/search.js to match in the browser (no server, works offline).
# Quizzes are left out (they repeat the lesson). Everything is derived from the pages on disk.
# ---------------------------------------------------------------------------------------------
function Json-Str([string]$s) {
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.Append('"')
    foreach ($ch in $s.ToCharArray()) {
        $c = [int]$ch
        if ($ch -eq [char]34) { [void]$sb.Append('\"') }
        elseif ($ch -eq [char]92) { [void]$sb.Append('\') }
        elseif ($c -lt 32 -or $c -eq 8232 -or $c -eq 8233) { [void]$sb.Append(('\u{0:x4}' -f $c)) }
        else { [void]$sb.Append($ch) }
    }
    [void]$sb.Append('"')
    return $sb.ToString()
}

function Html-Text([string]$html) {
    $t = [regex]::Replace($html, '<[^>]*>', ' ')
    $t = [System.Net.WebUtility]::HtmlDecode($t)
    return ([regex]::Replace($t, '\s+', ' ')).Trim()
}

$searchDir = Join-Path $root 'search'
$searchPage = Join-Path $searchDir 'index.html'
$searchGenerated = $false
if (Test-Path -LiteralPath $searchPage) {
    $skipSearch = '/.git/', '/.github/', '/.claude/', '/src/', '/tools/', '/node_modules/', '/refs/'
    $htmlPages = New-Object System.Collections.Generic.List[string]
    foreach ($f in Get-ChildItem -Path $root -Recurse -File -Force -Filter '*.html') {
        $relPath = $f.FullName.Substring($root.Length).TrimStart([char]92, [char]47).Replace([string][char]92, '/')
        $skipIt = $false
        foreach ($d in $skipSearch) { if (('/' + $relPath).Contains($d)) { $skipIt = $true } }
        if ($skipIt -or $relPath -eq 'search/index.html') { continue }
        $htmlPages.Add($relPath)
    }
    $pageList = $htmlPages.ToArray()
    [Array]::Sort($pageList, [System.StringComparer]::Ordinal)

    $lines = New-Object System.Collections.Generic.List[string]
    $entryCount = 0
    foreach ($p in $pageList) {
        $html = Read-Text (Join-Path $root $p)
        $html = [regex]::Replace($html, '<!--.*?-->', '', 'Singleline')
        $html = [regex]::Replace($html, '<script\b[^>]*>.*?</script>', '', 'Singleline')
        $html = [regex]::Replace($html, '<style\b[^>]*>.*?</style>', '', 'Singleline')
        $html = [regex]::Replace($html, '<form\b[^>]*class="quiz".*?</form>', '', 'Singleline')
        $html = [regex]::Replace($html, '<div class="quiz"[^>]*>.*?</div>', '', 'Singleline')     # open Q&A (details): no nested div inside
        $titleMatch = [regex]::Match($html, '<title>(.*?)</title>', 'Singleline')
        if (-not $titleMatch.Success) { throw "$p has no <title>; the search index needs it" }
        $pageTitle = Html-Text $titleMatch.Groups[1].Value
        $bodyStart = $html.IndexOf('<body')
        if ($bodyStart -lt 0) { throw "$p has no <body>" }
        $body = $html.Substring($bodyStart)

        # the page's own header (title, subtitle, chips) first, then every <section>
        $hm = [regex]::Match($body, '<header\b.*?</header>', 'Singleline')
        $chunks = New-Object System.Collections.Generic.List[object]
        if ($hm.Success) { $chunks.Add(@{ heading = ''; anchor = ''; html = $hm.Value }) }
        foreach ($sm in [regex]::Matches($body, '<section\b([^>]*)>(.*?)</section>', 'Singleline')) {
            $inner = $sm.Groups[2].Value
            if ($inner.Contains('<section')) { throw "$p has nested <section> elements; the search index needs them flat" }
            $anchor = ''
            $im = [regex]::Match($sm.Groups[1].Value, '\bid="([^"]+)"')
            if ($im.Success) { $anchor = $im.Groups[1].Value }
            $heading = ''
            $h2 = [regex]::Match($inner, '<h2\b[^>]*>(.*?)</h2>', 'Singleline')
            if ($h2.Success) {
                $heading = Html-Text ([regex]::Replace($h2.Groups[1].Value, '<span class="tag">.*?</span>', '', 'Singleline'))
                $inner = $inner.Remove($h2.Index, $h2.Length)
            }
            $chunks.Add(@{ heading = $heading; anchor = $anchor; html = $inner })
        }
        foreach ($ch in $chunks) {
            $text = Html-Text $ch.html
            if ($text.Length -lt 3) { continue }
            $lines.Add('{"p":' + (Json-Str $p) + ',"t":' + (Json-Str $pageTitle) + ',"s":' + (Json-Str $ch.heading) + ',"a":' + (Json-Str $ch.anchor) + ',"x":' + (Json-Str $text) + '}')
            $entryCount++
        }
    }
    $indexJs = "/* Generated by build.ps1 - do not edit this file. Search index: one entry per page section (p = page, t = page title, s = section heading, a = section id, x = text). */`n" +
        'window.BM_SEARCH=[' + "`n" + ($lines -join ",`n") + "`n" + '];' + "`n"
    $indexPath = Join-Path $root 'assets/search-index.js'
    $indexCurrent = $null
    if (Test-Path -LiteralPath $indexPath) { $indexCurrent = Read-Text $indexPath }
    if ($indexCurrent -cne $indexJs) {
        if ($Check) { $stale.Add('assets/search-index.js') }
        else { [System.IO.File]::WriteAllText($indexPath, $indexJs, $utf8); $searchGenerated = $true }
    }
    Write-Host ("search index: {0} entries from {1} pages ({2} KB)" -f $entryCount, $pageList.Count, [int]($utf8.GetByteCount($indexJs) / 1024))
}

# ---------------------------------------------------------------------------------------------
# Flashcards: assets/cards-data.js holds the review deck of every lesson, for review/index.html +
# assets/review.js. Cards are cut from what the lesson pages already say:
#   q = a multiple-choice review question  -> front: the question, back: the marked answer (+ explanation)
#   o = an open review question (details)  -> front: the question, back: the answer
#   s = a bold-led summary point           -> front: the bold heading, back: the rest of the point
#   z = any other summary point with bold  -> front: the sentence with the bold words blanked, back: those words
# A card id is a short hash of course, lesson, kind and front text, so a card keeps its review
# history when the lessons around it change (and starts fresh when its own question changes).
# ---------------------------------------------------------------------------------------------
$cardLessonSets = New-Object System.Collections.Generic.List[object]
$cardTotal = 0
$cardSeen = @{}
$sha1 = [System.Security.Cryptography.SHA1]::Create()
$khulasa = -join ([char]0x062E, [char]0x0644, [char]0x0627, [char]0x0635)   # the root of the Arabic word for "summary" (this file stays ASCII-only)
foreach ($dl in $deckLessons) {
    $cards = New-Object System.Collections.Generic.List[object]
    function Add-Card([string]$kind, [string]$front, [string]$back, [string]$extra, [string]$anchor) {
        if ($front.Length -lt 2 -or $back.Length -lt 1) { throw "$($dl.path): empty flashcard ($kind) near section $anchor" }
        $hashBytes = $sha1.ComputeHash($utf8.GetBytes($dl.course + '|' + $dl.n + '|' + $kind + '|' + $front + '|' + $back))
        $cid = (($hashBytes | ForEach-Object { $_.ToString('x2') }) -join '').Substring(0, 8)
        if ($cardSeen.ContainsKey($cid)) { throw "$($dl.path): two flashcards with the same text (id $cid): $front | $back" }
        $cardSeen[$cid] = $true
        $cards.Add(@{ i = $cid; k = $kind; f = $front; b = $back; x = $extra; a = $anchor })
    }
    foreach ($sm in [regex]::Matches($dl.content, '<section id="(sec-\d+)">(.*?)</section>', 'Singleline')) {
        $anchor = $sm.Groups[1].Value
        $inner = $sm.Groups[2].Value
        foreach ($mm in [regex]::Matches($inner, '<div class="mcq">(.*?)</div>', 'Singleline')) {
            $mb = $mm.Groups[1].Value
            $qm = [regex]::Match($mb, '<p class="q">(.*?)</p>', 'Singleline')
            $em = [regex]::Match($mb, '<p class="exp">(.*?)</p>', 'Singleline')
            $oks = [regex]::Matches($mb, '<label class="opt ok">.*?<span class="t">(.*?)</span>', 'Singleline')
            if (-not $qm.Success -or $oks.Count -ne 1) { throw "$($dl.path): a multiple-choice question needs a <p class=""q""> and exactly one 'opt ok' option (section $anchor)" }
            $extra = ''; if ($em.Success) { $extra = Html-Text $em.Groups[1].Value }
            Add-Card 'q' (Html-Text $qm.Groups[1].Value) (Html-Text $oks[0].Groups[1].Value) $extra $anchor
        }
        foreach ($qb in [regex]::Matches($inner, '<div class="quiz"[^>]*>(.*?)</div>', 'Singleline')) {
            foreach ($dm in [regex]::Matches($qb.Groups[1].Value, '<details>\s*<summary>(.*?)</summary>\s*<p>(.*?)</p>\s*</details>', 'Singleline')) {
                Add-Card 'o' (Html-Text $dm.Groups[1].Value) (Html-Text $dm.Groups[2].Value) '' $anchor
            }
        }
        $h2 = [regex]::Match($inner, '<h2\b[^>]*>(.*?)</h2>', 'Singleline')
        if ($h2.Success -and ((Html-Text $h2.Groups[1].Value) -match $khulasa)) {
            foreach ($lm in [regex]::Matches($inner, '<li>(.*?)</li>', 'Singleline')) {
                $li = $lm.Groups[1].Value.Trim()
                $bolds = @([regex]::Matches($li, '<b>(.*?)</b>', 'Singleline'))
                if ($bolds.Count -eq 0) { continue }
                $full = Html-Text $li
                if ($li.StartsWith('<b>')) {
                    $label = (Html-Text $bolds[0].Groups[1].Value).TrimEnd(':', [char]0x061B, ' ')
                    $rest = (Html-Text $li.Substring($bolds[0].Length)).TrimStart(':', ' ')
                    if ($label.Length -ge 2 -and $rest.Length -ge 12) { Add-Card 's' $label $rest '' $anchor; continue }
                }
                $blanked = $li
                $answers = New-Object System.Collections.Generic.List[string]
                foreach ($bm in $bolds) { $answers.Add((Html-Text $bm.Groups[1].Value)) }
                $blanked = [regex]::Replace($li, '<b>.*?</b>', '[ ... ]', 'Singleline')
                $front = Html-Text $blanked
                if ($front.Length -lt 25) { continue }
                Add-Card 'z' $front ($answers -join ' / ') $full $anchor
            }
        }
    }
    if ($cards.Count -eq 0) { throw "$($dl.path): no flashcards could be cut from this lesson" }
    $cardTotal += $cards.Count
    $cardLessonSets.Add(@{ dl = $dl; cards = $cards })
}

$cardJson = New-Object System.Collections.Generic.List[string]
foreach ($courseId in @($cardLessonSets | ForEach-Object { $_.dl.path } | ForEach-Object { $_.Substring(0, $_.LastIndexOf('/')) } | Select-Object -Unique | Sort-Object { $_ } )) {
    $mine = @($cardLessonSets | Where-Object { $_.dl.path.StartsWith($courseId + '/') } | Sort-Object { $_.dl.n })
    $lessonJson = New-Object System.Collections.Generic.List[string]
    foreach ($ls in $mine) {
        $cj = New-Object System.Collections.Generic.List[string]
        foreach ($c in $ls.cards) {
            $cj.Add('{"i":' + (Json-Str $c.i) + ',"k":' + (Json-Str $c.k) + ',"f":' + (Json-Str $c.f) + ',"b":' + (Json-Str $c.b) + ',"x":' + (Json-Str $c.x) + ',"a":' + (Json-Str $c.a) + '}')
        }
        $lessonJson.Add('{"n":' + $ls.dl.n + ',"t":' + (Json-Str $ls.dl.title) + ',"p":' + (Json-Str $ls.dl.path) + ',"c":[' + "`n" + ($cj -join ",`n") + "`n" + ']}')
    }
    $cardJson.Add('{"id":' + (Json-Str $mine[0].dl.course) + ',"name":' + (Json-Str $mine[0].dl.courseName) + ',"lessons":[' + "`n" + ($lessonJson -join ",`n") + "`n" + ']}')
}
$cardsJs = "/* Generated by build.ps1 - do not edit this file. Flashcards cut from the lessons (i = id, k = kind q/o/s/z, f = front, b = back, x = extra, a = section id). */`n" +
    'window.BM_CARDS={"courses":[' + "`n" + ($cardJson -join ",`n") + "`n" + ']};' + "`n"
$cardsPath = Join-Path $root 'assets/cards-data.js'
$cardsCurrent = $null
if (Test-Path -LiteralPath $cardsPath) { $cardsCurrent = Read-Text $cardsPath }
$cardsGenerated = $false
if ($cardsCurrent -cne $cardsJs) {
    if ($Check) { $stale.Add('assets/cards-data.js') }
    else { [System.IO.File]::WriteAllText($cardsPath, $cardsJs, $utf8); $cardsGenerated = $true }
}
Write-Host ("flashcards: {0} cards from {1} lessons ({2} KB)" -f $cardTotal, $deckLessons.Count, [int]($utf8.GetByteCount($cardsJs) / 1024))

# ---------------------------------------------------------------------------------------------
# Offline support: sw.js (the service worker) lists every file to keep in the browser cache.
# The list is built from the files on disk and the version is a hash of their content, so the
# browser re-downloads the site exactly when something changed. See src/README.md.
# ---------------------------------------------------------------------------------------------
$swTemplate = Join-Path $srcDir 'sw.template.js'
$swGenerated = $false
if (Test-Path -LiteralPath $swTemplate) {
    $skipDirs = '/.git/', '/.github/', '/.claude/', '/src/', '/tools/', '/node_modules/', '/refs/'
    $keepExt = '.html', '.css', '.js', '.svg', '.png', '.woff2', '.webmanifest'
    $textExt = '.html', '.css', '.js', '.svg', '.webmanifest'
    $cacheFiles = New-Object System.Collections.Generic.List[string]
    foreach ($f in Get-ChildItem -Path $root -Recurse -File -Force) {
        $relPath = $f.FullName.Substring($root.Length).TrimStart([char]92, [char]47).Replace([string][char]92, '/')
        $skipIt = $false
        foreach ($d in $skipDirs) { if (('/' + $relPath).Contains($d)) { $skipIt = $true } }
        if ($skipIt) { continue }
        if ($keepExt -notcontains $f.Extension.ToLower()) { continue }
        if ($relPath -eq 'sw.js' -or $relPath -eq 'assets/og-card.png') { continue }   # the worker itself; the card is for chat apps only
        if ($relPath -notmatch '^[A-Za-z0-9_./-]+$') { throw "${relPath}: file names that are cached for offline use must use only letters, digits and _ . / -" }
        $cacheFiles.Add($relPath)
    }
    $sorted = $cacheFiles.ToArray()
    [Array]::Sort($sorted, [System.StringComparer]::Ordinal)

    $ms = New-Object System.IO.MemoryStream
    foreach ($p in $sorted) {
        $bytes = [System.IO.File]::ReadAllBytes((Join-Path $root $p))
        if ($textExt -contains [System.IO.Path]::GetExtension($p).ToLower()) {
            $bytes = $utf8.GetBytes($utf8.GetString($bytes).Replace("`r`n", "`n"))      # same hash with LF or CRLF checkouts
        }
        $head = $utf8.GetBytes($p + [string][char]0)
        $ms.Write($head, 0, $head.Length)
        $ms.Write($bytes, 0, $bytes.Length)
    }
    $sha = [System.Security.Cryptography.SHA256]::Create()
    $version = (($sha.ComputeHash($ms.ToArray()) | ForEach-Object { $_.ToString('x2') }) -join '').Substring(0, 12)

    $list = "[`n" + (($sorted | ForEach-Object { '  "' + $_ + '"' }) -join ",`n") + "`n]"
    $sw = (Read-Text $swTemplate).Replace('{{version}}', $version).Replace('{{files}}', $list)
    if (-not $sw.EndsWith("`n")) { $sw += "`n" }

    $swPath = Join-Path $root 'sw.js'
    $swCurrent = $null
    if (Test-Path -LiteralPath $swPath) { $swCurrent = Read-Text $swPath }
    if ($swCurrent -cne $sw) {
        if ($Check) { $stale.Add('sw.js') }
        else { [System.IO.File]::WriteAllText($swPath, $sw, $utf8); $swGenerated = $true }
    }
    Write-Host ("offline cache: {0} files, version {1}" -f $sorted.Count, $version)
}

if ($Check) {
    if ($stale.Count -gt 0) {
        Write-Host "Out of date: $($stale.Count) generated file(s) (of $pages pages plus the search index, the flashcard deck and sw.js). Run build.ps1 and commit the result:"
        $stale | ForEach-Object { Write-Host "  $_" }
        exit 1
    }
    Write-Host "All $pages generated pages, the search index, the flashcard deck and sw.js are up to date."
} else {
    $swNote = ''; if ($searchGenerated) { $swNote += '; search index rewritten' }; if ($cardsGenerated) { $swNote += '; flashcard deck rewritten' }; if ($swGenerated) { $swNote += '; sw.js rewritten' }
    Write-Host "$pages pages: $written written, $unchanged already up to date$swNote."
}
