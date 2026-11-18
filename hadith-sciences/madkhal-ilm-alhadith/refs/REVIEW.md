# REVIEW — «المدخل إلى علم الحديث» (independent check against refs/source.pdf)

Scope: built pages `hadith-sciences/madkhal-ilm-alhadith/{index,lecture1..6}.html` (fixes go in `src/hadith-sciences/madkhal-ilm-alhadith/` and `index` source), read against every PDF page 2-66 rendered at 110 dpi (one zoom at 200 dpi on PDF 30). No page was edited.

Overall: content is faithful and well attributed. The three flagged doubtful points are handled safely (PDF 29 Mu'adh hadith not quoted, only Ibn 'Abd al-Barr's and al-'Iraqi's comments; PDF 37 «قال قتادة عن معاذ» example left out, only the rule kept; PDF 20 العزيز kept as an attribution, see M3). No Telegram link, no «تم تلخيص الكتاب», no reminder box, no Muhammad b. 'Abd al-Baqi quote, no transcriber «تنبيه: قد توسّع الشيخ» on any page. No Quran verse appears anywhere (none in the source either). No Latin text in page content.

Quiz mechanics: all 6 lessons have 8 mcq, 4 options, exactly one `opt ok`, positions 1-4 twice each, correct option longest in at most 3 of 8 (L1 2, L2 2, L3 1, L4 3, L5 2, L6 2). Every lesson question checked: one answer confirmed by the source, the others clearly wrong. The index cross-course quiz breaks the rules (M1).

---

## HIGH

### H1. Lesson 6: a weak narrator's tafarrud presented as possibly acceptable (not in the source)
- File: `lecture6.html`, section «ثانيًا: المنكر», rows panel, third row:
  `<span class="lb">ضعيفٌ مختصّ</span><p>قد يتفرّد عن بعض مشايخه الذي عرف أحاديثهم وتخصّص فيهم، فحينئذٍ قد يكون تفرّده مقبولًا وليس منكرًا.</p>`
- Source PDF 59: «وقد يكون ثقةً، ولكن تفرّده عن بعض المشايخ يكون منكرًا … وإن كان **هذا الراوي نفسه** قد يتفرّد عن بعض مشايخه الذي عرف أحاديثهم وتخصّص فيهم؛ فحينئذٍ قد يكون تفرّده مقبولًا». The specialised narrator is the same **thiqa**, not a weak narrator. The label «ضعيفٌ مختصّ» invents a rule (accepted tafarrud of a weak narrator) that students would memorise.
- Fix: relabel the row «الثقة نفسه عن شيوخه المختصّ بهم» (or merge it into the «راوٍ ثقة» row: «… وهذا الراوي نفسه قد يتفرّد عن بعض مشايخه الذي عرف أحاديثهم وتخصّص فيهم، فحينئذٍ قد يكون تفرّده مقبولًا»).

---

## MEDIUM

### M1. index.html cross-course quiz (gq1-gq8) breaks the position and length rules
- Correct positions: gq1=2, gq2=4, gq3=3, gq4=1, gq5=4, gq6=3, gq7=1, gq8=4 → position 2 used once, position 4 three times.
- Correct option is the longest in 4 of 8 (gq4, gq6, gq7, gq8); max allowed is 3.
- Fix: move gq5's correct option («وجوب فهم مراد قائلها واصطلاحه قبل الحكم بكلامه.») to position 2 (counts become 2/2/2/2); shorten gq7's correct option (89 chars), e.g. «الجرح والتعديل مبنيٌّ على علم علل الأحاديث.» (PDF 49 wording), so that option 2 is longer.
- Content of gq1-gq8: all answerable from the lessons and consistent with their text (checked against PDF 23, 13/21, 31-32, 33-34 & 39, 25-26/27-30/46, 25a & 46, 49 & 60, 4 & 61). See L7-L9 for wording.

### M2. Lesson 1: al-Hakim's quote placed under the wrong kind of علوّ
- File: `lecture1.html`, after the rows panel of the five kinds of علوّ: the blockquote «الأصل في ذلك أن النزول عن شيخٍ تقدّم موته …» (الحاكم) and its explanation follow the last row «العلوّ بالنسبة إلى كتابٍ معتمد», so «في ذلك» reads as referring to relative علوّ.
- Source PDF 12: the quote belongs to «القسم الأول: العلوّ بتقدّم وفاة الراوي».
- Fix: move the blockquote and the muted line right after the «العلوّ بتقدّم وفاة الراوي» row (or open the blockquote with «في العلوّ بتقدّم وفاة الراوي:»).

### M3. Lesson 2: العزيز — Ibn Hajar's restriction stated flatly, and a distractor that is a real attributed view
- Files/quotes: `lecture2.html` tree `ahad` leaf «ما رواه اثنان أو ثلاثة؛ وقيّده ابن حجر بالاثنين»; rows text «والحافظ ابن حجر العسقلاني قيّده بما رواه اثنان، وجعل ما رواه ثلاثةٌ من قسم المشهور»; quiz b2q6 option 1 «أنه ما رواه اثنان فقط، وما رواه ثلاثةٌ مشهور» (marked wrong) with explanation «والقول الأول هو تقييد ابن حجر».
- Source PDF 20 prints exactly this attribution, but OUTLINE flags it (Nukhba wording «ألا يرويه أقل من اثنين»). The page and the explanation assert it as fact, and the wrong option of b2q6 is in fact the view the page attributes to Ibn Hajar: a student who learnt the page may hesitate.
- Fix: keep the attribution as the book's report (e.g. «وفي الملخص أن ابن حجر قيّده بما رواه اثنان…»); in b2q6 replace option 1 with a plainly wrong option (e.g. «أنه ما لم يُروَ إلا من طريقٍ واحد.») and drop «والقول الأول هو تقييد ابن حجر» from the explanation.

### M4. Lesson 5: takhrij «رواه البخاري ومسلم» for the Jabir b. Samura hadith
- File: `lecture5.html`, «الرواية بالمعنى في المتن» item ١: «… ثم يسلّم على أخيه من على يمينه وشماله»، رواه البخاري ومسلم.»
- Source PDF 57 prints «رواه البخاري ومسلم», but the hadith «علام تومئون بأيديكم كأنها أذناب خيل شمس» is known from Sahih Muslim only (not in al-Bukhari). By the brief's rule (doubtful attribution: do not state as fact), the takhrij should not be on the page.
- Fix: drop «رواه البخاري ومسلم» (keep the hadith text as printed), and record the point in NOTES-part3.md, PDF 57.

---

## LOW

### L1. Lesson 3: silent correction of a printed «لا أنهم»
- `lecture3.html`, «المتأخرون»: «الغالب أنهم يقصدون بالحسن أن الحديث عندهم حجة، **وأنهم يحتجون به**».
- PDF 30 prints «أن الحديث عندهم حجةٌ، **لا أنهم** يحتجون به» (probably a typo for «لأنهم»). The page changes it without a note.
- Fix: end at «أن الحديث عندهم حجة» and record the printed wording in NOTES-part2.md.

### L2. Lesson 4: grid `sariqgrid`, row «الأصل فيه»
- The مدلّس cell says «وسيلة يقع بها السقط»; the book gives «الأصل فيه أنه متّهم» only for the سارق (PDF 41) and says nothing of the mudallis' «أصل». The cell answers a different question.
- Fix: put «—» in the مدلّس cell (as in the «التفرد» row), or rename the row «حكمه» and use «لو صرّح بالسماع كان كذّابًا» only.

### L3. Lesson 1 opening: scope of the «القضايا الكلية»
- `lecture1.html`: «وهذه القضايا الكلية هي ما يلخّصه هذا القسم».
- PDF 2: «نستطيع أن نلخّصها في فصول هذا الكتاب» (the whole book, not lesson 1).
- Fix: «… هي ما تلخّصه فصول هذا الكتاب».

### L4. Lesson 5 summary: wording of الإدراج
- `lecture5.html` خلاصة: «الإدراج: أن يُلحق الراوي كلامَ بعض الرواة بكلام الرسول ﷺ».
- PDF 54: the narrator said words of his own; *some narrators* then attach them. The glossary in index.html has it right («أن يُلحق بعض الرواة كلامَ الراوي…»).
- Fix: use the glossary wording in the summary item.

### L5. Lesson 5 heading numbering
- `lecture5.html`: «أولًا: الفصل الثاني: الطعن في الرواية» reads oddly (two ordinals).
- Fix: «أولًا: معنى الطعن في الرواية (الفصل الثاني)» or «أولًا: الطعن في الرواية».

### L6. Lesson 3 summary: Shu'ba example attached to «الموضوع»
- `lecture3.html` خلاصة: «قد يطلق المتقدمون الحسن على الغريب والمنكر، بل على الموضوع لحسن لفظه، كقول شعبة: «من حُسنها فررت».»
- Shu'ba's word illustrates الغرائب والمناكير (PDF 28), not the mawdu'.
- Fix: «… على الغريب والمنكر -كقول شعبة: «من حُسنها فررت»- بل على الموضوع لحسن لفظه».

### L7. index.html gq6: grammar
- «لأن الثقة غير معصوم، فقد تعتري روايته الخطأ مع صحة إسنادها ظاهرًا.» — «الخطأ» is the masculine subject.
- Fix: «فقد يعتري روايتَه الخطأُ مع صحة إسنادها ظاهرًا».

### L8. index.html gq8: a phrase in «» that is not a source quotation
- «قاعدة «لا يُحمل مصطلح الإمام على غير مراده»» — this is OUTLINE's heading summary, not the book's wording (PDF 4 says «حتى لا يسيء فهم كلام أهل العلم، وحتى لا يفهم مصطلحًا لإمامٍ قد أطلقه … على معنًى يختصّ به بمقتضى اختيار غيره»). Guillemets are reserved for quoted wording.
- Fix: drop the «» (e.g. «ما الذي يجمع بين وجوب فهم مصطلح الإمام على مراده، وبين غلبة …»).

### L9. index.html gq4 (حسن لغيره / مرسل): correct option mixes a mursal-only condition
- Correct option «أن تكون صالحةً للتقوية، لا شاذةً ولا منكرةً ولا من مخرج المرسل نفسه» is asked as «الشرط المشترك» but «ولا من مخرج المرسل نفسه» belongs to the mursal chapter only (PDF 39). It is also the longest option by far (65 vs 31-42).
- Fix: «أن تكون صالحةً للتقوية في نفسها، لا شاذةً ولا منكرة.» and keep the makhraj point in the explanation.

### L10. index.html: notes that do not fit this course
- «أصله محاضراتٌ مسجلة» (about the book): OUTLINE lists the author's mention of recorded lectures (PDF 2) as background/non-content. Harmless on the course page, but can be dropped.
- «والآيات نُقلت من المصحف عند الجزم بلفظها مع ذكر السورة ورقم الآية، وإلا وُصف معناها.» — the course quotes no verse; boilerplate. Fix: drop this sentence.
- «تفريغٌ ملخَّصٌ للكتاب في ٦٦ صفحة» — the source is a summary of a book, not a transcript. Fix: «ملخَّصٌ للكتاب في ٦٦ صفحة».

### L11. Lesson 3 tree `hasanforms`: grouping is an inference
- The two branches «لها علاقة بالثبوت» (1-3) / «لا علاقة لها بالثبوت» (4-6) are not printed as a grouping in PDF 27-29; the book only gives the jami' «سواء كان له علاقة بثبوت الحديث أو ليس له علاقة». The split is consistent with the text, so acceptable; optional fix: retitle the branches «صورٌ لها تأثير في القبول» / «صورٌ لا تأثير لها في القبول» to echo PDF 30's «علاقة أو تأثير في قبول الحديث أو ردّه».

---

## Checked and correct (no action)
- Definitions: المصطلح، السند (ابن جماعة)، حدّ علم الحديث (ابن جماعة/ابن حجر)، المسلسل، أقسام العلوّ (٢+٣، والنزول خمسة)، المتن، المرفوع/الموقوف/المقطوع/المرفوع حكمًا وشرطه، صور الرفع السبع، أسماء المتون السبعة، المسند (الحاكم وابن حجر)، المتواتر بقسميه (الخطيب)، الآحاد وأقسامها، أبو نصر الوائلي، نزهة النظر، الشروط الخمسة؛ الصحيح، الصحة النسبية، حديث الرحم (أبو الرداد/الرداد as printed)، «هو الطهور ماؤه»، صور الحسن الست، الربيع الأشناني، الحسن لغيره وشرائطه، حسن صحيح/حسن غريب (ابن رجب)؛ المردود، المعلق/المرسل/المنقطع/المعضل/المتصل، شرائط المرسل وعواضده، أنواع التدليس، السرقة، مسائل العدالة والضبط الخمس، طبقات الثقات (no count); المعلول، القرائن، الاعتبار ومعنياه، المتابعة والشاهد، شرائط إثبات المتابعة، القلب بصوره، الإدراج، أسباب الخطأ وأمثلتها؛ المنكر وأمثلته، الشاذ (الشافعي، الخليلي، الترمذي)، بقية المصطلحات السبعة، أقوال الذهبي والمعلمي، الخاتمة وقول ابن رجب.
- Hadith quotations checked word for word against the printed text (PDF 12, 14, 15, 16, 18, 21, 26, 27, 51-60, 63): all as printed, with the narrator the book names.
- The two different wordings of al-Tirmidhi's definition of حسن («وقولنا في هذا الكتاب…» L1, «وما ذكرنا في هذا الكتاب…» L3/L6) are both printed in the source (PDF 7 and PDF 32/62).
- Arabic number agreement: «ستة أقسام»، «٦ أقسام»، «٨ أسئلة»، «٦٦ صفحة» correct.
