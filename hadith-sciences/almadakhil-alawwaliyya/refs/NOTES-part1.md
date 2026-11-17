# NOTES — part 1 (lesson 1, PDF pages 2-7)

## Lesson 1
- Title: نشأة علم الحديث وكتبه وصلته بالعلوم الأخرى
- description: نشأة علم الحديث ببعثة النبي ﷺ وأهمية دراسته، وأهم كتبه وكيفية التدرج فيها مع تنبيهات في الطلب، ثم ارتباطه بالعلوم الأخرى وكيفية استمداد قواعده من النقل والعقل وتصرفات السلف.
- tag: النشأة والكتب والقواعد
- Diagrams: mind map + 5 drawn (kutub, ahkam, ghalaba, tanbihat, shawahid) + CSS blocks (cmp in s1/s4/s5/s7, flow in s3, rows panels in s2/s3/s5/s6, ben detail cards in s4/s5/s7, sum/note/warn/ask callouts, 2 blockquotes).
- Quiz: 8 mcq (b1q1..b1q8); correct positions 2,4,1,3,3,1,4,2; correct is longest in 3 (q3, q5, q8).

## Glossary (term · definition from the book · lesson)
| المصطلح | التعريف | القسم |
|---|---|---|
| الحديث | أقوال النبي ﷺ، وأفعاله، وتقريراته، وأوصافه الخَلْقية والخُلُقية | ١ |
| كتب الحديث | الكتب التي أُلّفت في جمع أحاديث النبي ﷺ، وأهمها الكتب الستة | ١ |
| الصحيحان | صحيحا البخاري ومسلم، أهم الكتب الستة، وأفضلهما صحيح البخاري | ١ |
| الموطأ | كتاب الإمام مالك، أصل الكتب الستة، وعليه بنى من جاء بعده | ١ |
| الشَّرَه في طلب العلم | أن يريد الطالب أن يبتلع العلم دفعةً واحدة | ١ |
| فقهاء المحدّثين | أفذاذٌ اجتمع لهم الحذق بقوةٍ وعمقٍ في فنّين، منهم أحمد والبخاري وأبو داود | ١ |
| عملية الموازنة | ضرب الأخبار ومقارنتها بعضها ببعض عند سماعها من أطرافٍ مختلفة حتى نصل للطرف الذي ضبط حكايتها | ١ |
| القواعد المتعلقة بالمتن | منها قواعد مختلف الحديث، ومقارنة الألفاظ لمعرفة من أخطأ ومن أصاب ومن عبّر بالمعنى ومن اختصر ومن زاد ومن نقص | ١ |

## Candidate cross-lesson questions
(Linking lesson 1 to the course idea: the science of hadith grew from the Prophet's ﷺ time, its rules come from the conduct of the Companions, and it is a base for the other sciences. gq2 links to lesson 2 only through Umar, who appears in both parts; the assembler should check it against lesson 2's text.)

```html
  <div class="mcq">
    <p class="q">من أيّ مصادر استمداد قواعد علم الحديث يُعدّ تثبّت عمر في خبر أبي موسى وإنكار عائشة حديث «إن الميت ليعذَّب ببكاء الحي»؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">من النقل، وهو نصوص القرآن.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">من القواعد الأصولية التي جمعها الشافعي.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">من تصرفات السلف وأئمة الحديث.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">من اصطلاحات المتأخرين في كتب المصطلح.</span></label>
    <p class="exp">فالقواعد مبنية على النقل والعقل وتصرفات السلف، وقد استعمل المحدّثون بعد ذلك ما صنعه الصحابة من التثبّت وعرض الروايات على القرآن والنصوص الأخرى.</p>
  </div>
  <div class="mcq">
    <p class="q">ما الذي يجمع بين خبري عمر بن الخطاب (خبر عمار وخبر أبي موسى) في الجزء الأول من المحاضرة؟</p>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">أنهما شاهدان على أن أحاديث الأفراد فيها ما يُردّ وما لا يُردّ.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">أنهما شاهدان على ردّ كل خبرٍ تفرّد به صحابي.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">أنهما شاهدان على عرض الروايات على القرآن.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">أنهما شاهدان على أن الصحابة لم يكونوا يسألون عن الإسناد.</span></label>
    <p class="exp">وهو المعيار الدقيق الذي استعمله المحدّثون بعد ذلك؛ ولذا لم يقبل عمر خبر أبي موسى حتى أتاه بشاهدٍ معه.</p>
  </div>
  <div class="mcq">
    <p class="q">لماذا لا يمكن للفقيه أو المفسّر أن يكون مجتهدًا في فنّه دون علم الحديث؟</p>
    <label class="opt"><input type="radio" name="gq3"><span class="t">لأن علم الحديث نشأ قبل الفقه والتفسير.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">لأن كتب الفقه والتفسير خاليةٌ من الروايات.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">لأن العلوم الشرعية يمكن فصلها فصلًا تامًّا.</span></label>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">لأنه لا يملك آلة تمييز الصحيح من الضعيف.</span></label>
    <p class="exp">فمن كان مجرد ناقلٍ لصحة الحديث أو ضعفه فليس له آلة، والاختلاف في صحة الحديث ينبني عليه الاختلاف في مسائل الفنون الأخرى.</p>
  </div>
```

## Source issues (left out or reworded; PDF pages)
- PDF 4: era of «استقرار العلوم» given as «طبقة أتباع التابعين» while the examples are al-Shafi'i and Ibn al-Madini; page says only «مرحلة استقرار العلوم», the parenthesis is left out.
- PDF 4: عبد الغني المقدسي وابن قدامة «ابنَي خال» (usually ابنا خالة): page says only «وكانت بينهما قرابة».
- PDF 3: الموطأ «أصل الكتب الستة وأولها»: page keeps «أصل الكتب الستة، وعليه بنى من جاء بعده» and drops «وأولها».
- PDF 3: «عمدة الأحكام» «للمقدسي» kept as printed (عبد الغني المقدسي, named on PDF 4 as «صاحب العمدة»); no fuller name added.
- PDF 6-7, خبر عمار: the tayammum wording «مسح بهما وجهه ويديه إلى نصف الذراع» is not the known Sahihayn wording («وجهه وكفيه»); the page quotes the report up to «وضرب بيديه هكذا…» and says «ثم ذكر صفة التيمم». The summary's conclusion «فقبل عمر هذا الخبر» is also left out (the quoted reply «نولّيك من ذلك ما تولّيت» does not plainly say he accepted it); the page keeps only the stated rule (أحاديث الأفراد فيها ما يُردّ وما لا يُردّ) and the plain statement about Abu Musa (لم يقبله حتى يأتيه بشاهد). No source is given for either report in the book; none added.
- PDF 7: Ibn Umar's al-Qalib report and Aisha's report about the Jewish woman are quoted as printed, without takhrij (the book gives none). The summary's judgement that al-Qalib «كان استثناءً لم يبلغ عائشة» is kept as the book's.
- PDF 6: Muslim's muqaddima report of بُشير العدوي quoted as printed (the book attributes it to «مقدمة صحيحه»).
- PDF 7: the book says only «قال تعالى» for «ولا تزر وازرة وزر أخرى» (the phrase occurs in several suras); I cited [الأنعام: ١٦٤]; the reviewer may prefer another place or no reference.
- PDF 2: «يبني في طالب العلم» read as «يبني».
- Non-content left out: page frames/numbers; no hand marks seen on PDF 2-7 besides coloured headings.

## Quran quotations written (lesson 1)
1. النساء: ١١٣ (part of the verse, as the book quotes it) — ﴿وَأَنزَلَ اللَّهُ عَلَيْكَ الْكِتَابَ وَالْحِكْمَةَ وَعَلَّمَكَ مَا لَمْ تَكُن تَعْلَمُ ۚ وَكَانَ فَضْلُ اللَّهِ عَلَيْكَ عَظِيمًا﴾
2. النجم: ٣-٤ — ﴿وَمَا يَنطِقُ عَنِ الْهَوَىٰ ۝ إِنْ هُوَ إِلَّا وَحْيٌ يُوحَىٰ﴾
3. الحجرات: ٦ (part) — ﴿يَا أَيُّهَا الَّذِينَ آمَنُوا إِن جَاءَكُمْ فَاسِقٌ بِنَبَإٍ فَتَبَيَّنُوا﴾
4. النمل: ٨٠ — ﴿إِنَّكَ لَا تُسْمِعُ الْمَوْتَىٰ وَلَا تُسْمِعُ الصُّمَّ الدُّعَاءَ إِذَا وَلَّوْا مُدْبِرِينَ﴾
5. الأنعام: ١٦٤ (part; written twice: section ٧ and the exp of b1q8) — ﴿وَلَا تَزِرُ وَازِرَةٌ وِزْرَ أُخْرَىٰ﴾
