# REVIEW (step 4): «شرح الأجرومية», Level 1 stage 4

Reviewed: built `level1/stage4/sharh-alajrumiyya/index.html` and `lecture1..8.html` (text, SVG labels, glossary, summaries, all 72 quiz items), against page images of
(أ) `ملخص_سلسلة_شرح_الآجرومية.pdf` PDF 2-46 (110 dpi, zooms at 170-220 dpi on PDF 7, 13, 18),
(ج) `متن_الآجرومية.pdf` PDF 5-47 (130 dpi, zooms at 180 dpi on PDF 16-17),
(ب) `تشجير_الآجرومية.pdf` (slide 11 checked; the other slides' known errors were checked against the page text).
Line numbers are for `src/level1/stage4/sharh-alajrumiyya/lectureN.html` unless the file is named.

General result: the content follows (أ) closely and the matn quotations match (ج). Every known source error in OUTLINE section 5 has been left out or corrected: «لا يغفر الذنوب إلا أنت», «إذن لا يضيعنا», «اسم لا منصوب», the counts 15 and 10, «الأسماء الستة», the 11 tawkid words, the 3 badal kinds, the 8 conjunctions, the 4 jussive particles, and the tashjir slides 6, 19, 22, 29, 31, 37, 42, 43.
The lecturer is not named. «مدارج النحو» is attributed correctly to الشيخ سالم القحطاني.
All Quran quotations I checked have the right wording and reference: about 75 verses across L2-L8.

---

## HIGH

### H1. L4: matn quotation changes «إِذَا» into «إِذًا» (lecture4.html:93, and the SVG `jawazim`, lecture4.html:116, from `refs/diagrams_part2.py:88`)
- Page: «… وَحَيْثُمَا، وَكَيْفَمَا، وَ«إِذًا» فِي الشِّعْرِ خَاصَّةً». The tree leaf reads «إِذًا» في الشعر خاصة.
- (ج) PDF 17 [71] prints «وَ«إِذَا» فِي الشِّعْرِ خَاصَّةً». (أ) PDF 21 and نظم ابن أُبّ («ثُمَّ إِذَا ** فِي ٱلشِّعْرِ») say the same. The word is the conditional إذا. «إذًا» with tanween is the noun-less spelling of إذن, a ناصب. Students would memorise a ناصب in the list of jussive particles.
- Fix: write «إِذَا» in both places (lecture4.html line 93, and diagrams_part2.py line 88, then rebuild). The summary at lecture4 line ~366 already has «إذا».

### H2. L3: «لعلّي أبلغ الأسباب… فأطّلعَ» is labelled تمنٍّ (lecture3.html:393; SVG `sababiyya` row «سورة غافر: ٣٦–٣٧ | تمنٍّ», lecture3.html:375)
- Page: «"فَأَطَّلِعَ" فعلٌ مضارعٌ منصوبٌ بفاء السببية؛ لأن قبلها تمنّيًا».
- (أ) PDF 20 [19] does say «لأنّ قبلها تمنٍّ». But this is wrong in grammar: لعلّ is for الترجّي. The verse is the standard example of nasb after الرجاء, which the page itself lists as a separate condition (from (أ) PDF 19). The matn, quoted in L6, says «وَلَعَلَّ لِلتَّرَجِّي وَالتَّوَقُّعِ» ((ج) PDF 26). The same grid row then teaches a wrong category.
- Fix: label it «ترجٍّ (رجاء)», supported by the matn's «لعلّ للترجّي» and the رجاء item of (أ)'s list. Or drop the category label for this verse. Record the problem in NOTES (source error not in OUTLINE section 5).

### H3. L4 quiz b4q7 explanation states a false general rule (lecture4.html:433)
- exp: «أما المتصل بالفعل ففي محل نصب مفعول به، والمتصل بحرف الجر في محل جرّ اسم مجرور.»
- As an unqualified rule this is wrong: تاء الفاعل, واو الجماعة, ألف الاثنين, ياء المخاطبة and نون النسوة are attached to the verb and are in محل رفع فاعل. The page's own examples say so (L3 «تَسْأَلُوا», «تُنفِقُوا»; L4 «يَلْحَقُوا»). (أ) PDF 24 [23] states the rule loosely, and NOTES-part2 already flags it. The body text qualifies it, but the explanation drops the qualifier.
- Fix: «أما الكاف المتصلة بالفعل في «يَنصُرْكُمْ» ففي محل نصب مفعول به، والمتصل بحرف الجر في محل جرّ اسم مجرور.»

---

## MEDIUM

### M1. L4 tanbih still opens with the over-general rule (lecture4.html:309)
- «إذا اتصل الضمير بالفعل يكون في محل نصب مفعولٍ به كما في المثال السابق…». The next paragraph adds the exception, so a reader sees the rule first and the exception second.
- Fix: start with the example: «الضمير المتصل بالفعل في مثل الكاف من «يَنصُرْكُمْ» يكون في محل نصب مفعولٍ به…». Also attach the exception to the tree leaf «متصل بالفعل».

### M2. L8 reinstates the dropped count of شبه المفاعيل (lecture8.html:183)
- «السادس من شبه المفاعيل: اسم إنّ وخبر كان، والسابع إلى العاشر: التوابع الأربعة».
- This gives شبه المفاعيل = 10, so the mansubat total comes out at 15. L7 quotes the matn's «أربعة عشر» and the writers deliberately left (أ)'s counts out (OUTLINE section 5; NOTES-part1, part3 and part4).
- Fix: «ثم اسم إنّ وخبر كان، والتوابع الأربعة، وقد سبق الكلام عنها» (no ordinals «السابع إلى العاشر»).

### M3. L8: «لأن «ما» لا تدخل إلا على الأفعال» stated as a general reason (lecture8.html:99)
- This is (أ) PDF 40 [39] wording. As a general statement it is false: ما النافية and ما الموصولة enter on nouns, and the course itself has «ما زيدٌ…»-type uses. The point is valid only for this ما (ما خلا، ما عدا).
- Fix: «فلا بدّ أن تكون فعلًا ماضيًا؛ لأن «ما» هنا لا تدخل إلا على الأفعال». Or keep only the ruling and drop the reason.

### M4. L6: «اسم ظنّ» / «خبر ظنّ» (lecture6.html:94, «ظننتُ الجوَّ صحوًا»)
- «"الجوّ": اسم ظنّ، مفعول به أول… و"صحوًا": خبر ظنّ، مفعول به ثانٍ». (أ) PDF 30 [29] has these words. But ظنّ has no «اسم» or «خبر» (unlike كان and إنّ): its فاعل is the تاء, and its two مفعولان were originally مبتدأ وخبر. The same page's second treatment (section رابعًا) correctly says only «مفعول به أول/ثانٍ».
- Fix: «"الجوّ" (وأصله المبتدأ): مفعول به أول…، و"صحوًا" (وأصله الخبر): مفعول به ثانٍ…»; or drop «اسم ظنّ / خبر ظنّ».

### M5. L4: equal-level command called «رجاء» (lecture4.html section رابعًا and summary line 366; quiz b4q4)
- This is (أ) PDF 22 [21] wording. The usual term for a command between equals is «التماس». «رجاء» is a different notion, and L3 uses it as one of the conditions of فاء السببية. In b4q4 the distractor «التماسًا» is the standard name of the neighbouring category, which may confuse students who know it.
- Fix: attribute it («ويسمّيه الشرح رجاءً») and replace the b4q4 distractor «التماسًا» with something clearly wrong (e.g. «نهيًا»).

### M6. index.html: the source statement contradicts itself (index.html:316)
- «ملخصٌ للسلسلة في ثمانية مجالس، ٤٦ صفحة، مع نص المتن وتشجيره، وهو المصدر الوحيد الذي بُنيت عليه الصفحات».
- The pages quote the matn (ج) and use the tashjir (ب). These are separate files, not part of the 46-page summary. «المصدر الوحيد» is therefore wrong, and the «عن الكتاب» paragraph says correctly «مع الرجوع إلى نص المتن نفسه وإلى تشجيره».
- Fix: «ملخصٌ للسلسلة في ثمانية مجالس (٤٦ صفحة)، وهو المصدر الأساسي للصفحات وترتيب مباحثها، مع نص المتن المشكول للاستشهاد بلفظه، وتشجيرٍ للأبواب.»

### M7. index.html cross-course quiz: the correct option is the strictly longest in 4 of 8 (gq3, gq4, gq7, gq8; limit 3)
- gq4 «إذا اتصلت به نون النسوة أو نون التوكيد.» and gq7 «مفعولٌ به منصوبٌ وعلامة نصبه الألف؛ لأنه من الأسماء الخمسة.» are both much longer than their distractors.
- Fix: in gq4, lengthen a distractor (e.g. «إذا كان معتلّ الآخر بالألف أو الواو أو الياء.»), or shorten gq7's answer to «مفعولٌ به منصوبٌ بالألف؛ لأنه من الأسماء الخمسة.» and lengthen one distractor.

---

## NOTE

- N1. L1, «في نصّ المتن» card (lecture1.html:281): «وحروف الخفض (ومنها حروف القسم)». The matn lists حروف القسم as a separate item after حروف الخفض ((ج) PDF 5). The L1 summary item «علامات الاسم في المتن: الخفض، والتنوين، ودخول الألف واللام، وحروف الخفض» and the b1q4 explanation also omit حروف القسم. Suggest «…وحروف الخفض، وحروف القسم».
- N2. L1 «صاحب المتن»: «محمد بن محمد بن داود الصنهاجي». (أ) PDF 7 [6] prints «محمد بن عبد الله بن داود»; the page follows (ج)'s «محمد بن محمد». The page is correct; just record the divergence in NOTES.
- N3. L3/L4 i'rab lines quote the verb together with its lam as «فعلٌ مضارع»: «لِتُبَيِّنَ», «لِيَغْفِرَ», «لِيُعَذِّبَ» (L3); «لِيُنفِقْ», «وَلْيَتَّقِ», «لْيَقْضُوا» (L4). (أ) does the same, but for a grammar course it is cleaner to quote the bare verb («تُبَيِّنَ», «يَغْفِرَ», «يُنفِقْ»…), since the lam is a separate particle.
- N4. L7 b7q6 exp (lecture7.html:461): «أما اللفظي فمثل (قتلتُه قتلًا)، ويُسمّى في المتن «المصدر»» reads as if only the لفظي kind were called المصدر. Suggest «…؛ والمفعول المطلق يُسمّى في المتن «المصدر»».
- N5. L2 jadwal: the colours match (أ) PDF 13: accent = blue/فرعية, plain = green/أصلية, and «الأسماء الخمسة» replaces «الستة» as intended.
- N6. L6 grid «ليتَ الشبابَ يعودُ يومًا: يعود يومًا جملة فعلية في محل رفع»: this follows (أ) PDF 31, but «يومًا» is a ظرف, not part of the khabar sentence proper. It is acceptable as (أ) gives it; it could read «"يعودُ": جملة فعلية في محل رفع خبر ليت».

---

## Quiz check

- All 64 lesson questions and the 8 cross-course questions have exactly one `label.opt ok`. Each marked answer is confirmed by (أ) or (ج), and each distractor is wrong by the sources. Apart from H3 (b4q7), the explanations are accurate.
- Answer positions: every quiz (L1-L8 and index) puts the correct option in positions 1-4 exactly twice each.
- Correct option strictly the longest:

| Quiz | Questions | Count |
|---|---|---|
| L1 | q2, q6, q7 | 3, at the limit |
| L2 | none (q4 and q6 are ties) | 0 |
| L3 | q3, q4 | 2 |
| L4 | q6 (q5 and q7 are ties) | 1 |
| L5 | q7, q8 | 2 |
| L6 | none (q4 is a tie) | 0 |
| L7 | q2, q5 (q6 is a tie) | 2 |
| L8 | q1 (q7 is a tie) | 1 |
| index | q3, q4, q7, q8 (q2 is a tie) | **4, over the limit (M7)** |

## Counts
HIGH: 3 · MEDIUM: 7 · NOTE: 6

---

## Fix step (step 5) — status

Verified on page images: (ج) PDF 17 prints «وَ«إِذَا»» (fatha, alif, no tanween); (ج) PDF 5 lists حروف القسم separately; (أ) PDF 20, 22, 30 confirm the wording quoted in H2, M5, M4. Edits are in `src/level1/stage4/sharh-alajrumiyya/` and in the course `index.html`; generated lecture pages were not touched, and nothing was rebuilt.

- H1 RESOLVED: lecture4 blockquote and the `jawazim` SVG leaf now read «إِذَا»; `refs/diagrams_part2.py:88` changed too (not run).
- H2 RESOLVED: lecture3 grid label «ترجٍّ (رجاء)» (fits the 104px box), row label «ترجٍّ في آية», reason «ترجّيًا بـ«لعلّ»…» tied to the matn's «لعلّ للترجّي»; aria-label updated. Recorded in NOTES.md.
- H3 RESOLVED: b4q7 exp now «أما الكاف المتصلة بالفعل في «يَنصُرْكُمْ» ففي محل نصب مفعول به…».
- M1 RESOLVED: tanbih opens with the كاف example; the tree leaf «متصل بالفعل» already carries the فاعل exception (واو الجماعة ونحوها).
- M2 RESOLVED: lecture8 «ثم اسم إنّ وخبر كان، والتوابع الأربعة، وقد سبق…» (no ordinals).
- M3 RESOLVED: «لأن «ما» هنا لا تدخل إلا على الأفعال».
- M4 RESOLVED: lecture6 «"الجوّ" (وأصله المبتدأ): مفعول به أول… و"صحوًا" (وأصله الخبر): مفعول به ثانٍ».
- M5 RESOLVED: section رابعًا, summary and b4q4 exp attribute the term («يسمّيه الشرح رجاءً»); distractor «التماسًا» replaced by «نهيًا». Recorded in NOTES.md.
- M6 RESOLVED: source statement reworded as suggested.
- M7 RESOLVED: gq4 answer shortened to «إذا اتصلت به نونُ النسوة أو التوكيد.», distractor lengthened to «إذا كان معتلّ الآخر بالألف أو الواو أو الياء.»; gq7 answer shortened to «مفعولٌ به منصوبٌ بالألف؛ لأنه من الأسماء الخمسة.», distractor «…الفتحة الظاهرة على آخره.». Index now 2 of 8 strictly longest (gq3, gq8); positions unchanged (each twice).
- N1 RESOLVED: L1 matn card, summary and b1q4 exp now list «وحروف الخفض، وحروف القسم».
- N2 NOT CHANGED (page correct); divergence recorded in NOTES.md.
- N3 RESOLVED: i'rab lines quote the bare verb: «تُبَيِّنَ», «يَغْفِرَ», «يُعَذِّبَ» (L3); «يُنفِقْ», «يَتَّقِ», «يَقْضُوا/يُوفُوا/يَطَّوَّفُوا» (L4). Verse quotations unchanged.
- N4 RESOLVED: b7q6 exp «…؛ والمفعول المطلق يُسمّى في المتن «المصدر»».
- N5 NOT CHANGED (confirmation only).
- N6 RESOLVED: L6 grid leaf now «"يعودُ": جملة فعلية في محل رفع».

Re-check after edits: every quiz still has exactly one `label.opt ok` per question and each position used twice; correct option strictly longest: L1 3, L2 0, L3 2, L4 1, L5 2, L6 0, L7 2, L8 1, index 2.
