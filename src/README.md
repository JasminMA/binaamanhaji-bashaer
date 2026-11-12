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

## Self-hosted fonts

The site makes no request to Google (or any other host): the fonts are files in `assets/fonts/` and `assets/fonts.css` declares them.

- **Fonts:** IBM Plex Sans Arabic (text; 400, 500, 600) and Reem Kufi (headings; one variable file for 500-700). Only the `arabic` and `latin`
  subsets are kept, 8 `.woff2` files, about 226 KB in all; the browser downloads a subset only when a page uses it. Licences (SIL OFL 1.1) and
  sources are in `assets/fonts/`.
- **Pages:** every page links `assets/fonts.css` before its main stylesheet (the lecture template does it for lessons; a new hand-written index
  page copies the line from a sibling). The Google Fonts `<link>` is gone everywhere, including the share-card source `src/social/card.html`.
- **Fallback:** if a font file cannot load, the CSS falls back to `Tahoma` / `Segoe UI`, so text always shows (`font-display:swap`). Some browsers
  (Firefox in particular) can refuse font files outside the page's own folder when a page is opened straight from disk; the site then simply uses
  the fallback font there. On the published site, and in Chrome/Edge from disk, the real fonts load.
- **Checks:** `tools/check-site.ps1` fails when a page does not link `fonts.css`, when `fonts.css` points at a missing or non-`.woff2` file, when
  a font family the pages ask for has no `@font-face`, or when anything loads from an outside host (the old Google exception is gone).
- **Adding or updating a font:** put the `.woff2` in `assets/fonts/`, add its `@font-face` to `assets/fonts.css`, add its licence, run the check.

## Offline support (installable site)

After one visit with internet, the whole study site opens with no connection, and phones can add it to the home screen as an app.

- **`sw.js`** (site root) is the service worker. **Do not edit it:** `build.ps1` generates it from `src/sw.template.js`, filling in the list of files
  to keep (every page, stylesheet, script, font and icon: about 52 files, 2.5 MB; not `refs/` PDFs and transcripts, not the share card) and a
  `VERSION` that is a hash of those files' content. So the browser downloads the site again exactly when something changes, swaps to the new
  cache and deletes the old one. `build.ps1` rewrites it on every build and `-Check` fails if it is stale, so **run the build after any change
  to a page, style, script or font, and commit `sw.js`** (the GitHub check enforces this).
- **How it answers:** a request for a cached file is served from the cache (instant, works offline); anything else goes to the network. If the
  network is down and the page is not cached (for example a PDF in `refs/`), a short Arabic "not available offline" page appears instead of the
  browser's error. It only touches same-site GET requests.
- **`assets/offline.js`** registers the worker (every page loads it; the lecture template does it for lessons, a new hand-written page copies the
  line from a sibling). It only runs on https or localhost; from a file on disk the site just works online as before.
- **`manifest.webmanifest`** + `assets/icon-192.png` / `icon-512.png` make the site installable. `tools/make-social-images.ps1` regenerates the icons
  from `assets/favicon.svg`. Every page links the manifest.
- **Security:** `sw.js` is the only script allowed to call `fetch`, and the check accepts only `fetch(event.request)` (it passes the page's own
  request through) plus the `security-reviewed:network` marker. It cannot reach another site, and `importScripts` is rejected.
- **Checks:** every page links the manifest and loads `offline.js`; the manifest is valid (Arabic, RTL, relative `start_url`, real 192 and 512 PNG
  icons of the declared size); `sw.js` exists, is current and has install-time caching, an `activate` clean-up and a `fetch` handler.
- **Testing by hand:** service workers do not run from `file://`. Serve the folder over http (any static server on `localhost`), open a lesson,
  reload once, stop the server, and the pages still open.
- **Limits:** reading the PDFs and transcripts still needs internet. A page already open keeps the old version until it is reloaded after an update.

## Site search

`search/index.html` searches the text of every lesson, course page and the glossary at once, entirely in the browser (works offline).

- **Index:** `assets/search-index.js` is **generated** by `build.ps1` (do not edit): one entry per page *section* (page, page title, section
  heading, section id, plain text), about 300 entries, 850 KB (served compressed; only the search page loads it). Quizzes (multiple choice and the
  open `<details>` Q&A) are left out. `build.ps1 -Check` fails when it is stale, so after any change to page text run the build and commit it
  (the build also regenerates `sw.js`, which caches the index for offline use).
- **Section ids:** results open the exact section, so every `<section>` has an id. Lesson pages get `sec-1`, `sec-2`... from the build (lesson sources
  keep a bare `<section>`); hand-written pages carry `id="sec-N"` (or a descriptive id) themselves. The site check fails on a `<section>` without an id.
- **Matching (`assets/search.js`):** ignores diacritics, tatweel, hamza forms, ta marbuta/ha, alef maqsura/ya and digit shapes, and matches inside
  words ("منكر" finds "المنكر"). Several words must all appear in a section; sections with the words together, or in the heading, rank higher.
  Words under 2 letters are ignored. Results show the page, the section heading and a snippet with the words highlighted (built with `textContent`
  and `<mark>`; nothing from the index is ever inserted as HTML, and the page path and section id are pattern-checked before they become a link).
- **Entry points:** every page has a "بحث" link in its top bar (lesson pages get it from `src/templates/crumb-search.html`; hand-written pages carry
  `<a class="tab search" ...>`; a new page copies it from a sibling). The check requires the link on every page.
- **Checks:** the search page and its scripts (index before `search.js`), the index parses, every entry points at a real page and an id that exists
  in it, every page has at least one entry, no entry still holds HTML tags.
- **Adding a page:** hand-written pages need the search link and ids on their sections; the build picks the page up by itself.

## Re-checking quiz answers

The site check only verifies that quizzes are well formed. Whether each marked answer is *true* is a judgement against the sources, done with the
`quiz-answer-check` skill (`.claude/skills/quiz-answer-check/SKILL.md`) and its helper:

```
powershell -NoProfile -ExecutionPolicy Bypass -File tools/list-quizzes.ps1 -Summary
powershell -NoProfile -ExecutionPolicy Bypass -File tools/list-quizzes.ps1 -Path level2/stage3/nazm-almuaeen/lecture2.html
```

- `tools/list-quizzes.ps1` lists every multiple-choice question with its options, the `[CORRECT]` one and the explanation, plus the open Q&A
  (`<details>`) with answers, and prints red flags (not exactly one marked answer, duplicate options, the marked text repeated in another option,
  missing explanation) and bias statistics (position of the marked answer; how often it is also the longest option). It only reads files.
- The skill then compares each marked answer with the lesson, then the transcript in `refs/`, checks every wrong option is really wrong, checks the
  explanation, and reports (never edits on its own).

## Flashcard review

`review/index.html` turns the lessons into a spaced-repetition deck (about 430 cards, entirely in the browser, works offline).

- **Cards:** `assets/cards-data.js` is **generated** by `build.ps1` (do not edit) from the lesson sources, so there is nothing extra to write when
  a lesson is added or changed. Four kinds: `q` every multiple-choice review question (front: the question; back: the marked answer, with the
  explanation underneath), `o` every open Q&A (`<details>`), `s` a bold-led point of «خلاصة الدرس» (front: the bold heading; back: the rest),
  `z` any other summary point that has bold words (front: the sentence with the bold words blanked as `[ ... ]`; back: those words).
  Summary points without any bold word are skipped. A lesson that yields no card fails the build; so does a multiple-choice question without exactly
  one `opt ok`. The card text is plain text (no HTML) and each card keeps the lesson path and section id, for the "open its place in the lesson" link.
- **Card ids:** the first 8 hex digits of a SHA-1 of course, lesson number, kind, front and back. A card keeps its review history while its own text
  is unchanged; editing a question or answer starts that card fresh (old ids are dropped the next time review data is saved).
- **Scheduling (`assets/review.js`):** Leitner boxes 0 to 5. "تذكّرتها" moves a card up one box and it returns after 1, 3, 7, 14 and 30 days;
  "لم أتذكّرها" sends it to box 0, due tomorrow, and it comes back once at the end of the same session. A session is at most 20 cards: due cards
  first (oldest first), then new ones. A tick box reviews everything, due or not. The picker narrows by course and lesson.
- **Storage:** one `localStorage` key, `bm.review.v1`: `{"v":1,"c":{"<card id>":[box,dueDay]}}`, nothing else (no text, no names, nothing is sent
  anywhere). Whatever is read back is validated (known ids, small integers). If storage is blocked the review still works for the session and says
  that nothing is remembered. "مسح بيانات المراجعة" asks twice. The script carries the `security-reviewed:storage` marker.
- **Entry points:** every page has a "مراجعة" link in its top bar next to "بحث" (lesson pages from `src/templates/crumb-review.html`; hand-written pages
  carry `<a class="tab review" ...>`); the check requires it on every page except the review page itself.
- **Checks:** the page's ids and script order (cards before `review.js`), the deck parses, every card id is unique 8-hex, every card points at a real
  lesson page and an id that exists in it, no card text holds HTML, every lesson has cards, `review.js` has the storage marker and key; the deck is
  also covered by `build.ps1 -Check` (stale when a lesson's questions or summary change).
