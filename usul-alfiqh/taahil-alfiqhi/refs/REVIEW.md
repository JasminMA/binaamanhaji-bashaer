# REVIEW (step 4): «التأهيل الفقهي» (usul-alfiqh/taahil-alfiqhi)

Reviewer: independent check of the built pages `index.html` and `lecture1..6.html` against `refs/shamil-taahil.pdf`.
All 69 PDF pages were read as 110 dpi images. Poem lines and doubtful wordings were zoomed at 180-220 dpi (PDF 10, 39, 50, 60).
"PDF n" is the PDF page; the printed page is PDF n - 1.

## Overall

The pages follow the source closely. Every definition, count, list, view and holder (Shafi'i vs other schools vs named scholars) was checked
against the page images, and they match. The table cells, tree labels, glossary rows and summary/flashcard items also match.
Every quoted line of the poems (العمريطي, السيوطي, الأشخر, نظم المبادئ, نظم سنن الكفاية) matches the print, with its tashkeel.
All Quran quotations listed in NOTES-part1..3 were checked against the mushaf wording and reference. All are correct, including the misprint fixes:
- «فَلَا تَقُل» (PDF 29), «يُعْطُوا» (PDF 47), «قُمِ اللَّيْلَ» (PDF 36).
- The wasiyya verse without the wrong «يا أيها الذين آمنوا» prefix: البقرة ١٨٠ (PDF 19).
- النحل ١٨ for «نِعْمَةَ», الحجر ٣٠, البقرة ٢٨٢, الحشر ١, التوبة ٢٩.

Hadith wordings match the print, with no sources added. These items are absent:
- the Telegram link (PDF 69)
- the «تذكير» box
- the «تنبيه: انتهى/يبدأ/ينتقل الدكتور» notes. They were reworded as neutral bridge sentences in L3 and L5, and as the closing note in L6.
- highlights and pen strokes

The doubtful points are handled safely:
- **PDF 49-50, الحال الرابعة:** L5 gives the case and its example with no ruling. The table has no ruling column, and the summary and quiz cover only cases 1-3.
- **PDF 7, المانع:** quoted exactly as printed, in «».
- **قضاء/اقتضاء:** the page uses «الاقتضاء», as in the PDF 30 heading.
- **The ظاهر lines of العمريطي (PDF 27):** not quoted. Only the النص and المجمل lines are quoted.
- **Mixed numbering of القياس بالجامع:** presented as its four أقسام, as PDF 51 states.
- **Wasiyya prefix:** fixed.

Quizzes: every one of the 56 questions (6 x 8 lesson questions + 8 in index) has exactly one `opt ok`. The marked answer is confirmed by the lecture, every wrong option is wrong by the lecture, and the explanations are accurate except for one item (M3).

## HIGH

**H1. L1 (`lecture1.html`), «سادسًا: تقسيمات الواجب», card «مخيَّر» (PDF 10).**
Page text: «مثل كفارة اليمين: إطعام عشرة مساكين أو كسوتهم أو عتق رقبة أو صيام ثلاثة أيام. ولو فعل المكلف هذه الثلاثة أثيب عليها، لكن الواجب عليه واحد يختاره منها».
- The page lists four items joined by «أو» and then says «هذه الثلاثة», so the text contradicts itself.
- It also presents صيام ثلاثة أيام as one of the options of the choice. That is a wrong ruling: the choice in كفارة اليمين is among three things, and fasting is only for one who cannot do any of them.
- The source's own sentence has the same slip: «فالواجب عليه واحد من أمور ثلاثة: إطعام… أو كسوتهم أو عتق رقبة أو صيام ثلاثة أيام». The page dropped «من أمور ثلاثة», which makes it worse.

Fix: «مثل كفارة اليمين: فالواجب على من حنث واحد من أمور ثلاثة: إطعام عشرة مساكين أو كسوتهم أو عتق رقبة؛ ولو فعل المكلف هذه الثلاثة أثيب عليها، لكن الواجب عليه واحد يختاره منها». This drops «أو صيام ثلاثة أيام», which is not part of the choice. The tree label «مخيَّر: ككفارة اليمين» can stay.

## MEDIUM

**M1. L3 (`lecture3.html`), end of «ثالثًا», card «القسم الثاني: دلالة المفهوم».**
Page text: «وتنقسم دلالة المفهوم إلى نوعين: مفهوم الموافقة، ومفهوم المخالفة، وتفصيلهما في القسم الخامس.»
On this site «القسم الخامس» means lesson 5 (المطلق والمقيد والقياس), but the details are in section «خامسًا» of this same page. The cross-reference sends the reader to the wrong page.
Fix: «…وتفصيلهما في «خامسًا» أدناه.»

**M2. «على ترتيب الورقات» is unsupported and inaccurate.**
Where it appears:
- `index.html` «عن الكتاب»: «تمضي على ترتيب «الورقات» مع أبيات «نظم الورقات» للعمريطي».
- `usul-alfiqh/index.html`, the tile of this course: «ملخص السلسلة في ستة أقسام على ترتيب الورقات».

Why it is wrong:
- The lectures never say they follow the order of the Waraqat. They only quote al-'Imriti's nazm of it.
- The actual order is not the Waraqat order. The lectures run: مبادئ، الحكم، القرآن، السنة والأخبار والنسخ، الإجماع، الدلالات، الأمر والنهي، العام، المطلق، القياس، المختلف فيه، الاجتهاد، التعارض. The Waraqat puts الأمر والنهي first, and التعارض before الإجماع والأخبار.

Fixes:
- `index.html`: «…وهي، على اسمها، في أصول الفقه، وتستشهد كثيرًا بأبيات «نظم الورقات» للعمريطي: فتبدأ…».
- Tile: «…ملخص السلسلة في ستة أقسام، من المبادئ والأدلة إلى القياس والاجتهاد والتعارض والترجيح.»

**M3. L6 (`lecture6.html`), quiz q8 (b6q8), `p.exp` (PDF 66).**
Page text: «…ومثاله نسخ الفطر بالحجامة بحديث احتجامه ﷺ وهو صائم.»
The lecture does not name the abrogating text. It says that the last of the two matters is that cupping does not break the fast, and that this comes «من حديث أنس رضي الله عنه في سنن الدارقطني».
Fix: «…ومثاله الفطر بالحجامة: آخر الأمرين أن الحجامة لا تفطّر الصائم، كما في حديث أنس رضي الله عنه في سنن الدارقطني.»

## NOTE

**N1. L2 (`lecture2.html`), «قيود التعريف» of النسخ (PDF 18).**
Page text: «ولا بد أن يكون الرافع (الناسخ) أيضًا حكمًا شرعيًّا».
This is the book's wording, but it clashes with the definition just above it («بدليل شرعي»): the remover is a shar'i proof (خطاب). Suggest «دليلًا شرعيًّا (كما في التعريف)», or put the book's sentence in «».

**N2. L1, المانع (PDF 7).**
Quoted exactly as printed, without «لذاته». This is safe. It could carry a short note that the شرط definition has «لذاته» and the مانع definition here does not, but nothing has to change.

**N3. L1, «أنواع القراءات».**
The seven cards «من القراء السبعة» come right after the «قراءات الآحاد» card, so visually they look like readers of the شاذة.
Fix: move them directly under «القراءات المتواترة», or add a small heading «القراء السبعة».

**N4. L3, closing box «ما بعد هذا القسم».**
Page text: «…ويأتي في القسم التالي تفصيل الشرح في أنواع الدلالات باعتبار قوة الدلالة، وأولها أنواع الظاهر».
PDF 35 says the next part covers the kinds of دلالة by strength (النص، الظاهر، المؤول، المجمل). Their first kind is النص, not الظاهر.
Fix: «…ويأتي في القسم التالي تفصيل أنواع الظاهر: الأمر والنهي والعام والخاص.»

**N5. L5, «النوع الثاني: القياس عن طريق الجامع».**
The two cards «جمهور الفقهاء في العبد» and «أبو حنيفة في العبد» belong to قياس الشبه, but they come after the قياس العكس card.
Fix: move them right after the «قياس الشبه» card.

**N6. L6, table of أنواع المجتهدين.**
The «مثاله» cell of «مجتهد المذهب» is empty. That is correct, because the book gives no example, but it looks like a rendering gap.
Fix: put «—» in it.

**N7. L6, the first line of al-'Imriti on قول الصحابي (PDF 60).**
The page has «قَوْلُه», but the print has «قَوْلُهُ» with a damma.

**N8. L5 and L6, hero line.**
L1-L4 name their lectures in the hero line (e.g. «للمحاضرة الثالثة وأول الرابعة»), but L5 and L6 say only «ملخص مذاكرة:».
Suggest «للمحاضرة السادسة وأول السابعة» (L5) and «لبقية المحاضرة السابعة والمحاضرة الثامنة» (L6).

**N9. `index.html` «عن الكتاب».**
It says «وما بدا خطأً… تُرك أو نُقل على الصواب مع التنبيه», but no page carries such a note: the corrected verses are silent.
Fix: drop «مع التنبيه» (the closing «ملاحظة على النصوص» is accurate as it stands).

**N10. `index.html` cross-course quiz.**
gq1 (what المدلول is) and gq3 (the four axes) test the same list from lesson 1. Consider replacing one with a question that links other lessons, for example the الإجماع across L3 and L6, or النسخ across L2 and L6.

**N11. L3 quiz.**
The answer positions run 1,2,3,4,1,2,3,4, so the balance is formally fine but predictable. Shuffle the order, keeping two of each position.

**N12. `usul-alfiqh/index.html` hero subtitle.**
It still reads «المدخل إلى أصول الفقه، ومتن الورقات، ومنظومة أصول الفقه وقواعده.» and does not mention the new course.
Suggest adding «، والتأهيل الفقهي على مذهب الشافعي».

## Quiz statistics

| page | correct positions (1-4) | each position twice | correct option is the longest |
|---|---|---|---|
| index (gq1-8) | 3,4,2,3,1,2,4,1 | yes | 2 of 8 |
| lecture1 | 2,4,1,3,3,1,4,2 | yes | 2 of 8 |
| lecture2 | 3,1,4,2,2,4,1,3 | yes | 0 of 8 |
| lecture3 | 1,2,3,4,1,2,3,4 | yes (pattern, N11) | 0 of 8 |
| lecture4 | 2,4,1,3,2,4,1,3 | yes | 2 of 8 |
| lecture5 | 2,4,1,3,2,1,4,3 | yes | 0 of 8 |
| lecture6 | 3,1,4,2,3,2,1,4 | yes | 1 of 8 |

Hero chips and counts:
- `index.html`: «على المذهب الشافعي» and «٦ أقسام» are correct.
- Specialty tile: «٦ أقسام» is correct.
- Glossary: all 24 rows match the book's definitions and lesson numbers.

## Counts

HIGH 1 · MEDIUM 3 · NOTE 12

## Fix step (step 5) — status

Each point was rechecked on the rendered PDF page (110 dpi; PDF 60 poem line at 250 dpi) before editing. Edits are in `src/usul-alfiqh/taahil-alfiqhi/lectureN.html`, `usul-alfiqh/taahil-alfiqhi/index.html` and `usul-alfiqh/index.html`. The generated lecture pages, the build and the diagram scripts were not touched or run.

- **H1 — RESOLVED.** PDF 10 confirmed («واحد من أمور ثلاثة … أو صيام ثلاثة أيام»). L1 card now reads «فالواجب على من حنث واحد من أمور ثلاثة: إطعام عشرة مساكين أو كسوتهم أو عتق رقبة؛ ولو فعل…». Tree label unchanged.
- **M1 — RESOLVED.** L3: «وتفصيلهما في «خامسًا» أدناه.»
- **M2 — RESOLVED.** Course `index.html`: «…في أصول الفقه، وتستشهد كثيرًا بأبيات «نظم الورقات» للعمريطي: فتبدأ…». Specialty tile: «على ترتيب الورقات» removed; it now says the lectures quote «نظم الورقات» of العمريطي. (`assets/search-index.js` still holds the old tile text until the next build regenerates it.)
- **M3 — RESOLVED.** Text is on PDF 67 (not 66). L6 b6q8 exp: «…ومثاله الفطر بالحجامة: آخر الأمرين أن الحجامة لا تفطّر الصائم، كما في حديث أنس رضي الله عنه في سنن الدارقطني.»
- **N1 — RESOLVED.** PDF 18 confirmed. L2: «ولا بد أن يكون الرافع (الناسخ) أيضًا دليلًا شرعيًّا (كما في التعريف: «بدليل شرعي»)».
- **N2 — NOT CHANGED.** Quoted as printed; reviewer says no change needed.
- **N3 — RESOLVED.** L1: heading «القراء السبعة (أصحاب القراءات المتواترة)» added above the seven cards.
- **N4 — RESOLVED.** L3 closing box: «…ويأتي في القسم التالي تفصيل أنواع الظاهر: الأمر والنهي والعام والخاص.» (PDF 35 checked.)
- **N5 — RESOLVED.** L5: قياس الشبه now stands alone, followed directly by the two «في العبد» views, then قياس العكس.
- **N6 — RESOLVED.** L6 table: «—» in the empty «مثاله» cell of مجتهد المذهب.
- **N7 — RESOLVED.** L6: «قَوْلُهُ» (damma confirmed on PDF 60 zoom).
- **N8 — RESOLVED.** L5 hero «للمحاضرة السادسة وأول السابعة», L6 «لبقية المحاضرة السابعة والمحاضرة الثامنة» (OUTLINE: lecture 6 at PDF 48, 7 at 55, 8 at 62).
- **N9 — RESOLVED.** «مع التنبيه» dropped.
- **N10 — RESOLVED.** gq3 (the four axes) replaced by the NOTES-part1 candidate on آية الرجم (L1 «المتعبد بتلاوته» + L2 نسخ التلاوة). Positions now 3,4,2,3,1,2,4,1 (each twice); correct option longest in 2 of 8; names gq1-gq8 unique.
- **N11 — RESOLVED.** L3 quiz reordered to 3,4,2,1,4,1,3,2 (each twice; option texts unchanged; correct option longest in 0 of 8).
- **N12 — RESOLVED.** Specialty hero subtitle adds «، والتأهيل الفقهي على مذهب الشافعي».
