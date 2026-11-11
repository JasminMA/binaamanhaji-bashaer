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
