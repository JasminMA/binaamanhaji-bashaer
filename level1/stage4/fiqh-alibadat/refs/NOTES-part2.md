# NOTES — part 2 (lessons 3 and 4)

Read from page images of `refs/lecture3.pdf` (PDF pp. 2-13) and `refs/lecture4.pdf` (PDF pp. 2-15) at 110 dpi; all pages clear.

## Lesson cards

### Lesson 3
- title: التيمم والحيض والنجاسات، ومواقيت الصلاة والأذان
- description: يختم باب الطهارة بالتيمم وشروطه وأركانه ومبطلاته، والدماء الخارجة من المرأة (الحيض والنفاس والاستحاضة)، والنجاسات وتطهيرها، ثم يستأنف أحكام الصلاة بمواقيت الصلوات الخمس وأحكام الأذان والإقامة.
- tag: التيمم والنجاسات والمواقيت

### Lesson 4
- title: صفة الصلاة: أركانها وسننها ومبطلاتها، وسجود السهو وصلاة النفل
- description: يبيّن شرطي استقبال القبلة وستر العورة، وأركان الصلاة الثلاثة عشر، والأبعاض والهيئات، والمبطلات والمكروهات، وأحكام سجود السهو، ثم صلاة النفل من الرواتب إلى العيدين والكسوف والاستسقاء.
- tag: صفة الصلاة والسهو

## Glossary rows (term · definition · lesson)
| المصطلح | التعريف في الدرس | الدرس |
|---|---|---|
| التيمم | إيصال التراب الطهور إلى الوجه واليدين بنية مخصوصة | ٣ |
| دم الاستحاضة | الدم الذي يخرج من المرأة في غير أيام الحيض وأيام النفاس | ٣ |
| الاستحالة | انقلاب الشيء من صفة إلى صفة أخرى | ٣ |
| الأذان | الإعلام بالصلاة بألفاظ مخصوصة | ٣ |
| النية (اصطلاحًا) | قصد الشيء مقترنًا بفعله | ٤ |
| أبعاض الصلاة | سنن الصلاة المؤكدة التي يشرع للمصلي إذا تركها عمدًا أو سهوًا أن يسجد للسهو | ٤ |
| هيئات الصلاة | سنن الصلاة غير المؤكدة، ولا يشرع سجود السهو إذا تركت | ٤ |
| الاستسقاء | طلب السقيا من الله تعالى عند الحاجة، كانقطاع المطر وجفاف الأرض | ٤ |

## Candidate cross-lesson questions

```html
  <div class="mcq">
    <p class="q">الردة تبطل التيمم ولا تبطل الوضوء، والتيمم لا يصح قبل دخول الوقت؛ فما العلة التي ذكرها الدرس لذلك؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">أن التراب ليس من وسائل الطهارة.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">أن التيمم طهارة ضعيفة، طهارة ضرورة.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">أن التيمم يرفع الحدث رفعًا مؤقتًا.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">أن التيمم لا تشترط له النية.</span></label>
    <p class="exp">ولذلك ينوي المتيمم استباحة الصلاة لا رفع الحدث، ويتيمم لكل فرض؛ وهذا مما يميّز المقصد الثالث من مقاصد الطهارة عن الوضوء والغسل.</p>
  </div>
  <div class="mcq">
    <p class="q">جمعت شروط الصلاة بين الطهارة ودخول الوقت واستقبال القبلة وستر العورة؛ فأيّ هذه الشروط يسقط في نافلة السفر وشدة الخوف؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">الطهارة من الحدث.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">ستر العورة.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">دخول الوقت.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">استقبال القبلة.</span></label>
    <p class="exp">ويسقط كذلك عند العجز عنه، لكن العاجز يعيد الصلاة، بخلاف نافلة السفر وشدة الخوف.</p>
  </div>
  <div class="mcq">
    <p class="q">ما الذي يجمع بين بطلان التيمم بزوال المرض، وبطلان الصلاة بحدوث نجاسة لم يلقها حالًا؟</p>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">أن العذر الذي أباح الأمر زال أو لم يُتدارك في حينه.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">أن كليهما من نواقض الوضوء.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">أن كليهما يوجب سجود السهو.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">أن كليهما لا أثر له إذا وقع سهوًا.</span></label>
    <p class="exp">قاعدة الدرس الثالث: «أنّ ما جاز لعذر بطل بزوال ذلك العذر»؛ وفي الدرس الرابع لا تبطل الصلاة بالنجاسة ولا بانكشاف العورة إذا أُزيل ذلك حالًا، وتبطل إن تراخى.</p>
  </div>
```
(gq3 links two lessons by inference; the reviewer may prefer gq1/gq2.)

## Source issues
- L4 PDF p.8 (printed ٧), مبطل ٣: «النطق بأربع كلمات فأكثر ولو ناسيًا؛ وإذا كان دون الأربع كلمات فإن صلاته لا تبطل». Kept as printed (in the `mubtilat` grid), but the count «أربع كلمات» should be checked against the Haqiba: the usual Shafi'i statement is that a long (كثير عرفًا) speech while forgetting voids, without this exact count.
- L3 PDF p.5 (printed ٤): «فلو نزل الدم قبل تسع سنين بستة عشر يومًا فهذا لا يعتبر حيضًا» — copied word for word without drawing any inference from it (OUTLINE §5).
- L3 PDF p.10 (printed ٩): end of the ikhtiyar time of الظهر «أن يبقى من الوقت ما يسع الصلاة فقط» — copied as printed into the `mawaqit` grid; unusual wording but not contradictory.
- L3 p.4 (printed ٣) مبطل ٤: the example says «فإن التيمم يبطل» for the حضر case and «لا تبطل صلاته» for the desert case; kept as two separate statements as printed.
- Hadiths in both files appear without a source; written without a source (none invented).
- Nothing left out for being unreadable.

## Quran quotations written
| Lesson | Reference | Text |
|---|---|---|
| 3 | [النساء: ٤٣] | ﴿فَتَيَمَّمُوا صَعِيدًا طَيِّبًا﴾ (the phrase also occurs in المائدة ٦; the lecture gives no reference) |
| 3 | [النساء: ١٠٣] | ﴿إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًا﴾ |
| 4 | [البقرة: ١٤٤] | ﴿قَدْ نَرَىٰ تَقَلُّبَ وَجْهِكَ فِي السَّمَاءِ ۖ فَلَنُوَلِّيَنَّكَ قِبْلَةً تَرْضَاهَا ۚ فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ ۚ وَحَيْثُ مَا كُنتُمْ فَوَلُّوا وُجُوهَكُمْ شَطْرَهُ﴾ (part of the verse, as the lecture quotes it) |
| 4 | [البقرة: ٢٣٩] | ﴿فَإِنْ خِفْتُمْ فَرِجَالًا أَوْ رُكْبَانًا﴾ |

Dua al-istiftah in L4 (contains Quranic wording) is given inside «» as the lecture prints it, as a hadith.
