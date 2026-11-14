# Review (step 4) — «بوصلة المصلح»

Reviewer: independent check of the built pages in `level2/stage1/bawsalat-almuslih/` against
`refs/بوصلة_المصلح_pdf.txt` (book pages by `=== PDF N ===`). Nothing in `src/` or the built pages was edited.
Findings are written lesson by lesson; the summary and counts are at the end.

Severity: **HIGH** = wrong fact / answer / verse · **MEDIUM** = misleading, unsupported, ambiguous quiz option,
missing attribution · **NOTE** = wording, typos.

---

## Lesson 1 — `lecture1.html` (book pp. 8–38)

### MEDIUM

- **L1-M1 · count the book does not state.** Section أولًا: «وهذه السنة ماضيةٌ في كل الأزمان، وذكر لها ثلاثة شواهد».
  Book p. 8–9 gives the Prophet ﷺ, Musa and Zakariya, then says «والمستندات الدالة على هذا المعنى كثيرة في كتاب الله»;
  it never says «ثلاثة». Fix: «وذكر من شواهدها:».
  RESOLVED: «وذكر لها ثلاثة شواهد» → «وذكر من شواهدها:» (book p. 9 «والمستندات … كثيرة»).
- **L1-M2 · «من أعظم» turned into a definition.** Summary: «واجب الوقت عند المؤلف: بناء المصلحين وصناعة الحمَلة».
  Book p. 8: «فإن من أعظم واجبات الوقت: بناء المصلحين». «واجب الوقت» is itself one of the book's question labels
  (circle 3, p. 18), so a student will memorise a wrong equation. Fix: «من أعظم واجبات الوقت عند المؤلف: بناء المصلحين…».
  RESOLVED: summary label now «من أعظم واجبات الوقت عند المؤلف:» (book p. 8).
- **L1-M3 · «من أسباب» turned into «سبب».** Summary: «مركزية الإصلاح في الشريعة: هو سبب نجاة المؤمنين من العذاب».
  Book p. 33: «من أسباب نجاة المؤمنين من العذاب». (The section body and the tree say «من أسباب» correctly.)
  Fix: «هو من أسباب نجاة المؤمنين من العذاب».
  RESOLVED: summary now «هو من أسباب نجاة المؤمنين من العذاب» (book p. 33).

### NOTE

- **L1-N1.** «وأهم أجزاء المشروع ثلاثة: «بوصلة المصلح»، و«خارطة الثغور»… و«مركزيات الإصلاح»». Book p. 11:
  «لتكون هذه الأجزاء الثلاثة … هي من أهم أجزاء مشروع المنهج الإصلاحي», and p. 12 names further parts
  (أنوار الأنبياء، شرح المنهاج، معالجة القرآن لنفوس المصلحين). Fix: «ومن أهم أجزاء المشروع ثلاثة: …».
  RESOLVED: «وأهم أجزاء المشروع ثلاثة» → «ومن أهم أجزاء المشروع ثلاثة» (book pp. 11–12).

### Checked and correct (lesson 1)
- Ibn Ashur (طه ٣٩), al-Sa'di (مريم ٥), Zaki al-Milad, al-Shatibi, Ibn al-Qayyim attributions; Shakib Arslan
  (Indonesia, al-Manar, 1930); five problems and their contents; three circles and every question placed in its circle;
  eleven landmarks and their references; the four aspects; all hadith wording and sources (البخاري ومسلم «يستريح منه…»؛
  الترمذي «حسن صحيح غريب»؛ أبو بكر عند أحمد وأبي داود والترمذي؛ النعمان في البخاري؛ حذيفة في البخاري؛ أبو ذر في مسلم؛
  أبو هريرة في مسلم؛ علي في البخاري ومسلم).
- Quran (8): الأنفال ٦٢، طه ٣٩، هود ٨٨، يوسف ١٠٨، الدخان ٢٩، فصلت ٣٣، لقمان ١٣، آل عمران ١١٠ — wording and tashkeel
  match the mushaf; references correct; no author words inside ﴿﴾.
- Quiz: 8/8 — one marked answer each, matches the book, distractors wrong by the book. The writers correctly left out
  the «هود ٢٨ على لسان نوح وصالح وشعيب» slip (p. 25) and the «تستغفر/يصلّون» mismatch (p. 31).

---

## Lesson 2 — `lecture2.html` (book pp. 39–76)

### NOTE

- **L2-N1 · shortened label changes the sense.** Levels table «اليأس من الإسلام مكوّنًا في الإصلاح» and mind-map leaf
  «اليأس من الإسلام مكوّنًا». Book p. 42: «اليأس من جدوى اعتبار الإسلام مكونا أساسيا في الإصلاح» — the despair is of the
  *usefulness* of Islam as a component, not of Islam (that is level 4). The card text and quiz say it correctly.
  Fix: «اليأس من جدوى الإسلام مكوّنًا في الإصلاح» (table) and «اليأس من جدوى الإسلام مكوّنًا» (mind map).
  RESOLVED: table cell and mind-map leaf now say «اليأس من جدوى الإسلام مكوّنًا…» (book p. 42); table cell font 12.5→12 to stay inside the 254 px box.

### Checked and correct (lesson 2)
- Four levels and their order, nine manifestations (book: «جمع لأهمها»), 7 internal + 4 external causes, five «goods»
  of the breakage (book: «منها»), Ibn Taymiyya (مجموع الفتاوى ٢٨/٤٢٠), nine keys (book: «التاسع والأخير»), three sunan
  and their evidence, al-Tabari on آل عمران ١٧٩, Waraqa / Heraclius, three examples of certainty, Ibn Kathir on الأحزاب ٢٢,
  the sariyya hadith (مسلم عن عبد الله بن عمرو), Thawban (مسلم), the three positions on the mubashshirat and their four
  harms, al-'Ujayri's book title, the three cited hadiths and sources, the three «considerations» of strength and their
  items (3 / 3 / 6 in the diagram, matching pp. 64–72), Farid al-Ansari, the four reasons for the spread of falsehood,
  Ibn Taymiyya «كذبهم في العلم», key 9, the coming stage, «والله أعلم» kept on the author's forecasts.
- The writers correctly left out the p. 71 firm forecast («بلا أدنى شك ولا ريب») and the p. 72 dated footnote.
- Quran (7): آل عمران ١٤٠، البقرة ٢٥١، الحج ٤٠، العنكبوت ٢، آل عمران ١٧٩، البقرة ٢٤٩، الأحزاب ٢٢ — all correct.
- Quiz: 8/8 correct, distractors clearly wrong.

---

## Lesson 3 — `lecture3.html` (book pp. 77–119)

### NOTE

- **L3-N1 · count presented as closed.** Mind map «ست درجات لمشاريع الحملة» and tree leaf «مجالات متعلقة بحملته: ست درجات».
  Book p. 111: «وهذا بيان شيء منها مرتبة من الدرجات الدنيا إلى العليا» — six are listed and the sixth is called
  «أعلى الدرجات», but the author presents them as «شيء منها». Acceptable as a description of the list; for strictness:
  «درجات مشاريع الحملة (ذكر منها ستًّا)».
  RESOLVED: mind map «درجات مشاريع الحملة (ذكر منها ستًّا)»; diagram leaf «مجالات متعلقة بحملته: درجات ذكر منها ستًّا» (book p. 111).

### Checked and correct (lesson 3)
- The question of direction (p. 79) and its three «spaces» of difference; the Muslim 770 du'a; the means of seeking
  guidance and «مفاتيح البصيرة عند النوازل والفتن»; the five landmarks (p. 81); the five *detailed* indicators of sound
  knowledge (pp. 83–89) — the writers rightly did not use the seven-item summary list of p. 82, which does not match the
  detailed part; the deviant trends and «أنتم أعلم بأمور دنياكم» (مسلم ٢٣٦٣); weight of issues / consistency; the four
  examples of combining texts and aims; al-Darimi; Farid al-Ansari (الفطرية); Ibn Taymiyya (مجموع الفتاوى ٢٠/٦٠ and
  اقتضاء الصراط); the fifth landmark with مسلم ٢٥٥٣, أحمد ١٧٧٤٢ («البر» — correctly fixed from the book's typo «الرب»),
  Ibn Mas'ud, Abu al-Darda', Ibn Rajab; the four methods of mapping the thughur and their examples; the three thughur
  levels (p. 97); the two principles and the three hadiths with numbers; the six faulty pictures of the fruit, the 7 bad
  outcomes and the arrow chain 2→3→4 (book: «ينتج عنه… قد ينتج عن هذا»); the rule «العمل شرط…»; مسلم ٢٩٦٢; six good
  outcomes; Zayd b. Thabit, Ali, Jarir hadiths with sources; the author's article quote; the seven fields of truth; the
  six degrees table; al-Tabari on آل عمران ٧٩; the two parts of the second circle, the two degrees, the five reasons for
  excluding comprehensive mitigation, the four conditions for partial mitigation, theoretical / practical projects.
- Quran (3): مريم ٤٣، الأعراف ١٢٩ (whole verse)، آل عمران ٧٩ (whole verse) — correct.
- Quiz: 8/8 correct, distractors clearly wrong.

---

## Lesson 4 — `lecture4.html` (book pp. 120–158)

### NOTE

- **L4-N1 · grid cell under the wrong header.** Seven-criteria table, column «مثاله», row «الانتشار عددًا ونوعًا»:
  the cell reads «قبل الضيقة، وقبل ما يمس الخاملين». That is the second half of the rule, not an example (book p. 123 gives
  no example for criterion 2). Fix: leave the «مثاله» cell as «—», and put the full rule in «الأولى بالعلاج»:
  «الواسعة التأثير قبل الضيقة، والمتصلة بالمؤثرين قبل ما يمس الخاملين».
  RESOLVED: «مثاله» cell now «—»; «الأولى بالعلاج» cell «الواسعة قبل الضيقة، والمتصلة بالمؤثرين» (book p. 123). The full suggested rule (~64 chars) does not fit the 294 px cell, so the «قبل الخاملة» half was dropped, as other rows also give only the preferred side.
- **L4-N2 · count closed where the book leaves it open.** Tree aria-label «ستة آثار سيئة للخلل فيها». Book p. 151 lists
  six and adds «وغير ذلك من الآثار السيئة والتي قد شرحتها في محاضرة «مركزة المركزيات»». Fix the label: «ومن آثار الخلل فيها
  ستة ذكرها المؤلف». (The six *good* effects, p. 146–148, are a closed list; fine.)
  RESOLVED: aria-label now «… ومن آثار الخلل فيها ستة ذكرها المؤلف» (book p. 151 «وغير ذلك من الآثار السيئة»).

### Checked and correct (lesson 4)
- الشعراء ٦٢ as «يستأنس به»; the rigid-matrix warning; two factors and «بمجموع هذه العوامل… بطريق اجتهادي مرن»;
  Mu'adh hadith (البخاري ١٤٥٨، مسلم ١٩); the eight priorities in the circle of truth (p. 122); the seven criteria and
  their examples (Muslim 35, feminism and its four circles, political authority, the modern state, humanism, Shi'ism in
  Yemen, missionary work in poor areas, media); the definition of subjective factors; the six subjective factors and the
  two-thughur flow (order as in p. 126); the «رأي ذوي الخبرة» caveat; «من بورك له في شيء فليلزمه»; البقرة ٢١٦ for the
  shar'i over the nafsi; the author's definition of صناعة المصلحين with all ten «متخذين» items (p. 130–131);
  «مقصودة لغيرها… أعظم واجبات الوقت الإصلاحية» (p. 131); 6 revelation + 7 reality witnesses; Musa's three aspects, Ibn
  Ashur, «المصلح يُبنى قبل أن يَبني»; Ibn Kathir on Zakariyya and on الصف ١٤; the tajdid hadith (أبو داود ٤٢٩١, صححه
  العراقي وابن حجر والسخاوي); Umar b. Abd al-Aziz / al-Shafi'i; absolute / relative; the two forms; the central sentence
  and its tree (p. 141–142); definition of مركزة المركزيات with Farid al-Ansari; Ubayy (مسلم ٨١٠ — the writers rightly
  avoided the book's wrong reference «آل عمران ٢»), Abu Sa'id b. al-Mu'alla (البخاري ٤٤٧٤), مسلم ٨١٢, مسلم ٣٥, البخاري ٦٥٠٢،
  ٦٢٧٣، مسلم ١٢، البخاري ٣٦١٠; two maqams; the four kinds of imbalance (p. 149 footnote); the eight issues needing revival
  (book: «لا على سبيل الحصر», page says so).
- Quran (5): الشعراء ٦٢، البقرة ٢١٦، الصف ١٤، الإخلاص ١، الذاريات ٥٦ — correct, full tashkeel.
- Quiz: 8/8 correct, distractors clearly wrong.

---

## Lesson 5 — `lecture5.html` (book pp. 159–198)

### NOTE

- **L5-N1 · waqf mark missing in a verse.** «﴿أُولَٰئِكَ الَّذِينَ هَدَى اللَّهُ فَبِهُدَاهُمُ اقْتَدِهْ﴾ [الأنعام: ٩٠]». The mushaf
  (Madinah print) has a waqf sign after «اللَّهُ»: «أُولَٰئِكَ الَّذِينَ هَدَى اللَّهُ ۖ فَبِهُدَاهُمُ اقْتَدِهْ». The other quotations
  keep their waqf signs, so add «ۖ» for consistency. Wording and tashkeel otherwise correct.
  RESOLVED: added «ۖ» after «اللَّهُ» in الأنعام ٩٠ (the book text renders the verse as glyphs, so this follows the mushaf, not the txt).

### Checked and correct (lesson 5)
- Opening (graduates and the crises, «تعترف صراحة أو ضمنا…»), the cause of weak output and the two concerns (p. 161–162);
  all seven landmarks in the book's order, with Ibn Mas'ud (البخاري ٣٤٧٧ ومسلم ١٧٩٢), «رحم الله موسى» (البخاري ٣١٥٠),
  the Dawud hadith (البخاري ومسلم), the author's quote on Qur'an circles, the two series; the definition of الثقافة
  المعيارية and the footnote definition; the 13 examples; the three facilitators (book lists exactly three); التدريب
  العطائي (about two years, after years of theory); landmarks 5 and 6 as two opposite errors and the middle way;
  the seven fields (book: «من أبرز»); the four sources and four places in Qur'an and Sunnah; «قرابة العشرين صفة… قابلة
  للزيادة… وللنقص»; the four aspects of each quality with the «تحديدًا لا في الامتداح العام» limit; qualities 1–7: every
  item of «ما يدخل فيها», every evidence with its reference, every importance and method bullet, the quotations of
  al-Tabari, Ibn Juzayy, Ibn Ashur (×2), Ibn Kathir (×2), Ibn Sa'di, al-Biqa'i, al-Tabari on الأنعام ٣٤ and on التوبة
  ١٢٢ (الحسن البصري), the hadiths (البخاري ٦٣٠٧، ٥٢، ١٣٤٤، ١٤٩٦/مسلم ١٠٥٣، مسلم ٧٤٦، أبو داود والترمذي «في إسناده لين»),
  the recommended books, and the link «العمل ↔ الحكمة ↔ الربانية» (p. 197: «ارتباط وثيق»).
- Writers rightly cited البقرة ٢٤٩ only for Talut (book's p. 181 «البقرة ٤٦» belongs to another verse).
- Quran (8): الأنعام ٩٠ (see N1)، مريم ١٢، التوبة ٤٠، السجدة ٢٤، الأحقاف ٣٥، البقرة ٢٤٧، يوسف ١٠٨، هود ٨٨ — correct.
- Quiz: 8/8 correct, distractors clearly wrong.

---

## Lesson 6 — `lecture6.html` (book pp. 199–232)

### MEDIUM

- **L6-M1 · label renames a book category.** Mind map «العدل مع الأقربين والمخالفين والكفار» and summary table row ١٥
  «مع الأقربين والمخالفين والكفار الصادّين». Book p. 221: the first field is «العدل مع كل من هم تحت مسؤولية المصلح المباشرة،
  من أهل وأبناء وطلاب وعاملين». «الأقربين» means relatives and drops students and workers; a student memorising the
  three fields will learn the wrong one. (The tree and the summary list say it correctly: «من هم تحت مسؤوليته».)
  Fix: «العدل مع من هم تحت مسؤوليته، والمخالفين، والكفار» (mind map) and «مع من تحت مسؤوليته والمخالفين والكفار الصادّين» (table).
  RESOLVED: mind map and table row ١٥ now use «من هم/من تحت مسؤوليته» as suggested (book p. 221); table text fits the 394 px cell.

### NOTE

- **L6-N1 · importance written as an aspect.** Summary: «من أهم وجوه الرحمة بالمؤمنين البعد عن التنازع». In the book
  (p. 220) avoiding تنازع is listed under «أهميتها» (why mercy matters), not under what mercy consists of (p. 219: التآلف،
  الحرص، الرفق، الإيثار، الصبر على أذى الإخوان، نصرة المظلوم). Fix: «ومن أهمية الرحمة بالمؤمنين: البعد عن التنازع، وهو سبب
  الفشل الذي ذكره الله في القرآن».
  RESOLVED: summary bullet now «ومن أهمية الرحمة بالمؤمنين: البعد عن التنازع…» (book p. 220 under «أهميتها»).
- **L6-N2 · reference range.** «بأنه الصادق في إيمانه [الحجرات: ١٤-١٥]» — the verse naming «الصادقون» is الحجرات ١٥; the
  book cites 14–15 (writers kept the book's range on purpose). Acceptable; «[الحجرات: ١٥]» would be more exact.
  NOT CHANGED: the book (p. 229) quotes and cites «الحجرات ١٤-١٥» for this point; the page follows the book's reference.

### Checked and correct (lesson 6)
- Qualities 8–17: every «ما يدخل فيها» item, every evidence and reference, every importance and method bullet;
  al-Nawawi, al-Sa'di (القصص ٢٦، يونس ٦٥ with «تضرك» correctly fixed from the book's typo «ترضك»، فاطر ١٠), Ibn Kathir
  (النساء ٦٢، النساء ١٣٩), al-Khattabi, al-Biqa'i and al-Tabari on wisdom, Farid al-Ansari's definition of الحكمة (p. 210
  footnote: الفطرية ١١٤), Mu'awiya «لا حكيم إلا ذو تجربة» (البخاري معلقًا بصيغة الجزم؛ المرفوع عند الترمذي وأحمد «إسناده لين»),
  Ibn Hajar on shepherding, al-Mawardi's three readings and two origins, al-Tabari's preference and «فوق الأحبار»,
  al-Zamakhshari, Siddiq Hasan Khan, al-Tabari and al-Razi on التوبة ١١٩, Ibn Taymiyya (مجموع الفتاوى ٧/٢٧١ — writers
  rightly dropped the book's wrong «النساء ١-٣»), Ibn al-Qayyim on الصديقية; hadiths (مسلم ٢٦٦٤، البخاري ٦١١٤/مسلم ٢٦٠٩،
  مسلم ٢٤٩٠، البخاري ٢٩٤٧، البخاري ٦١٣٣/مسلم ٢٩٩٨، البخاري ٣٢٠٧، البخاري ٢٢٦٢، البخاري ٨٩٣/مسلم ١٨٢٩، مسلم ٢٩٣٧،
  مسلم ٢٥٩٤، مسلم ١٨٢٧، البخاري ٦٦٠/مسلم ١٠٣١); «مسجد الضرار» named without the book's wrong verse numbers.
- Quran (8): القصص ٢٦، الأنفال ٦٠، النحل ١٢٥، البقرة ٢٦٩، فاطر ١٠، الحجرات ١٠، آل عمران ٧٩، التوبة ١١٩ — correct.
- Quiz: 8/8 correct, distractors clearly wrong.

---

## Lesson 7 — `lecture7.html` (book pp. 233–264)

### HIGH

- **L7-H1 · book's wrong cross-reference copied.** Callout «اليأس والإحباط»: «وقد سبق تفصيل مظاهره وأسبابه وكيفية التعامل معه
  في القسم الأول من الكتاب». Book p. 240 says «في القسم الأول من الكتاب», but despair (levels, manifestations, causes,
  keys) is the book's **القسم الثاني: جدوى الإصلاح** (pp. 39–76) — on this site lesson 2, whose own title is
  «القسم الثاني: جدوى الإصلاح». القسم الأول is فضل الإصلاح. A student will memorise a contradiction between two pages.
  Fix: «وقد سبق تفصيل مظاهره وأسبابه وكيفية التعامل معه في القسم الثاني من الكتاب «جدوى الإصلاح»». Record the book slip in
  NOTES.md «Source issues».
  RESOLVED: callout now «…في القسم الثاني من الكتاب «جدوى الإصلاح»» (book contents: despair is القسم الثاني pp. 39–76); p. 240 slip recorded in NOTES.md «Source issues».

### MEDIUM

- **L7-M1 · second cross-reference, half right.** Card «التساؤلات المنهجية»: «…وأسئلة الجدوى والثمرات؛ … وتناولها القسم الثاني
  من الكتاب». Book p. 258: «وقد تم تناول هذا النوع من التساؤلات في القسم الثاني من الكتاب، تحت عنوان «أسئلة الإصلاح»». There
  is no heading «أسئلة الإصلاح»; the جدوى questions are in القسم الثاني, but the questions on trends, direction and projects
  are in القسم الثالث «بوصلة الإصلاح» (lessons 3–4). Fix: «وتناول الكتابُ أسئلةَ الجدوى في قسم «جدوى الإصلاح»، وأسئلةَ الوجهة
  والمشاريع في قسم «بوصلة الإصلاح»», or drop the cross-reference; add the slip to NOTES.md.
  RESOLVED: card now ends «وتناول الكتابُ أسئلةَ الجدوى في قسم «جدوى الإصلاح»، وأسئلةَ الوجهة والمشاريع في قسم «بوصلة الإصلاح»» (book contents); p. 258 slip recorded in NOTES.md.

### Checked and correct (lesson 7)
- Early-warning section and Waraqa (البخاري ومسلم), the five Prophetic examples with sources (مسلم ٢٩٦٢، البخاري ٣١٥٨/مسلم
  ٢٩٦١، البخاري ٦٤٢٧/مسلم ١٠٥٢، البخاري ١١٥، أحمد for As'ad b. Zurara), Muslim 1844; the two kinds and four sub-kinds of
  challenges; «لا يعمل وحده العمل التام إلا بقابلية من الداخل»; the six internal challenges; definition of انحراف البوصلة,
  its 9 causes (أ–ط) and 7 guarantees (أ–ز) with RAND / al-Wuhaybi; tanazu' with الأنفال ٤٦، البخاري ٦٨٦٨، مسلم ٢٨١٢; the six
  causes and all their bullets; the criterion of criticism (العلم والعدل والرفق / العلم والصدق); Zayd and Usama (البخاري
  ومسلم), Hamza's daughter, the Ansar at Hunayn, «أثرة شديدة», «طوبى لعبد»; هجر and Ibn Taymiyya (مجموع الفتاوى ٢٨/٢٠٦-٢٠٧);
  the two wrong positions and the four rules of fiqh al-khilaf; Abu Umama (الترمذي وأحمد، «حسن صحيح»، أبو غالب); the four
  «قابلية» items; life difficulties (أبو داود «بإسناد قوي»، مسلم ٢٦٦٤، البخاري ٣٠٩١، البخاري ١٩٦٨), the family case, Ibn
  al-Mubarak / al-Tabari's father / zakat; desires with آل عمران ١٥٥ and التوبة ٤٦; the triad-of-knowledge table; the duas
  (مسلم ٢٦٥٤، ٢٧٢٥); doubts, the generations table (p. 259–260), the five means for the rising generation and «سوية المؤمن»
  titles; the conclusion «الإسلام قادم» and «سابغات». Writers rightly left out the p. 261 diagram additions.
- Quran (5): الأنفال ٤٦، الزخرف ٥٨، آل عمران ١٥٥، التوبة ٤٦، الشورى ١٣ — correct.
- Quiz: 8/8 correct, distractors clearly wrong.

---

## Course page — `index.html`

### MEDIUM

- **IDX-M1 · cross-lesson explanation names the wrong book part.** Q3 (سد الثغور / صناعة المصلحين), explanation: «في القسم الثالث
  قرر المؤلف مبدأ سد الثغور…، وفي القسم الرابع بيّن أن صناعة المصلحين مقصودة لغيرها». In the book both are in القسم الثالث
  «بوصلة الإصلاح» (المبحث الثاني p. 99 and المبحث السادس p. 131); the book's القسم الرابع is «حملة الإصلاح». The page mixes the
  site's lesson numbers (القسم ٣ / ٤) with the book's part names used in Q1 («القسم الثاني «جدوى الإصلاح»»). Fix: «في المبحث
  الثاني من «بوصلة الإصلاح» قرر المؤلف مبدأ سد الثغور…، وفي المبحث السادس منه بيّن أن صناعة المصلحين مقصودة لغيرها».
  RESOLVED: Q3 explanation now names «المبحث الثاني من «بوصلة الإصلاح»» and «المبحث السادس منه» (book contents pp. 95–99, 130–131).
- **IDX-M2 · an inference presented as the book's statement.** Q4 «أيّ درجات مشاريع حملة الحق توافق ما سمّاه المؤلف «واجب
  الوقت»؟» — answer «الدرجة السادسة». The book never links the sixth degree (p. 113) to «واجب الوقت» (p. 130); it says the
  sixth degree «هي التي أدعو في هذا الكتاب إلى العناية بتكوينها». The marked answer is defensible but the question asks for
  a link the book does not make. Fix: ask «أيّ درجات مشاريع حملة الحق هي التي يدعو الكتاب إلى العناية بتكوينها؟» and keep the
  options and the first sentence of the explanation.
  RESOLVED: Q4 stem reworded as suggested; options and answer position unchanged; explanation keeps its first clause and drops the واجب الوقت link, adding the book's «وهذه أعلى الدرجات» (p. 113).

### Checked and correct (index)
- About text, the five book parts, the seven lesson cards (titles and descriptions match the pages), book map labels,
  «٢٦٤ صفحة». Glossary: 24 rows, each definition matches its lesson page and the book (pp. 13, 14, 25, 30, 45, 52, 73,
  82, 99, 100, 114, 125, 139, 143, 164, 166, 180, 210, 225, 228, 240, 253) and the lesson number is right.
- Cross-lesson quiz: 8 questions; one marked answer each; Q1, Q2, Q5, Q6, Q7, Q8 correct with clearly wrong distractors;
  Q3 and Q4 have the right answer but see IDX-M1/M2.

---

## Summary

| Severity | Count | IDs |
|---|---|---|
| HIGH | 1 | L7-H1 |
| MEDIUM | 7 | L1-M1, L1-M2, L1-M3, L6-M1, L7-M1, IDX-M1, IDX-M2 |
| NOTE | 8 | L1-N1, L2-N1, L3-N1, L4-N1, L4-N2, L5-N1, L6-N1, L6-N2 |

**Verified as correct**
- Quiz questions checked: 64 (7 lessons × 8 + 8 on the course page). All 64 have exactly one marked answer, and the
  marked answer matches the book; no distractor is also true by the book. Two course-page explanations/stems need
  rewording (IDX-M1, IDX-M2).
- Quran quotations checked against the mushaf: 44 distinct (L1 8, L2 7, L3 3, L4 5, L5 8, L6 8, L7 5). All wording and
  tashkeel correct, all references match, no author words inside ﴿﴾; one missing waqf sign (L5-N1).
- Hadith checked: all hadith quotations in the seven pages carry the book's wording and the source the book's footnote
  gives (including grading remarks: الترمذي «حسن صحيح غريب»، أبو داود «بإسناد قوي»، «في إسناده لين»).
- Glossary rows checked: 24, all correct.
- Writers' «Source issues» in NOTES-part1/2/3 verified: every book error they listed was indeed left out or corrected in
  the pages. Two further book slips (p. 240 and p. 258 cross-references) were copied into lesson 7 (L7-H1, L7-M1).
