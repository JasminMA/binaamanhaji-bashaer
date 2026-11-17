# REVIEW — «المداخل الأولية إلى علم الحديث» (independent check against refs/source.pdf)

Scope: built pages `index.html`, `lecture1.html`, `lecture2.html` (text, SVG labels, quizzes), every PDF page 2-15 read from 110 dpi images.

## Verdict
No HIGH findings. Content of both lessons follows the source closely; every definition, list, book/author pair, count and quotation checked matches the PDF. All six flagged doubtful points are handled safely:
- «شرح العلل» for Ibn Hajr (PDF 10): dropped; lesson 2 says only «ابن حجر في «النكت»». OK.
- Juz on laylat al-nisf credited to Imam Muslim (PDF 15): attribution dropped. OK (see LOW-6 for the leftover pronoun).
- Ammar tayammum wording (PDF 7): quote cut at «وضرب بيديه هكذا…» + «ثم ذكر صفة التيمم». OK.
- «فقبل عمر هذا الخبر» (PDF 7) and «سمع خبرًا فقبله» (PDF 6): both left out. OK.
- «الزهد والرقائق» (PDF 15): given as a category, not a title, and kept out of the `mufradat` grid. OK (see LOW-5).
- «ثلاثمائة شرح» (PDF 13): hedged «كما ذكر الشيخ». OK.
- Ibn Khuzayma/Ibn Hibban (PDF 10): «يرى الشيخ أن…». OK.
No Telegram link, «تم تلخيص المحاضرة» or closing transcriber «تنبيه» on any page.

Quran references all correct, mushaf wording correct: النساء ١١٣، النجم ٣-٤، الحجرات ٦، النمل ٨٠ (the PDF has «إنك», not الروم ٥٢'s «فإنك»), الأنعام ١٦٤ (see LOW-7).

Quizzes: lesson 1 positions 2,4,1,3,3,1,4,2; correct option longest in 3/8 (q3, q5, q8). Lesson 2 positions 2,4,1,3,1,4,3,2; longest in 2/8 (q1 tie, q4). Every lesson question has exactly one answer confirmed by the source (L1: PDF 2, 2, 3, 3, 6, 4, 6, 7; L2: PDF 8, 9, 10, 10, 11, 10, 13, 14). Index gq1..gq6 positions 3,1,4,2,4,1.

## MEDIUM

**M-1. index.html gq4 explanation quotes the lesson for words the lesson page does not contain.**
- Quote: «ولذا قال الدرس الثاني عنه: «الذي مرّ معنا»، وموطن الشاهد فيه قول عمر…»
- Source: PDF 9 has «حديث أبي موسى الأشعري في الاستئذان -الذي مرّ معنا-», but lecture2.html (شواهد التثبت بعد وفاة النبي ﷺ › أبو موسى الأشعري) omits «الذي مرّ معنا». A student checking lesson 2 will not find it; «الدرس الثاني» is also not the site's term (القسم الثاني).
- Fix: either add «الذي مرّ معنا في الجزء الأول» to the Abu Musa card in `src/.../lecture2.html`, or reword the exp: «ولذا أعاده الشيخ في الجزء الثاني شاهدًا على التثبت بعد الوفاة، وموطن الشاهد فيه قول عمر: «ومن يعلم هذا؟».»

**M-2. index.html gq1-gq3 do not cross the lessons although the block says «٦ أسئلة تعبُر الأقسام».**
- gq1 (sources of rules), gq2 («في الجزء الأول من المحاضرة» is in the stem), gq3 (faqih/mufassir) are answerable from lesson 1 alone (PDF 5-7). Only gq4-gq6 link both lessons.
- Fix: either relabel the header (e.g. «أسئلة على الكتاب كله»), or rework gq2/gq3 to link to lesson 2 (e.g. gq2: Umar as «مدرسة في نقد الأحاديث» in lesson 2 + his two reports in lesson 1; gq3: lesson 1 «تمييز الصحيح ضروري» + lesson 2 النووي صحّح أحاديث ليست صحيحة عند أهل الحديث).

**M-3. index.html gq1: distractor 1 is arguable.**
- Quote: «( ) من النقل، وهو نصوص القرآن.» against the stem «…وإنكار عائشة حديث «إن الميت ليعذَّب ببكاء الحي»».
- Source PDF 7: Aisha rejected it by citing «ولا تزر وازرة وزر أخرى» and the book stresses «عرض الروايات على القرآن». A student can defend «النقل». The book does frame both under «شواهد من تصرفات السلف» (PDF 6), so the key is right, but the distractor is not clearly wrong.
- Fix: replace option 1 with something plainly wrong (e.g. «من كتب أحاديث الأحكام عند المتأخرين.»), or ask «تحت أيّ عنوانٍ ساق الملخص…».

## LOW

**L-1. index.html gq6 and gq4: correct option far longer than the others** (gq6 89 chars vs 43-53; gq4 74 vs 44-50). Length gives the answer away. Fix gq6: shorten to «بالشافعي المتقدم والنووي المتأخر.» or lengthen distractors; gq4 similarly.

**L-2. lecture1.html, سادسًا: «وهذا الشرط مبنيٌّ على ثلاثة أمور:»** — PDF 6 says only «وهذا الشرط مبني على:» then three numbered items. A count the book does not print. Fix: «وهذا الشرط مبنيٌّ على:».

**L-3. lecture1.html flow «ترتيب التدرج كما ذكره الملخص»: الصحيحان ← السنن ← كتب الأصول المسندة.** PDF 3 puts الموطأ between السنن and «ثم كتب الأصول»; the flow skips it while claiming to be the book's order. Fix: add a «الموطأ» step between السنن and كتب الأصول, or retitle «من مراحل التدرج كما ذكرها الملخص».

**L-4. lecture2.html, خامسًا › نقطة ٤: «وبعضها بعضها دون بعض كالسنن»** — word missing. PDF 14: «وبعضهم يشمل بعضها دون بعض». Fix: «وبعضها يشمل بعضها دون بعض كالسنن».

**L-5. lecture2.html after the mufradat grid: «مثل كتب الزهد والرقائق لوكيع بن الجراح والإمام أحمد ولغيرهما»** — safe as a category, but still reads close to the doubtful title (PDF 15). Fix (optional): «مثل كتبٍ في الزهد والرقائق لوكيع بن الجراح والإمام أحمد ولغيرهما».

**L-6. lecture2.html «الكتاب المفرد أوعب في بابه»: «…لأنه خصّ هذا الجزء بجمع ما ورد فيها»** — after removing Imam Muslim (PDF 15) the pronoun has no referent. Fix: «لأن صاحبه خصّه بجمع ما ورد فيها».

**L-7. lecture1.html ﴿وَلَا تَزِرُ وَازِرَةٌ وِزْرَ أُخْرَىٰ﴾ [الأنعام: ١٦٤]** (section ٧ and b1q8 exp) — correct, but the phrase also occurs at الإسراء ١٥، فاطر ١٨، الزمر ٧; the book (PDF 7) gives no sura. Acceptable; optionally drop the reference or keep as is.

**L-8. lecture2.html طبقات المتقدمين: «هؤلاء هم أئمة الحديث المتقدمين»** — copied from PDF 10; adjective of «أئمةُ» should be «المتقدمون». Fix: «هؤلاء هم أئمة الحديث المتقدمون».

**L-9. lecture2.html خلاصة القسم: «كان عمر … مدرسةً في نقد الأحاديث، كما في خبر هشام بن حكيم وخبر أبي موسى في الاستئذان.»** — PDF 9 states the فائدة after the sandals report without tying it to those two reports. Consistent with the content, but slightly sharpened. Fix (optional): «…كما في أخباره مع هشام بن حكيم وأبي هريرة وأبي موسى» or drop the «كما في» clause.

**L-10. index.html Arabic number agreement:** hero badge «٢ قسمين» and course-map aria-label «في ٢ أقسام». Fix: «قسمان» / «في قسمين» (may come from the shared template; check `tools`).

## Checked and fine (no action)
- L1: النساء/النجم quotes, السنة definition, شارحة/مخصصة/مبينة, المقصود بعلم الحديث (not العلل/الجرح والتعديل), الكتب الستة/الصحيحان/أفضلهما البخاري, «ليس كل صحيح في الصحيحين», اللؤلؤ والمرجان, السنن order (النسائي ثم أبو داود، مزية الترمذي، ثم ابن ماجه), الموطأ («وأولها» dropped), all ahkam books and authors (grid), الأذكار/رياض الصالحين/الترغيب, four tanbihat, الشافعي vs ابن المديني, فقهاء المحدثين, عبد الغني/ابن قدامة («قرابة»), الطبري, three tanbihat + two shawahid, ابن سيرين and بُشير العدوي quotes verbatim, الموازنة, Abu Musa and Ibn Umar al-Qalib quotes, Jewish-woman report, قواعد المتن, قول أحمد, رفع التعارض.
- L2: four stages and definitions, Umar/neighbour quote, Hisham and sandals (paraphrase outside quotes, nothing completed from memory), Qabisa/grandmother, Rajab umrah, متقدمون/متأخرون definitions, tabaqat (order and names), «منهج الأصوليين أدق», three shawahid for the two schools, tanbih, Ibn Taymiyya quote, five conditions grid, تأصيلي vs كلي, الشوكاني/ابن حزم, الشافعي/النووي, فائدة مالك والشافعي وأحمد, بكر أبو زيد, علوم الإسناد/المتن tree, shuruh grid (الخطابي، ابن حجر، العيني، ابن رجب، ابن عبد البر), ترتيب على المسانيد/الأبواب, جوامع/سنن/مصنفات/مستدركات, five points, mufradat grid (all 12 book-author pairs match PDF 14-15), الأموال advice.
- Glossary rows on index: all match the lessons and the PDF.
