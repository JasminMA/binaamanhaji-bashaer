# REVIEW: «تدريبات الإعراب على الكتاب كله» (index.html, section sec-4b, ge1..ge16)

Reviewed `nahw/sharh-alajrumiyya/index.html` lines 311-447 against `src/nahw/sharh-alajrumiyya/lecture1..8.html`, the matn as quoted in the lessons, `refs/OUTLINE.md` section 5, `refs/REVIEW.md` and `refs/REVIEW-exercises.md`. All question stems of the built lecture pages (bNq, bNe) and gq1..gq8 were compared with the new items. No page was edited.

## Overall result
- **Answers:** every item has exactly one `opt ok`, and in all 16 the marked answer is right by Basran grammar as the lessons teach it. Every distractor is clearly wrong. I found no item with a second defensible answer.
- **Positions:** 1 = ge1, ge6, ge11, ge15; 2 = ge3, ge8, ge9, ge14; 3 = ge2, ge5, ge12, ge16; 4 = ge4, ge7, ge10, ge13. That is four each, which passes.
- **Correct option strictly longest:** only ge1 (45 vs 44) and ge2 (23 vs 20), so 2 of 16, under the limit of 5. ge7 is a tie (46/46).
- **Lesson scope:** each «من القسم N» matches the lesson that teaches the rule:
  - قد / أل: L1
  - ثبوت النون / الياء في المثنى: L2
  - كي / إذن in the jawab position (the L3 tanbih): L3
  - ألم / مَن with حذف حرف العلة (the L4 «لِيَسْعَ», «لم يقضِ»): L4
  - المبتدأ والخبر / الفاعل: L5
  - كأنّ للتشبيه / ثمّ: L6
  - ظرف الزمان / تمييز النسبة (the matn's «تصبّب زيدٌ عرقًا»): L7
  - الاستثناء التامّ الموجب / الإضافة بتقدير اللام: L8
- **Known source errors:** none of the errors in OUTLINE section 5 comes back.
- **Matn quotations:** they match the lessons: «وَالفِعْلُ يُعْرَفُ: بِقَدْ…», «كَأَنَّ لِلتَّشْبِيهِ», «العاري عن العوامل اللفظية».
- **Quran (ge7):** ﴿أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ﴾ [الشرح: ١]. Wording, tashkeel and reference are correct.
- **Tashkeel:** all parsed words are correct:
  - يَصْدُقُ، الكِتَابَ، تَحْفَظُونَ، الكِتَابَيْنِ
  - أَتَعَلَّمَ، إِذَنْ تَنْجَحَ، نَشْرَحْ، يَرْقَ
  - حَاضِرُونَ، نَجَحَتِ الطَّالِبَتَانِ، مِصْبَاحٌ، البَقَرَةَ
  - يَوْمَ الخَمِيسِ، امْتَلَأَ… مَاءً، طَالِبَيْنِ، المَسْجِدِ

  All examples are valid Arabic.

---

## HIGH
None.

---

## MEDIUM

### M1. ge7: the exercise is the lesson's own worked example, word for word
- Quote: «﴿أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ﴾ [الشرح: ١]: ما إعراب «نَشْرَحْ»؟». The correct option is «فعلٌ مضارعٌ مجزومٌ بـ«ألم» وعلامة جزمه السكون».
- **Problem:** lecture4 already gives this exact parse in its examples. Its rows say: «ألم … «نَشْرَحْ» فعلٌ مضارعٌ مجزومٌ بـ«ألم» وعلامة جزمه السكون لأنه صحيح الآخر». The lesson's SVG also labels «نَشْرَحْ», and the b4 review question on «ألم» uses it in its explanation. So the item tests recall of the example, not application. It is the only item in the set that copies a lesson example.
- **Fix:** keep the verse requirement, but use a different verse with ألم and a صحيح الآخر verb. For example ﴿أَلَمْ يَجِدْكَ يَتِيمًا فَآوَىٰ﴾ [الضحى: ٦]: «يَجِدْ» is مضارع مجزوم بـ«ألم» وعلامة جزمه السكون, and the كاف is in محلّ نصب مفعول به. Re-run quran-verse-check after the change. Alternatively, keep the verse and ask about «صَدْرَكَ» or «لَكَ».

---

## LOW

### L1. ge8: the إعراب of «مَنْ» has no محلّ
- Quote: ««مَنْ» اسم شرطٍ جازمٌ مبنيٌّ على السكون».
- **Problem:** a complete إعراب of a noun needs its محلّ.
- **Fix:** «…مبنيٌّ على السكون في محلّ رفع مبتدأ». Do not name the خبر, because that point is disputed.

### L2. ge2, ge4, ge5, ge12, ge13: the verb with تاء الفاعل is quoted in its bare form
- Quotes:
  - «قَرَأْتُ»: «قَرَأَ» فعلٌ ماضٍ (ge2, ge12)
  - «نَظَرْتُ»: «نَظَرَ» (ge4)
  - «حَضَرْتُ»: «حَضَرَ» (ge5)
  - «صُمْتُ»: «صَامَ» فعلٌ ماضٍ (ge13)
- **Problem:** this is the same pattern that REVIEW-exercises L5 flagged. In the sentence, the verb is مبنيّ على السكون because it is attached to تاء الفاعل. In ge13 the bare form «صَامَ» does not even appear in the sentence, because the alif drops.
- **Fix:** «قَرَأْتُ»: فعلٌ ماضٍ مبنيٌّ على السكون لاتصاله بتاء الفاعل، والتاء ضميرٌ متصلٌ مبنيٌّ في محلّ رفع فاعل. Do the same for نَظَرْتُ, حَضَرْتُ and صُمْتُ.

### L3. Near-repetition of lesson questions (same point, new example)
None of these is an exact copy, and each changes the word or the sign. Change the angle only if you want full independence from the lesson quizzes.

| Item | Overlapping lesson question | Note |
|---|---|---|
| ge15 «حَضَرَ الطُّلَّابُ إِلَّا طَالِبَيْنِ» | b8 «نَجَحَ الطُّلَّابُ إِلَّا خَالِدًا» | The frame and rule are the same, and only the sign (ياء المثنى) is new. This is the closest overlap. A possible fix is an إلّا sentence with a nominal مستثنى منه in a different position, e.g. «أَكْرَمْتُ الضُّيُوفَ إِلَّا ضَيْفَيْنِ». |
| ge1 «قَدْ يَصْدُقُ» | b1 «سَيَكْتُبُ … ما نوع الكلمة وبمَ عرفت» | Same question with the same angle, but قد in place of السين. |
| ge2 «الكِتَابَ» | b1 «رَأَيْتُ رَجُلًا: ما علامة الاسم» | Same question, but أل in place of the tanween. |
| ge14 «امْتَلَأَ الإِنَاءُ مَاءً» | b7 «طابَ زيدٌ نفسًا» (تمييز نسبة), «رِطْلًا عَسَلًا» | |
| ge13 «يَوْمَ الخَمِيسِ» | b7 «صباحًا» ظرف زمان (exercise), «أَمَامَ» | |
| ge12 «ثُمَّ البَقَرَةَ» | b6 «رَأَيْتُ مُحَمَّدًا وَأَخَاكَ» (معطوف) | |
| ge9 «حَاضِرُونَ» | b5 «صَادِقَاتٌ» (علامة رفع الخبر) | |
| ge8 «يَرْقَ» | b4 «إنْ تذاكرْ تنجحْ» (جواب الشرط), «مَنْ يَزْرَعْ يَحْصُدْ» | ge8 adds حذف حرف العلة, so it is acceptable. |

I found no overlap with gq1..gq8.

### L4. ge5: «كي» without a preceding lam (note only)
- The marked answer and «منصوبٌ بـ«كي»» follow the matn, which counts كي among the النواصب, and the lesson. Some Basran grammarians allow كي here to be the تعليلية جارّة, with أن مضمرة after it. The lesson does not teach this, so nothing needs to change.
- **Optional:** use «لِكَيْ أَتَعَلَّمَ» to remove even this marginal point. With the lam, كي is unambiguously مصدرية ناصبة.

---

## Counts
HIGH: 0 · MEDIUM: 1 · LOW: 4 (L3 covers 8 items)
