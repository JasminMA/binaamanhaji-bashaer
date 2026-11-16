# Writer brief (step 2) — «فقه العبادات»

You write lesson pages for an Arabic study site (RTL, static HTML). Students memorise what these
pages say, so nothing may go beyond the source. Read `NOTES.md` in this folder first (source,
extraction problems, the lesson split with book pages).

## Read first
1. `.claude/skills/add-new-material/SKILL.md` sections ٥ and ٦ (transfer rules, quiz rules).
2. One finished lesson source as the markup model: `src/level2/stage1/muyassar-ulum-alquran/lecture3.html`.
   Copy its structure and CSS classes exactly. Note: in that file the SVG diagrams are already drawn
   inline; in YOUR lessons you put a marker instead (see Diagrams).
3. `tools/diagrams.py` (the docstring and the `tree` and `grid` signatures).
4. `refs/OUTLINE.md` (the nine files, every heading by PDF page, the lesson split, and in section 5 the hand marks, the points that look wrong, and where the series sets the Shafi'i view against other schools), then ALL the pages of your lessons, read from PAGE IMAGES
   (no usable text layer): lesson N = `refs/lectureN.pdf`. Render with pdftoppm at 110 dpi into your scratch folder, e.g. `pdftoppm -r 110 -png "refs/lecture3.pdf" <scratch>/l3`
   (poppler is in `C:\Users\P15\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin`).
   Read every page of your files with the Read tool. PDF page 1 of each file is the cover; the printed page number "-N-" is the PDF page minus 1.

## What a lesson file is
`src/level1/stage4/fiqh-alibadat/lectureN.html`: body only. It must start with
`<header id="main" tabindex="-1">` holding `<div class="eyebrow">فقه العبادات · القسم …</div>`,
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
- The course is «فقه العبادات» (Level 1, stage 4): a series «فقه العبادات على المذهب الشافعي» by الشيخ الدكتور لبيب نجيب عبد الله (named on every cover; attribute to him only what the text attributes to him), a transcribed summary of his explanation of «حقيبة الفقه الشافعي» (published by مكتب فقهاء للتدريب والاستشارات). Each lecture is one file; the nine files form one continuous series (طهارة، صلاة، جنائز، زكاة، صيام واعتكاف، حج) and some chapters cross files: follow the lesson table in NOTES.md.
- RULINGS: every ruling is the Shafi'i school's as the series states it. Keep each view with its holder: the madhhab's mu'tamad view, the views of ابن حجر / الرملي / النووي / الرافعي where the series names them, and other schools' views only where the series states them (OUTLINE section 5 lists them). Never present another school's view as the page's own, never merge views, never add a ruling, condition, number, measure, time, example or evidence that the lecture does not contain, and never soften or sharpen a ruling. Numbers and measures (the qullatayn in litres, distances, nisab weights, the sa' and mudd, the number of letters of الفاتحة, counts of pillars/sunan) are copied exactly as printed, with the author's own wording of "approximately"; where the text gives two estimates (e.g. the two distances for shortening prayer) give both as stated.
- NOT CONTENT (never put on a page): the orange pen strokes, the hand-drawn box, the repeated «تذكير: لا تنسَ تجديد نيتك…» box, page frames and numbers, the transcriber's Telegram link and «تم تلخيص المحاضرة». Points that look wrong (OUTLINE section 5: e.g. «أركان الحج خمسة» followed by a sixth; «ذو الحليفة» twice; insanity and fainting voiding i'tikaf absolutely): do NOT state them as fact; state only what is consistent, or leave the point out, and record it in your notes.
- Quote Quran verses and hadiths exactly as the lecture prints them (with the narrator/source where the lecture gives it); never complete a hadith from memory.
- If something in the book looks wrong or inconsistent, leave it out of the page and record it.
- Arabic-Indic digits (٠-٩) in page text. No Latin text in pages. No links.


- TEXT QUALITY: read from images; vowel marks matter in a grammar course: where a number, a measure, a ruling or a quoted wording is uncertain, render that page again at 150-200 dpi and zoom before writing it. Never guess an unreadable word: leave the point out and record it in the notes.
- Fiqh content is rules, conditions, pillars, lists and comparisons: use `grid(...)` tables (e.g. what breaks wudu, comparison of views) and `tree(...)` for classifications (kinds of water, kinds of najasa, pillars/sunan...), and flows only where the book gives an order (steps of wudu, ghusl, prayer, tawaf).

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
1. Your `src/level1/stage4/fiqh-alibadat/lectureN.html` files.
2. `level1/stage4/fiqh-alibadat/refs/diagrams_partP.py` (P = your part number), exactly in this shape:
   ```python
   # -*- coding: utf-8 -*-
   import os, sys
   ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '..', '..'))
   sys.path.insert(0, os.path.join(ROOT, 'tools'))
   from diagrams import tree, grid, fill_placeholders
   D = os.path.join(ROOT, 'src', 'level1', 'stage4', 'fiqh-alibadat')
   fill_placeholders(os.path.join(D, 'lectureN.html'), {
       'name': tree('…', '…', [('…', ['…', '…'])]),
   })
   ```
   Check it with `python -m py_compile <file>` only. Do NOT run it (it rewrites the lesson files; the
   assembly step runs it once).
3. `level1/stage4/fiqh-alibadat/refs/NOTES-partP.md` with, in Arabic where it is page text:
   - for each lesson: its title (as in NOTES.md, may be polished), a one-or-two-sentence `description`
     (what the lesson covers, for the lesson card), and a short tag (2-4 words);
   - 6-8 glossary rows for the course page: term · the book's definition (one line) · lesson number;
   - 3 candidate cross-lesson quiz questions in the same mcq markup (name them `gqX`), each linking your
     lessons to the course's central idea, answer marked, with explanation;
   - "Source issues": anything in the book you left out because it looked wrong, with page number;
   - a list of every Quran quotation you wrote: lesson, reference, and the exact text, for the reviewer.
4. Final message: a short summary (files written, number of diagrams and questions per lesson, anything
   you were unsure of). Keep it under 30 lines.
