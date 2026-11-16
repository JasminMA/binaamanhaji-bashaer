# NOTES — part 1 (lessons 1 and 2)

Read from page images: (أ) PDF 2-15 (at 110 dpi, zoomed crops at 200 dpi of PDF 2, 8, 9, 14); (ج) PDF 5-15 (+16 for the amr ruling) at 200 dpi; (ب) slides 1-11.

## Lesson cards

### Lesson 1
- title: مقدمات دراسة النحو، والخريطة العامة، وباب الكلام والكلمة
- description: لماذا نستصعب النحو وكيف نكسر الحاجز معه من تجربة «مدارج النحو»، وتنبيهات قبل دراسته، ثم الخريطة العامة لأبوابه الأربعة، وتعريف الكلام وأقسامه وعلامات الاسم والفعل والحرف.
- tag: المدخل والكلام والكلمة
- drawn diagrams: 5 (kharita, asmaa, kalam, afal, alamat); CSS diagrams: mind map, cmp three, flow ×3, ben detail ×2, ben, rows ×2, cmp ×2, callouts. Quiz: 8.

### Lesson 2
- title: الإعراب والبناء وعلامات الإعراب والمعربات
- description: المعرب والمبني في الحروف والأفعال والأسماء، والأسماء المبنية، والإعراب الظاهر والتقديري، ثم علامات الإعراب في المتن وجدول المعربات وأنواع الجملة.
- tag: الإعراب والبناء
- drawn diagrams: 5 (mabni, taqdiri, alamat, jadwal, jumla); CSS diagrams: mind map, cmp ×6, cmp three, rows ×4, ben detail, callouts. Quiz: 8.

## Glossary rows (term · definition · lesson)
| المصطلح | التعريف | القسم |
|---|---|---|
| الكلام | اللفظ المركّب المفيد بالوضع (المتن) | ١ |
| اللفظ | صوتٌ مشتمل على بعض الحروف الهجائية | ١ |
| المفيد | ما يفيد فائدةً ومعنًى يحسن السكوت عليها، ولا ينتظر المستمع شيئًا آخر | ١ |
| الحرف | ما لا يصلح معه دليل الاسم ولا دليل الفعل (المتن)؛ فعلامته عدمية | ١ |
| الإعراب | تغيير أواخر الكلم لاختلاف العوامل الداخلة عليها لفظًا أو تقديرًا (المتن) | ٢ |
| المبني | الذي لا يتغيّر آخره مهما تغيّرت العوامل الداخلة عليه | ٢ |
| الإعراب التقديري | إعرابٌ لا نرى علامته، ويكون في الألف للتعذّر وفي الواو والياء للثقل | ٢ |
| جمع المؤنث السالم | ما سلم فيه بناء المفرد ويدلّ على أكثر من اثنتين بزيادة ألفٍ وتاء | ٢ |

## Candidate cross-lesson questions

```html
  <div class="mcq">
    <p class="q">لماذا عدّ الشرح البابين الأول والثاني أهمّ أبواب النحو الأربعة؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">لأنهما أكثر الأبواب أمثلةً من القرآن.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">لأن ما بعدهما ينبني عليهما، ولا يُستوعب النحو بغير ضبطهما.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">لأن المتن لم يذكر غيرهما من الأبواب.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">لأنهما يختصّان بالأسماء دون الأفعال.</span></label>
    <p class="exp">ولذا نبّه الشرح في أول باب الإعراب أن من أتقنه سهُل عليه ما بعده، ومن لم يتقنه فعليه بالتكرار والمراجعة؛ فالنحو آخذٌ بعضه برقاب بعض.</p>
  </div>
  <div class="mcq">
    <p class="q">مهارة التفكيك تفكّ العبارة إلى اسمٍ وفعلٍ وحرف؛ فما مهارة التحليل التي تليها؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">تحويل الجملة الاسمية إلى جملةٍ فعلية.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">حفظ حروف الجرّ وحروف القسم.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">رسم الخريطة العامة لعلم النحو.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">تحليل الكلمات إلى معرباتٍ ومبنيّات.</span></label>
    <p class="exp">وهي موضوع الباب الثاني؛ وطبّقها الشرح بواجبين: التفكيك على سورة الضحى، والتحليل على سورة الفاتحة.</p>
  </div>
  <div class="mcq">
    <p class="q">أيّ هذه العلامات تختصّ بالاسم ولا تدخل الفعل، بحسب علامات الاسم وأقسام الإعراب في المتن؟</p>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">الخفض.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">الجزم.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">النصب.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">الرفع.</span></label>
    <p class="exp">الخفض أول علامات الاسم في المتن، وفي باب الإعراب: للأفعال الرفع والنصب والجزم «وَلَا خَفْضَ فِيهَا»، وللأسماء الرفع والنصب والخفض «وَلَا جَزْمَ فِيهَا».</p>
  </div>
```

## Source issues (left out or reworded, with page)
- (أ) PDF 6 [5] and PDF 8 [7]: «تعريف الكلمة: هي اسمٌ وفعلٌ وحرف» / «قال المؤلف: الكلمة تنقسم إلى ثلاثة أقسام». The matn (ج PDF 5) says «وأقسامه ثلاثة» about الكلام, and gives no definition of الكلمة; this is a division, not a definition, and the quoted words are not the matn's. Page quotes the matn's own wording; no «تعريف الكلمة» given.
- (أ) PDF 8 [7]: «قال المؤلف: الفعل ينقسم إلى ثلاثة أقسام: إمّا فعلٌ حصل…» is not matn wording (the matn has «الأفعال ثلاثة: ماضٍ، ومضارعٌ، وأمرٌ» in باب الأفعال). Page gives it as the explanation's division, not as a quote of ابن آجرّوم.
- (أ) PDF 6 [5]: «المنصوبة خمسة عشر» and «شبه المفاعيل عشرة» do not match the list given (and the matn says 14). Page lists the items without these two counts (keeps «المرفوعة سبعة», «المفاعيل خمسة», «المجرورة ثلاثة», which match their lists).
- (أ) PDF 13 [12]: the table says «الأسماء الستة»; text (PDF 14) and matn say الأسماء الخمسة. The table is redrawn with «الأسماء الخمسة».
- (أ) PDF 14 [13]: «أمّا إذا جاءت مثنًى أو جمعًا فإنها تعرب إعرابًا عاديًا: تُرفع بالضمة وتُنصب بالفتحة وتُجرّ بالكسرة» contradicts the book's own rule for المثنى (بالألف والياء, same page). Page says only that they then do not take the i'rab of الأسماء الخمسة.
- (أ) PDF 11 [10]: «نون النسوة: حرفٌ مبنيٌّ في محلّ رفع فاعل» is self-inconsistent (a فاعل is a noun). Page gives the verb's bina' only and omits the i'rab of the nun.
- (أ) PDF 11 [10]: «الأمر مبنيٌّ على ما يُجزم به مضارعه» differs from the matn (ج PDF 16): «وَالأَمْرُ: مَجْزُومٌ أَبَداً». Page gives both, attributed (the tashjir slide 11 gives both too); lesson 3 treats it.
- (أ) PDF 9 [8]: «رزقكم: ثلاث كلمات: رزقَ، والكاف، والميم» — counting الميم as a separate word is questionable; example left out (only «ضربتك» kept).
- (أ) PDF 8 [7]: النداء listed as a sign of the noun; not in the matn. Kept, explicitly marked as the explanation's addition.
- (أ) PDF 15 [14]: the example «قال لهم أخوهم» is a Quranic phrase cut from «إذ قال لهم أخوهم» (several verses); left out to avoid quoting a cut verse with an unclear reference.
- (ب) slide 2: adds «مذ، منذ، لعل، حتى» (and lists الواو، التاء) to حروف الجر; not used (the matn's list is quoted instead).
- (ب) slide 4: «تثنية الأسماء الخاصة» misreads the matn «تثنية الأسماء خاصّةً» (= only); matn wording used.
- (ب) slide 6: title «علامات النصب» but content is الخفض, and «جمع المذكر السالم» under الكسرة should be جمع المؤنث السالم; not used (matn used).
- (ب) slide 3: the الأفعال list is nearly invisible (white on light); content taken from the matn.

## Quran quotations written (all in lecture2.html, section «سابعًا», box of الأسماء الخمسة; the third also in the exp of b2q5)
- [الرعد: ١٤] ﴿لِيَبْلُغَ فَاهُ﴾ (part of the verse)
- [البقرة: ١٠٥] ﴿وَاللَّهُ ذُو الْفَضْلِ الْعَظِيمِ﴾ (end of the verse; the same words also end آل عمران ٧٤ and others)
- [يوسف: ١٠٠] ﴿وَرَفَعَ أَبَوَيْهِ عَلَى الْعَرْشِ﴾ (part of the verse)

## Poetry and quotations
- L1: «طَعَامُ الْكِبَارِ سُمُّ الصِّغَارِ» (عبد الكريم الرفاعي, (أ) PDF 2); bait of الحريري «وَالْحَرْفُ مَا لَيْسَ لَهُ عَلَامَهْ *** فَقِسْ عَلَى قَوْلِي تَكُنْ عَلَّامَهْ» ((أ) PDF 9, as printed); «وإنما النحو الإعراب…» from «مدارج النحو» ((أ) PDF 4).
- L2: «فَلَا يَمَلَّنَّكَ مَا تَكَرَّرَ *** لَعَلَّهُ يَحْلُو إِذَا مَا تَقَرَّرَ» ((أ) PDF 15, unattributed in the source).
- Matn quotations from (ج) PDF 5-6 (L1), 7-15 (L2), 16 (one phrase in L2).
