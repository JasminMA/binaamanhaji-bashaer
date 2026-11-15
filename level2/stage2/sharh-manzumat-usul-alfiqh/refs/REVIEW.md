# REVIEW (step 4) — «شرح منظومة أصول الفقه»

Reviewer: independent check of the built pages `index.html`, `lecture1..8.html` (sources in
`src/level2/stage2/sharh-manzumat-usul-alfiqh/`) against the source PDF, read from page images
(110 dpi, verse lines re-rendered at 220 dpi where needed). Every content page of every lesson range
was read (covers and index pages skipped). PDF page numbers are used below.

Checked: facts and attributions (poem verse vs. explanation), counts, lists, examples, quoted verses of
the poem, Quran wording and references, hadith wording, every diagram label and table cell, the
summary items (flashcards), the glossary, and all 72 quiz questions (64 lesson + 8 course-page).

Overall: the course is faithful to the summary. The source issues the writers listed in
NOTES-part1..4 were all handled safely (left out or reworded without stating anything wrong); I
confirmed each against the page images (PDF 19, 20, 21, 22, 27, 56, 62, 67, 69/72, 91, 92, 147, 154,
165). All Quran quotations and references checked are correct mushaf wording. Every quiz has exactly
one `label.opt ok`, four options, and 2/2/2/2 answer positions.

---

## HIGH (wrong fact or wrong answer)

None found.

---

## MEDIUM (misleading or unsupported)

### M1. lecture7 — the «لا تخن من خانك» case adds a wrong detail
- Location: section «ثالثًا: وجوب أداء الأمانة…», box «مسألة: هل تخون من خانك؟» (src lecture7.html line ~227).
- Page text: «…فطالبه بالوديعة فأنكر ولا بيّنة، فحلف **وأخذ المدّعي مائة ألف ظلمًا**.»
- Source PDF 134: the creditor denied the deposit and swore «بأنه ما أعطاه الأمانة، وفي ذمّة المدّعي للحالف مائة ألف». Nobody "took 100,000"; the point is that the depositor still owes the denier 100,000 and must pay it. «وأخذ المدّعي مائة ألف ظلمًا» is not in the book and reverses who holds what.
- Fix: replace with «…فأنكر ولا بيّنة، فحلف أنه ما أعطاه الأمانة، وفي ذمّة المدّعي للحالف مائة ألف.»

### M2. index.html — course quiz: the correct option is the longest in 5 of 8
- Rule: at most 3 of 8. Longest-correct: gq2 (70 vs 46/46/54 chars), gq3 (61 vs 47/52/39), gq4 (49 vs 25/24/43), gq5 (58 vs 28/38/31), gq6 (50 vs 38/38/38).
- Fix: shorten the correct option or lengthen distractors in at least two of these, e.g.
  - gq2: correct → «المعاملات على الحل، والعبادات على المنع إلا بإذن.»
  - gq5: lengthen distractors, e.g. «لأن الأول ناسٍ معذور، والثاني جاهلٌ غير معذور بجهله.»
  - gq6: lengthen a distractor, e.g. «بالاستحسان؛ لأن في بيعه غبطةً ظاهرةً ومصلحةً للمالك.»

### M3. index.html — gq2 `p.exp` states a link the book does not make
- Text: «…؛ **ولذا** كان المنهي عنه في البابين فاسدًا، ولا بد أن توافق العبادة…»
- Source PDF 21 (حكم المنهي عنه) and PDF 23/27 (الأصل في الأشياء…) are separate rules; the book never derives the fasad of the forbidden from «الأصل في الأشياء الحل». The «ولذا» is the writer's inference.
- Fix: drop «ولذا كان المنهي عنه في البابين فاسدًا،» and keep: «وفي البيت: «…»؛ ولا بد أن توافق العبادة الشرع في سببها وجنسها وقدرها وكيفيتها وزمانها ومكانها.»

---

## NOTE (polish)

### N1. lecture1 — first verse carries a print error
- Page: «الْحُمْدُ لِلَّهِ الْمُعِيدِ الْمُبْدِي …». The print (PDF 3, checked at 220 dpi) does show a damma on the ح, but that is a typo in the summary; the word is «الْحَمْدُ».
- Fix: write «الْحَمْدُ» (or remove the vowel on the ح) and, if wanted, record it under source issues.

### N2. index.html glossary — «الشك» and «الوهم» appear twice with different definitions
- Rows: الشك (٤) «التردد بين شيئين، ويقابله اليقين» and الشك (٨) «ما تساوى فيه الأمران…»; الوهم (٤) and الوهم (٨). Both pairs are faithful to their pages (PDF 63–64 and PDF 153), but the book itself defines الشك differently in the two places (PDF 63 says it «يشمل ما ترجّح أحدهما… وما لم يترجّح»). A student memorising the glossary meets two "definitions" of one term.
- Fix (optional): merge each pair into one row naming both lessons, or keep one row per term (lesson 8's five-level scale is the clearer one).

### N3. lecture3 — «قال الشيخ: «وعندي في الوقت الحاضر خاصةً…»» (card «منع المرأة من السفر بلا محرم»)
- PDF 58 has the first-person «وعندي…» without a name. Attributing it to the Shaykh is reasonable (the summary is of his own explanation) and not wrong; just noting that the words «قال الشيخ» are the writer's. No change required.

### N4. lecture5 — Quran quotations extended beyond the book's excerpt
- PDF 78 quotes only «قد جاءكم برهان من ربكم»; the page quotes all of النساء ١٧٤ (﴿يَا أَيُّهَا النَّاسُ قَدْ جَاءَكُم بُرْهَانٌ… نُورًا مُّبِينًا﴾). Similarly الروم ٢٧ is given in full where PDF 83 has only its first part. The wording and references are correct, so nothing is wrong; but the extra text is not in the source.
- Fix (optional): trim to the part the book quotes: ﴿قَدْ جَاءَكُم بُرْهَانٌ مِّن رَّبِّكُمْ﴾ [النساء: ١٧٤]; ﴿وَهُوَ الَّذِي يَبْدَأُ الْخَلْقَ ثُمَّ يُعِيدُهُ وَهُوَ أَهْوَنُ عَلَيْهِ﴾ [الروم: ٢٧].

### N5. index.html — gq7 is an inference, not a statement of the book
- «ما الذي يجمع بين تعريف المدّعي… وقاعدة اليقين لا يزول بالشك؟ — كلاهما مبنيّ على اعتبار الأصل.» Both halves are in the book (PDF 128; PDF 147) and the wrong options are clearly wrong, so the answer is safe; the linkage is the writer's. Acceptable for a cross-lesson question.

### N6. lecture3 — «الحاضرة على الفائتة» next to «الترتيب في قضاء الفوائت واجب»
- The tree «عند التزاحم» lists «الفرض على النفل، والحاضرة على الفائتة» (PDF 52), while the «مسائل ملحقة» card says the ordering of missed prayers is obligatory (PDF 50). Both are in the book and are about different situations; a reader may see a contradiction. Optional: no change, or add nothing (do not add explanation not in the book).

---

## Quiz audit summary

| Page | Positions (1-4) | Correct = longest | Result |
|---|---|---|---|
| lecture1 | 1,2,4,3,1,2,4,3 | 1 | OK |
| lecture2 | 3,1,4,2,2,4,1,3 | 2 | OK |
| lecture3 | 2,4,1,3,4,1,2,3 | 2 | OK |
| lecture4 | 3,1,4,2,3,4,2,1 | 3 | OK (at the limit) |
| lecture5 | 2,4,1,3,3,1,4,2 | 1 | OK |
| lecture6 | 3,1,4,2,2,4,1,3 | 2 | OK |
| lecture7 | 2,4,1,3,3,1,4,2 | 2 | OK |
| lecture8 | 3,1,4,2,2,4,1,3 | 1 | OK |
| index (course quiz) | 4,1,3,4,2,1,2,3 | 5 | M2 |

Every marked answer was confirmed on the source page; every distractor is wrong by the book; all
`p.exp` texts are supported except index gq2 (M3).

## Verified items worth recording (no action)
- Quran: all references in NOTES-part1..4 lists checked (e.g. النساء ١٦٥، القصص ٥٩، الإسراء ١٥، البقرة ١٧٣، الزمر ٧، الأنعام ١١٩، النور ٦٣، المائدة ٢، الأحزاب ٢١ و٣٧، الأنعام ١٠٨، البقرة ١٨٥، النساء ١١٥، فصلت ٣٩، ق ١٥، يس ٧٨–٨٣، غافر ٥٧، البقرة ٢٨٢، التوبة ٩١، البقرة ٢٣٠، المائدة ١، آل عمران ٨٥، النساء ٢٣ و٩٢، البقرة ٢١، آل عمران ٤٤، الصافات ١٤١، إبراهيم ٣٤، مريم ٩٨، النساء ١٢٣، النحل ٦٦، المجادلة ١، المائدة ٦ و٨٩): wording and numbers correct.
- Counts: شروط العرية ٥ (PDF 20)، شروط العبادة ٦ (PDF 31)، فوائد فهم العلل ٥ (PDF 26–27)، أقسام فعل النبي ﷺ (PDF 46–47 and 50)، مواضع عدم اعتبار الشك ٣ (PDF 64)، وجوه حجية قول الصحابي ٣ (PDF 75)، أدلة القياس العقلية ٧ (PDF 83)، حالات عدم الضمان ٣ (PDF 103–104)، صور الإذن ٤ (PDF 106)، أقسام العقود ٣ (PDF 110)، حالات المطلق ٣ (PDF 112)، أقوال ضمان العارية ٤ (PDF 133)، أقسام الأمناء ٣ (PDF 132)، مراتب الإدراك ٥ (PDF 153): all match.
- Source-issue handling confirmed: PDF 154 «ست مواضع» and PDF 165 «ستة» counts not stated; PDF 56 «نقدّم المباح» dropped; PDF 19 «بشرطين» dropped; PDF 147 cut verse quoted only to its first hemistich.

## Counts
- HIGH: 0
- MEDIUM: 3 (M1 lecture7; M2, M3 index.html)
- NOTE: 6

---

## Fix step (step 5) — status

- M1 — RESOLVED. src lecture7.html: «فحلف وأخذ المدّعي مائة ألف ظلمًا» → «فحلف أنه ما أعطاه الأمانة، وفي ذمّة المدّعي للحالف مائة ألف» (re-checked against PDF 134).
- M2 — RESOLVED. index.html course quiz: shortened correct options gq2 («المعاملات على الحل، والعبادات على المنع إلا بإذن.»), gq3 (hadith quoted from «حتى يسمع…»), gq4 («…فيعود الحكم إلى ما كان.»); lengthened distractors gq5 opt1 and gq6 opt3 (both still wrong by the book). Correct = longest now 2 of 8 (gq3 tied, gq5); positions unchanged 4,1,3,4,2,1,2,3 (2 each); one `label.opt ok` per question.
- M3 — RESOLVED. gq2 `p.exp`: removed «ولذا كان المنهي عنه في البابين فاسدًا،».
- N1 — RESOLVED. src lecture1.html first verse: «الْحُمْدُ» → «الْحَمْدُ».
- N2 — RESOLVED. index.html glossary: merged the two «الشك» rows and the two «الوهم» rows into one row each (at the lesson-4 position), keeping both lessons' wording and linking lessons ٤ and ٨.
- N3, N4, N5, N6 — NOT CHANGED (optional / no change required).
- Lecture pages under level2/ not regenerated here (build not run); the src edits to lecture1 and lecture7 take effect on the next build.
