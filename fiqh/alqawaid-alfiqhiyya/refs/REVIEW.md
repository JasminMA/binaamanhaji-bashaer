# REVIEW — «القواعد الفقهية» (independent check)

Checked: `fiqh/alqawaid-alfiqhiyya/{index,lecture1,lecture2,lecture3}.html` (built pages) against
`refs/shamil-qawaid.pdf`, PDF pages 2-26 read as images at 110 dpi. Page numbers below are PDF pages
(printed number = PDF - 1). No page was edited.

## Summary

- **HIGH: none.** Every definition, ruling, view and attribution checked (المعتمد / الأصح / «قول للإمام الشافعي لكنه ليس المعتمد» / «بعض المذاهب», the ~84 km travel distance, rain allowing only advanced combining, السلم بلفظ البيع → بيع على المعتمد, التعيين in a voluntary fast, the barbers' wage text, بيع المعاطاة) matches the source. No example, evidence or attribution was added.
- **The points the brief says to leave out really are left out:** «وهبتك هذا الثوب بكذا» (PDF 8), the dead person's wudu' «لغز» and الخلع/المفاداة among صرائح الطلاق (PDF 6), the «تذكير» boxes (PDF 13, 21), and the Telegram link and «تم تلخيص السلسلة» (PDF 26). No link or transcriber note appears in the page text.
- **Nazms are as printed, with their authors as printed:** القديمي (PDF 5), الأهدل (PDF 11), the seven-rulings line (PDF 5), الزبد (PDF 10), and the two الأخرس/الناطق lines attributed to «الناظم» (PDF 26).
- **Quran:** all 13 verses carry correct mushaf wording, tashkeel and references (البقرة ١٢٧، ٢٩، ١٨٥، ٢٣٩، ٢٨٠؛ الزمر ٣؛ المؤمنون ٥-٧؛ النساء ٢٩، ٢٨، ١٩؛ الحج ٧٨؛ الأعراف ١٩٩).
- **Hadith:** the wording matches the lecture. Only «لا ضرر ولا ضرار» is given a source (ابن ماجه), which is what the book does.
- **Quizzes:** 32 questions (3 lessons × 8, plus 8 in index). Each has exactly one option marked `opt ok`, the marked answer is confirmed by the source, and the other options are wrong by the source.
  - Answer positions are balanced: each position is correct twice in every set of 8.
  - The correct option is the longest in 1, 2 and 3 questions of lessons 1, 2 and 3, and in 3 index questions (gq2, gq4, gq7).
- **Summaries:** 12, 11 and 12 items. Each has a `<b>`, there are no duplicates, and each flashcard body is at least 12 characters.
- **Diagrams:** the text of all 15 drawn SVGs plus the index map was checked against the source and is correct.

## MEDIUM

1. **Quotation marks around wording that is not verbatim.** `index.html`, gq7 `p.exp`.
   - The page has: «عنوان المحاضرة السادسة: «القاعدة الخامسة من القواعد الخمس الكبرى: قاعدة العادة محكّمة»، وعنوان الخامسة: «القاعدة الرابعة: لا ضرر ولا ضرار»».
   - Source PDF 20: the heading under «المحاضرة الخامسة» reads «القاعدة الرابعة من القواعد الخمس الكبرى: قاعدة «لا ضرر ولا ضرار»». The second quote is shortened while still inside «». Both are section headings under the lecture title, not the lecture titles themselves.
   - Fix: «وفي المحاضرة السادسة: «القاعدة الخامسة من القواعد الخمس الكبرى: قاعدة العادة محكّمة»، وفي الخامسة: «القاعدة الرابعة من القواعد الخمس الكبرى: قاعدة لا ضرر ولا ضرار»».

2. **Totals stated where the lecture gives none.** The brief says «where the lecture gives no count, give none». The lecture only numbers these items with ordinals (الأولى…السابعة; ١-٤) and never states a total.
   - `index.html`, lesson card descriptions (also in NOTES-part1/2/3, course.json and probably cards-data.js / search-index.js):
     - «والقواعد الأربع المندرجة تحتها» (lesson 1, PDF 8-10)
     - «والقواعد السبع المندرجة تحتها» (lesson 2, PDF 12-14)
     - «والقواعد الست المندرجة تحتها» and «والقواعد الخمس المندرجة تحتها» (lesson 3, PDF 20-22, 25-26)
   - `index.html`, gq6 `p.exp`: «ويندرج تحتها في الدرس ست قواعد».
   - `lecture1.html`, mind map: «أربع فوائد لدراستها» (PDF 4 numbers ١-٤ without a total).
   - Fix: write «والقواعد المندرجة تحتها» / «ويندرج تحتها في الدرس قواعد، منها: …» / «فوائد دراستها».
   - This is borderline, because the lists are complete enumerations. Keep the totals if you count ordinal numbering as stating the count. The counts the book does state are used correctly: سبعة أسباب (PDF 15), ثلاثة أقسام of قطع النية (PDF 7) and of المشقة (PDF 17), and القواعد الكبرى «خمس» (PDF 4).

## LOW

3. **Same answer pattern in all three lessons.** `lecture1/2/3.html`: the correct positions are 2,4,1,3,3,1,4,2 in every lesson. A student who works through all three pages can learn the pattern. Fix: reshuffle the options in lessons 2 and 3 to a different balanced order (for example 3,1,4,2,1,3,2,4 and 4,2,3,1,2,4,1,3), keeping the longest-correct count at 3 or fewer.

4. **Correct option much longer than the others.**
   - `index.html` gq4: correct «إذا ضاق الأمر اتسع، وإذا اتسع الأمر ضاق.» is 40 characters; the others are 24-26.
   - `lecture3.html` b3q7: correct «باعتبار مدى العمل به عند أهله.» is 30 characters; the others are 14-20.
   - Both are within the rule (3 or fewer longest per 8), but they are easy to guess. Fix (b3q7): shorten to «باعتبار مدى العمل به.» or lengthen a distractor, for example «باعتبار قبوله: صحته وعدم صحته.» (PDF 24 wording).

5. **Unrelated sentence in the wrong callout.** `lecture2.html`, the note box «الجمع بسبب المرض» also contains «وأما الإكراه فلا يكون عذرًا في القتل والزنا.» That sentence is correct (PDF 16), but it is unrelated to the box title. Fix: move it out or retitle the box (for example «تنبيهان»).

6. **Mind map shortens the source wording.** `lecture3.html`, mind map: «محل اعتباره: ما لا ضابط له في الشرع ولا اللغة». Source PDF 25: «فيما ورد في الشرع مطلقًا ولم يرد له ضابط في الشرع ولا في اللغة». The section text and the summary have the full wording. Fix (optional): «ما ورد في الشرع مطلقًا بلا ضابطٍ شرعًا ولا لغةً».

7. **Verse quoted with a waw the book does not print.** `lecture2.html` cites ﴿وَمَا جَعَلَ عَلَيْكُمْ فِي الدِّينِ مِنْ حَرَجٍ﴾ [الحج: ٧٨]; PDF 15 prints it without the opening waw. Using the mushaf wording is correct per the brief and is already recorded in NOTES-part2. No change needed; recorded for the record only.

8. **Wording differs from the outline.** `lecture2.html` uses the printed wording of the seventh sub-rule, «لا عبرة بالظن إذا تبيّن خطؤه» (PDF 14), which is correct. OUTLINE.md has «البيّن خطؤه». Fix the OUTLINE only, if wanted.

## Checked and fine (no action)
- Lesson 1 (PDF 2-10):
  - definitions of القاعدة, الفقه and its three qualifiers, لقبًا, and النية / العزم
  - the relation to أصول الفقه, including الشافعي ٢٠٤هـ and the fourth century
  - the two sources with their four hadith-based examples
  - the three kinds with their examples, including the four ضوابط and their abwab
  - the four benefits, with Ibn Nujaym
  - مقاصد / حكم / محل / وقت / مفسدات (three categories, الأصح for the fast) / حقيقة / شروط (4) / كيفية
  - the four sub-rules with examples
  - all 8 questions and explanations.
- Lesson 2 (PDF 11-19):
  - اليقين / الشك (فقه vs أصول)
  - the two evidences, and the ظن vs أصل cases
  - the seven sub-rules with examples
  - the meaning and evidence of المشقة
  - the seven causes, with the ~84 km distance and the قول of al-Shafi'i on illness
  - the seven kinds of تخفيف, the kinds of مشقة, and the four sub-rules (with the شرط and both قيود)
  - all 8 questions.
- Lesson 3 (PDF 20-26):
  - الضرر / الضرار, why the hadith wording is أولى, and ابن ماجه
  - the six sub-rules with examples (the حجر types, the order of دفع, the مارّ, the bedouin's urine, المضمضة)
  - the meaning and evidence of العادة محكّمة
  - العادة vs العرف (three views), the four divisions, the four conditions «منها», and the محل with its three examples
  - the five sub-rules with the Shafi'i/other-schools split and the الأخرس/الناطق exceptions
  - all 8 questions.
- Index:
  - the glossary rows (24) match the lessons and the source
  - gq1-gq8: one correct answer each, with consistent explanations (apart from item 1 above).
