<#
.SYNOPSIS
  Regenerates the share-preview images from their sources:
    assets/og-card.png          (1200x630)  from src/social/card.html
    assets/apple-touch-icon.png (180x180), icon-192.png, icon-512.png   from assets/favicon.svg
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

# 2. app icons: the favicon on a full-bleed square (iOS rounds the corners itself)
#    180 = apple-touch-icon, 192 and 512 = the web app manifest icons (installing the site to a home screen)
$svgSource = [System.IO.File]::ReadAllText((Join-Path $root 'assets\favicon.svg'), [System.Text.Encoding]::UTF8)
foreach ($icon in @(@(180, 'apple-touch-icon.png'), @(192, 'icon-192.png'), @(512, 'icon-512.png'))) {
    $size = [int]$icon[0]
    $svg = $svgSource.Replace('rx="14"', 'rx="0"').Replace('<svg ', "<svg width=""$size"" height=""$size"" style=""display:block"" ")
    $iconHtml = Join-Path $tmp "icon$size.html"
    [System.IO.File]::WriteAllText($iconHtml, "<!doctype html><meta charset=utf-8><body style='margin:0;background:#0F2A2E'>$svg</body>", (New-Object System.Text.UTF8Encoding($false)))
    Render-Crop $iconHtml ($size + 420) ($size + 420) $size $size (Join-Path $root ('assets\' + $icon[1]))
}

Remove-Item -Recurse -Force $tmp
