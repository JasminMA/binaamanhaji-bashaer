# NOTES — part 3 (lesson 3, PDF pages 20-26)

## Lesson 3
- Title: قاعدتا «لا ضرر ولا ضرار» و«العادة محكّمة»
- description: القاعدة الرابعة «لا ضرر ولا ضرار»: معناها ودليلها والقواعد الست المندرجة تحتها، ثم القاعدة الخامسة «العادة محكّمة»: معناها ودليلها، ومسائل العرف (علاقته بالعادة، تقسيماته، شروطه، محل اعتباره)، والقواعد الخمس المندرجة تحتها.
- tag: الضرر والعرف
- File: `src/fiqh/alqawaid-alfiqhiyya/lecture3.html` — 5 drawn diagrams (markers: darmeaning, dargrid, urfdiv, urfcurrency, adahsub) + mind map + CSS blocks (flow, cmp, cmp three, rows, ben detail, sum/note/warn); 12 summary items; 8 questions (b3q1..b3q8; correct positions 2,4,1,3,3,1,4,2; correct is the longest in q1, q4, q7).

## Glossary rows (term · definition · lesson)
| المصطلح | التعريف (من الكتاب) | القسم |
|---|---|---|
| الضرر | إلحاق مفسدةٍ بالغير، كأن تُتلف مال غيرك. | ٣ |
| الضرار | مقابلة المفسدة بمفسدةٍ أخرى. | ٣ |
| الحجر | المنع من التصرفات المالية. | ٣ |
| المفلس | من زادت ديونه الحالّة التي للآدميين على أمواله. | ٣ |
| العادة محكّمة | اعتبار العادة حَكَمًا لإثبات حكمٍ شرعي في المسائل الاجتهادية المرتبطة بالعرف. | ٣ |
| العرف الصحيح المعتبر | العرف الذي لم يخالف الشرع (ويقابله الفاسد: الذي خالف الشرع). | ٣ |
| القبض الحكمي | الإيداع في حساب الشخص المطلوب أن يُنقل المال إلى حسابه. | ٣ |
| بيع المعاطاة | البيع بلا صيغةٍ معتبرة؛ ولا يصح عند الشافعية ولو تعارف الناس عليه. | ٣ |

## Candidate cross-lesson questions
```html
  <div class="mcq">
    <p class="q">أيّ القواعد الخمس الكبرى نصّ الدرسُ على أن لفظها نصُّ حديثٍ عن النبي ﷺ؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">العادة محكّمة.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">المشقة تجلب التيسير.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">لا ضرر ولا ضرار.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">اليقين لا يزول بالشك.</span></label>
    <p class="exp">قال في أولها: «هذه القاعدة نصّ حديثٍ عن النبي ﷺ»، وقد رواه ابن ماجه في السنن؛ ولذا كان التعبير بلفظ الحديث أولى من «الضرر يزال».</p>
  </div>
  <div class="mcq">
    <p class="q">بمَ علّل الدرس كون «لا ضرر ولا ضرار» من القواعد الكبرى؟</p>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">بأنه يندرج تحتها كثيرٌ من الفروع الفقهية.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">بأنها لا يندرج تحتها شيءٌ من القواعد.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">بأنها خاصةٌ بباب المعاملات المالية.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">بأن الشافعية يذكرونها بصيغة الاستفهام.</span></label>
    <p class="exp">ويندرج تحتها في الدرس ست قواعد، منها: الضرر يزال، والضرر يدفع بقدر الإمكان، والضرر لا يزال بمثله.</p>
  </div>
  <div class="mcq">
    <p class="q">ما ترتيب قاعدة «العادة محكّمة» بين القواعد الخمس الكبرى في هذه السلسلة؟</p>
    <label class="opt"><input type="radio" name="gq3"><span class="t">الأولى، وتليها «الأمور بمقاصدها».</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">الثالثة، بعد «اليقين لا يزول بالشك».</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">الرابعة، قبل «لا ضرر ولا ضرار».</span></label>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">الخامسة، بعد «لا ضرر ولا ضرار».</span></label>
    <p class="exp">عنوان المحاضرة السادسة: «القاعدة الخامسة من القواعد الخمس الكبرى: قاعدة العادة محكّمة»، وعنوان الخامسة: «القاعدة الرابعة: لا ضرر ولا ضرار».</p>
  </div>
```
(gq1: please check that lessons 1-2 do not also call «الأمور بمقاصدها» or another rule "نص حديث"; gq3: the option «الثالثة، بعد اليقين» relies on lesson 2's headings: المشقة is the third.)

## Source issues (PDF pages)
- Nothing in PDF 20-26 looked wrong. Points handled with care:
  - PDF 23: the hadiths «لا تقدموا رمضان…» and Hind's hadith, PDF 21 the hadiths of the مصلي and «من أدرك ماله بعينه…», PDF 22 «لا تزرموه، دعوه»: no source given in the book, so none given on the page. Only «لا ضرر ولا ضرار» has a source (ابن ماجه في السنن).
  - PDF 23: عرف قولي / عرف فعلي are named without definitions; the page gives no definition.
  - PDF 23-24: the divisions and conditions of العرف are introduced with «منها»; the page keeps «منها» (no closed count stated), though the book lists four conditions and four divisions.
  - PDF 26: both nazms are attributed only to «الناظم» (unnamed); kept so. Read at 220 dpi.
  - PDF 22: sub-rule 6 is printed as «درء المفاسد مقدّم وأولى بالمراعاة من جلب المصالح» (longer than the OUTLINE heading); the page uses the printed wording.
- Non-content left out: the «تذكير» box (PDF 21), Telegram link and «تم تلخيص السلسلة» (PDF 26), page numbers.

## Quran quotations (lesson 3)
- الأعراف: ١٩٩ — ﴿خُذِ الْعَفْوَ وَأْمُرْ بِالْعُرْفِ وَأَعْرِضْ عَنِ الْجَاهِلِينَ﴾ (section ثالثًا, dalil of «العادة محكّمة»)
- النساء: ١٩ (part of the verse, as the book quotes it) — ﴿وَعَاشِرُوهُنَّ بِالْمَعْرُوفِ﴾ (same place)
