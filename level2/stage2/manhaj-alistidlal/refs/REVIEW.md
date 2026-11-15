# REVIEW (step 4) — «منهج الاستدلال»

Reviewer: independent check of the built pages `level2/stage2/manhaj-alistidlal/index.html` and `lecture1..7.html`
(sources in `src/level2/stage2/manhaj-alistidlal/`) against the summary PDF (101 pp) and its text layer.
Every lesson was read in full against the text layer of its PDF pages; page images were rendered (90 dpi) and read for
PDF 23, 28, 41, 60, 73 and all of PDF 92-101 (lesson 7). All quiz questions (7 × 8 + 8 cross questions) were checked
option by option; positions and option lengths were measured with a script.

Severity: HIGH = wrong fact or wrong answer · MEDIUM = misleading, unsupported, or a broken quiz rule · NOTE = polish.

## Overall

- No wrong fact and no wrong quiz answer found. Every lesson quiz has exactly one `label.opt ok`, confirmed by the
  source; the other options are wrong by the source; every `p.exp` is supported.
- Attributions are kept with their holders: الرافضة (L1), منكرو السنة / المعتزلة / الخوارج / الشيعة / النظامية / الظاهرية / أحمد (L2),
  المعتزلة والأشاعرة وابن عقيل / ديكارت / الأحناف… (L3), المتكلمون / الصوفية / اليهود والرافضة / الإمامية (L4),
  الماوردي والآمدي / الرازي / أبو يعلى / قانون المتكلمين (L5), الإيجي / الرازي / الفلاسفة / المفوضة (L6), the five views
  on المحكم والمتشابه and the sects in L7. No opponent view is stated as the page's own.
- No author is named anywhere (grep for author names / «المؤلف» / «الدكتور»: none).
- All Quran quotations listed in NOTES-part1..4 were checked for wording and reference: all correct
  (including البقرة ١٧٠ for «أولو كان آباؤهم…», الأنعام ٢٣ «وَاللَّهِ رَبِّنَا…», القيامة ٢٢-٢٣, الشعراء ١٩٤-١٩٥, الزمر ٢٣).
- Hadith wordings and footnote numbers match the book (e.g. «تخريج شرح السنة: ٢٧ / ٩» checked on the PDF 28 image;
  البخاري ٥٧٥٧، ٥٥٤، ٥٨٢٧، ٣٤٤٣، ٧٣٨٤، ٧٤١٥؛ مسلم ٩١، ٢٦٢).
- Lesson quizzes: positions 2/2/2/2 in every lesson; correct option is the longest in 2 of 8 (L1, L2, L3, L6, L7) and
  3 of 8 (L4, L5): within the limit.
- The writers' source-issue decisions in NOTES-part1..4 were checked and are sound (omissions of «أبو بكر العربي» PDF 67,
  فائدة ٤ PDF 55, «الأطباء» PDF 34, the Muslim number PDF 89, the repeated items PDF 90, «عظم العلم» PDF 101, etc.).

## MEDIUM

### M1 · lecture2 (+ index cross q2): the book's second مرتكز of the Mu'tazila is printed reversed, and the page corrected it silently
- Source PDF 23 (image checked), under «عند المتقدمين»: «٢) تقديم الدليل النقلي على الدليل العقلي». The book prints *naqli over ʿaqli*.
- Page: lecture2 «خامسًا: إنكار حجية السنة» card «عند المتقدمين»: «…؛ وتقديم الدليل العقلي على الدليل النقلي.»; summary li
  «مرتكزا المعتزلة في إنكار السنة: التشكيك في عدالة النقلة، وتقديم الدليل العقلي على النقلي.» (also a flashcard);
  index cross q2 is built on it: «ما الأصل المشترك بين إنكار المعتزلة لحجية السنة، وقول بعض المتكلمين…» → «تقديم الدليل العقلي على الدليل الشرعي النقلي»,
  exp «من مرتكزي المعتزلة تقديم العقلي على النقلي…».
- The correction is almost certainly right in substance (PDF 31 says of the متكلمين «تقديم الدليل العقلي على الشرعي عند التعارض»),
  but the brief says a source error is left out and recorded, and it is not in NOTES-part1 «Source issues».
- Fix: record it in NOTES-part1 «Source issues» (PDF 23, printed reversed). Then either (a) keep the corrected wording and say so
  in the note for Yasmin, or (b) drop the second مرتكز from the card and the summary li, and rebase index cross q2 on PDF 31 only
  (e.g. ask what the متكلمين's denial of الإجماع in الاعتقاد is built on: «تقسيم العلوم إلى شرعية وعقلية، وتقديم الدليل العقلي على الشرعي عند التعارض»).
  Decision for the fix step / Yasmin.

### M2 · lecture6 «سادسًا»: the الفلاسفة attribution is put on meaning ٣ only; the book puts it on ٢ and ٣ (and the quiz marks ٢)
- Source PDF 78-79: «وإرادة الثاني والثالث قدحٌ في الإيمان بالله ورسوله ﷺ، وهو مذهب الفلاسفة ومن شايعهم، الذين اعتقدوا في نصوص الأنبياء عدم مطابقتها للأمر في نفسه».
- Page cards: «٢. عدم اليقين بأن مراد المتكلم موافقٌ للحق في نفس الأمر — وإرادته قدحٌ في الإيمان بالله ورسوله ﷺ.» and
  «٣. كلاهما — وإرادته كذلك قدحٌ في الإيمان، وهو مذهب الفلاسفة ومن شايعهم…». Quiz q5 «أيّ معانيه هو مذهب الفلاسفة ومن شايعهم؟»
  marks meaning ٢ as correct, so the page text and the quiz contradict each other.
- Fix: put the attribution on both cards (or one shared line under them): «وإرادة الثاني والثالث قدحٌ في الإيمان بالله ورسوله ﷺ، وهو مذهب الفلاسفة ومن شايعهم…».
  Optionally reword q5 to «أيّ هذه المعاني يدخل في مذهب الفلاسفة ومن شايعهم؟» (the answer stays: meaning ٢; «كلاهما» is not among the options).

### M3 · lecture6 «ثانيًا»: the card «الظاهر عند الأصوليين» turns the book's unclear sentence into a definition
- Source PDF 73 (image checked): «وهذا المعنى يخالف الظاهر الذي عند الأصوليين، وهو ما يكون في مقابل النص، وفي عُرف المتأخرين القول بنفي الظاهر عن كثيرٍ من نصوص الكتاب. ولهذا صار يقتضي التفصيل…».
- Page card: «الظاهر عند الأصوليين — ما يكون في مقابل النص؛ وفي عرف المتأخرين: القول بنفي الظاهر عن كثيرٍ من نصوص الكتاب.»
  With the colon, the second half reads as a second definition of «الظاهر» («القول بنفي الظاهر»), which is meaningless and not what the book says.
- Fix: keep the card to «ما يكون في مقابل النص.» and put the rest, in the book's wording and without a colon, in the following callout:
  «وفي عُرف المتأخرين [جرى] القول بنفي الظاهر عن كثيرٍ من نصوص الكتاب؛ ولهذا اقتضى التفصيل…» — or leave the متأخرين clause out as unclear.

### M4 · index.html «عن الكتاب»: «وفي كل قاعدةٍ مذهب المخالفين وجواب أهل السنة عليه» is not true
- Source: rules 1, 2, 3 and 10 have no «مذهب المخالفين» section (PDF 43-55, 99-101); rule 4 lists «المخالفون لهذه القاعدة» with no answer (PDF 56);
  rule 9 has «بعض مواقف المخالفين» (PDF 96). Only rules 5-8 have «مذهب المخالفين… والجواب». NOTES.md itself says «وفي بعضها مذهب المخالفين وجوابه».
- Fix: «…ثم الباب الثاني في قواعد الاستدلال العشر، لكلٍّ منها فقهها وأدلتها وفوائد الالتزام بها، وفي بعضها مذهب المخالفين والجواب عليه.»

### M5 · index.html cross quiz: correct option is the longest in 5 of 8, and the positions are uneven
- Measured (letters without diacritics, options in page order, ✓ = correct):
  q1 [35, 39, 41✓, 32] · q2 [45✓, 35, 33, 24] · q3 [48, 38, 52✓, 38] · q4 [49✓, 41, 45, 38] · q5 [41, 47, 48, 62✓] ·
  q6 [38✓, 37, 40, 32] · q7 [43, 36, 40✓, 43] · q8 [47, 23✓, 39, 33].
  Longest correct: q1-q5 (limit 3). Positions: 1 → q2, q4, q6; 2 → q8; 3 → q1, q3, q7; 4 → q5.
- Reorder (content unchanged), gives 2/2/2/2:
  - q4 («أيّ أصلٍ من القاعدة الثالثة…»): swap options 1 and 2 → correct «أن النسخ لا يدخل الأخبار…» moves to position 2.
  - q7 («…أيَّ قواعد الاستدلال يخالفون بذلك؟»): swap options 3 and 4 → correct «قاعدة: الإيمان بالمتشابه والعمل بالمحكم.» moves to position 4.
- Length (bring to ≤ 3):
  - q5: correct «أن نصوص الوحي متفقة، لا يعارضها عقلٌ صريح، وظاهرها مراد الشارع.» (62) far outruns the rest; shorten it, e.g.
    «اتفاق النصوص، وسلامتها من معارضة العقل، ومطابقة ظاهرها للمراد.» or lengthen two distractors.
  - q2: shorten the correct option to «تقديم الدليل العقلي على النقلي.» (≈32), or lengthen a distractor (e.g. «اشتراط أن يكون مستند الإجماع قطعيًّا لا ظنيًّا.»).
  - q1: shorten to «أن الله تكفّل بحفظ الوحي، والسنة منه.» (or lengthen option 2 slightly).

### M6 · lecture1 diagram «بطلان نسبة القرآن لغير الله»: the leaf widens the book's claim
- Source PDF 12: «٥. الاتفاق التام بين إشارات القرآن الكريم إلى بعض العلوم الكونية ومكتشفات العلم الحديث».
- Diagram leaf (`refs/diagrams_part1.py`): «الاتفاق التام مع مكتشفات العلم الحديث» — reads as a claim about the whole Quran and all modern findings.
- Fix: «اتفاق إشاراته إلى بعض العلوم الكونية مع مكتشفات العلم الحديث» (or a shorter «إشاراته الكونية توافق مكتشفات العلم الحديث»; widen the leaf if needed).

## NOTE

1. **lecture5 «كيفية دفع التعارض»** — page: «وأقرب الأقوال إلى الحق والعدل الترتيب.» Source PDF 60 (image): «…أو إسقاط الدليلين والمطالبة بدليلٍ ثالث على الترتيب: وهو أقرب الأقوال إلى الحق والعدل.» Bare «الترتيب» can be read as the whole four-step order. Suggest: «وسلوك هذه الأقوال على الترتيب هو أقرب الأقوال إلى الحق والعدل.»
2. **lecture5 «خامسًا»** muted line: «ذكر الكتاب في أول المبحث أن أدلة القاعدة خمسة…». The book lists them (PDF 62: «القرآن الكريم، السنة النبوية، الإجماع، داللة المعقول، داللة الفطرة») but states no count. Suggest: «عدّ الكتاب في أول المبحث من أدلة القاعدة «دلالة الفطرة»، ولم يُفصّل تحت عنوانها شيئًا.»
3. **lecture3 diagram «دلالة الفطرة»**, branch توحيد الربوبية, leaf «أقوال وجوب النظر كلها غلطٌ مخالفٌ للكتاب والسنة». Source PDF 41 (image): after the four views (including «ليس بواجبٍ مطلقًا») comes «وكلُّ هذا غلطٌ مخالفٌ للكتاب والسنة…»; the scope of «هذا» is unclear in the summary. The leaf fixes one reading. Suggest the book's own words: «وكل هذا غلطٌ مخالفٌ للكتاب والسنة» (the text block below the list already does this correctly).
4. **lecture3 quiz q2** «ما التحقيق في مكان العقل عند صاحب الملخص؟» — the book just says «والتحقيق» (PDF 34). Suggest «بحسب الكتاب».
5. **lecture2 diagram «مخالف الإجماع»**, branch «مخالف حكمٍ ثبت بالإجماع»: the book first says «حكم البعض بكفره، والصحيح أن فيه تفصيلًا؛ لأن الإجماع على مراتب» (PDF 31). The three leaves give the تفصيل but not this line; optional leaf «حكم البعض بكفره، والصحيح التفصيل».
6. **lecture2 quiz q6** puts a paraphrase inside «»: «…شبهة أن «العلم لا يقبل الزيادة، واعتقادنا بخبر الواحد يزيد بتعدد المخبرين»؟». Not the book's words (PDF 26). Drop the «» or use the book's sentence.
7. **lecture1 quiz q6** («بمَ رُدّ على من زعم أن النبي ﷺ تعلّم القرآن من بعض قومه؟»): distractor «أن قريشًا نسبته إلى السحر والجن لما أعيتهم الحجة.» is a true statement of the book (PDF 12, reply to the جنّي claim). It is wrong for this question, but a student may hesitate. Optional: replace with a plainly wrong option (e.g. «أن قومه لم يكونوا يعرفون علم الفصاحة والبيان.»).
8. **lecture6 diagram «المعاني المعبَّر عنها»**: leaf «غائبٌ لا نظير له — فهذا ألغازٌ وأصواتٌ لا معنى لها» is the book's wording (PDF 73, image checked), but isolated in a diagram it can be misread as a statement about الغيب or الصفات. Optional: drop that leaf from the diagram and keep the sentence only in running text after the two kinds of خطاب.
9. **lecture7 «من لم يرجع إلى فهم الصحابة»**: «فهو استبدالٌ للذي هو أدنى بالذي هو خير» is put in «» as if quoted; in the book (PDF 100) it is plain prose. Drop the «».
10. **lecture3 / lecture6, قول الزهري**: L3 «من الله العلم…» (PDF 45), L6 «من الله البيان…» (PDF 81). Both are the book's wording; worth one line in NOTES so the fix step does not "harmonise" them.
11. **lecture4 quiz q7 exp**: «أما من فعله بعد قيام الحجة عليه من غير استحلال فهو فاسق» — «من غير استحلال» is an inference (PDF 58 says «فمن فعله بعد قيام الحجة عليه فهو فاسق»). Harmless; may drop the three words.
12. **index glossary «الإشارات (عند الصوفية)»**: the book applies «إشارات» first to the whole second kind (sound meaning drawn from words that do not show it) and then again to the قياس/اعتبار subtype (PDF 76). The row gives only the subtype. Acceptable; optional «…وهي عند الصوفية: الاستدلال على معنى صحيح بألفاظ لا تدل عليه، ومنها جعله من باب الاعتبار والقياس…».

## Items checked and found correct (selection, for the fix step)
- L1: definitions (المنهج، السنة، القرآن، النقل المتواتر، الكافّة), the five views of الجماعة with الطبري, the two hadiths of الافتراق with «صحيح الترمذي: ٢٦٤١» and «صحيح ابن ماجه: ٣٢٤١» (as the book), the three shubuhat and their answers, the tafsir order.
- L2: three definitions of السنة, the four دلالات, حفظ السنة, the four shubuhat, the three views on خبر الواحد with holders, الإجماع (definition, proofs, منكرون, الظاهرية, أحمد's four توجيهات, مستند with holders, ما يفيده, حكم المخالف).
- L3: الباجي and the شارح, تفاوت العقول, مكان العقل, the six views on الفطرة with holders and answers (ابن سريع, ابن الحسن, أبو يعلى), أقسام الناس, the ten فوائد.
- L4: the four فروق and their refutations, التقسيم الصحيح, تعلّق العلوم, النسخ/البداء, مخالفو القاعدة الرابعة, حكم عدم الرد.
- L5: definition of التعارض, eight causes, the three examples, the four opponent views and three shubuhat, قانون المتكلمين and Ibn Taymiyya's replies, quotations of سهل بن حنيف / عمر بن عبد العزيز / مالك / الشافعي / الطيبي.
- L6: الإيجي quotation and its eight-point شرح, the 15 replies, المفوضة and the seven وجوه, the hadith list of rule 8.
- L7 (against images PDF 92-101): the five views of المحكم والمتشابه with holders (القول الأول: «جابر… والشعبي والثوري… واستحسنه القرطبي… واختاره الطبري» — quiz q2 correct), الشوكاني, الوقف, the two kinds of المتشابه, the six sects, the 11 فوائد, rule 10 and its proofs and فوائد.

## Fix step (step 5) — status

- M1 RESOLVED — option (b): lecture2 card now says «بنوا مذهبهم على مرتكزين أساسيين، أولهما: التشكيك في عدالة النقلة…» (second مرتكز dropped, no direction stated); summary li/flashcard → «من مرتكزَي المعتزلة…: التشكيك في عدالة النقلة…»; cross q2 rebuilt on PDF 31 + قانون المتكلمين (rule 6, PDF 67-68); recorded in NOTES.md «Source issues».
- M2 RESOLVED — attribution moved to a shared line under the three cards («وإرادة الثاني والثالث… وهو مذهب الفلاسفة ومن شايعهم…»); q5 reworded to «أيّ هذه المعاني يدخل في مذهب الفلاسفة…؟»; exp names the الفلاسفة.
- M3 RESOLVED — card is «ما يكون في مقابل النص.»; the متأخرين clause is a separate line «وجرى في عُرف المتأخرين القول بنفي الظاهر…؛ ولهذا اقتضى الأمر التفصيل.» (noted in NOTES.md).
- M4 RESOLVED — «عن الكتاب» uses the suggested wording («…وفي بعضها مذهب المخالفين والجواب عليه»).
- M5 RESOLVED — q4 and q7 reordered; q1 and q5 correct options shortened, q2 rebuilt with a longer distractor. Positions now 3,1,3,2,4,1,4,2 (each twice); correct is longest in 2 of 8 (q3, q4).
- M6 RESOLVED — lecture1 leaf now «إشاراته الكونية توافق مكتشفات العلم الحديث» (fits the 350px rect).
- NOTE 1 RESOLVED — «وسلوك هذه الطرق على الترتيب هو أقرب الأقوال إلى الحق والعدل.»
- NOTE 2 RESOLVED — «عدّ الكتاب في أول المبحث من أدلة القاعدة «دلالة الفطرة»…» (no count).
- NOTE 3 RESOLVED — leaf now the book's words «وكلُّ هذا غلطٌ مخالفٌ للكتاب والسنة».
- NOTE 4 RESOLVED — q2 «…بحسب الكتاب؟».
- NOTE 5 RESOLVED — added in the running text above the diagram (not as a leaf): «وهذا الثاني حكم البعض بكفره، والصحيح أن فيه تفصيلًا؛ لأن الإجماع على مراتب».
- NOTE 6 RESOLVED — «» removed from lecture2 q6.
- NOTE 7 NOT CHANGED — the distractor is wrong for the question; a replacement would need content the book lacks or sits too close to the correct answer.
- NOTE 8 NOT CHANGED — the leaf is the book's wording and the diagram root «المعاني المعبَّر عنها» scopes it to speech.
- NOTE 9 RESOLVED — «» removed in lecture7.
- NOTE 10 RESOLVED — recorded in NOTES.md «Source issues».
- NOTE 11 RESOLVED — «من غير استحلال» dropped from lecture4 q7 exp.
- NOTE 12 RESOLVED — glossary row now gives both uses of «إشارات».
- Not touched: `refs/diagrams_part1.py` (diagrams are already in the lecture sources and must not be rerun); one `label.opt ok` per question rechecked in all 8 quizzes.

## Counts
- HIGH: 0
- MEDIUM: 6 (M1-M6)
- NOTE: 12
- Quiz questions checked: 64 (56 lesson + 8 cross); wrong answers: 0; questions with two correct options: 0.
