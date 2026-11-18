# NOTES — part 3 (lessons 5 and 6, PDF 42-64 to the end of Muslim, before «الإمام أبو داود»)

## Lesson 5
- title: علم العلل ونقد المتن وموطأ الإمام مالك
- description: علم العلل بوصفه علم متابعة الثقات ورواياتهم، ومعنى العلة وأئمتها وكتبها، ثم الرد على زعم المستشرقين في نقد المتن، والتعريف بالإمام مالك ومنهجه في الموطأ أول كتابٍ منهجي.
- tag: العلل ونقد المتن والموطأ

Diagrams: mind map + 5 drawn (`ilalasbab` grid, `ilalaimma` grid, `matnadilla` grid, `muwattamanhaj` tree, `muwattaadad` grid) + CSS blocks (cmp ×3, rows ×3, ben detail ×2, eras, note ×3, warn, ask, sum ×4, blockquotes). Quiz: 8 mcq (`b5q1`..`b5q8`), correct positions 2,4,1,3,3,1,4,2; correct option longest in 3 (q2, q7, q8).

## Lesson 6
- title: الصحيحان: منهج البخاري ومسلم
- description: التعريف بالإمامين البخاري ومسلم، والمزايا المنهجية لصحيح البخاري وتراجمه، ومقدمة صحيح مسلم وأقسام الأخبار فيها والاعتراض عليه، ثم مميزات منهج مسلم كالباب الحديثي واعتماد رجال الطبقة الثانية.
- tag: منهج الصحيحين

Diagrams: mind map + 5 drawn (`bukharimazaya` tree, `bukharitabaqat` grid, `bukharinamudhaj` grid, `muslimaqsam` grid, `zuhritabaqat` grid) + CSS blocks (eras, flow, cmp ×6, ben ×1, ben detail ×2, rows ×3, note ×4, ask, sum ×2, blockquote). Quiz: 8 mcq (`b6q1`..`b6q8`), correct positions 3,1,4,2,1,3,2,4; correct option longest in 2 (q4, q5).

## Glossary (term · definition from the book · lesson)
| المصطلح | التعريف | القسم |
|---|---|---|
| علم العلل | علم متابعة الثقات ورواياتهم؛ يبدأ من حيث انتهى علم الجرح والتعديل فيبحث روايات الثقة روايةً رواية | ٥ |
| الخبر المعلول | حديثٌ ظاهر السلامة اطُّلع فيه بعد التفتيش على قادح | ٥ |
| نقد المروي | نقد المحدثين للسند والمتن جملةً واحدة، يدخل الخطأ والوهم على أي جزءٍ منها | ٥ |
| علم مختلف الحديث | ويسمى اختلاف الحديث أو مشكل الحديث: علمٌ كاملٌ نشأ في البحث في المتون | ٥ |
| البلاغات | ما يقول فيه مالك «بلغني أن…» ويُغفل ذكر السند إلى من بلغه عنه | ٥ |
| التراجم | مقدماتٌ موجزة يقدّم بها البخاري لكل حديثٍ أو باب تشرحه وتوضحه؛ وقالوا: «فقه البخاري في تراجمه» | ٦ |
| الارتفاع (علو الإسناد) | السند المتصل بأقل عددٍ ممكنٍ من الرواة؛ ويقابله الإسناد النازل | ٦ |
| الباب الحديثي | منهج مسلم في جمع الروايات ذات الموضوع الواحد في مكانٍ واحد، يعضد بها الطريق بالطريق | ٦ |

## Candidate cross-lesson questions

```html
  <div class="mcq">
    <p class="q">بمَ يكشف علم العلل -بحسب المؤلف- عن عمق منهج المحدثين، وما صلة ذلك بمنهج مسلم في كتابه؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">بأنه يقتصر على تتبّع الكذابين، ولذا أخرج مسلمٌ حديث المتهمين بالوضع.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">بأنه تتبّعٌ لأخطاء الثقات، ومسلمٌ يميز الخطأ النادر من حديث الثقات والصواب النادر من حديث الضعفاء.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">بأنه يحكم على الراوي حكمًا عامًّا، ولذا قبل مسلمٌ كل ما رواه الثقات.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">بأنه يعتمد على السند وحده، ولذا لم يلتفت مسلمٌ إلى ألفاظ المتون.</span></label>
    <p class="exp">قال الحاكم إن الدقة والجهد في تتبع الثقات، وقرّر مسلمٌ في جوابه عن اعتراض أبي زرعة هذه القاعدة، وهي تسير مع كتابه «التمييز».</p>
  </div>
  <div class="mcq">
    <p class="q">ما الذي جعل البخاري -بحسب المؤلف- أول من جرّد الحديث الصحيح في مصنَّف، مقارنةً بموطأ مالك؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">أن الموطأ خلا من الأحاديث المتصلة الصحيحة.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">أن مالكًا رتّب كتابه على مسانيد الصحابة.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">أن الموطأ احتوى البلاغات والمرسلات التي في صحتها جدلٌ حتى يتبين اتصالها.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">أن مالكًا لم يلتزم الثقات من الرجال.</span></label>
    <p class="exp">فالمحدثون قبل البخاري يجمعون الصحيح وغيره، واستجاب البخاري لاقتراح إسحاق بن راهويه فأفرد الصحيح المجرد.</p>
  </div>
  <div class="mcq">
    <p class="q">كيف يرد منهج الصحيحين على زعم المستشرقين أن المحدثين لم يعتنوا بالمتن؟</p>
    <label class="opt"><input type="radio" name="gq3"><span class="t">بأن الشيخين قبلا كل ما صح سنده دون أي نظرٍ في ألفاظ متنه ومعناه وما بين رواياته من فروق.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">بأنهما اقتصرا على ذكر الأسانيد العالية دون المتون.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">بأنهما تركا تمييز الألفاظ للفقهاء من بعدهما.</span></label>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">بأن البخاري يختار من مئات الروايات، ومسلمًا يسجّل الفوارق بين الأسانيد والمتون.</span></label>
    <p class="exp">جعل المؤلف النظر في الكتب الستة من أدلة العناية بالمتون، ووصف مسلمًا بأنه بارعٌ في تسجيل الفوارق فقلّما يفوته شيء.</p>
  </div>
```

## Source issues (left out of the pages or stated carefully)
- PDF 47: Nafi' «(ت ١٢٠هـ)» (more commonly 117 AH). Left the date out; Nafi' is named without a death year.
- PDF 46: «جامع مَعْمَر بن راشد المتوفى سنة (١٥٤هـ)»; PDF 27 gives 153 AH (internal inconsistency). Left the date out.
- PDF 44: «الترمذي … أول من صنّف الحديث على الأبواب المعلّلة» kept as the book's statement (attributed to the book in a card and a grid row); reviewer may check.
- PDF 48: the Muwatta' connected hadiths «وهي ستمائة حديث», and the counts 222 (بلاغات ومرسلات), 613 (موقوفات), 285 (أقوال التابعين) on PDF 48-49 are given as the book's figures («كما في الكتاب»); not verified.
- PDF 49: the Ibn 'Abd al-Barr statement (61 hadiths of «بلغني/عن الثقة», all connected except four) sits inside the closing parenthesis of the Suyuti quotation; written as «نقل [السيوطي] أن ابن عبد البر…», not as a separate claim.
- PDF 52: «ضم بين دفتيه واحدًا وتسعين كتابًا» (the common count is 97 kutub) — the count is NOT stated on the page. Also «اختار أحاديث كتابه الأربعة آلاف -غير المكررة-» and «لا تزيد على ألفين وستمائة وحديثين» (two different counts in one paragraph) — both left out; only «من بين ستمائة ألف حديث» (PDF 51 and 52) is kept.
- PDF 53: Kitab al-Iman «اثنين وأربعين بابًا اشتملت على واحد وثمانين حديثًا» kept, introduced with «كما يذكر المؤلف»; not verified.
- PDF 53: the tarjama of Kitab al-Iman quotes several verses (Al-Fath 4, Al-Kahf 13, Maryam 76, Muhammad 17, Al-Muddaththir 31, Al-Tawba 124, Al-Ahzab 22, Al-Baqara 260, Al-Shura 13, Al-Ma'ida 48) in plain parentheses; not quoted on the page, described as «ساق آياتٍ في زيادة الإيمان».
- PDF 51: «لما يقارب الأربعة عشر ألف راو» (narrators in al-Tarikh al-Kabir) — checked at 200 dpi, kept.
- PDF 61: Ubayy's hadith «جاء من ست طرق», but PDF 60 shows a seventh route (سعيد بن أزهر عن وكيع). The page lists the six names the book gives without stating a count.
- PDF 58: the book attributes the Abu Zur'a/al-Bardha'i report to «قال الإمام النووي: (روينا عن سعيد بن عمرو البرذعي…)»; kept with that attribution.
- PDF 51: the heading dates (194-256) and Muslim (204-261) kept as printed.
- (Fix pass after REVIEW) PDF 57-58: grid `muslimaqsam` row 3 now «المردود» with the accused/munkar narrators (عبد الله بن مسور، عمرو بن خالد); أسباط وقطن وأحمد بن عيسى moved to a separate sentence as «المختلف فيه» that is excluded from the third section.
- (Fix pass) PDF 50: Malik's talaq sentence quoted in full; the book's own paraphrase «وكذلك السنة عندنا أيضًا الطلاق» omits «في» and reads as the opposite ruling, so it is not used on the page.
- (Fix pass) Lesson 6 «أخرجه البخاري في خمسة مواضع»: the book lists five places but does not state the count; kept (REVIEW: acceptable).
- (Fix pass) PDF 63: «الرواية الثالثة فيها زيادة» kept as the book words it, without the «من حديث أبي هريرة» gloss; in the printed numbering the زيادة «لولا أن تعيرني قريش» is in no. 42 (the fourth narration) — doubtful, left as the book has it.
- (Fix pass) PDF 64 vs 66: al-Bukhari's tabaqat (first, sometimes «أعيان الثانية» vs «الأولى والثانية»); L7 now notes the grid follows the author's division there.

## Quran quotations written
- Lesson 6, [التوبة: ١١٣]: ﴿مَا كَانَ لِلنَّبِيِّ وَالَّذِينَ آمَنُوا أَن يَسْتَغْفِرُوا لِلْمُشْرِكِينَ وَلَوْ كَانُوا أُولِي قُرْبَىٰ مِن بَعْدِ مَا تَبَيَّنَ لَهُمْ أَنَّهُمْ أَصْحَابُ الْجَحِيمِ﴾ (in the Abu Talib narration, PDF 62).
- Lesson 6, [القصص: ٥٦]: ﴿إِنَّكَ لَا تَهْدِي مَنْ أَحْبَبْتَ وَلَٰكِنَّ اللَّهَ يَهْدِي مَن يَشَاءُ ۚ وَهُوَ أَعْلَمُ بِالْمُهْتَدِينَ﴾ (same narration, PDF 62).
- Lesson 5: none.
