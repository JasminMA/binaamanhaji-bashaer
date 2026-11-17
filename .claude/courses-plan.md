# Adding the courses from `D:\البناء المنهجي`: work plan by model

This file is the hand-over point between sessions and models. Any session starts by reading it,
does the next open step for its model, and updates the progress table at the end.

Standing decisions (Yasmin): books are split on their own chapters; scanned-only
sources are read from page images and done last; `refs/` holds the text extract and small summary
PDFs only; commit and push after each course is complete; no Claude attribution in commits.

## The steps of one course, and who does each

Each step has one model, a fixed input, and a file it leaves behind. A step never needs the
conversation of the step before it: everything it needs is in the repository.

| Step | Model | What it does | Leaves behind |
|---|---|---|---|
| **1. Prepare** | Sonnet | Extract the PDF text, clean it, test whether it is scanned, list the chapter headings with page ranges, propose the slug and the page split. No summarising. | `refs/<name>_pdf.txt`, `refs/NOTES.md` (outline, page ranges, split, extraction problems) |
| **2. Write** | Fable or Opus | Read the whole source. Write `course.json`, every `lectureN.html` (text, mind map, quiz, and a `<!--SVG:name-->` marker where a drawn diagram goes), the diagram definitions, and the course page body. Record anything in the source that looks wrong. | lesson sources, `refs/diagrams.py`, `refs/index-body.html`, "source issues" section in `NOTES.md` |
| **3. Assemble** | Sonnet | Run the diagram script, build, `check-site`, `build -Check`, `list-quizzes`, the label-fit check in the browser. Create the specialty page if new, update the specialty and home pages. Fix mechanical faults only (markup, a label too long for its box, quiz position balance). Never change what a sentence says. | built pages, check results appended to `NOTES.md` |
| **4. Review** | Opus | Independent check of every fact, diagram label, verse reference and wording, and quiz answer against the source. Reads only the pages and `refs/`. Edits nothing. | `refs/REVIEW.md` (findings by severity) |
| **5. Fix** | Fable or Opus | Apply the review's HIGH and MEDIUM findings and the sensible NOTEs in `src/`. Short step. | fixed sources, "resolved" marks in `REVIEW.md` |
| **6. Ship** | Sonnet | Rebuild, rerun all checks, one commit for the course, push, update the table below. | commit on `add-courses`, updated table |

Fable limit rule (Yasmin): if Fable reports a usage-limit error, stop using Fable. Rerun the
unfinished work of that step on Opus (use `model: "opus"`), do not wait for the reset and do not retry
Fable. Work already saved in the repository stays; the Opus writer continues from it.

Rule for the cheap steps (1, 3, 6): if something needs a judgement about the content, stop and
write the question in `NOTES.md` for the next strong-model step. Do not decide it.

## Two ways to run it

**A. One orchestrating session on Sonnet (recommended).** The session does steps 1, 3 and 6 itself
and hands step 2 and step 5 to a subagent on `fable` (or `opus`), and step 4 to a subagent on
`opus`. No manual switching; the strong models are used only where the content is written or judged.

**B. Manual switching.** Work in batches so the model changes rarely:
1. Sonnet: step 1 for every course of a batch.
2. Fable/Opus: step 2, one course per session.
3. Sonnet: step 3 for the courses written.
4. Opus: step 4, one course per session.
5. Fable/Opus: step 5 for the reviewed courses.
6. Sonnet: step 6, course by course.

Either way: one course per writing session, so a session never carries more than one source.

## One-time tasks

Done: diagram helpers are in `tools/diagrams.py`, the label-fit check is described in
`tools/check-labels.md`, and the `add-new-material` skill points to this file.
Still waiting on Yasmin: OK to download a mushaf text file for an automatic verse check.

## Progress

Status: `-` not started · `1`…`5` last finished step · `done` committed and pushed.

The site is organised by specialty, not by level or stage (the site is now called مُدارسات and carries no
program branding). A course lives at `<specialty>/<slug>/`, with its source in `src/<specialty>/<slug>/`.
Specialties: `quran-sciences`, `hadith-sciences`, `usul-alfiqh`, `fiqh`, `aqeeda`, `nahw`,
`islamic-culture` (general topics). A new specialty needs a folder entry in `src/site.json` and an
index page. The "Source" column is only where the file sits under `D:\البناء المنهجي`; it does not
appear on the site.

### quran-sciences
| Course | Slug | Source | Status |
|---|---|---|---|
| الميسر في علوم القرآن | `muyassar-ulum-alquran` | L2 · stage 1 | done |
| فصول في أصول التفسير | `fusul-usul-altafsir` | L2 · stage 1 | done |
| إعجاز القرآن (scanned) | | L2 · stage 1 | - |

### hadith-sciences
| Course | Slug | Source | Status |
|---|---|---|---|
| شرح نظم المعين | `nazm-almuaeen` | L2 · stage 3 | done |
| شرح لغة المحدث | `lughat-almuhaddith` | L2 · stage 3 | done |
| تثبيت حجية السنة | `thabit-hujjiyat-alsunna` | L2 · stage 1 | done |
| معجم المصطلحات المقارن (`glossary`, hand-written) | `glossary` | | done |

### usul-alfiqh
| Course | Slug | Source | Status |
|---|---|---|---|
| شرح متن الورقات | `sharh-alwaraqat` | L2 · stage 2 | done (c0a39a7) |
| المدخل إلى علم أصول الفقه ١–٧ | `madkhal-usul-alfiqh` | L2 · stage 2 | done |
| التأهيل الفقهي (8 lectures; usul, follows the Waraqat verses of al-'Imriti) | `taahil-alfiqhi` | L1 · stage 4 | done |
| شرح منظومة أصول الفقه | `sharh-manzumat-usul-alfiqh` | L2 · stage 2 | done |

### fiqh
| Course | Slug | Source | Status |
|---|---|---|---|
| فقه العبادات (9 lectures) | `fiqh-alibadat` | L1 · stage 4 | done |

### aqeeda
| Course | Slug | Source | Status |
|---|---|---|---|
| شرح لمعة الاعتقاد | `sharh-lumat-alitiqad` | L2 · stage 2 | done |
| منهج الاستدلال | `manhaj-alistidlal` | L2 · stage 2 | done |
| دلائل أصول الإسلام | | L2 · stage 2 | - (specialty to decide) |

### nahw
| Course | Slug | Source | Status |
|---|---|---|---|
| شرح الأجرومية | `sharh-alajrumiyya` | L1 · stage 4 | done |

### islamic-culture
| Course | Slug | Source | Status |
|---|---|---|---|
| بوصلة المصلح | `bawsalat-almuslih` | L2 · stage 1 | done |
| مآلات الخطاب المدني | `maalat-alkhitab-almadani` | L2 · stage 3 | done |
| تاريخ الفكر الغربي الحديث | `western-thought` | L2 · stage 3 | done |
| جراحات المسلمين (scanned) | | L2 · stage 2 | - |

### Pending decision
| Course | Source | Status |
|---|---|---|
| القواعد الفقهية (Dr. Lubayb Najib, 26 pp, a separate series from التأهيل الفقهي; `shamil-qawaid` file in the same source folder) | L1 · stage 4 | - (specialty to decide: fiqh) |

### Dropped by Yasmin
طالب العلم والقراءة الأدبية، ومركزيات الإصلاح، والغزو الباطني.

Source folders: `D:\البناء المنهجي\المستوى الاول\المرحلة الرابعه\` and its siblings. Level 1 stages 2 and 3: not started (decide each course's specialty when it is added).

## Open questions for Yasmin
- «الورقات»: five places where the summary itself looks wrong (pp. 6, 10, 18, 27, 32) were left out or quoted as the summary's wording. Confirm or correct.
- «الميسر»: the source gives verses without references, so the [سورة: آية] references were supplied while writing; step 4 must check each one.
