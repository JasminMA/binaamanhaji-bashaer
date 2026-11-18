# REVIEW: «تمارين تطبيقية» in شرح الآجرومية, lecture1..8 (64 exercises)

Reviewed the built pages `nahw/sharh-alajrumiyya/lecture1..8.html` (the section before «أسئلة مراجعة», radio names b1e1..b8e8). I checked each exercise against the lesson body of the same page, the matn as quoted in the lessons, `refs/OUTLINE.md` section 5 and `refs/REVIEW.md`. I also ran `tools/list-verses.py --path src/nahw/sharh-alajrumiyya`. No page was edited.

## Overall result
- **Answers:** every exercise has exactly one `opt ok`, and in all 64 the marked answer is right by Basran grammar as the lesson teaches it. I found no exercise with two defensible answers.
- **Answer positions:** in every lesson each position from 1 to 4 is correct exactly twice.
- **Correct option strictly the longest:**

| Lesson | L1 | L2 | L3 | L4 | L5 | L6 | L7 | L8 |
|---|---|---|---|---|---|---|---|---|
| Count | 1 (e8) | 0 | 1 (e3) | 1 (e1) | 1 (e7) | 1 (e5) | 0 | 1 (e4) |

  The limit is 3, so all lessons pass. Counting ties as longest, the maximum is 3 (L7).
- **Lesson scope:** every rule the exercises use is taught in the same lesson. I found the cited examples in the lesson bodies: مهٍ/صهٍ, القاضي عادل, يَضْرِبْنَ, اقنتي, لن تذهبا, ذهبت إلى مكة لأحج, لم يشرحِ, أنّى تسكن, أُكرِمْتُ, الله يحب المحسنين, كان الطالبان مجتهدين, رأيت الرجل العاقلة أمه, أعجبني زيد علمه, خفضت صوتي احترامًا لأبي, رطلًا لبنًا, مخلصين (الأعراف 29), ما عدا, and يا طالبَ العلم.
- **Known source errors:** none of the errors listed in OUTLINE section 5 comes back:
  - L8 e5 does not say «اسم لا منصوب».
  - L8 e3 and e4 follow the matn on غير and on عدا.
- **Quran verses:** all four verses have correct wording, and the lesson body cites each one with a correct reference:
  - النساء 27
  - البقرة 264
  - البقرة 282
  - محمد 7
- **Tashkeel:** the tashkeel of every parsed word is correct. For example, «فَاطِمَةُ» is correctly written without tanween, and «لِيَسْعَ», «تَحْفَظِ», «يَحْضُرِ», «اِرْمِ» and «طَالِبَ» are correct.

---

## HIGH
None.

---

## MEDIUM

### M1. lecture6.html b6e2: the explanation overgeneralises the first object
- Quote: «والمفعول به الأول إنما يكون مع ظنّ وأخواتها.»
- **Problem:** this is false as a general rule. Verbs such as أعطى and كسا also take a مفعول به أول and a مفعول به ثانٍ. The lesson does not state this restriction.
- **Fix:** «ولا يقال: مفعول به أول؛ إذ ليس في الجملة فعلٌ ينصب مفعولين كظنّ وأخواتها.» Alternatively, drop the sentence.

### M2. lecture6.html b6e5: the explanation cites the matn's بدل example to illustrate عطف
- Quote: «و«أخ» من الأسماء الخمسة يُنصب بالألف كما في «رأيتُ زيدًا أخاكَ».»
- **Problem:** «رأيت زيدًا أخاك» is the matn's example of بدل. The same explanation then argues «وليس بدلًا», and option 1 (بدل) is the distractor. Students may be confused about which one is the بدل.
- **Fix:** use a neutral example of نصب الأسماء الخمسة, for example «كما في «رأيتُ أخاكَ»».

---

## LOW

### L1. lecture3.html b3e5 and lecture4.html b4e2, b4e5, b4e7: verses without `[surah: ayah]`
These are flagged as WARNINGS by `list-verses.py`:
- lecture3: ﴿وَاللَّهُ يُرِيدُ أَن يَتُوبَ عَلَيْكُمْ﴾
- lecture4: ﴿لَا تُبْطِلُوا صَدَقَاتِكُم﴾, ﴿وَلْيَتَّقِ اللَّهَ رَبَّهُ﴾, ﴿إِن تَنصُرُوا اللَّهَ يَنصُرْكُمْ﴾

The wording is correct, and the lesson body cites each verse with a reference. **Fix:** add the references:
- [النساء: ٢٧]
- [البقرة: ٢٦٤]
- [البقرة: ٢٨٢]
- [محمد: ٧]

### L2. lecture6.html b6e8: the إعراب is incomplete
- **Problem:** «أُخْتُهُ» is not parsed.
- **Fix:** add «و«أختُ»: فاعل للنعت «المجتهدة» مرفوع وعلامة رفعه الضمة، والهاء ضمير متصل مبني في محل جر مضاف إليه.»

### L3. lecture8.html b8e5: the explanation has no إعراب for «طَالِبَ»
- **Fix:** add the إعراب in the form the outline prefers (OUTLINE section 5, against (أ) p.42): «فـ«طالبَ»: اسم لا مبنيّ على الفتح في محلّ نصب، و«في الفصل» جارّ ومجرور.»

### L4. lecture8.html b8e3: «غَيْرَ» is not parsed
- **Fix:** add «و«غيرَ»: اسمٌ منصوب على الاستثناء، وهو مضاف».

### L5. lecture7.html b7e4, b7e6 and lecture8.html b8e2: the verb is quoted in its bare form
- Quotes: «مَشَى» فعلٌ ماضٍ / «اشْتَرَى» فعلٌ ماضٍ / «قَرَأَ» فعلٌ ماضٍ.
- **Problem:** in the sentence the verb carries تاء الفاعل (مَشَيْتُ / اشْتَرَيْتُ / قَرَأْتُ), so it is مبني على السكون.
- **Fix:** write «مَشَيْ: فعلٌ ماضٍ مبنيٌّ على السكون لاتصاله بتاء الفاعل», and similarly for the other two, or just «فعلٌ ماضٍ».

### L6. lecture7.html b7e5: unclear reference to a verse
- Quote: «كـ«مُخْلِصِينَ» في الآية».
- **Problem:** the exercise does not say which verse is meant.
- **Fix:** «كـ«مُخْلِصِينَ» في ﴿وَادْعُوهُ مُخْلِصِينَ لَهُ الدِّينَ﴾ [الأعراف: ٢٩]».

### L7. Near-repetition of the lesson's review questions
These exercises test the same point as an existing review question, so they are not exact copies. Consider changing the example or the angle:

| Lesson | Exercise | Review question it overlaps |
|---|---|---|
| L7 | b7e3 «قَعَدْتُ جُلُوسًا» (which sentence has a معنوي مفعول مطلق) | «"قعودًا" في (جلستُ قعودًا) … فما نوعه؟». This is the mirror example and the closest overlap. **Fix:** use a different pair, e.g. «فَرِحْتُ جَذَلًا». |
| L8 | b8e3 «غير خالدٍ» | «ما إعراب "محمّدٍ" في (ما رأيتُ غيرَ محمّدٍ)؟», the same rule «مجرور لا غير» |
| L3 | b3e3 «اِرْمِ» | «ما إعراب "اسْعَ" في الشرح؟», the same rule |
| L2 | b2e2 «المسلماتِ» | «بمَ يُنصب جمع المؤنث السالم؟» |
| L1 | b1e2 «سَيَكْتُبُ» | «ما علامة الفعل المضارع في الشرح؟» |
| L4 | b4e3 | «الفرق بين لا في (لا آكلُ) و(لا تأكلْ)» |
| L6 | b6e8 | «ما نوع النعت في "جاء زيد العاقل أبوه"؟» |
| L7 | b7e4 «مشيت والنهرَ» | «لماذا وجب نصب "القمرَ"…؟» |

### L8. lecture3.html b3e3: an example that the lesson does not have
- Quote: «كما في «صَلِّ» و«اِقْضِ»».
- **Problem:** «اقضِ» does not appear in lecture3.
- **Fix:** keep «صَلِّ» and use the lesson's own example «اسْعَ».

---

## Counts
HIGH: 0 · MEDIUM: 2 · LOW: 8 (the L7 near-repetition item covers 8 exercises).
