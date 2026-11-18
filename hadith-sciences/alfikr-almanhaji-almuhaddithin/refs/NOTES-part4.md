# NOTES — part 4 (lesson 7, PDF 64 from «الإمام أبو داود ومنهجه» to 76)

## Lesson 7
- title: السنن الأربعة: أبو داود والنسائي والترمذي وابن ماجه
- description: التعريف بأصحاب السنن الأربعة ومناهجهم: أبو داود وكتاب أصول المسائل الفقهية، والنسائي ومنهجه المعلَّل، والترمذي واصطلاح الحسن في جامعه، وابن ماجه ومكانة سننه بين الكتب الستة.
- tag: مناهج أصحاب السنن

Diagrams: mind map + 5 drawn (`abudawud` tree, `tabaqat` grid, `hasan` tree, `editions` grid, `imams` grid) + CSS blocks (rows, cmp ×7, cmp three, ben ×3, eras ×2, flow, note/warn/ask/sum callouts). Quiz: 8 mcq (`b7q1`..`b7q8`), correct positions 2,4,1,3,3,1,4,2.

## Glossary (term · definition from the book · lesson)
| المصطلح | التعريف | القسم |
|---|---|---|
| الصالح عند أبي داود | ما لم يذكر فيه أبو داود شيئًا، وبعضه أصح من بعض؛ وهو في دائرة الاحتجاج، يقابل الحسن عند الترمذي | ٧ |
| الحديث الحسن عند الترمذي | كل حديث لا يكون في إسناده من يُتهم بالكذب، ولا يكون شاذًّا، ويُروى من غير وجهٍ نحو ذلك | ٧ |
| حسن صحيح | الحسن في أعلى درجات الاحتجاج عند الترمذي | ٧ |
| المنهج المعلَّل | منهج يذكر ما بين الروايات من اختلاف، ويوازن ويقارن، ويذكر العلل والصحيح والأصح والضعيف والأضعف | ٧ |
| المجتبى | كتاب النسائي المعروف بسنن النسائي، اجتُبي من السنن الكبرى، وهو متخصص في أحاديث الأحكام | ٧ |
| منهج الباب | النظر إلى الحديث من خلال الباب كله: أحاديثه المتصلة والمنقطعة وأقوال الصحابة والتابعين ومذاهب الأئمة، لا من خلال رواية واحدة | ٧ |
| الزيادات اللفظية | وقوف أبي داود على الزيادات في الروايات وكشف الفروق بينها حيث اتفقت وحيث افترقت | ٧ |
| الكتب الستة | الكتب الخمسة مع سنن ابن ماجه الذي أُلحق بها على يد ابن طاهر المقدسي | ٧ |

## Candidate cross-lesson questions

```html
  <div class="mcq">
    <p class="q">ما الفرق بين نظر الترمذي إلى الحديث ونظر البخاري ومسلم إليه كما وصفه المؤلف؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">نظر الترمذي من الأعلى إلى الأدنى، ونظر الشيخان من الأدنى إلى الأعلى.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">نظر الترمذي من الأدنى إلى الأعلى، ونظر الشيخان من الأعلى إلى الأدنى.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">اقتصر الترمذي على الصحيح، وتوسّع الشيخان في الحسن.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">لم يفرّق المؤلف بينهم، فمنهجهم في النظر واحد.</span></label>
    <p class="exp">اعتمد البخاري على الفئة العليا من الرواة وتبعه مسلم، وتوجه الترمذي إلى الطبقة الوسطى فظهر عنده اصطلاح «الحسن»؛ وهذا من مميزات عصرٍ كان الاجتهاد أبرز سماته.</p>
  </div>
  <div class="mcq">
    <p class="q">أيّ مما يأتي يجمع بين منهج النسائي والترمذي ويميزهما عن عرض الصحيحين؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">الاقتصار على رجال الطبقة الأولى من الرواة.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">عرض الحصيلة الصحيحة دون حوار حول التصحيح.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">أن منهج كلٍّ منهما منهجٌ معلَّل يذكر الاختلاف والعلل.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">ترك التبويب والاكتفاء بسرد الأحاديث.</span></label>
    <p class="exp">النسائي يوازن ويقارن ويذكر العلل، ويتلخص منهج الترمذي بأنه معلَّل؛ أما البخاري ومسلم فيعرضان الحديث في صورته النهائية.</p>
  </div>
  <div class="mcq">
    <p class="q">كيف عبّر أبو داود والترمذي عن الحديث الذي في دائرة الاحتجاج دون الصحيح؟</p>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">عبّر أبو داود بـ«صالح»، والترمذي بـ«حسن».</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">عبّر أبو داود بـ«حسن»، والترمذي بـ«صالح».</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">عبّر كلاهما بـ«ثابت».</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">لم يُفردا له اسمًا، فالحديث عندهما صحيح أو ضعيف.</span></label>
    <p class="exp">كان التقسيم قبلهما إلى صحيح وضعيف، ثم صار عندهما صحيحًا وحسنًا وضعيفًا، وتوسّع الترمذي في هذا المنهج وحدّد مصطلحاته.</p>
  </div>
```

## Source issues (left out or worded carefully)
- PDF 75: «ففي السند الأول: انقطاعٌ بين منصور وسالم بن أبي الجعد». The known break in this chain is between سالم بن أبي الجعد and ثوبان (per OUTLINE). On the page I wrote only «ففي السند الأول انقطاع» without placing it.
- PDF 67: «وقد تضمن كتابه (المجتبى) واحدًا وخمسين بابًا». These are kutub, not abwab (per OUTLINE); count left out of the page.
- PDF 64: the top lines (الطبقتان الرابعة والخامسة لتلاميذ الزهري، ومسلم والبخاري والطبقات) belong to lesson 6 and were not used.
- PDF 64 vs 66: PDF 64 says al-Bukhari relies on the first tabaqa «وقد يخرج عن أعيان الطبقة الثانية», PDF 66 says he narrates from the first and second. I used PDF 66's wording for the `tabaqat` grid (it is the section on Abu Dawud's circle of narrators); no contradiction stated on the page.
- PDF 72: Ibn al-'Arabi says «وفيه أربعة عشر علمًا» but the items listed do not obviously total 14; the quotation is copied as printed and no count of the items is stated.
- PDF 75: the editions table: the book gives 1515 abwab only for Abd al-Baqi's edition; the al-A'zami cell reads «غير مذكور». PDF 74 gives «ألفًا وخمسمائة باب» on Ibn al-Qattan's authority; both kept, each with its source.
- PDF 76: the Telegram line and «تم تلخيص الكتاب بفضل الله» are not content (excluded).

## Quran quotations
- None in lesson 7.
