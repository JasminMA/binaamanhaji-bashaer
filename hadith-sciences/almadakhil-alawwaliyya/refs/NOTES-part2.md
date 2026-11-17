# NOTES — part 2 (lesson 2, PDF 8-15)

## Lesson 2
- Title: مراحل علم الحديث ومدرستا المتقدمين والمتأخرين وأبواب كتبه
- description: المراحل التي مرّ بها الحديث من السماع المباشر إلى النقد بعد زمن الصحابة، والفرق بين منهج المتقدمين والمتأخرين وأثره في الفقه، ثم سعة فنون علم الحديث وطرق ترتيب كتبه على الأبواب.
- tag: المراحل والمدارس والأبواب

Diagrams: mind map + 5 drawn (`shawahid` tree, `shurut` grid, `funun` tree, `shuruh` grid, `mufradat` grid) + CSS blocks (2 flows, 3 cmp, 3 rows panels, 3 ben cards, notes/warn/ask/sum callouts). Quiz: 8 questions (b2q1..b2q8), correct positions 2,4,1,3,1,4,3,2; correct option is longest in 2 of 8 (q1 tie, q4).

## Glossary (term · definition · lesson)
| المصطلح | التعريف كما في الدرس | القسم |
|---|---|---|
| المتقدمون | نقّاد الحديث: الأئمة الذين عُنوا بنقد الحديث والتفتيش فيه، ويُلحق بهم من كان على منهجهم ممن جاء بعدهم | ٢ |
| المتأخرون | الذين جاؤوا بعد عصر الرواية وخالفوا أهل الحديث في منهج النقد، ويُسمّى منهجهم منهج الفقهاء أو الأصوليين | ٢ |
| علم الرجال | أحد فنون علم الحديث، أصله معرفة الثقات من الضعفاء ومعرفة ما بُني عليه التوثيق والتضعيف | ٢ |
| علم الاتصال | أحد فنون علم الحديث، من مسائله معرفة الرواة المدلّسين والرواة الذين سمعوا والذين لم يسمعوا | ٢ |
| علم العلل | أحد فنون علم الحديث، وهو علمٌ مستقل له مؤلفاته الخاصة وبحوثه الكثيرة، ومنه «علل الدارقطني» | ٢ |
| الجوامع | كتبٌ تجمع أبواب الدين، مثل الصحيحين | ٢ |
| السنن | كتبٌ تختصّ بالحلال والحرام وما يتبعهما، مثل السنن الأربعة | ٢ |
| المصنّفات | كتبٌ مرتّبة على الأبواب تشمل المرفوع والموقوف | ٢ |

## Candidate cross-lesson questions
(Built on lesson 1 headings as listed in OUTLINE.md, PDF 4-7; the assembler should check them against the finished lecture1.html.)

```html
  <div class="mcq">
    <p class="q">خبر عمر بن الخطاب مع أبي موسى الأشعري في الاستئذان: كيف جاء في قسمي المادة؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">شاهدًا على السماع المباشر من النبي ﷺ في القسمين.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">شاهدًا من تصرفات السلف على القواعد، ثم شاهدًا على التثبت بعد وفاة النبي ﷺ.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">مثالًا على الترتيب على الأبواب في كتب السنن.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">مثالًا على اختلاف المتقدمين والمتأخرين في التصحيح.</span></label>
    <p class="exp">ولذا قال الدرس الثاني عنه: «الذي مرّ معنا»، وموطن الشاهد فيه قول عمر: «ومن يعلم هذا؟».</p>
  </div>
  <div class="mcq">
    <p class="q">نقل القسم الأول قول أحمد: «لولا الشافعي ما عرفنا فقه الحديث». فإلى أيّ مدرسة يُحسب الشافعي وأحمد في القسم الثاني؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">مدرسة الفقهاء المتأخرين «الأصوليين».</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">مدرسة المتكلمين في نقد الحديث.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">مدرسةٍ مستقلة كمدرسة ابن حزم.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">مدرسة فقهاء المحدّثين «الأثر».</span></label>
    <p class="exp">ومعهما مالك؛ فالتعلّق بالأثر والاستدلال وكثرة الرواية عندهم واضحٌ جدًّا، وإن كان أحمد أوسعهم رواية.</p>
  </div>
  <div class="mcq">
    <p class="q">قرّر القسم الأول أن الاختلاف في صحة الحديث يُبنى عليه اختلاف الفروع. فبمَ مثّل القسم الثاني لذلك داخل المذهب الشافعي؟</p>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">بالشافعي الذي توقّف في أحاديث معلولة، والنووي الذي صحّح أحاديث ليست صحيحة عند أهل الحديث.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">بابن حجر والعيني في شرحيهما على صحيح البخاري.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">بابن خزيمة وابن حبان في اشتراط الشروط الثلاثة الأولى.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">بالبخاري ومسلم في ترتيب كتابي الحج والصيام.</span></label>
    <p class="exp">لأن النووي خالف في أصل منهج النظر، فتجد فرقًا شاسعًا بين فقهاء الشافعية المتقدمين والمتأخرين.</p>
  </div>
```
Note: gq3 correct option is the longest; the assembler may balance it against the other candidates.

## Source issues (lesson 2)
- PDF 8, heading «المرحلة الثالثة: النقل بعد وفاة النبي ﷺ»: its شواهد (عمر وهشام؛ أبو هريرة والنعلان) are about checking in the Prophet's lifetime, and PDF 9 then gives post-death شواهد. On the page: the heading and its definition kept as printed in the flow; the شواهد split under «في حياة النبي ﷺ» and «بعد وفاة النبي ﷺ» exactly as the text itself frames them («كان هذا نوعٌ من التثبت في حياة النبي ﷺ، ثم بدأ التمييز يقوى شأنه بعد وفاة النبي ﷺ»).
- PDF 8-9, hadith wordings (Hisham; the sandals; the grandmother; Rajab umrah) quoted only as the summary prints them, partly shortened with «…» or paraphrased outside the quotes; the summary gives no takhrij for any of them, so none is given. The sandals text in the summary differs in places from the known Sahih Muslim wording (e.g. «فضرب عمر بيده بين ثديي فخررت لاستي»; it ends at «نعم» without the rest of the hadith); not completed from memory.
- PDF 10: «ابن حجر في كتابيه (النكت، وشرح العلل)» — «شرح العلل» left out (شرح علل الترمذي is Ibn Rajab's, who is named next); the page says only «ابن حجر في «النكت»».
- PDF 10: Ibn Khuzayma «لم يذكر في صحيحه إلا الشروط الثلاثة الأول» and Ibn Hibban «أخذ منهجه من شيخه» — given on the page as «يرى الشيخ أن…».
- PDF 13: «شروح صحيح البخاري التي زادت على ثلاثمائة شرحًا» — given as «كما ذكر الشيخ» (the shaykh's figure); wording normalised to «ثلاثمائة شرح».
- PDF 15: «جزء في أحاديث ليلة النصف من شعبان للإمام مسلم» — no such juz by Imam Muslim is known; page gives «جزءٌ في أحاديث ليلة النصف من شعبان» with no author.
- PDF 15: «كتب الزهد والرقائق؛ لوكيع بن الجراح والإمام أحمد ولغيرهما» — kept as a category («كتب الزهد والرقائق»), not as a book title; the known title «الزهد والرقائق» is Ibn al-Mubarak's, Waki' and Ahmad each have «الزهد». Not in the `mufradat` grid.
- PDF 14 point 1: «دمج الإمام مسلم (كتاب التوحيد) في (كتاب الإيمان)» kept as printed (the shaykh's description).
- PDF 15: closing «تنبيه» (the shaykh says the course did not give the axes their due for lack of time), Telegram line and «تم تلخيص المحاضرة» — not content, left out.

## Quran quotations
None in lesson 2 (PDF 8 only names «سورة الفرقان» inside the Hisham hadith; no verse is quoted).
