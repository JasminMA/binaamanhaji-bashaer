# Writer brief (step 2) — «المدخل إلى علم أصول الفقه»

You write lesson pages for an Arabic study site (RTL, static HTML). Students memorise what these
pages say, so nothing may go beyond the source. Read `NOTES.md` in this folder first (source,
extraction problems, the lesson split with book pages).

## Read first
1. `.claude/skills/add-new-material/SKILL.md` sections ٥ and ٦ (transfer rules, quiz rules).
2. One finished lesson source as the markup model: `src/level2/stage1/muyassar-ulum-alquran/lecture3.html`.
   Copy its structure and CSS classes exactly. Note: in that file the SVG diagrams are already drawn
   inline; in YOUR lessons you put a marker instead (see Diagrams).
3. `tools/diagrams.py` (the docstring and the `tree` and `grid` signatures).
4. `refs/OUTLINE.md` (the series parts, headings by PDF page, the lesson split), then ALL the pages of your lessons, read from PAGE IMAGES:
   the text file `refs/المدخل_إلى_أصول_الفقه_pdf.txt` is only approximate (words split, line endings displaced, spaces replaced), so use it
   to find your way, never as the wording to copy. Render with pdftoppm at 110 dpi into your scratch folder, e.g.
   `pdftoppm -r 110 -f 13 -l 31 -png "<pdf>" <scratch>/p`, from `refs/ملخص_المدخل_إلى_أصول_الفقه.pdf` in this repository
   (poppler is in `C:\Users\P15\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin`).
   Read every page of your range with the Read tool. Page numbers in this brief are PDF page numbers (the printed footer number is the PDF page minus 1).

## What a lesson file is
`src/level2/stage2/madkhal-usul-alfiqh/lectureN.html`: body only. It must start with
`<header id="main" tabindex="-1">` holding `<div class="eyebrow">المدخل إلى علم أصول الفقه · القسم …</div>`,
an `<h1>` and a `<p class="muted">` line. Then bare `<section>` elements (no ids, never nested), in this order:
1. Mind map: `<h2>الخريطة الذهنية للقسم <span class="tag">ابدأ من هنا</span></h2>` + `<div class="mm four">` with
   `mm-root` and four `mm-branch` blocks.
2. Content sections following the book's own headings, numbered أولًا، ثانيًا… in the `<h2>`.
3. `<h2>خلاصة القسم</h2>` with `<div class="sum"><ul class="clean">` of 8-12 `<li>`. Most items start with
   `<li><b>مصطلح:</b> …` (these become flashcards: bold heading, then at least 12 characters), the rest contain
   at least one `<b>…</b>` inside a sentence. No two items may have identical text.
4. Quiz: `<h2>أسئلة مراجعة <span class="tag">اختبر نفسك</span></h2>` + `<form class="quiz" dir="rtl">` with exactly
   8 `<div class="mcq">` (no div inside an mcq), each with `<p class="q">`, four `<label class="opt">` (exactly one
   `class="opt ok"`), radio `name="bNqK"` (N lesson, K question; unique), `<p class="exp">`, and the reset button
   as in the model.

Length: about 20-35 KB per lesson (the source is a short summary, so do not pad; every diagram and table the content allows).

## Content rules (no exceptions)
- Every definition, count, list, name and attribution must be in your pages of the book. Do not add
  knowledge of your own, do not "improve" a list, do not state a count the book does not state
  (say «من أبرزها» when the book does).
- Quotations of the author or of scholars: the book's wording inside «», with who said it.
- Hadith: the book's wording inside «» with its source as the book gives it in the footnote.
- Quran: in the source text verses appear in plain parentheses, often cut or without a reference.
  Quote a verse only when you are certain of its exact mushaf wording; write it with full tashkeel
  inside ﴿ ﴾ followed by [السورة: رقم الآية] in Arabic-Indic digits (the reference is yours to supply
  only when you are certain). Otherwise describe what the verse says outside any marks. Never put
  your own words inside ﴿ ﴾.
- The source is a transcribed summary of the lecture series «المدخل إلى علم أصول الفقه» by الشيخ الدكتور حسن بن عبد الحميد بخاري (seven parts, each opening with a «الدرس …» heading). Attribute to the Shaykh only what the summary attributes to him; PDF 64 says the second classification of the usul schools is his own ijtihad: say so where you give it. The «تذكرة» box about renewing one's intention that repeats at the foot of pages is not content: ignore it. Never mention the transcriber's link or channel. Everything is exactly as the summary says it: do not add proofs, verses, hadiths, names, dates, counts or examples it does not contain, and do not soften or sharpen a ruling.
- If something in the book looks wrong or inconsistent, leave it out of the page and record it.
- Arabic-Indic digits (٠-٩) in page text. No Latin text in pages. No links.


- TEXT QUALITY: read from images; be careful with similar letters and with tashkeel; where a name, date, title of a book, number or quoted wording is uncertain, render that page again at 150 dpi and zoom before writing it. Never guess an unreadable word: leave the point out and record it in the notes. Names of scholars and book titles must be exactly as printed.

## Diagrams ("as many as the content allows")
- Each lesson needs at least 6 diagrams counting the mind map: use the CSS blocks from the model
  (`.flow` with `.step`/`.arr`, `.cmp` / `.cmp three` with optional `.g`/`.r`, `.rows panel` with `.row`/`.lb`,
  `.ben` / `.ben detail` cards with `.n`, `.eras`, `.chains`, callouts `.sum` `.note` `.warn` `.ask` with `.cal-t`)
  and 3-5 drawn diagrams per lesson.
- A drawn diagram is a marker on its own line: `<!--SVG:name-->` (name: lowercase letters/digits, unique in
  the lesson). Define it in your diagrams file (below) with `tree(...)` or `grid(...)`.
  - `tree(aria_label, root, [(branch, [leaf, …]) or (branch, [leaf, …], 'accent'|'gold'|'red'), …], leaf_w=330, branch_w=190, root_w=170)`.
    Text must fit: about 6.5 px per character at 12.5-13.5 px font, so a leaf of width 330 holds about 46
    characters, a branch of 190 about 24, the root about 20. Raise `leaf_w`/`branch_w` if needed (total width
    stays under about 1000).
  - `grid(aria_label, headers, rows, widths, first_color='accent'|'gold', min_width=…, row_h=40)`: first column is the
    rightmost; a cell may be `(text, 'accent'|'red')` for emphasis; a cell of width W holds about W/6.5 characters.
  - `aria_label` is a full Arabic sentence describing the diagram for screen readers, without diacritics needed.
- A diagram is content: every label, grouping and arrow must be backed by the book. Use an arrow sequence
  only when the book gives an order.

## Quiz rules
- The marked answer must be exactly what the book says; each other option must be clearly wrong by the
  book; no "كل ما سبق". Put the correct option in positions 1,2,3,4 twice each across the 8 questions.
- Do not let length give the answer away: the correct option is the longest in at most 3 of 8.
- `p.exp` adds a reason or a detail from the book; it does not repeat the option and adds nothing that
  is not in the book.

## What you deliver (write these files; touch nothing else, run no build, no git)
1. Your `src/level2/stage2/madkhal-usul-alfiqh/lectureN.html` files.
2. `level2/stage2/madkhal-usul-alfiqh/refs/diagrams_partP.py` (P = your part number), exactly in this shape:
   ```python
   # -*- coding: utf-8 -*-
   import os, sys
   ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '..', '..'))
   sys.path.insert(0, os.path.join(ROOT, 'tools'))
   from diagrams import tree, grid, fill_placeholders
   D = os.path.join(ROOT, 'src', 'level2', 'stage2', 'madkhal-usul-alfiqh')
   fill_placeholders(os.path.join(D, 'lectureN.html'), {
       'name': tree('…', '…', [('…', ['…', '…'])]),
   })
   ```
   Check it with `python -m py_compile <file>` only. Do NOT run it (it rewrites the lesson files; the
   assembly step runs it once).
3. `level2/stage2/madkhal-usul-alfiqh/refs/NOTES-partP.md` with, in Arabic where it is page text:
   - for each lesson: its title (as in NOTES.md, may be polished), a one-or-two-sentence `description`
     (what the lesson covers, for the lesson card), and a short tag (2-4 words);
   - 6-8 glossary rows for the course page: term · the book's definition (one line) · lesson number;
   - 3 candidate cross-lesson quiz questions in the same mcq markup (name them `gqX`), each linking your
     lessons to the course's central idea, answer marked, with explanation;
   - "Source issues": anything in the book you left out because it looked wrong, with page number;
   - a list of every Quran quotation you wrote: lesson, reference, and the exact text, for the reviewer.
4. Final message: a short summary (files written, number of diagrams and questions per lesson, anything
   you were unsure of). Keep it under 30 lines.
