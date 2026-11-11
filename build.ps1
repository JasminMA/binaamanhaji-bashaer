<#
.SYNOPSIS
  Generates the lecture pages (level2/stage3/<course>/lectureN.html) from src/.

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
foreach ($name in 'lecture', 'breadcrumb', 'crumb-link', 'crumb-sep', 'crumb-current', 'pager', 'pager-prev', 'pager-next') {
    $tpl[$name] = Get-Template $name
}

$courseFiles = @(Get-ChildItem -Path $srcDir -Recurse -Filter 'course.json')
if ($courseFiles.Count -eq 0) { throw 'No course.json found under src/' }

$stale = New-Object System.Collections.Generic.List[string]
$written = 0
$unchanged = 0
$pages = 0

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
        if ($content -match '(?i)<!doctype|<html[\s>]|<head[\s>]|<body[\s>]|</body>|</html>') {
            throw "$srcRel must contain only the lesson body (no doctype/html/head/body); the template adds those."
        }
        if ($content -notmatch '^<header>') { throw "$srcRel should start with <header>" }

        # Breadcrumb
        $items = New-Object System.Collections.Generic.List[string]
        foreach ($t in $trail) {
            $items.Add((Render $tpl['crumb-link'] @{ href = $t.href; label = (Esc $t.label) } 'crumb-link'))
            $items.Add($tpl['crumb-sep'])
        }
        $currentLabel = [string]$course.labels.lesson + ' ' + (ConvertTo-ArabicDigits ([int]$lesson.n))
        $items.Add((Render $tpl['crumb-current'] @{ label = (Esc $currentLabel) } 'crumb-current'))
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

if ($Check) {
    if ($stale.Count -gt 0) {
        Write-Host "Out of date ($($stale.Count) of $pages pages). Run build.ps1 and commit the result:"
        $stale | ForEach-Object { Write-Host "  $_" }
        exit 1
    }
    Write-Host "All $pages generated pages are up to date."
} else {
    Write-Host "$pages pages: $written written, $unchanged already up to date."
}
