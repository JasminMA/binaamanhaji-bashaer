# REVIEW — «الفكر المنهجي عند المحدثين» (independent check against refs/source.pdf)

Scope: built pages `index.html`, `lecture1..7.html` checked against every PDF page (2-76, rendered at 110 dpi, p. 39 re-rendered at 250 dpi). No page was edited.

Overall: the content is faithful and careful. All doubtful points from OUTLINE are handled safely (17-count left out; al-Shafi'i «وعاء/غطاء» left out; Robson's 75 AH left out; al-'Askari's kunya and date left out; Ibn Abi al-Zinad quote left out; 91 kutub and the 4000/2602 counts left out; Nafi' and Ma'mar dates left out; al-Mujtaba «51 بابًا» left out; PDF 75 break stated as «في السند الأول انقطاع» without placing it). Foreword is attributed to عمر عبيد حسنة throughout lesson 1 and the index; the author's own views are kept apart. No Telegram link, no «تم تلخيص», no transcriber «تنبيه». All 16 Quran verses in lesson 1 (and the 7 in lesson 2, 2 in lesson 6) have correct mushaf wording and references. Every lesson quiz has one correct option, positions 2/2/2/2, correct-longest ≤3. The jadwal table (lesson 4) matches PDF 40 cell by cell; Ibn Hajar's 12 ranks and the 3-rank mapping match PDF 41; the imams grid (lesson 7) matches PDF 64-74.

## HIGH

1. **lecture6.html — grid `muslimaqsam` (أقسام الأخبار في مقدمة مسلم), row 3 is wrong.**
   Page: «الثالث: المختلف فيه | يتهمه بعضهم ويوثقه بعضهم | أسباط بن نصر، قطن بن نُسير».
   Source PDF 58: the third section is «القسم المردود الذي لا يعرّج عليه؛ لأن أصحابه من المتهمين بالوضع، ومن غلب على حديثهم المنكر والغلط. **ويخرج من هذا القسم الثالث** الأخبار التي لا يخلو رواتها ممن يُتّهم عند بعض العلماء ويوثقه بعضهم، وهو المختلف فيه، وهؤلاء مثل أسباط بن نصر وقطن بن نسير وأحمد بن عيسى المصري». So the disputed narrators are *excluded* from the third (rejected) section, not its content. The grid also contradicts the page's own summary item («ثم المردود الذي لا يعرّج عليه»).
   Fix: row 3 → «الثالث: المردود | المتهمون بالوضع ومن غلب على حديثهم المنكر والغلط | عبد الله بن مسور، عمرو بن خالد، عبد القدوس الشامي، محمد بن سعيد المصلوب»; mention أسباط وقطن وأحمد بن عيسى separately as «المختلف فيه، يخرج من القسم الثالث» (or drop them from the grid). Update the aria-label accordingly.

2. **index.html — cross-course quiz: the correct option is the longest in 6 of 8 (rule: at most 3).**
   Lengths (correct marked *): gq1 46/34/*66/38; gq2 *65/42/43/38; gq3 31/30/28/*33; gq4 *40/28/33/26; gq5 68/*98/68/64; gq8 42/41/*53/36 (gq6 and gq7 are fine). Positions are balanced (2/2/2/2).
   Fix: shorten the correct option or lengthen one distractor in at least three of gq1, gq2, gq3, gq4, gq8 (e.g. gq1 correct → «نقد السند ونقد المتن»; gq2 correct → «خوفهم من خطأ الرواة غير المتعمد»; gq8 correct → «أن منهج كلٍّ منهما معلَّل»).

## MEDIUM

3. **lecture3.html — المكاتبة example drops a link of the chain.**
   Page: «وكان في كتابه أن عائشة حدّثته أن رسول الله ﷺ قال: «لا تحرم الخطفة والخطفتان»».
   Source PDF 30: «وكان في كتابه أن **أبا الشعثاء المحاربي حدّثه** أن عائشة حدّثته أن رسول الله ﷺ قال…». As written, 'A'isha appears to narrate directly to Ibrahim al-Nakha'i.
   Fix: restore «أن أبا الشعثاء المحاربي حدّثه أن عائشة حدّثته…».

4. **lecture4.html — vowel of «المعدَّل» changed.**
   Page (body and tree `adala`): «ولا يتحقق التعديل إلا ببيان اسم المعدِّل» (kasra). Source PDF 39 (checked at 250 dpi) prints «اسم المعدَّل» (fatha); the q7 explanation on the same page writes «المعدَّل», so the page is also inconsistent with itself.
   Fix: write «المعدَّل» as printed in both places (or leave the word unvowelled everywhere).

5. **lecture4.html — Ibn Abi Hatim's three ranks stated as fact in the mind map (doubtful point).**
   Mind map branch «المراتب»: «ابن أبي حاتم في «الجرح والتعديل» / تجمعها ثلاث مراتب»; grid `maratib` header «عند ابن أبي حاتم». Source PDF 40-41: the three-rank scheme is the author's reading («فإننا نجد ابن أبي حاتم يجعل…»), and Ibn Abi Hatim's own text has more ranks (OUTLINE flag). The body and summary correctly say «يرى المؤلف» / «التي قرأها المؤلف».
   Fix: mind-map leaf → «يقرؤها المؤلف ثلاث مراتب»; grid header → «عند ابن أبي حاتم (بقراءة المؤلف)».

6. **lecture5.html — Malik's ruling on talaq is cut so it reads as a contradiction.**
   Page: «وذلك في الأموال خاصة، لا في الحدود ولا النكاح ولا الطلاق … و«كذلك السنة عندنا أيضًا الطلاق»».
   Source PDF 50: «قال مالك: وكذلك السنة عندنا أيضًا **في** الطلاق، إذا جاءت المرأة بشاهد أن زوجها طلقها أُحلف زوجها ما طلقها، فإذا حلف لم يقع عليه الطلاق». The page's fragment suggests the yamin-with-witness rule applies to talaq, which is the opposite of what Malik says.
   Fix: quote the full sentence, or drop the fragment. (Minor in the same card: «مضت السنة في القضاء باليمين مع الشاهد الواحد» mixes the two printed forms — PDF 49 «باليمين يحلف صاحب الحق مع شاهده», PDF 50 «باليمين والشاهد الواحد»; use one of them.)

7. **lecture7.html — «توجيه المؤلف» card drops the middle clause.**
   Page: «وهذا المنهج معروف عند البخاري ومسلم، فقد أخرجه الإمامان أحمد وأبو داود».
   Source PDF 73: «وهذا المنهج معروف عند البخاري ومسلم؛ **فهما يصححان الحديث باعتبار روايات أخرى ثابتة من غير طريقهما**؛ فقد أخرجه الإمامان أحمد وأبو داود». Without the clause the «فقد أخرجه…» reads as evidence about al-Bukhari and Muslim.
   Fix: restore the clause.

## LOW

8. **lecture1.html — summary item**: «ود. عماد الدين خليل في نقد المروي، **ومن قبلهما** منهج ابن خلدون». PDF 5 does not frame Ibn Khaldun as «من قبلهما»; it says «ومن الجدير بالتسجيل في هذا المجال -أيضًا- المنهج المحكم الذي أصّله عبد الرحمن بن خلدون». Fix: «وكذلك منهج ابن خلدون».
   Same lesson, grid `muhawalat`, column «ما انتهى إليه» for Ibn Khaldun: «عرض الروايات على أصولها وطبائع الكائنات» is his method, not a result (PDF 5). Fix: column text «دعا إلى عرض الروايات على أصولها…» or rename the column «منهجه أو نتيجته».

9. **lecture5.html — aria-label of grid `matnadilla`**: «وهي تسعة أدلة». PDF 45 says «بعدد من الأدلة الكثيرة، منها:» (no count). Fix: «ومنها تسعة أدلة يذكرها المؤلف» or «من أدلة المؤلف».

10. **lecture6.html — «فالرواية الثالثة -من حديث أبي هريرة- فيها زيادة…»**. PDF 63 says «فنجد الرواية الثالثة فيها زيادة»; the added «من حديث أبي هريرة» is fine, but in the printed numbering the زيادة «لولا أن تعيرني قريش» is in no. 42 (the fourth narration). Safer: «وفي إحدى روايتَي أبي هريرة زيادة…» or keep the book's «الثالثة» without the gloss.
    Same lesson: «أخرجه البخاري في خمسة مواضع» — the book lists five places (557, 2268, 2269, 3459, 5021) but does not state the count; acceptable, or say «في المواضع الآتية».

11. **lecture6.html vs lecture7.html — al-Bukhari's tabaqat.** L6 (from PDF 64): al-Bukhari relies on the first tabaqa «وقد يخرج عن أعيان الطبقة الثانية»; L7 grid `tabaqat` (from PDF 66): «البخاري: الطبقتان الأولى والثانية». Both are in the book; a short «كما يذكر المؤلف هنا» in L7 (or the PDF 64 wording) would avoid students seeing a contradiction. The L7 quiz q3 is unaffected.

12. **index.html — gq1** («التفريق بين الرواية والدراية في التقديم، يقابله في زمن الصحابة: نقد السند … ونقد المتن»). The correspondence is the writer's inference; the book does not pair riwaya/diraya with naqd al-sanad/naqd al-matn. Answer is still the only defensible one. Optional fix: rephrase the stem as «أيّ مما يأتي ظهر عند الصحابة من صور النقد؟».
    gq2 likewise links two separate statements (PDF 8 aahad / PDF 18 fear of unintended error); acceptable.

13. **lecture2.html** keeps «كجابر بن عبد الله (ت ٧٤هـ)» as printed (PDF 14). Not a quiz point; acceptable as the book's figure, but it could be dropped for consistency with the other omitted death dates.

## Checked and correct (no action)
- Lesson 1: 16 verses — الحجر ٩، المائدة ٤٤، النحل ٤٤، الجن ٢٢-٢٣، العلق ١، البقرة ٢٨١، الفرقان ٥، النجم ٢٣، الأحقاف ٤، البقرة ١١١، الحجرات ٦، المائدة ١٠٣، النجم ٣-٤، الحشر ٧، النور ٥٤، النور ٦٣: wording and references correct. Definitions of السنة/الحديث, Ibn Faris, Ibn al-A'rabi, Lisan, Ibn Mahdi, al-Tirmidhi on «الوضوء مما مست النار» match PDF 10-11.
- Lesson 2: al-Marwazi tree, Ibn al-Jawzi counts (142/146; al-Barqi ~50/~40), reconciliation points 1-5, Abu Shah, 'A'isha's critique grid, al-Bukhari's tarjama — match PDF 12-22. Verses آل عمران ١١٠، الأنعام ١٦٤، النجم ٤٣ (partial)، النمل ٨٠، فاطر ٢٢ correct.
- Lesson 3: Schacht/Robson grid, musannifun-by-city grid, kutub tree, turuq tree, siyagh grid — match PDF 23-33.
- Lesson 4: al-Shafi'i text, khabar grid, shurut tree, jadwal (all 50 cells), conclusions (هـ، د، ب), Ibn Hajar 12 ranks and mapping — match PDF 33-41.
- Lesson 5: ilal causes grid, imams grid with dates (160/198/198/234), books (385/327/795), muwatta tree and counts (600/222/613/285/61) — match PDF 42-50.
- Lesson 6: Bukhari tree and tabaqat grid, namudhaj grid (557/2268/2269/3459/5021 with shaykhs), Ibn al-Salah's three answers, bab hadithi example, al-Zuhri tabaqat grid; verses التوبة ١١٣ and القصص ٥٦ correct.
- Lesson 7: Abu Dawud tree, tabaqat grid, hasan tree, editions grid (37/4341/1515 vs 32/4397/—), imams grid (dates 202-275, 215-303, 209-279, 209-273) — match PDF 64-76.
