# Review (step 4) — «المدخل إلى علم أصول الفقه»

Reviewer: independent check of `index.html` and `lecture1..6.html` (sources in `src/level2/stage2/madkhal-usul-alfiqh/`)
against every page of `refs/ملخص_المدخل_إلى_أصول_الفقه.pdf` (PDF 2-87, read from 110 dpi page images).
Page numbers below are PDF pages (printed = PDF - 1). Line numbers refer to the `src/` lesson files.

Overall: the transfer is faithful and careful. All 17 Quran quotations carry correct references and mushaf
wording; names, dates (٢٠٤، ٣٧٠، ٥٠٥، ٧٧١، ١٨٠هـ), book titles, the 14 topics of «الرسالة», the four books,
the madhhab tables and the three types of affected issues all match the source. The Shaykh's own-ijtihad
criterion (PDF 64) is labelled in lesson 5 (box, mind map and summary). No transcriber link or channel appears
in any page (PDF 87 Telegram line correctly ignored). Every quiz has exactly one `opt ok`, and every marked
answer is confirmed by the source.

---

## HIGH

### H1. Lesson 5: hadith wording cut, the conflict it illustrates disappears
- File: `src/.../lecture5.html` line 284 (section «المسألة الثانية: العمل عند تعارض الأدلة», row «مثال التعارض»).
- Page: «لا تستقبلوا القبلة بغائطٍ ولا بولٍ ولكن شرّقوا أو غرّبوا»
- Source PDF 66: «لا تستقبلوا القبلة بغائطٍ ولا بولٍ **ولا تستدبروها** ولكن شرّقوا أو غرّبوا».
- Why it matters: the example's whole point is that the prohibition of *استدبار* conflicts with Ibn ʿUmar's report
  «مستدبر الكعبة», and the Hanafi conclusion on the same page is «لا يجوز الاستقبال ولا الاستدبار». Without
  «ولا تستدبروها» the two texts no longer conflict.
- Fix: «لا تستقبلوا القبلة بغائطٍ ولا بولٍ ولا تستدبروها، ولكن شرّقوا أو غرّبوا».

---

## MEDIUM

### M1. Lesson 2: a count the source does not state («خمسة عوامل»)
- File: `lecture2.html` line 40 (mind map leaf «خمسة عوامل للضعف»), line 443 (SVG aria-label «شجرة العوامل الخمسة…»,
  defined in `refs/diagrams_part1.py` line 118), line 518 (summary/flashcard «أضعفت **خمسة عوامل** انتقال علم الأصول…»).
- Source PDF 29: «بدأ جيل التابعين وأتباعهم يواجهون أمورًا عدةً لم تكن موجودةً زمن الصحابة، **منها**:» then أولًا…خامسًا.
- The brief forbids stating a count the book does not state. Fix: mind map «عوامل الضعف (من أبرزها خمسة)» or simply
  «عوامل الضعف»; aria-label «شجرة من العوامل التي أدت…»; summary «أضعفت **عواملُ عدة** (منها: اتساع البلاد، وفقد
  اللسان العربي، وضعف الرواية…) انتقال علم الأصول وراثيًّا…».

### M2. Lesson 3: the transcriber's gloss is quoted as al-Shāfiʿī's words
- File: `lecture3.html` line 340 («المقطعان السادس والسابع: باب النسخ»).
- Page: قال الشافعي: «وجهٌ آخر يُقصد في الجمع بين النصوص»
- Source PDF 41: «قال: وجهٌ آخر -يقصد في الجمع بين النصوص-»: «يقصد» = «he means», the summariser's parenthesis, not
  the text of «الرسالة».
- Fix: قال الشافعي: «وجهٌ آخر» (يقصد: في الجمع بين النصوص)، ثم ساق…

### M3. Lesson 2: the action is attributed to Usāma
- File: `lecture2.html` line 305 (row «٣. جيش أسامة»).
- Page: «…إنفاذ الجيش، مع **استبقاء أسامة** بعض كبار الصحابة كعمر بن الخطاب لحاجة أبي بكر إليه».
- Source PDF 24: «…بإنفاذ جيش أسامة مع استبقاء بعض كبار الصحابة كعمر بن الخطاب لحاجة أبي بكر إليه»: the summary
  does not say who kept him back.
- Fix: «…إنفاذ الجيش، مع استبقاء بعض كبار الصحابة كعمر بن الخطاب لحاجة أبي بكر إليه».

### M4. Lesson 4 and glossary: «قرون الركود = القرن الثامن وما بعده» is stated with more certainty than the source has
- Files: `lecture4.html` lines 224-227 and 372 (summary); `index.html` line 194 (glossary row «قرون الركود»).
- Source PDF 51: the heading is «القرن الثامن وما بعده», but the very first words of the paragraph are
  «(القرن السابع فما بعد) هذه القرون عُرفت في تاريخ علوم الإسلام بقرون الركود…». The source is internally inconsistent
  and this was not recorded in the notes.
- Fix (safe): keep the heading as is, but in the glossary and summary avoid fixing a century:
  «قرون الركود: القرون المتأخرة بعد المحصول والإحكام، اقتصر التصنيف فيها على…»; record the PDF 51 inconsistency in NOTES.

### M5. index.html: «لقصرهما» is untrue
- File: `index.html` line 92: «دُمج الدرسان الثاني والثالث في صفحة واحدة **لقصرهما** وتقاربهما».
- Series lessons 2-3 are PDF 13-31 (19 pages), the longest part of the summary; lesson 2 is the largest page (~95 KB).
- Fix: «دُمج الدرسان الثاني والثالث في صفحة واحدة لاتصال موضوعهما (النشأة قبل التدوين)، فصارت المادة على ست صفحات.»

### M6. index.html cross quiz: answer positions and length clue (see the quiz section below for the concrete edits)
- Positions now: 1 → gq2, gq5, gq8 (3); 2 → gq3, gq6 (2); **3 → none**; 4 → gq1, gq4, gq7 (3).
- Correct option is the longest in **7 of 8** (all but gq3); limit is 3.

---

## NOTE

### N1. Lesson 1: «الأمرين» in the aria-label
- `lecture1.html` line 75 (SVG aria-label, from `refs/diagrams_part1.py` line 10): «شجرة الأمرين اللذين يتفقد بهما…».
- Source PDF 4: «يمكنه ذلك بأمور، **منها**:». Fix: «شجرة أمرين مما يتفقد به طالب العلم نيته: …».

### N2. Lesson 5: «ولم يُرَ نصًّا به»
- `lecture5.html` line 215. Source PDF 64: «ولم يَرَ نصًّا به» (the Shaykh did not see a text stating it).
  The passive «يُرَ» changes the subject. Fix: «ولم يَرَ نصًّا به» or clearer «ولم يقف فيه على نصٍّ لغيره».

### N3. Lesson 2: the garbled PDF 31 date is still awkward
- `lecture2.html` line 492: «منتصف القرن الثاني بعد المئة والخمسين من الهجرة تقريبًا».
- PDF 33 states the same point cleanly: «في منتصف القرن الثاني الهجري». Fix: «منتصف القرن الثاني الهجري تقريبًا».

### N4. Lesson 4 title differs between the course page and the lesson
- `course.json` / `index.html` line 155: «علم الأصول **ما** بعد رسالة الشافعي»; `lecture4.html` line 3: «علم الأصول بعد رسالة الشافعي».
  The source heading (PDF 44) is «علم الأصول ما بعد رسالة الشافعي». Use one form (the source's) in both.

### N5. Lesson 2: «قاعدة أصولية», second condition printed as in the source
- Writer kept the PDF 25 wording «أن ينتفي المانع من تركه ﷺ لهذا الفعل», which reads oddly; the source's own statement
  of the rule on PDF 24 is clearer: «…مع وجود المقتضي له وانتفاء مانع هذا الترك». Optional: quote the PDF 24 form.
  The quiz option (b2q5) is correct either way.

### N6. Small consistency points (optional)
- Luqman 13 is written without the pause mark ۖ while al-Zukhruf 44 has it; harmless, but be consistent.
- Lessons 3, 5 and 6 are each at the limit of 3 questions where the correct option is the longest (b3q4, b3q6, b3q8;
  b5q2, b5q7, b5q8; b6q1, b6q3, b6q7). Within the rule; if any option is edited, do not add a fourth.

---

## Writers' doubts and source issues: how they were handled (all safe)
- PDF 18 «حُمْر - شديدة البياض»: colours omitted except «أورق». OK.
- PDF 25 second condition: reproduced as printed (see N5). OK.
- PDF 31 garbled date: see N3.
- PDF 32 «إلى سنة ٩٤هـ»: date omitted. OK.
- PDF 41 «المفترض أن تعتد بالعدتين…»: left out; page gives al-Shāfiʿī's quoted conclusion. OK.
- PDF 46 «القرن الخامس تحديدًا» vs المستصفى (ت ٥٠٥هـ): pages say only «القرنان الخامس والسادس». OK.
- PDF 64 «فعمد إلى طريقة الجمهور»: left out. OK.
- PDF 70 vs 76 (three or four pillars of qiyās): no count given; L6 says only «أهم أركانه العلة». OK.
- PDF 84 «لا توجد صيغ للعموم، فالأمر لا صيغة له»: kept as the book's quotation. Acceptable.
- PDF 86 tanbīh wording smoothed («إن لم يكن…»، «وفيما عدا ذلك»). OK.
- Not recorded by the writers: PDF 51 السابع/الثامن inconsistency (M4).

## Quran quotations (all checked)
المجادلة ١١، الزمر ٩، الأنعام ١٦٢، البقرة ٨٥، الأعراف ٣٣، المائدة ٦، البقرة ١٨٧، الزخرف ٣، الزلزلة ٧-٨، البقرة ٢٨٦،
الأنعام ٨٢، لقمان ١٣، الانشقاق ٧-٨ و٨، الزخرف ٤٤، الشعراء ٢١٤، الشرح ٤، النحل ٨٩: references and wording correct.
Al-Baqara 187 rightly uses the mushaf «وَكُلُوا» where the summary prints «فكلوا». The Sūrat Muḥammad verses (PDF 8),
the ʿidda verses (PDF 39) and Ibn Masʿūd's shādhdh reading (PDF 69) are described, not quoted. OK.

---

## Quizzes

All 56 lesson questions and 8 cross questions: exactly one `opt ok`, the marked answer is what the source says,
distractors are wrong by the source, and every `p.exp` is supported.

| Quiz | Correct positions (q1-q8) | Count per position 1/2/3/4 | Correct = longest |
|---|---|---|---|
| L1 | 2,4,1,3,3,1,4,2 | 2/2/2/2 | 0 |
| L2 | 3,1,4,2,1,3,2,4 | 2/2/2/2 | 1 (q2) |
| L3 | 2,4,1,3,3,1,4,2 | 2/2/2/2 | 3 (q4,q6,q8) |
| L4 | 3,1,4,2,2,4,1,3 | 2/2/2/2 | 1 (q7) |
| L5 | 1,2,4,3,4,1,2,3 | 2/2/2/2 | 3 (q2,q7,q8) |
| L6 | 2,4,1,3,4,1,2,3 | 2/2/2/2 | 3 (q1,q3,q7) |
| index | 4,1,2,4,1,2,4,1 | **3/2/0/3** | **7** |

### Concrete fix for the index.html cross quiz (M6)
Target: positions 1 → gq2, gq8; 2 → gq3, gq6; 3 → gq4, gq5; 4 → gq1, gq7; correct = longest only in gq4, gq6, gq7.

1. **gq1** («مثقال ذرة» / «ما مسّت النار»): keep in position 4; shorten the correct option to
   «كلاهما تطبيقٌ لقاعدة صيغ العموم.» (32 chars; the others are 47/34/44).
2. **gq2** (why the later generations needed to write it down): keep in position 1; shorten the correct option to
   «لأن عواملَ كفقد اللسان العربي أضعفت توريثه.» (about 43 chars; option 2 is 52).
3. **gq3**: no change (position 2, not longest).
4. **gq4** (order of the works): move the correct option to position 3. New order:
   1 «مختصرات وشروح، ثم كتب متكاملة، ثم رسائل جزئية.» / 2 «الكتب الأربعة، ثم رسائل جزئية، ثم المختصرات.» /
   3 ✔ «رسائل جزئية، ثم تصنيف متكامل، ثم الكتب الأربعة، ثم المختصرات.» / 4 «كتب متكاملة، ثم رسائل جزئية، ثم الكتب الأربعة.»
   (stays longest: one of the 3 allowed).
5. **gq5** (reading «الرسالة» / stage of expansion): move the correct option to position 3 and shorten it. New order:
   1 «الاكتفاء بالمختصرات المعتمدة في المذهب الذي يُدرس فيه الفن.» / 2 «تقديم حفظ المتون وأسماء المصطلحات على كل قراءة.» /
   3 ✔ «قراءة الكتب الكبيرة كاملةً لا رجوع الباحث فقط.» (46) / 4 «ترك الكتب الكبار لأنها تُتعب المتخصص كما تُتعب المبتدئ.»
6. **gq6**: no change (position 2; longest by one character: one of the 3 allowed).
7. **gq7**: no change (position 4; one of the 3 allowed).
8. **gq8** (خبر الواحد فيما تعم به البلوى): keep in position 1; shorten the correct option to
   «تفرّدوا بها، وفيها نوعُ قربٍ من مذهب المعتزلة.» (46; option 2 is 50).

Result: 2/2/2/2 positions; correct = longest in 3 of 8 (gq4, gq6, gq7). No explanation (`p.exp`) needs changing.
The cross quiz exists only in the built `index.html` (and the candidates in `NOTES-part1..3.md`); apply the edit
wherever the step-5 writer regenerates the course page body, so a rebuild does not undo it.

---

## Counts
- HIGH: 1 (H1)
- MEDIUM: 6 (M1-M6)
- NOTE: 6 (N1-N6)

---

## Fix step (step 5) — status

PDF 51 and 66 re-checked from page images before editing.

- **H1 RESOLVED**: `lecture5.html` hadith now «…ولا بولٍ ولا تستدبروها، ولكن شرّقوا أو غرّبوا».
- **M1 RESOLVED**: `lecture2.html` mind map leaf «عوامل الضعف»; aria-label «شجرة من العوامل التي أدت…»; summary «أضعفت عواملُ عدة (منها: اتساع البلاد، وفقد اللسان العربي، وضعف الرواية)…». No «خمس» left in the lesson.
- **M2 RESOLVED**: `lecture3.html` «قال الشافعي: «وجهٌ آخر» (يقصد: في الجمع بين النصوص)، ثم ساق…».
- **M3 RESOLVED**: `lecture2.html` «مع استبقاء بعض كبار الصحابة…» (no agent named).
- **M4 RESOLVED**: heading «القرن الثامن وما بعده» and paragraph («هذه القرون…») kept as in the source; `lecture4.html` summary and `index.html` glossary now say «القرون المتأخرة بعد «المحصول» و«الإحكام»». Inconsistency recorded in `NOTES.md` → Source issues.
- **M5 RESOLVED**: `index.html` «…في صفحة واحدة لاتصال موضوعهما (نشأة علم الأصول إلى تدوينه)، فصارت المادة على ست صفحات.»
- **M6 RESOLVED**: cross quiz edited as listed (gq1, gq2 shortened; gq4, gq5 moved to position 3, gq5 shortened; gq8 shortened to «مسألةٌ تفرّدوا بها، وفيها قربٌ من مذهب المعتزلة.» (48; keeps the shared «مسألةٌ» opening, option 2 is 50)). Result: positions 1/2/3/4 = 2/2/2/2 (gq2,gq8 / gq3,gq6 / gq4,gq5 / gq1,gq7); correct = longest only in gq4, gq6, gq7 (3 of 8). One `opt ok` per question; no `p.exp` changed.
- **N1 RESOLVED**: `lecture1.html` aria-label «شجرة أمرين مما يتفقد به طالب العلم نيته…».
- **N2 RESOLVED**: `lecture5.html` «ولم يَرَ نصًّا به».
- **N3 RESOLVED**: `lecture2.html` timeline «منتصف القرن الثاني الهجري تقريبًا».
- **N4 RESOLVED**: `lecture4.html` h1 now «علم الأصول ما بعد رسالة الشافعي» (source form, matching course.json and index.html).
- **N5 NOT CHANGED**: optional; the page already glosses the PDF 25 wording («أي: لا يوجد مانعٌ يمنع هذا الترك»).
- **N6 RESOLVED (first point)**: Luqman 13 now carries the pause mark ۖ like al-Zukhruf 44. Second point: no lesson-quiz option edited, so the longest-option counts are unchanged.

Generated pages under `level2/stage2/madkhal-usul-alfiqh/lecture*.html` were not touched; they need the build to pick up the `src/` edits.
