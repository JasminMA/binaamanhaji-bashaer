# Lecture page sources

The lecture pages (`level2/stage3/<course>/lectureN.html`) are **generated** from the files in this folder.
Do not edit the generated pages: the next build overwrites them. Edit the source, then build.

```
src/
  site.json                       names of the folders above a course (level, stage) for the breadcrumb
  templates/                      the shared markup: page shell, breadcrumb, previous/next bar
  level2/stage3/<course>/
    course.json                   course name, wording ("الدرس"/"المحاضرة"…) and the ordered lessons
    lectureN.html                 ONLY the lesson body, from <header> to the end of the last <section>
build.ps1                         the generator (repo root)
```

## Build

No installs needed: it only uses PowerShell, which ships with Windows (5.1 or 7).

```
powershell -NoProfile -ExecutionPolicy Bypass -File build.ps1          # write the pages
powershell -NoProfile -ExecutionPolicy Bypass -File build.ps1 -Check   # exit 1 if a page is out of date
```

Commit the source **and** the generated pages together. The generated pages are what GitHub Pages serves,
and they also open straight from disk. `-Check` is for catching a forgotten rebuild or a hand-edited page
(for example in a future CI job).

## Add a lesson

1. Create `src/level2/stage3/<course>/lectureN.html` with just the body (copy the structure of a sibling).
2. Add `{ "n": N, "title": "…" }` to `lessons` in that course's `course.json`.
   The title becomes the `<title>` (plus the course's `titleSuffix`).
3. Run the build. The breadcrumb, the previous/next links of the neighbouring lessons and the new page appear by themselves.
4. The course's `index.html` card and the counts on the stage/level pages are still written by hand
   (see the `site-index-sync` skill).

## Add a course

Create `src/level2/stage3/<new-course>/` with a `course.json` (copy a sibling's) and its lesson files.
A course under a different level or stage needs its folders added to `site.json`.

## Change the design

- Page-wide look: `assets/lecture.css` (shared by every lecture).
- Head, breadcrumb or previous/next markup: the matching file in `src/templates/`, then rebuild.
- Template placeholders are written `{{name}}`; an unknown name stops the build with a message.

The build refuses a lesson body that contains `<html>`, `<head>`, `<body>` or a doctype, a lesson file that is
not listed in `course.json` (and the reverse), and any template typo.

## Checks

`tools/check-site.ps1` checks every page: generated pages up to date, RTL and accessibility basics, balanced tags,
duplicate ids, broken links and `#fragments`, pages nothing links to, shared CSS (dark mode, stray `*/`) and the
security rules (no external scripts, no `http://`, no inline handlers or injection sinks, no local paths or emails).
It exits with 1 if anything is wrong.

```
powershell -NoProfile -ExecutionPolicy Bypass -File tools/check-site.ps1
```

GitHub runs it on every push to `main` and on every pull request (`.github/workflows/checks.yml`); a red cross on
the commit means a problem to fix. It only reads the repository, it never edits pages or changes how the site is published.

## Quiz scores

Every multiple-choice quiz (`<form class="quiz">` with `.mcq` questions) gets a score bar from `assets/quiz.js`:
one dot per question (green right, red wrong) and a line such as "نتيجتك: ٦ من ٨". The first answer to a question
counts (the other options lock) and the existing reset button starts over. Without JavaScript the quiz still
reveals answers and explanations, since that part is plain CSS. Nothing is stored or sent anywhere.

Markup rules (the site check enforces them, because the score depends on them):

- each question is a `<div class="mcq">` with at least 2 `<input type="radio">` options sharing one `name`;
- the `name` is unique on the page (two questions with the same name would interfere);
- exactly one option is the right one: `<label class="opt ok">`;
- add `<p class="exp">` with the explanation (a warning if missing).

Lecture pages get the script from `src/templates/lecture.html`. The two course "tests" on index pages link it by hand:
`<script src="../../../assets/quiz.js" defer></script>`. The score styles live in both `assets/lecture.css` and
`assets/site.css`; keep them identical.

## Comparative glossary

`level2/stage3/glossary/index.html` compares how the two stage-3 courses (نظم المعين and لغة المحدث) present the
same hadith terms. It is a hand-written index-style page (it uses `assets/site.css`, not the generator), linked from
the stage page and from the "خريطة المصطلحات" section of both course pages.

- Every card is built only from what the lesson summaries say; keep it that way (check the source lesson, never memory).
- Tags: `same` (agreement), `comp` (the lessons complement each other), `count` (a different count or grouping, same substance).
  Only claim a real disagreement if both lessons clearly say opposite things.
- The overview map is plain SVG: one row per term, one circle per lesson (filled = taught there, empty = mentioned).
  To add a term, copy a row (rows are 40 units apart), add the card with `id="t-..."` and the chip in the `.toc`,
  and raise the SVG `viewBox` height.
- When a new lesson explains a term that is already here, add its link to that term's card and a dot to the map.
