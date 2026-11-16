# NOTES — part 4 (lessons 7 and 8, PDF 124-169)

All content pages of the range were read from page images (110 dpi), and every quoted verse line of the poem was checked again at 220 dpi crops. Covers (124, 130, 137, 144, 150, 157, 163) are title-only.

## Lesson 7 — `lecture7.html` (PDF 124-143, booklets 21-23)
- Title: الدعاوى والبيّنات، ودعاوى الأمناء، والشروط في العقود
- description: البيّنة وأنواعها واليمين على المنكر والقضاء بالنكول، ودعاوى الأمناء في الردّ والتلف، ووجوب أداء الأمانة وأخذ الحق الشرعي سرًّا، وما يثبت تبعًا، والشرط المفسد للعقد وحكم الشروط بين المتعاقدين، ثم أول القواعد الفقهية العامة.
- tag: الدعاوى والأمانات
- Drawn diagrams: 5 (bayyina, shuhud, umana, ariya, haqq). CSS diagrams: mind map, 5 cmp, 2 ben detail, 2 rows panel, sum/note/warn/ask callouts. Quiz: 8 (correct positions 2,4,1,3,3,1,4,2; correct is the longest in 2).

## Lesson 8 — `lecture8.html` (PDF 144-169, booklets 24-27)
- Title: قواعد فقهية عامة، ودلالات الألفاظ
- description: بقية القواعد الفقهية العامة: الاستدامة، واليقين والشك، ورتب النفي، والقيد، وغلبة الظن، والقرعة، وتعجّل الشيء، ومضاعفة الغُرم، وما أُبين من الحي؛ ثم دلالات الألفاظ: «كان»، وصيغ العموم، والإطلاق، والعبرة بعموم اللفظ، والتخصيص والتقييد.
- tag: القواعد ودلالات الألفاظ
- Drawn diagrams: 5 (nafy, maratib, qura, umum, taqyid). CSS diagrams: mind map, flow (رتب النفي: the book gives the order), 8 cmp, ben detail, 3 rows panel, callouts. Quiz: 8 (correct positions 3,1,4,2,2,4,1,3; correct is the longest in 3).
- Size note: lesson 8 covers 4 booklets (18 content pages), so its source is about 44 KB before the diagrams are filled (above the 35 KB guide); it is already trimmed and holds no padding.

## Glossary rows (term · definition · lesson)
| المصطلح | تعريف الكتاب | القسم |
|---|---|---|
| البيّنة | كل ما أبان الحق وأظهره، من شهود أو قرائن أو عادات أو غيرها (على القول الراجح) | ٧ |
| النكول | الامتناع عن اليمين، ويُقضى به في المال وما يُقصد به المال | ٧ |
| المدّعي | من يدّعي خلاف الأصل؛ والمنكر من يُثبت الأصل | ٧ |
| الأمين | كل من حصلت العين بيده بإذن من الشرع أو بإذن من المالك | ٧ |
| المشغول (في القاعدة) | عقد لا يصح أن يُعقد عليه عقد يُبطل العقد | ٧ |
| الوهم | ضدّ الظن، وهو الطرف المرجوح، ولا يُعمل به | ٨ |
| الشك | ما تساوى فيه الأمران؛ فيرجع إلى اليقين ويبني على الأقل | ٨ |
| المطلق والعام | المطلق يتناول جميع أفراده بالبدل، والعام يتناولها بالشمول | ٨ |

## Candidate cross-lesson questions (gq1..gq3)
```html
<div class="mcq">
  <p class="q">ما الذي يجمع بين تعريف المدّعي في الخصومات وقاعدة «اليقين لا يزول بالشك»؟</p>
  <label class="opt"><input type="radio" name="gq1"><span class="t">كلاهما مبنيّ على غلبة الظن عند تعذّر اليقين.</span></label>
  <label class="opt ok"><input type="radio" name="gq1"><span class="t">كلاهما مبنيّ على اعتبار الأصل.</span></label>
  <label class="opt"><input type="radio" name="gq1"><span class="t">كلاهما مبنيّ على القرعة عند الاشتباه.</span></label>
  <label class="opt"><input type="radio" name="gq1"><span class="t">كلاهما مبنيّ على العرف والعادة.</span></label>
  <p class="exp">فالمدّعي من يدّعي خلاف الأصل والمنكر من يُثبته، والأصل بقاء ما كان على ما كان حتى يأتي يقين يرفعه.</p>
</div>
<div class="mcq">
  <p class="q">أيّ الأمثلة يجمع قاعدتي «يثبت تبعًا ما لا يثبت استقلالًا» و«الاستدامة أقوى من الابتداء»؟</p>
  <label class="opt"><input type="radio" name="gq2"><span class="t">بيع الحمل وحده، وعقد المحرم النكاح ابتداءً.</span></label>
  <label class="opt"><input type="radio" name="gq2"><span class="t">بيع اللبن في الضرع، وتطيّب المحرم بعد الإحرام.</span></label>
  <label class="opt ok"><input type="radio" name="gq2"><span class="t">بيع الشاة الحامل، وبقاء طيبٍ تطيّبه قبل الإحرام.</span></label>
  <label class="opt"><input type="radio" name="gq2"><span class="t">رهن البيت المرهون لآخر، ومراجعة المطلقة بعد العدة.</span></label>
  <p class="exp">في كلتا القاعدتين ما يُمنع مستقلًّا أو ابتداءً يجوز في حال أخرى: الحمل تبعًا لأمه، والطيب استدامةً.</p>
</div>
<div class="mcq">
  <p class="q">ما الفرق الذي بُني عليه قبول قول المودَع في الردّ دون المستعير، وقطع يد المستعير الجاحد دون المودَع؟</p>
  <label class="opt"><input type="radio" name="gq3"><span class="t">أن المستعير أخذ المال بغير اختيار صاحبه.</span></label>
  <label class="opt"><input type="radio" name="gq3"><span class="t">أن العارية تُضمن مطلقًا والوديعة لا تُضمن.</span></label>
  <label class="opt"><input type="radio" name="gq3"><span class="t">أن المودَع ليس أمينًا والمستعير أمين.</span></label>
  <label class="opt ok"><input type="radio" name="gq3"><span class="t">أن المودَع قبض لمصلحة المالك، والمستعير لحظّ نفسه.</span></label>
  <p class="exp">ولذلك لا يُقبل قول من له حظ في القبض حتى يأتي ببيّنة، وكل من تتعذّر عليه السرقة يمكن أن يتحيّل بالاستعارة.</p>
</div>
```

## Source issues (left out of the pages or normalised)
- PDF 165: «هناك ألفاظ موصولة مشتركة تُفيد العموم، وهي ستة: مَن، ما، أل، ذو الطائية، ذا بعد ما أو مَن الاستفهاميتين» — the count says six but five are listed. The page lists the five without the count.
- PDF 154: «وأما في السنة فجاءت في ستّ مواضع» with only two examples (already known). The page gives the two examples without the count.
- PDF 147: the verse line is printed cut: «وكُلُّ مَعلُومٍ وُجُودًا أو عَدَم · فالأَصلُ أن يَبقَى على ما قَد» (the rhyme word missing; the explanation then quotes «على ما قَد عُلِم»). The page quotes only the first hemistich and the explanation's words.
- PDF 134: the hadith is printed «أَدِّ الأمانة إلى مَن إِتمَنَك» (missing hamza); written «ائتمنك» in the page.
- PDF 167: the second hemistich «كقَيـدِ/كقَيِّدِ مُطلَق بما قد قَيَّدا» — the shadda on the first word is unclear even at 220 dpi; written without tashkeel on that word («كقيد»).
- PDF 126: «أربعة رجال؛ مثل: الزنا أو الإقرار» — «الإقرار» is left as printed (it is not said what kind of إقرار); it appears only inside the shuhud table.
- PDF 129 and 132 repeat the same مسألة (both-party benefit, «يدل على أنه لا يُقبل»); used once.
- Heading names: booklet 21 «الدعوى (تتمة)», booklet 22 «الدَّعاوَى (تتمة)» (already known). «المفضول قد يكون أفضل من الفاضل» starts at PDF 143 (lesson 7) and continues at PDF 146 (lesson 8); lesson 7 ends with a pointer to lesson 8.

## Quran quotations written
Lesson 7:
- [البقرة: ٢٨٢] ﴿وَاسْتَشْهِدُوا شَهِيدَيْنِ مِن رِّجَالِكُمْ ۖ فَإِن لَّمْ يَكُونَا رَجُلَيْنِ فَرَجُلٌ وَامْرَأَتَانِ مِمَّن تَرْضَوْنَ مِنَ الشُّهَدَاءِ﴾
- [التوبة: ٩١] ﴿مَا عَلَى الْمُحْسِنِينَ مِن سَبِيلٍ﴾
- [البقرة: ٢٣٠] ﴿حَتَّىٰ تَنكِحَ زَوْجًا غَيْرَهُ﴾
- [المائدة: ١] ﴿يَا أَيُّهَا الَّذِينَ آمَنُوا أَوْفُوا بِالْعُقُودِ﴾
- [آل عمران: ٨٥] ﴿وَمَن يَبْتَغِ غَيْرَ الْإِسْلَامِ دِينًا فَلَن يُقْبَلَ مِنْهُ﴾

Lesson 8:
- [النساء: ٢٣] ﴿وَرَبَائِبُكُمُ اللَّاتِي فِي حُجُورِكُم مِّن نِّسَائِكُمُ اللَّاتِي دَخَلْتُم بِهِنَّ﴾
- [النساء: ٩٢] ﴿فَتَحْرِيرُ رَقَبَةٍ مُّؤْمِنَةٍ﴾
- [البقرة: ٢١] ﴿يَا أَيُّهَا النَّاسُ اعْبُدُوا رَبَّكُمُ الَّذِي خَلَقَكُمْ وَالَّذِينَ مِن قَبْلِكُمْ لَعَلَّكُمْ تَتَّقُونَ﴾
- [آل عمران: ٤٤] ﴿وَمَا كُنتَ لَدَيْهِمْ إِذْ يُلْقُونَ أَقْلَامَهُمْ أَيُّهُمْ يَكْفُلُ مَرْيَمَ وَمَا كُنتَ لَدَيْهِمْ إِذْ يَخْتَصِمُونَ﴾
- [الصافات: ١٤١] ﴿فَسَاهَمَ فَكَانَ مِنَ الْمُدْحَضِينَ﴾
- [إبراهيم: ٣٤] ﴿وَإِن تَعُدُّوا نِعْمَةَ اللَّهِ لَا تُحْصُوهَا﴾ (same wording also at النحل: ١٨; the book gives no reference)
- [مريم: ٩٨] ﴿هَلْ تُحِسُّ مِنْهُم مِّنْ أَحَدٍ﴾
- [النساء: ١٢٣] ﴿مَن يَعْمَلْ سُوءًا يُجْزَ بِهِ﴾
- [النحل: ٦٦] ﴿وَإِنَّ لَكُمْ فِي الْأَنْعَامِ لَعِبْرَةً ۖ نُّسْقِيكُم مِّمَّا فِي بُطُونِهِ مِن بَيْنِ فَرْثٍ وَدَمٍ لَّبَنًا خَالِصًا سَائِغًا لِّلشَّارِبِينَ﴾
- [المجادلة: ١] ﴿قَدْ سَمِعَ اللَّهُ قَوْلَ الَّتِي تُجَادِلُكَ فِي زَوْجِهَا وَتَشْتَكِي إِلَى اللَّهِ وَاللَّهُ يَسْمَعُ تَحَاوُرَكُمَا﴾
- [المائدة: ٨٩] ﴿فَكَفَّارَتُهُ إِطْعَامُ عَشَرَةِ مَسَاكِينَ مِنْ أَوْسَطِ مَا تُطْعِمُونَ أَهْلِيكُمْ أَوْ كِسْوَتُهُمْ أَوْ تَحْرِيرُ رَقَبَةٍ﴾
- [النساء: ٩٢] ﴿وَمَن قَتَلَ مُؤْمِنًا خَطَأً فَتَحْرِيرُ رَقَبَةٍ مُّؤْمِنَةٍ﴾
- [المائدة: ٦] ﴿فَاغْسِلُوا وُجُوهَكُمْ وَأَيْدِيَكُمْ إِلَى الْمَرَافِقِ﴾
- [المائدة: ٦] ﴿فَامْسَحُوا بِوُجُوهِكُمْ وَأَيْدِيكُم مِّنْهُ﴾
- Not quoted as a verse: آية السرقة (PDF 169) is named only as «آية السرقة» in the taqyid table; «سبّح» and «الغاشية» (PDF 161) are surah names.
