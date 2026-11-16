# REVIEW (step 4) — «فقه العبادات» (Level 1, stage 4)

Reviewer: independent check of the built pages `level1/stage4/fiqh-alibadat/index.html` and `lecture1..9.html`
against `refs/lecture1.pdf .. lecture9.pdf`. Every page of all nine PDFs was read from page images
(110 dpi; 200-220 dpi zooms on L3 p.3, L4 p.7, L7 p.2-3). PDF page numbers below (printed number = PDF page − 1).
Nothing was edited except this file.

Global checks that passed:
- No Telegram link, no «تم تلخيص المحاضرة», no «تذكير: لا تنسَ تجديد نيتك…» box, no pen strokes or page frames in any page (grep: 0 hits for `t.me`, `swaadel`, `تيليجرام`, `تجديد نيتك`, `تم تلخيص`). No leftover `<!--SVG:` markers.
- All 16 Quran quotations checked against the mushaf: wording and references correct (النساء ١٠٣، الواقعة ٧٩، الزخرف ١٣-١٤، النساء ٤٣، البقرة ١٤٤، البقرة ٢٣٩، الجمعة ٩، المدثر ٢١، الأنعام ١٤١، التوبة ٦٠، البقرة ١٨٤، البقرة ١٩٦ ×٢، آل عمران ٩٧، البقرة ١٩٧، الحج ٢٩، المائدة ٩٥).
- Hadith wording matches the lectures; nothing completed from memory.
- Numbers and measures checked and correct: qullatayn (٢٠٠/١٩٠/١٩٦/١٩٣/٢١٦، الحقيبة ١٩٣), Fatiha letters (١٥٥/١٥٦), adhan 15 sentences, hayd/tuhr/nifas limits, kusuf verse-lengths, distances for qasr (٤٨ ميلًا، ١٤٤ كم عند النووي، ٨٤ كم عند ابن عبد البر, both kept), ٣٠٠ ذراع ≈ ١٥٠ م, gold ٨٥ / ٩٧ / ١١٣ g, silver ٥٩٥ g, ٥ أوسق = ٣٠٠ صاع = ١٢٠٠ مد, ٦١١/٦٥٠ kg, camel/cow/sheep tables, صاع ≈ ٢.٥ kg, مد ≈ ٦٠٠ g, bodies of the kaffarat and fidyas, عرفة time, التحلل.
- Views kept with their holders: الرافعي / النووي on jama'a, ابن حجر on الأقرأ and on the start of mash and on طواف الوداع, الرملي / ابن حجر on الضحى, النووي and أحمد on jam' for illness, المالكية on الدلك, أحمد on الحجامة, الحنفية on الفاسد والباطل, «من مفردات المذهب», «بإجماع المذاهب الأربعة», «مذهب الجمهور» on النقد in زكاة الفطر.
- Flagged source points handled safely: L9 arkan (no count stated, six listed as the series numbers them); «ذو الحليفة» merged into one row; L8 جنون/إغماء left out of مبطلات الاعتكاف with «من مبطلات…»; L7 «القوت» left out; L1 p.4 clause «حتى وإن كان ناطقًا» left out (but see H1); L6 «(الأول)» (see N1). L4 «أربع كلمات» was NOT handled safely (see H2).
- Lesson quizzes: every one of the 72 questions has exactly one `label.opt ok`, four options, a unique radio name and a `p.exp`; marked answers are confirmed by the lectures and the distractors are wrong by the lectures. Positions 1-4 twice each in all nine lesson quizzes. Correct option longest: L1 3 (Q1,Q2,Q8), L2 3 (Q4,Q7,Q8), L3 3 (Q2,Q6,Q8), L4 2, L5 3 (Q3,Q6,Q7), L6 2 (Q2,Q5; Q6 tie), L7 0, L8 2 (Q1,Q5 both ties), L9 2 — all within the limit of 3.

---

## HIGH (wrong fact or ruling that would be memorised)

### H1. L1: «سلامة الحواس» example states a pairing that is not the Shafi'i rule
- File: `lecture1.html`, section «ثالثًا: شروط الصلاة», card «سلامة الحواس».
- Page: «من وُلد وهو أصم وأبكم فلا تجب الصلاة عليه.»
- Source: lecture1.pdf p.4 (printed ٣): «فمن ولد وهو أصم وأبكم فلا تجب الصلاة عليه حتى وإن كان ناطقًا». The clause «حتى وإن كان ناطقًا» contradicts «أبكم» and shows the transcription slip: the known Shafi'i wording of this condition is «فلا تجب على من خُلق أعمى أصمّ ولو ناطقًا». A sighted deaf-mute is not exempt in the madhhab. By dropping the clause the page turned a garbled sentence into a clean, wrong ruling.
- Fix: remove the example sentence and keep only the heading «سلامة الحواس» (it is in the series' list); record in NOTES-part1 that the example on p.4 is garbled. (If the editors allow a correction with a note, the correct example is «من خُلق أعمى أصمّ ولو كان ناطقًا»; but the safe fix is removal.)

### H2. L4: «النطق بأربع كلمات فأكثر ولو ناسيًا» stated as a fixed rule in the mubtilat grid
- File: `lecture4.html`, «خامسًا: مبطلات الصلاة ومكروهاتها», SVG grid row ٣: «النطق بأربع كلمات فأكثر | ولو ناسيًا؛ وما دون الأربع لا يبطل».
- Source: lecture4.pdf p.8 (printed ٧). This is one of the doubtful points in OUTLINE §5 / NOTES-part2: the madhhab rule is that forgetful speech voids when it is كثير عرفًا and the يسير is excused (commonly estimated at up to six عرفي words), so «four words voids even if forgetful» is not the mu'tamad and the writer's own notes say so. The brief requires such points not to be stated as fact; the grid states it flatly. It also clashes in tone with the same lesson's sujud section («ولو تكلم بكلام قليل ناسيًا لم تبطل»).
- Fix: change the row to «الكلام الكثير ولو ناسيًا | أما القليل ناسيًا فلا يبطل» (both halves are in the lecture: p.8 and p.12), drop the number, and record the change. Do the same in the SVG aria-label if it repeats the count.

### H3. L4: hadath as a mubtil «حتى من … دائم الحدث» without the lecture's limit
- File: `lecture4.html`, mubtilat grid row ٨: «الحدثان الأكبر والأصغر | حتى من فاقد الطهورين أو دائم الحدث».
- Source: lecture4.pdf p.9 (printed ٨): «حتى ولو كان من فاقد الطهورين أو دائم الحدث **من غير حدثه الدائم**». Without the limit the page says the continuous hadath of a dā'im al-hadath voids his prayer, which is wrong in the madhhab and contradicts L2 (دائم الحدث prays with طهارة الضرورة).
- Fix: «حتى من فاقد الطهورين، أو من دائم الحدث بغير حدثه الدائم».

---

## MEDIUM (misleading, unsupported or incomplete)

### M1. index.html cross-course Q4 (gq4): answer and explanation rest on an inference the lectures do not make
- Question: «ما الذي يجمع بين بطلان التيمم بزوال المرض، وبطلان الصلاة بحدوث نجاسة لم يلقها حالًا؟»; marked: «أن العذر الذي أباح الأمر زال أو لم يُتدارك في حينه». The rule «ما جاز لعذر بطل بزواله» (lecture3.pdf p.4) concerns tayammum; the najasa ruling (lecture4.pdf p.9) is not presented as an application of it and involves no permitting excuse. The writer marked this question as weak (NOTES-part2). The p.exp also says «الدرس الثالث/الرابع» while the site says «القسم».
- Fix: replace it, e.g. with NOTES-part2 gq1 (الردة تبطل التيمم ولا تبطل الوضوء، ولا يصح قبل الوقت ← «أن التيمم طهارة ضعيفة، طهارة ضرورة», lecture3.pdf p.3-4), or with NOTES-part3 gq2 (السفر: الجمعة/الجماعة/القصر; lecture5.pdf p.2 and p.9, lecture6.pdf p.2). Put the new correct option in position 3 (see the reorder below).

### M2. index.html cross-course quiz: position balance and length cue
- Current correct positions Q1-Q8: 4,1,4,1,2,1,2,4 (pos1 ×3, pos2 ×2, pos3 ×0, pos4 ×3).
- Concrete reorder (only two questions change):
  - Q4 (gq4): order the options as (1) «أن كليهما من نواقض الوضوء.» (2) «أن كليهما يوجب سجود السهو.» (3) the correct option (4) «أن كليهما لا أثر له إذا وقع سهوًا.» — correct moves 1 → 3. (If Q4 is replaced per M1, put the new correct option third.)
  - Q8 (gq8): order as (1) «فدية العاجز عن الصوم عن كل يوم.» (2) «إطعام ستين مسكينًا في الكفارة المغلظة.» (3) «الصدقة في فدية الأذى في الحج.» (correct) (4) «زكاة الفطر عن الشخص الواحد.» — correct moves 4 → 3.
  - Result: 4,1,4,3,2,1,2,3 → each position exactly twice.
- Correct option is the longest in 6 of 8 (Q1, Q2, Q4, Q5, Q6, Q7); limit is 3. Lengthen one distractor (still clearly wrong) in three questions, e.g.:
  - Q1 option 2 → «الصلاة والطواف والصوم والمكث في المسجد والعبور فيه وقراءة القرآن بقصد القراءة.» (الصوم and العبور make it wrong; lecture2.pdf p.10).
  - Q2 option 4 → «كلاهما يصح به رفع الحدث بالوضوء والغسل، دون إزالة الخبث عن البدن والثوب.»
  - Q6 option 3 → «أن الرخصة تبقى للمسافر بعد زوال العذر، كمن وصل إلى بلده في أثناء الصلاة.» (wrong by lecture6.pdf p.3, شرط ٨).
  - Then the correct option is longest only in Q4, Q5, Q7 (3 of 8). Recount after editing; if Q4 is replaced, keep its correct option from being the longest or lengthen one more distractor.

### M3. L7: garbled source sentence on السائمة rewritten into a confusing rule
- File: `lecture7.html`, «أولًا: زكاة بهيمة الأنعام», card ١ «أن تكون سائمة»: «فإذا لم تكن سائمة، والذي يسومها هو مالكها، فلا زكاة فيها.»
- Source: lecture7.pdf p.2 (printed ١), zoomed at 220 dpi: «فإذا كانت سائمة، والذي يسومها هو مالكها =فلا زكاة فيها» — itself garbled (it denies zakat in the very case where it is due). The page silently inserted «لم» and produced a sentence that still does not state a rule a student can use (and is not recorded in NOTES-part4).
- Fix: delete the sentence (the definition before it is enough) and record the garbled line in the notes.

### M4. L7: third condition of زكاة الفطر copied in a form that misstates the condition
- File: `lecture7.html`, «رابعًا: زكاة البدن», condition ٣: «أن يكون واجدًا ما يكفيه ويكفي من ينفق عليهم ليلة العيد ويومه».
- Source: lecture7.pdf p.7 (printed ٦), exactly as printed; NOTES-part4 records that the word for "surplus" is missing. As written it reads as "whoever has his day's needs must pay", whereas the condition is having something beyond those needs. A student would memorise the weaker condition.
- Fix: either drop condition ٣ and say «من شروطها» for the two that remain, or keep it and add «(كذا في الملخص)» so it is not memorised as the rule. Do not add the missing word without a source.

### M5. L4 mind map: a count the lecture does not give
- File: `lecture4.html`, mind map branch «من الشروط»: «يسقط في ثلاث حالات».
- Source: lecture4.pdf p.2: «ويسقط شرط استقبال القبلة في حالات، منها:» (three are listed as examples). The body correctly says «منها».
- Fix: «يسقط في حالات، منها ثلاث» or «من حالات سقوطه: السفر، والخوف، والعجز».

### M6. L5: the ٣٠٠-cubit distance is given without its reference point
- File: `lecture5.html`, SVG tree «مكان الاقتداء», leaf «ألا تزيد المسافة عن ٣٠٠ ذراع تقريبًا (١٥٠ مترًا تقريبًا)».
- Source: lecture5.pdf p.5: «وألا تزيد المسافة بين المأموم وآخر المسجد عن ثلاثمائة ذراع تقريبًا». Without «بين المأموم وآخر المسجد» the leaf can be read as the distance to the imam.
- Fix: «ألا تزيد المسافة بين المأموم وآخر المسجد عن ٣٠٠ ذراع تقريبًا (١٥٠ مترًا تقريبًا)» (raise `leaf_w` if needed).

---

## NOTE (polish, or silent corrections that should be recorded)

- N1. L6 `lecture6.html`, «ما يُسن في صلاة الجنازة», row «التسليمة الثانية»: «والسلام (الأول) ركن». The parenthesis is the writer's, but it is correct (the seventh pillar «السلام» = the first salam) and consistent with the sunna «التسليمة الثانية» on lecture6.pdf p.6. Safe to keep; smoother: «والتسليمة الأولى هي الركن السابع».
- N2. L3 `lecture3.html`, «لكل فرض»: «ولا بين فرض شرعي وفرض منذور». The source (lecture3.pdf p.3, zoomed) prints «وفرض مندوب»; the page silently corrected it to «منذور», which fits the example («ركعتين منذورتين») and the madhhab. Keep, but record the correction in NOTES-part2.
- N3. L4 `lecture4.html`, «الإسرار والجهر»: the page lists «خسوف القمر» among the jahr places; the source (lecture4.pdf p.7, zoomed) prints «وصلاة الكسوف». The correction is right and consistent with lecture4.pdf p.14 (الكسوف سرية، الخسوف جهرية). Keep and record it in NOTES-part2.
- N4. L4 «خطبتا العيد»: «ويختم الثانية بالدعاء للمؤمنين، والأفضل أن يكون في آخرها» says the same thing twice in a self-contradictory way. Source (lecture4.pdf p.14): the dua must be in the second khutba, at its start or middle or end, and the end is best. Suggest «ويدعو للمؤمنين في الثانية، والأفضل أن يكون في آخرها».
- N5. L5 SVG aria-label of the excuses tree says «أعذار خاصة اثنا عشر»; the source says «ومنها» (lecture5.pdf p.2). The visible text already says «وذكر الملخص منها»; align the aria-label («من الأعذار الخاصة…»).
- N6. L7 card «لماذا لا زكاة في العاملة؟» and Q1: fine; Q1 distractor «لأن مالكها ينفق عليها من علفه» is close to the reason for المعلوفة (lecture6.pdf p.9). It is wrong for the question asked, but a sharper distractor would be safer (e.g. «لأنها من غير بهيمة الأنعام»).
- N7. index.html glossary has «النية» (القسم ٢) and «النية (اصطلاحًا)» (القسم ٤) with the same definition; drop one or merge as «النية — … — ٢، ٤».
- N8. index.html Q6 (gq6): «الشريعة جاءت بتيسير الأحكام التي فيها مشقة» is said in the lecture of السفر only (lecture6.pdf p.2); extending it to rain is an inference. Acceptable, but «…جاءت بتيسير بعض الأحكام» would match the lecture's wording.
- N9. L1 «سلامة الحواس» also appears as a tree leaf (fine), and the card under «شروط وجوب» after the H1 fix will be heading-only; consider merging the six short cards into one list to avoid an empty-looking card.

---

## Fix step (step 5) — status

Every point was re-checked on the rendered PDF page before editing. Edits in `src/level1/stage4/fiqh-alibadat/lecture1,4,5,6,7.html` and `level1/stage4/fiqh-alibadat/index.html`; corrections recorded in `refs/NOTES.md` «Source issues (filled by the writing step)». No build, git or diagram script was run; generated pages under `level1/` (other than the hand-made index) are not touched and need the build.

- H1 RESOLVED. L1 row «سلامة الحواس»: garbled example removed; row now reads «من شروط وجوب الصلاة الستة كما عدّها الملخص.» Recorded in NOTES.md.
- H2 RESOLVED. L4 grid row ٣: «الكلام الكثير | ولو ناسيًا؛ أما القليل ناسيًا فلا يبطل» (p.8 + p.12); count dropped. The aria-label had no count.
- H3 RESOLVED. L4 grid row ٨ left cell: «حتى فاقد الطهورين، ودائم الحدث بغير حدثه» (font 11.5 to fit the 294px box; the full «بغير حدثه الدائم» did not fit).
- M1 RESOLVED. index gq4 replaced by NOTES-part2 gq1 (الردة/قبل الوقت ← «طهارة ضعيفة، طهارة ضرورة», lecture3.pdf p.3-4), renamed gq4, correct in position 3; one distractor lengthened («…رفعًا مؤقتًا إلى أن يجد الماء», wrong by p.3 «التيمم لا يرفع الحدث») so the correct option is not the longest; p.exp quotes the lecture and uses «القسم».
- M2 RESOLVED. gq8 reordered (correct → 3). Distractors lengthened in gq1, gq2, gq6 as proposed (gq6 example worded on lecture6.pdf p.3 «وصلت السفينة إلى مدينته»). Recount: positions 4,1,4,3,2,1,2,3 (each twice); correct longest in gq5, gq7 only (2 of 8). Exactly one `label.opt ok` per question.
- M3 RESOLVED. L7 card ١: the garbled sentence deleted; definition kept.
- M4 RESOLVED (option 2). L7 condition ٣ kept as printed, with «كذا في الملخص، ويظهر أن في العبارة سقطًا؛ فلا تُحفظ بهذا اللفظ على أنها الضابط.» No word added. (Kept rather than dropped because the lecture's next line says «هذه الشروط الثلاثة».)
- M5 RESOLVED. L4 mind map: «يسقط في حالات، منها ثلاث».
- M6 RESOLVED. L5 leaf: «ألا يزيد ما بين المأموم وآخر المسجد عن ٣٠٠ ذراع (نحو ١٥٠ م)» (font 11 to fit); the muted note under the tree gives the full wording with «تقريبًا» twice as in the lecture.
- N1 RESOLVED. L6: «وهي من السنن، والتسليمة الأولى هي الركن السابع.»
- N2 NOT CHANGED (page correct); correction recorded in NOTES.md.
- N3 NOT CHANGED (page correct); correction recorded in NOTES.md (source is lecture4.pdf p.7, printed ٦).
- N4 RESOLVED. L4 «خطبتا العيد»: «ويدعو للمؤمنين في الخطبة الثانية: في أولها أو أثنائها، والأفضل أن يكون في آخرها.» (p.14).
- N5 RESOLVED. L5 aria-label: «من الأعذار الخاصة ما في الفروع، ومن الأعذار العامة…»; no count.
- N6 RESOLVED. L7 Q1 distractor → «لأنها ليست من بهيمة الأنعام.»
- N7 RESOLVED. index glossary: one «النية» row linked to ٢، ٤.
- N8 RESOLVED. index gq6 correct option: «…بتيسير بعض الأحكام التي فيها مشقة.»
- N9 NOT CHANGED. The L1 item is a row in a list panel (not a card), and it now has a short line, so it does not look empty; no merge needed.

## Counts
- HIGH: 3 (H1 L1 سلامة الحواس; H2 L4 «أربع كلمات»; H3 L4 دائم الحدث)
- MEDIUM: 6 (M1 index gq4; M2 index quiz balance and lengths; M3 L7 السائمة sentence; M4 L7 شرط زكاة الفطر; M5 L4 «ثلاث حالات»; M6 L5 ٣٠٠ ذراع)
- NOTE: 9
- Quizzes: 72 lesson questions + 8 cross-course questions checked; all have exactly one correct option. Lesson quizzes balanced (2/2/2/2) with correct-longest ≤ 3 everywhere. Cross-course quiz needs the two reorders above (→ 2/2/2/2) and three distractor edits (correct-longest 6 → 3).
