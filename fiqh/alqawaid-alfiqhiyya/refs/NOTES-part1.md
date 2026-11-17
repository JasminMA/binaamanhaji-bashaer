# NOTES — part 1 (lesson 1, PDF pages 2-10)

## Lesson 1
- Title: مدخل إلى القواعد الفقهية، وقاعدة «الأمور بمقاصدها»
- description: تعريف القواعد الفقهية وعلاقتها بالقواعد الأصولية، ومصدراها وأنواعها الثلاثة وفوائد دراستها، ثم القاعدة الأولى «الأمور بمقاصدها»: معناها ودليلها ومسائل النية والقواعد الأربع المندرجة تحتها.
- tag: المدخل والنية

Diagrams: mind map + 5 drawn (masadir, anwa, maqasid, hukm, mundarija) + CSS blocks (rows, ben detail, cmp, cmp three, eras, callouts). Quiz: 8 questions, correct positions 2,4,1,3,3,1,4,2; correct option longest in 1 of 8.

## Glossary (term · definition · lesson)
| المصطلح | التعريف كما في المحاضرة | القسم |
|---|---|---|
| القاعدة | لغةً: أساس الشيء؛ واصطلاحًا: القضية الكلية | ١ |
| الفقه | معرفة الأحكام الشرعية العملية من أدلتها التفصيلية | ١ |
| القواعد الفقهية (لقبًا) | قضايا كلية تندرج تحتها جزئيات كثيرة | ١ |
| القاعدة الكلية الكبرى | القاعدة التي تدخل في جميع أبواب الفقه، وهي خمس عند فقهاء الشافعية | ١ |
| الضابط | القاعدة التي تختص ببابٍ واحد من أبواب الفقه | ١ |
| النية | لغةً: القصد؛ واصطلاحًا: قصد الشيء مقترنًا بفعله | ١ |
| العزم | قصد الشيء مع تأخّر الفعل عنه | ١ |
| السَّلَم | عقدٌ على موصوفٍ في الذمة | ١ |

## Candidate cross-lesson questions

```html
  <div class="mcq">
    <p class="q">كم عدد القواعد الكلية الكبرى كما ذكرها فقهاء الشافعية؟</p>
    <label class="opt"><input type="radio" name="gq1"><span class="t">أربع قواعد.</span></label>
    <label class="opt ok"><input type="radio" name="gq1"><span class="t">خمس قواعد.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">سبع قواعد.</span></label>
    <label class="opt"><input type="radio" name="gq1"><span class="t">عشر قواعد.</span></label>
    <p class="exp">وهي: الأمور بمقاصدها، واليقين لا يزول بالشك، والمشقة تجلب التيسير، والضرر يُزال أو لا ضرر ولا ضرار، والعادة محكّمة؛ وكلها تدخل في جميع أبواب الفقه.</p>
  </div>
  <div class="mcq">
    <p class="q">أيّ القواعد الكبرى مثّلت بها المحاضرة الأولى لمصدر «استقراء الفروع»؟</p>
    <label class="opt"><input type="radio" name="gq2"><span class="t">لا ضرر ولا ضرار.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">الأمور بمقاصدها.</span></label>
    <label class="opt ok"><input type="radio" name="gq2"><span class="t">المشقة تجلب التيسير.</span></label>
    <label class="opt"><input type="radio" name="gq2"><span class="t">الخراج بالضمان.</span></label>
    <p class="exp">التخفيفات على المسافر والمريض والمكره جاءت عند وجود المشقة، فاستُنبطت منها القاعدة؛ أما «لا ضرر ولا ضرار» فهي نص حديث.</p>
  </div>
  <div class="mcq">
    <p class="q">ما دليل القاعدة الكبرى الأولى «الأمور بمقاصدها»؟</p>
    <label class="opt"><input type="radio" name="gq3"><span class="t">استقراء الفروع في أبواب العبادات.</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">قوله ﷺ: «لا صيام لمن لم يبيت النية من الليل».</span></label>
    <label class="opt"><input type="radio" name="gq3"><span class="t">إجماع الفقهاء المتقدمين على لفظها.</span></label>
    <label class="opt ok"><input type="radio" name="gq3"><span class="t">قوله ﷺ: «إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى».</span></label>
    <p class="exp">والقاعدة قريبةٌ من لفظ هذا الحديث، فهي مثالٌ لمصدر «الأدلة الشرعية»؛ ومعناها أن أحكام الأقوال والأفعال مبنيةٌ على النيات.</p>
  </div>
```
(gq3: correct option is the longest; swap order or trim if the course quiz already has too many longest-correct items.)

## Source issues (left out of the page)
- PDF 8 (printed 7), القاعدة الأولى المندرجة، المثال ١: «وهبتك هذا الثوب بكذا وكذا» with the ruling «المعتمد عندنا أننا نعطيه أحكام الهبة اعتبارًا باللفظ». In the madhhab a هبة بثواب معلوم is normally treated as بيع; the ruling looks reversed (OUTLINE «Looks wrong»). The whole example is left out; only the general statement (المغلَّب عند الشافعية جانب اللفظ، وفي مسائل قليلة العبرة بالمعاني) and example ٢ (السلم بلفظ البيع → بيع على المعتمد) are kept.
- PDF 6 (printed 5), ما لا تشترط له النية ٢: «ووضوء الميت مستحبٌّ لكنّ نيته واجبة، وهذا من الألغاز الفقهية» left out (flagged as doubtful). Kept only: نية غسل الميت مستحبة لا واجبة، وغسله فرض كفاية.
- PDF 6, ما لا تشترط له النية ٤: the list of صرائح الطلاق prints «الطلاق، السراح، الفراق، الخلع، المفاداة إن قُرن بالمال». Page gives «ومنها: الطلاق، والسراح، والفراق» only (flagged); الخلع والمفاداة left out.
- PDF 6, item ٣ «التمتع لوجوب الدم في النسك» has no explanation in the lecture; kept as a bare list item.
- PDF 5: the lecture says النية «يتعلق بها سبعة أحكام» and quotes the nazm of seven, but then treats eight headings (adds مفسدات النية). Page states the seven as printed and notes that مفسدات is added.
- Hadiths on PDF 3, 5, 6, 7, 10 have no footnote source in the file; quoted with «قول النبي ﷺ» / «حديث قدسي» only.

## Quran quotations written (lesson 1)
- [البقرة: ١٢٧] ﴿وَإِذْ يَرْفَعُ إِبْرَاهِيمُ الْقَوَاعِدَ مِنَ الْبَيْتِ وَإِسْمَاعِيلُ﴾ (the source cites it without reference; part of the verse).
- [الزمر: ٣] ﴿أَلَا لِلَّهِ الدِّينُ الْخَالِصُ﴾ (the source cites it without reference; part of the verse).
