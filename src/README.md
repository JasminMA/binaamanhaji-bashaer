# Lecture page sources

The lecture pages (`level2/stage3/<course>/lectureN.html`) are **generated** from the files in this folder.
Do not edit the generated pages: the next build overwrites them. Edit the source, then build.

```
src/
  site.json                       names of the folders above a course (level, stage) for the breadcrumb
  templates/                      the shared markup: page shell, breadcrumb, previous/next bar
  level2/stage3/<course>/
    course.json                   course name, wording ("الدرس"/"المحاضرة"…) and the ordered lessons
    lectureN.html                 ONLY the lesson body, from <header id="main" tabindex="-1"> to the end of the last <section>
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

1. Create `src/level2/stage3/<course>/lectureN.html` with just the body (copy the structure of a sibling). It must start with
   `<header id="main" tabindex="-1">`: that is where the "skip to content" link lands (the build refuses a lesson without it).
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

## Diagrams and dark mode

Three kinds of diagram exist, and each follows dark mode in its own way:

- **Theme colours** (`style="fill:var(--accent)"` and friends): the preferred way for new diagrams. They follow the theme by themselves.
- **White badge labels** (`<text fill="#fff">` on a `--accent`/`--gold`/`--red` badge): allowed. In dark mode those badges turn light, so `assets/lecture.css` and `assets/site.css` turn the labels dark.
- **Fixed-colour diagrams** (hex colours such as `fill="#8c2f39"`): wrap them in `<div class="dia">`. That panel is white in light mode and inverted (`filter: invert(.9) hue-rotate(180deg)`) in dark mode, which flips the surface and text and keeps the hues.

`tools/check-site.ps1` warns about an SVG that uses hex colours outside a `.dia` panel, because it would stay bright in dark mode.
The dark-mode rules are kept identical in the two stylesheets (the index pages use `site.css`).

## Share previews, descriptions and icons

When a page link is pasted into WhatsApp or Telegram (or shown in a search result), the app reads a few tags in the page head:
the description, an image and a title. Every page now carries them.

- **Lecture pages** get them from the template. Each lesson in `course.json` needs a `"description"` (one or two sentences,
  the build refuses a lesson without one); reuse the lesson card text from the course page. The address of the site lives in
  `src/site.json` (`baseUrl`); preview images must be absolute addresses under it.
- **Hand-written pages** (home, level, stage, course pages, glossary) carry the same block by hand: copy it from a sibling and change
  the description, `og:title` (same as the page title) and `og:url` (the page's real public address, ending in `/` for an `index.html`).
- **Images:** `assets/og-card.png` (1200x630, the card chat apps show), `assets/favicon.svg` (tab icon) and `assets/apple-touch-icon.png`.
  They are made from `src/social/card.html` and `assets/favicon.svg` by `tools/make-social-images.ps1` (needs Microsoft Edge).
  Run it only when the look changes.
- `tools/check-site.ps1` checks all of it: description present, the whole Open Graph block, `og:url` matches the page, `og:image` is an
  absolute address whose file exists and is 1200x630, and the icon links resolve.

Chat apps keep a copy of the preview for a while. After changing a title, description or image, a link already shared may keep showing the old
preview until the app refreshes it.

## Study progress

`assets/progress.js` lets a student mark lessons as done:

- **Lesson pages** get a "تم إنجاز هذا الدرس" toggle above the bottom navigation (the lecture template links the script).
- **Course pages** (index pages with lesson cards) get a progress bar, a ✓ badge on finished cards, a link to the last lesson opened, and a
  "clear progress" button with a two-step confirm. A new course page needs `<script src="../../../assets/progress.js" defer></script>` in its head.
- It works out the course from the folder name in the address (`.../<course>/lectureN.html`), so no per-page setup is needed.
- **Storage:** one `localStorage` key (`bm.progress.v1`) with lesson *numbers* per course and the last lesson opened. Nothing else is stored
  (no quiz scores, no names) and nothing is sent anywhere. Stored data is validated as untrusted. If storage is blocked (private window), the
  feature stays hidden and the pages work as before; without JavaScript nothing appears.
- Progress lives in one browser only (no account), so it does not follow the student to another device.
- The script carries a `security-reviewed:storage` comment marker. `tools/check-site.ps1` only accepts that marker when the code really uses
  `try/catch`, and it still warns about any `location.search/hash` or `document.referrer` reads and fails on injection code or network calls.

## Keyboard access: skip link and focus ring

- **Skip link.** The first thing in every page's `<body>` is `<a class="skip" href="#main">تخطَّ إلى المحتوى</a>`. It stays off-screen until a keyboard user
  presses Tab, then appears at the top and jumps past the breadcrumb (and the hero on index pages) to the content. Lesson pages get it from
  `src/templates/lecture.html`; hand-written index pages carry it themselves. The target is the one element with `id="main" tabindex="-1"`: the `<main>` on
  index pages, the lesson's first `<header>` on lesson pages (the lesson wrapper is now a `<main>` landmark too).
- **Focus ring.** `assets/site.css` and `assets/lecture.css` both define `:focus-visible{outline:3px solid var(--accent);outline-offset:3px}`, so every link, button,
  card and radio shows where the keyboard is, in light and dark mode. Mouse clicks do not show it. Never remove an outline; style it instead.
- **Reduced motion.** With "reduce motion" switched on in the system, the cards stop lifting on hover/focus.
- **Checks.** `tools/check-site.ps1` fails when a page lacks the skip link, the single `id="main"` (with `tabindex="-1"`) or a `<main>`, when the shared CSS
  lacks the skip/focus rules, or when any CSS or inline style removes an outline (`outline:none` / `outline:0`; only `[tabindex="-1"]` targets are exempt).
  A new hand-written index page: copy the skip link and `<main id="main" tabindex="-1">` from a sibling.
