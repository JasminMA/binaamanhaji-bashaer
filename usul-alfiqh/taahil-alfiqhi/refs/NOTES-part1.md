# NOTES — part 1 (lessons 1-2, PDF 2-22)

Source read from page images of `refs/shamil-taahil.pdf` (PDF 2-22 at 110 dpi, verse lines re-checked at 200 dpi).

## Lesson cards

### Lesson 1
- title: مبادئ علم أصول الفقه، والحكم الشرعي وتقسيماته، والقرآن والقراءات
- description: المبادئ العشرة لعلم أصول الفقه ومحاوره الأربعة، ثم الحكم الشرعي بقسميه التكليفي والوضعي وتقسيمات الواجب والسنة، ثم الأدلة المتفق عليها والمختلف فيها، والقرآن وأنواع القراءات.
- tag: المبادئ والحكم الشرعي

### Lesson 2
- title: السنة النبوية: أفعال النبي ﷺ، والخبر وأقسامه، والنسخ
- description: الدليل الثاني السنة النبوية: تعريفها وأقسام أفعال النبي ﷺ الخمسة، ثم أقسام الخبر وشروط قبول الآحاد والمرسل عند الشافعي، ثم النسخ بشروطه الأربعة وطرق معرفة المتأخر وأقسامه.
- tag: السنة والخبر والنسخ

## Glossary (term · the book's definition · lesson)

| المصطلح | التعريف كما في الكتاب | القسم |
|---|---|---|
| أصول الفقه (لقبًا) | معرفة دلائل الفقه الإجمالية، ومعرفة كيفية الاستفادة منها، ومعرفة حال المستفيد | ١ |
| الحكم الشرعي | خطاب الله المتعلق بفعل المكلف، اقتضاءً أو تخييرًا أو وضعًا | ١ |
| السبب | وصف ظاهر منضبط معرِّف للحكم | ١ |
| الرخصة | تغيير الحكم الشرعي إلى سهولة لعذر مع قيام سبب الحكم الأصلي | ١ |
| القرآن | اللفظ المنزل على محمد ﷺ، المعجز بسورة منه، المتعبد بتلاوته | ١ |
| السنة (اصطلاحًا) | أقوال النبي ﷺ وأفعاله وتقريراته | ٢ |
| المتواتر | ما رواه جماعة يستحيل تواطؤهم على الكذب في كل طبقة من طبقات السند إلى منتهاه، وأسندوه إلى أمر محسوس | ٢ |
| النسخ (اصطلاحًا) | رفع حكم شرعي بدليل شرعي متراخٍ عنه | ٢ |

## Candidate cross-lesson questions

```html
  <div class="mcq">
    <p class="q">من محاور علم أصول الفقه الأربعة «المدلول»: فما هو؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">خطاب الشارع: الكتاب والسنة.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">المجتهد والشروط التي تتوفر فيه.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">الحكم الشرعي، وهو أثر الدليل.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">الباب أو القاعدة التي استُنبط منها الحكم.</span></label>
    <p class="exp">فالدليل خطاب الشارع، والدلالة وجه دلالة الدليل على المدلول، والمستدل هو المجتهد؛ ولذلك بدأت المحاضرة الأولى بأقسام الحكم الشرعي تحت عنوان «المدلول».</p>
  </div>
  <div class="mcq">
    <p class="q">آية «رجم الزانيين المحصنين» نُسخت تلاوتها وبقي حكمها: هل تدخل في تعريف القرآن الذي ذكره الدرس؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">نعم، لأن حكمها ما زال باقيًا معمولًا به.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">لا، لأن قيد «المتعبد بتلاوته» يخرج ما نُسخت تلاوته.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">لا، لأن قيد «المعجز بسورة منه» يخرجها.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">نعم، لأنها لفظ منزل على محمد ﷺ.</span></label>
    <p class="exp">في القسم الأول: قيد «المتعبد بتلاوته» يخرج ما نُسخت تلاوته فإنه ليس قرآنًا؛ وفي القسم الثاني: هذه الآية مثال نسخ التلاوة مع بقاء الحكم.</p>
  </div>
  <div class="mcq">
    <p class="q">ما الذي يجمع القراءات المتواترة والحديث المتواتر في حكمهما كما ذكره الدرس؟</p>
    <label class="opt"><input type="radio" name="gq3"><span class="t">كلاهما حجة ظنية يُعمل بها في الأحكام.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">كلاهما لا يُنسخ بحال من الأحوال.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">كلاهما يُشترط فيه الضبط دون العدالة.</span></label>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">كلاهما يفيد القطع واليقين.</span></label>
    <p class="exp">القراءات المتواترة حجة قطعية، والحديث المتواتر يفيد العلم (اليقين) لأن التواتر من طرق العلم الضروري؛ أما الشاذة فحجة ظنية.</p>
  </div>
```

## Source issues (left out or handled, with PDF page)

- PDF 7: the definition of المانع lacks «لذاته» (the شرط definition has it). The page gives the definition exactly as printed and adds nothing.
- PDF 19 (printed 18): the wasiyya verse is printed as «يا أيها الذين آمنوا كتب عليكم إذا حضر أحدكم الموت…». البقرة ١٨٠ begins at «كُتِبَ عَلَيْكُمْ»; the page quotes the mushaf wording without the prefix.
- PDF 5: «وهو البالغ العاقل الذاكر؛ وقيل: الذاكر حتى يخرج من ذلك: الناسي والمكره والملجأ» reads oddly («وقيل»); quoted as printed inside «» and not explained further.
- PDF 13: the shadhdha reading «والسارق والسارقة فاقطعوا أيمانهما» is given in «» as a reading, never in ﴿ ﴾.
- PDF 11: the Kawkab verse names «الأستاذ والجويني ونجله»; the book says only «هؤلاء الأئمة الثلاثة», so the page does not identify them.
- PDF 9: Suyuti's Kawkab nazm of the hukm categories (4 lines) is only mentioned, not quoted. Every other printed verse in the range is quoted.
- The hadiths in this range have no footnotes/sources in the book; quoted without a source.
- The doubtful «فلا قل لهما» (OUTLINE) is not in this range.

## Quran quotations written (for the reviewer)

| lesson | reference | text |
|---|---|---|
| 1 | البقرة: ٤٣ | وَأَقِيمُوا الصَّلَاةَ (fragment, three times) |
| 1 | المائدة: ٣ | حُرِّمَتْ عَلَيْكُمُ الْمَيْتَةُ (fragment; heading and quiz q3) |
| 1 | البقرة: ١٩٦ | وَأَتِمُّوا الْحَجَّ وَالْعُمْرَةَ لِلَّهِ |
| 1 | البقرة: ١٨٥ | فَمَن شَهِدَ مِنكُمُ الشَّهْرَ فَلْيَصُمْهُ |
| 2 | الحشر: ٧ | وَمَا آتَاكُمُ الرَّسُولُ فَخُذُوهُ وَمَا نَهَاكُمْ عَنْهُ فَانتَهُوا |
| 2 | البقرة: ٤٣ | وَأَقِيمُوا الصَّلَاةَ |
| 2 | البقرة: ٢٤٠ | وَالَّذِينَ يُتَوَفَّوْنَ مِنكُمْ وَيَذَرُونَ أَزْوَاجًا وَصِيَّةً لِّأَزْوَاجِهِم مَّتَاعًا إِلَى الْحَوْلِ غَيْرَ إِخْرَاجٍ |
| 2 | البقرة: ٢٣٤ | وَالَّذِينَ يُتَوَفَّوْنَ مِنكُمْ وَيَذَرُونَ أَزْوَاجًا يَتَرَبَّصْنَ بِأَنفُسِهِنَّ أَرْبَعَةَ أَشْهُرٍ وَعَشْرًا |
| 2 | البقرة: ١٤٤ | قَدْ نَرَىٰ تَقَلُّبَ وَجْهِكَ فِي السَّمَاءِ فَلَنُوَلِّيَنَّكَ قِبْلَةً تَرْضَاهَا فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ وَحَيْثُ مَا كُنتُمْ فَوَلُّوا وُجُوهَكُمْ شَطْرَهُ |
| 2 | البقرة: ١٨٠ | كُتِبَ عَلَيْكُمْ إِذَا حَضَرَ أَحَدَكُمُ الْمَوْتُ إِن تَرَكَ خَيْرًا الْوَصِيَّةُ لِلْوَالِدَيْنِ وَالْأَقْرَبِينَ بِالْمَعْرُوفِ حَقًّا عَلَى الْمُتَّقِينَ |
| 2 | المجادلة: ١٢ | يَا أَيُّهَا الَّذِينَ آمَنُوا إِذَا نَاجَيْتُمُ الرَّسُولَ فَقَدِّمُوا بَيْنَ يَدَيْ نَجْوَاكُمْ صَدَقَةً ذَٰلِكَ خَيْرٌ لَّكُمْ وَأَطْهَرُ فَإِن لَّمْ تَجِدُوا فَإِنَّ اللَّهَ غَفُورٌ رَّحِيمٌ |
| 2 | البقرة: ١٨٥ | شَهْرُ رَمَضَانَ الَّذِي أُنزِلَ فِيهِ الْقُرْآنُ هُدًى لِّلنَّاسِ وَبَيِّنَاتٍ مِّنَ الْهُدَىٰ وَالْفُرْقَانِ فَمَن شَهِدَ مِنكُمُ الشَّهْرَ فَلْيَصُمْهُ |

(Waqf marks were omitted inside the long verses.)
