# Writer brief (step 2) — «شرح الأجرومية»

You write lesson pages for an Arabic study site (RTL, static HTML). Students memorise what these
pages say, so nothing may go beyond the source. Read `NOTES.md` in this folder first (source,
extraction problems, the lesson split with book pages).

## Read first
1. `.claude/skills/add-new-material/SKILL.md` sections ٥ and ٦ (transfer rules, quiz rules).
2. One finished lesson source as the markup model: `src/level2/stage1/muyassar-ulum-alquran/lecture3.html`.
   Copy its structure and CSS classes exactly. Note: in that file the SVG diagrams are already drawn
   inline; in YOUR lessons you put a marker instead (see Diagrams).
3. `tools/diagrams.py` (the docstring and the `tree` and `grid` signatures).
4. `refs/OUTLINE.md` (the three sources, headings by page, the lesson split with page ranges in each source, and, in section 5, the known errors),
   then ALL the pages of your lessons in ALL THREE sources, read from PAGE IMAGES (none has a usable text layer):
   (أ) `refs/ملخص_سلسلة_شرح_الآجرومية.pdf` = the PRIMARY source (the summary of the 8-majlis series: the lesson text follows it);
   (ج) `refs/متن_الآجرومية.pdf` = the bare vowelled matn of ابن آجروم (the authority for the matn's own wording; quote the matn from it);
   (ب) `refs/تشجير_الآجرومية.pdf` = grammar trees as slides (use them as the shape of your diagrams, after correcting their errors listed in OUTLINE section 5).
   Render with pdftoppm at 110 dpi into your scratch folder, e.g. `pdftoppm -r 110 -f 10 -l 15 -png "<pdf>" <scratch>/p`
   (poppler is in `C:\Users\P15\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin`).
   Read every page of your range with the Read tool. Use the page numbers of the lesson table in NOTES.md (PDF page numbers; the printed number of (أ) is PDF - 1, of (ج) is PDF + 54).

## What a lesson file is
`src/level1/stage4/sharh-alajrumiyya/lectureN.html`: body only. It must start with
`<header id="main" tabindex="-1">` holding `<div class="eyebrow">شرح الأجرومية · القسم …</div>`,
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
- The course is «شرح الأجرومية» (Level 1, stage 4): a Nahw course on the matn «المقدمة الآجرومية» of أبو عبد الله محمد بن محمد الصنهاجي (ابن آجروم). The explanation is a summary of an 8-majlis series by the scientific committee of برنامج البناء المنهجي: its lecturer is not named, so name nobody as the lecturer. The framework on pages 3-4 of (أ) is quoted from «مدارج النحو» by الشيخ سالم القحطاني: say so where you give it. The matn's wording is quoted from (ج) inside «» as the matn (قال ابن آجروم) and the explanation's own wording is not put in the matn's mouth. The explanation (أ) reorganises the matn (e.g. the مفاعيل and أشباه المفاعيل) and adds topics the matn lacks: follow (أ) for the lesson structure.
- THE SOURCES CONTAIN ERRORS (listed in OUTLINE section 5: wrong i'rab or counts in (أ), wrong slide titles and wording in (ب), differences from the matn). This is a grammar course, so a wrong rule or example would be memorised: where a point of (أ) or (ب) is inconsistent with the matn (ج), with another page of the same source, or with itself, do NOT state it as a fact: use the matn's wording, or leave the point out, and record it in the notes. Never "correct" a rule from your own knowledge and never add examples, counts or rules that the sources do not contain; examples come from (أ), the matn or the corrected trees only. Give the i'rab of an example only as (أ) gives it.
- Quote Quran verses and poetry exactly as the source prints them with tashkeel; a نظم (e.g. of the نواصب and the جوازم) is quoted exactly or not at all.
- If something in the book looks wrong or inconsistent, leave it out of the page and record it.
- Arabic-Indic digits (٠-٩) in page text. No Latin text in pages. No links.


- TEXT QUALITY: read from images; vowel marks matter in a grammar course: where an example word, a case ending or a quoted wording is uncertain, render that page again at 150-200 dpi and zoom before writing it. Never guess an unreadable word: leave the point out and record it in the notes.
- Examples must be shown with their case endings (tashkeel) exactly as the source gives them; i'rab tables are the heart of the lessons, so use `grid(...)` tables and `tree(...)` for classifications (the tashjir slides show the classification shapes).

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
1. Your `src/level1/stage4/sharh-alajrumiyya/lectureN.html` files.
2. `level1/stage4/sharh-alajrumiyya/refs/diagrams_partP.py` (P = your part number), exactly in this shape:
   ```python
   # -*- coding: utf-8 -*-
   import os, sys
   ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', '..', '..'))
   sys.path.insert(0, os.path.join(ROOT, 'tools'))
   from diagrams import tree, grid, fill_placeholders
   D = os.path.join(ROOT, 'src', 'level1', 'stage4', 'sharh-alajrumiyya')
   fill_placeholders(os.path.join(D, 'lectureN.html'), {
       'name': tree('…', '…', [('…', ['…', '…'])]),
   })
   ```
   Check it with `python -m py_compile <file>` only. Do NOT run it (it rewrites the lesson files; the
   assembly step runs it once).
3. `level1/stage4/sharh-alajrumiyya/refs/NOTES-partP.md` with, in Arabic where it is page text:
   - for each lesson: its title (as in NOTES.md, may be polished), a one-or-two-sentence `description`
     (what the lesson covers, for the lesson card), and a short tag (2-4 words);
   - 6-8 glossary rows for the course page: term · the book's definition (one line) · lesson number;
   - 3 candidate cross-lesson quiz questions in the same mcq markup (name them `gqX`), each linking your
     lessons to the course's central idea, answer marked, with explanation;
   - "Source issues": anything in the book you left out because it looked wrong, with page number;
   - a list of every Quran quotation you wrote: lesson, reference, and the exact text, for the reviewer.
4. Final message: a short summary (files written, number of diagrams and questions per lesson, anything
   you were unsure of). Keep it under 30 lines.
