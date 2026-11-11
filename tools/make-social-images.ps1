<#
.SYNOPSIS
  Regenerates the share-preview images from their sources:
    assets/og-card.png          (1200x630)  from src/social/card.html
    assets/apple-touch-icon.png (180x180)   from assets/favicon.svg
  Needs Microsoft Edge (used headless to render). Run only when the look changes:
    powershell -NoProfile -ExecutionPolicy Bypass -File tools/make-social-images.ps1
  Keep this file ASCII-only: Windows PowerShell 5.1 reads BOM-less scripts as ANSI.
#>
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$root = Split-Path -Parent $PSScriptRoot
$edge = @("${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe", "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $edge) { throw 'Microsoft Edge was not found.' }
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) ('social-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tmp | Out-Null

function Render-Crop([string]$htmlPath, [int]$winW, [int]$winH, [int]$w, [int]$h, [string]$outPng) {
    $shot = Join-Path $tmp ([guid]::NewGuid().ToString('N') + '.png')
    $uri = 'file:///' + $htmlPath.Replace([char]92, [char]47)
    & $edge --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 "--window-size=$winW,$winH" "--screenshot=$shot" $uri | Out-Null
    $img = [System.Drawing.Image]::FromFile($shot)
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $w, $h)), (New-Object System.Drawing.Rectangle(0, 0, $w, $h)), [System.Drawing.GraphicsUnit]::Pixel)
    $bmp.Save($outPng, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose(); $bmp.Dispose(); $img.Dispose()
    "wrote $outPng ($w x $h)"
}

# 1. share card
Render-Crop (Join-Path $root 'src\social\card.html') 1300 800 1200 630 (Join-Path $root 'assets\og-card.png')

# 2. apple touch icon: the favicon on a full-bleed square (iOS rounds the corners itself)
$svg = [System.IO.File]::ReadAllText((Join-Path $root 'assets\favicon.svg'), [System.Text.Encoding]::UTF8)
$svg = $svg.Replace('rx="14"', 'rx="0"').Replace('<svg ', '<svg width="180" height="180" style="display:block" ')
$iconHtml = Join-Path $tmp 'icon.html'
[System.IO.File]::WriteAllText($iconHtml, "<!doctype html><meta charset=utf-8><body style='margin:0;background:#0F2A2E'>$svg</body>", (New-Object System.Text.UTF8Encoding($false)))
Render-Crop $iconHtml 600 600 180 180 (Join-Path $root 'assets\apple-touch-icon.png')

Remove-Item -Recurse -Force $tmp
