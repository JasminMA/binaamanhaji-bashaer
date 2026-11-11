Self-hosted fonts for the study site (no request to Google or any other host).

IBM Plex Sans Arabic  (body text)   weights 400, 500, 600
    Copyright 2017 IBM Corp. with Reserved Font Name "Plex". SIL Open Font License 1.1: see OFL-ibm-plex-sans-arabic.txt
Reem Kufi             (headings)    one variable file covering weights 500-700
    Copyright 2015-2022 The Reem Kufi Project Authors (https://github.com/aliftype/reem-kufi). SIL Open Font License 1.1: see OFL-reem-kufi.txt

Source: the files Google Fonts serves (fonts.gstatic.com), only the "arabic" and "latin" subsets, as .woff2
(the site uses no other characters). The @font-face rules are in ../fonts.css.

To update or add a font: download the .woff2 files, put them here, add the matching @font-face rule to ../fonts.css
and run tools/check-site.ps1, which fails if a font file is missing or a page does not load fonts.css.
