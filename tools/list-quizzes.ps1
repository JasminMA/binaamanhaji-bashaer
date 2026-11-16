<#
.SYNOPSIS
  Lists every quiz question on the site with its marked answer and explanation, plus mechanical red flags,
  so the answers can be re-checked against the lesson text and the transcript (see the quiz-answer-check skill).

.DESCRIPTION
  Reads the published pages (not src/), finds each <div class="mcq"> and prints:
    Q<n>. question
      1) option      (the one marked correct is tagged [CORRECT])
      ...
      Explanation: ...
  Then a summary per page and overall:
    - where the marked answer sits (1st/2nd/3rd/4th): a strong lean to one position makes answers guessable;
    - how often the marked answer is also the longest option (a common authoring bias);
    - red flags: no or several marked answers, duplicate options, the marked option repeated in another option,
      a missing explanation.
  It only READS files. Whether an answer is actually right is a judgement against the sources: the lesson, then the
  transcript in refs/.

  Usage (from the repository root):
    powershell -NoProfile -ExecutionPolicy Bypass -File tools/list-quizzes.ps1                       # whole site
    powershell -NoProfile -ExecutionPolicy Bypass -File tools/list-quizzes.ps1 -Path hadith-sciences/nazm-almuaeen
    powershell -NoProfile -ExecutionPolicy Bypass -File tools/list-quizzes.ps1 -Path hadith-sciences/nazm-almuaeen/lecture2.html
    ... -Summary      only the per-page counts and red flags, without the questions

  Keep this file ASCII-only: Windows PowerShell 5.1 reads BOM-less scripts as ANSI.
#>
[CmdletBinding()]
param(
    [string]$Path = '.',
    [switch]$Summary
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch { }

$root = Split-Path -Parent $PSScriptRoot
$utf8 = New-Object System.Text.UTF8Encoding($false)

function Clean([string]$html) {
    $t = [regex]::Replace($html, '<[^>]*>', ' ')
    $t = [System.Net.WebUtility]::HtmlDecode($t)
    return ([regex]::Replace($t, '\s+', ' ')).Trim()
}

$target = $Path
if (-not [System.IO.Path]::IsPathRooted($target)) { $target = Join-Path $root $target }
if (-not (Test-Path -LiteralPath $target)) { throw "Path not found: $Path" }

$skip = '/.git/', '/.github/', '/.claude/', '/src/', '/tools/', '/node_modules/', '/refs/'
$files = @()
if (Test-Path -LiteralPath $target -PathType Leaf) { $files = @(Get-Item -LiteralPath $target) }
else { $files = @(Get-ChildItem -LiteralPath $target -Recurse -File -Filter '*.html') }
$files = @($files | Where-Object {
    $r = '/' + $_.FullName.Substring($root.Length).TrimStart([char]92, [char]47).Replace([string][char]92, '/')
    $keep = $true
    foreach ($d in $skip) { if ($r.Contains($d)) { $keep = $false } }
    $keep
} | Sort-Object { $_.FullName })

$totalQ = 0
$totalOpen = 0
$totalFlags = 0
$positionTotals = @(0, 0, 0, 0, 0, 0)
$longestTotal = 0
$pagesWithQuiz = 0

foreach ($f in $files) {
    $rel = $f.FullName.Substring($root.Length).TrimStart([char]92, [char]47).Replace([string][char]92, '/')
    $html = [System.IO.File]::ReadAllText($f.FullName, $utf8)
    $html = [regex]::Replace($html, '<!--.*?-->', '', 'Singleline')
    # The last question is followed by the reset button (or by </form> when a quiz has none).
    $questions = [regex]::Matches($html, '<div class="mcq">(.*?)</div>\s*(?=<div class="mcq">|<button\b|</form>)', 'Singleline')
    if ($questions.Count -eq 0) {
        # open-ended review questions: <div class="quiz"><details><summary>question</summary><p>answer</p></details>...
        $qaBlock = [regex]::Match($html, '<div class="quiz"[^>]*>(.*?)</div>', 'Singleline')
        if (-not $qaBlock.Success) { continue }
        $pairs = [regex]::Matches($qaBlock.Groups[1].Value, '<details[^>]*>\s*<summary>(.*?)</summary>(.*?)</details>', 'Singleline')
        if ($pairs.Count -eq 0) { continue }
        $pagesWithQuiz++
        $totalOpen += $pairs.Count
        Write-Output "=== $rel ($($pairs.Count) open questions, answer shown on click) ==="
        $k = 0
        foreach ($pm in $pairs) {
            $k++
            $a = Clean $pm.Groups[2].Value
            if (-not $Summary) {
                Write-Output "Q$k. $(Clean $pm.Groups[1].Value)"
                Write-Output "  Answer: $a"
                Write-Output ''
            }
            if ($a.Length -lt 5) { $totalFlags++; Write-Output "  FLAG: Q$k has no real answer text" }
        }
        Write-Output ''
        continue
    }
    $pagesWithQuiz++

    $lines = New-Object System.Collections.Generic.List[string]
    $flags = New-Object System.Collections.Generic.List[string]
    $positions = @(0, 0, 0, 0, 0, 0)
    $longest = 0
    $qn = 0
    foreach ($qm in $questions) {
        $qn++
        $block = $qm.Groups[1].Value
        $qText = ''
        $q = [regex]::Match($block, '<p class="q">(.*?)</p>', 'Singleline')
        if ($q.Success) { $qText = Clean $q.Groups[1].Value } else { $flags.Add("Q$qn has no question text (<p class=""q"">)") }
        $opts = New-Object System.Collections.Generic.List[object]
        foreach ($om in [regex]::Matches($block, '<label class="opt( ok)?"[^>]*>(.*?)</label>', 'Singleline')) {
            $t = [regex]::Match($om.Groups[2].Value, '<span class="t">(.*?)</span>', 'Singleline')
            $text = ''
            if ($t.Success) { $text = Clean $t.Groups[1].Value } else { $text = Clean $om.Groups[2].Value }
            $opts.Add(@{ text = $text; ok = ($om.Groups[1].Value -ne '') })
        }
        $exp = ''
        $e = [regex]::Match($block, '<p class="exp">(.*?)</p>', 'Singleline')
        if ($e.Success) { $exp = Clean $e.Groups[1].Value } else { $flags.Add("Q$qn has no explanation") }

        $okIdx = @()
        for ($i = 0; $i -lt $opts.Count; $i++) { if ($opts[$i].ok) { $okIdx += ($i + 1) } }
        if ($okIdx.Count -ne 1) { $flags.Add("Q$qn has $($okIdx.Count) options marked correct (needs exactly 1)") }
        if ($opts.Count -lt 3) { $flags.Add("Q$qn has only $($opts.Count) options") }
        $texts = @($opts | ForEach-Object { $_.text })
        if (@($texts | Select-Object -Unique).Count -ne $texts.Count) { $flags.Add("Q$qn has two identical options") }
        if ($okIdx.Count -eq 1) {
            $okText = $opts[$okIdx[0] - 1].text
            $positions[[Math]::Min($okIdx[0], 5)]++
            $maxLen = ($texts | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
            if ($okText.Length -eq $maxLen -and @($texts | Where-Object { $_.Length -eq $maxLen }).Count -eq 1) { $longest++ }
            if ($exp -ne '' -and $okText.Length -gt 12) {
                for ($i = 0; $i -lt $opts.Count; $i++) {
                    if ($i -ne ($okIdx[0] - 1) -and $opts[$i].text.Contains($okText)) { $flags.Add("Q$qn option $($i + 1) contains the whole text of the marked answer") }
                }
            }
        }

        $lines.Add("Q$qn. $qText")
        for ($i = 0; $i -lt $opts.Count; $i++) {
            $tag = '   '
            if ($opts[$i].ok) { $tag = '[CORRECT]' }
            $lines.Add(("  {0}) {1} {2}" -f ($i + 1), $tag, $opts[$i].text))
        }
        $lines.Add("  Explanation: $exp")
        $lines.Add('')
    }

    $total = $questions.Count
    $totalQ += $total
    $totalFlags += $flags.Count
    $longestTotal += $longest
    for ($i = 1; $i -le 5; $i++) { $positionTotals[$i] += $positions[$i] }
    Write-Output "=== $rel ($total questions) ==="
    if (-not $Summary) { $lines | ForEach-Object { Write-Output $_ } }
    Write-Output ("  marked answer position: 1st={0} 2nd={1} 3rd={2} 4th={3}   longest option is the answer: {4} of {5}" -f $positions[1], $positions[2], $positions[3], $positions[4], $longest, $total)
    foreach ($fl in $flags) { Write-Output "  FLAG: $fl" }
    Write-Output ''
}

Write-Output "=== TOTAL: $totalQ multiple-choice and $totalOpen open questions on $pagesWithQuiz pages ==="
Write-Output ("  marked answer position overall: 1st={0} 2nd={1} 3rd={2} 4th={3}" -f $positionTotals[1], $positionTotals[2], $positionTotals[3], $positionTotals[4])
if ($totalQ -gt 0) { Write-Output ("  the longest option is the marked answer in {0} of {1} questions ({2}%)" -f $longestTotal, $totalQ, [int](100 * $longestTotal / $totalQ)) }
Write-Output "  mechanical red flags: $totalFlags"
Write-Output '  (A passing run only means the quizzes are well-formed. Whether each marked answer is TRUE still has to be checked against the lesson and the transcript.)'
