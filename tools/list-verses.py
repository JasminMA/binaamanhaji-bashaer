# -*- coding: utf-8 -*-
"""List every Quran verse quoted on the site, with its reference, and flag what is mechanically wrong.

Used by the quran-verse-check skill (.claude/skills/quran-verse-check/SKILL.md). It only READS files.

A quotation is  ﴿ ... ﴾  followed by a reference  [السورة: ٢٣]  or  [السورة: ٢٣-٢٥]  (Arabic or Latin digits).

Mechanical checks (no mushaf file needed):
  - a reference that cannot be read (a quotation with no reference at all is only a WARNING: some lessons name the
    surah in the sentence before it);
  - unknown surah name, or an ayah number beyond the surah's number of ayat (table inside this file,
    validated at start: 114 surahs, 6236 ayat);

Optional check against a mushaf text (only if the file exists; it is NOT part of the repo by default):
  tools/data/quran.txt, one ayah per line:  surah_number|ayah_number|text
  (any plain Uthmani or Imla'i text works; the compare ignores tashkeel and spelling variants of alef/ya/ta marbuta,
   so only a different WORD is reported). Without that file the wording must be checked by reading, see the skill.

Usage (from the repository root):
  python -X utf8 tools/list-verses.py                 every verse on the site
  python -X utf8 tools/list-verses.py --changed       only files changed or new in git (use before a commit)
  python -X utf8 tools/list-verses.py --path src/aqeeda
  python -X utf8 tools/list-verses.py --summary       only the problems and counts
Exit code 1 when a mechanical problem was found.
"""
import argparse, io, os, re, subprocess, sys

AYAT = [7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111, 43, 52, 99, 128, 111, 110, 98, 135, 112, 78, 118, 64,
        77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 54, 53, 89, 59, 37, 35, 38, 29, 18, 45, 60,
        49, 62, 55, 78, 96, 29, 22, 24, 13, 14, 11, 11, 18, 12, 12, 30, 52, 52, 44, 28, 28, 20, 56, 40, 31, 50, 40,
        46, 42, 29, 19, 36, 25, 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8, 19, 5, 8, 8, 11, 11, 8, 3, 9, 5, 4, 7, 3,
        6, 3, 5, 4, 5, 6]
NAMES = ['الفاتحة', 'البقرة', 'آل عمران', 'النساء', 'المائدة', 'الأنعام', 'الأعراف', 'الأنفال', 'التوبة', 'يونس', 'هود',
         'يوسف', 'الرعد', 'إبراهيم', 'الحجر', 'النحل', 'الإسراء', 'الكهف', 'مريم', 'طه', 'الأنبياء', 'الحج', 'المؤمنون',
         'النور', 'الفرقان', 'الشعراء', 'النمل', 'القصص', 'العنكبوت', 'الروم', 'لقمان', 'السجدة', 'الأحزاب', 'سبأ',
         'فاطر', 'يس', 'الصافات', 'ص', 'الزمر', 'غافر', 'فصلت', 'الشورى', 'الزخرف', 'الدخان', 'الجاثية', 'الأحقاف',
         'محمد', 'الفتح', 'الحجرات', 'ق', 'الذاريات', 'الطور', 'النجم', 'القمر', 'الرحمن', 'الواقعة', 'الحديد',
         'المجادلة', 'الحشر', 'الممتحنة', 'الصف', 'الجمعة', 'المنافقون', 'التغابن', 'الطلاق', 'التحريم', 'الملك',
         'القلم', 'الحاقة', 'المعارج', 'نوح', 'الجن', 'المزمل', 'المدثر', 'القيامة', 'الإنسان', 'المرسلات', 'النبأ',
         'النازعات', 'عبس', 'التكوير', 'الانفطار', 'المطففين', 'الانشقاق', 'البروج', 'الطارق', 'الأعلى', 'الغاشية',
         'الفجر', 'البلد', 'الشمس', 'الليل', 'الضحى', 'الشرح', 'التين', 'العلق', 'القدر', 'البينة', 'الزلزلة',
         'العاديات', 'القارعة', 'التكاثر', 'العصر', 'الهمزة', 'الفيل', 'قريش', 'الماعون', 'الكوثر', 'الكافرون',
         'النصر', 'المسد', 'الإخلاص', 'الفلق', 'الناس']
assert len(AYAT) == 114 and sum(AYAT) == 6236 and len(NAMES) == 114


def norm_name(s):
    s = re.sub(r'[ً-ٰٟـ]', '', s)
    s = re.sub(r'[أإآٱ]', 'ا', s).replace('ى', 'ي').replace('ة', 'ه')
    s = re.sub(r'^(سوره|سورة)\s+', '', s.strip())
    s = re.sub(r'^ال', '', s)
    return s.replace(' ', '')


BYNAME = {}
for i, n in enumerate(NAMES, 1):
    BYNAME[norm_name(n)] = i
ALIASES = {'ال عمران': 'آل عمران', 'السجده': 'السجدة', 'سجده': 'السجدة', 'غافر': 'غافر', 'المؤمن': 'غافر',
           'الملائكة': 'فاطر', 'بني اسرائيل': 'الإسراء', 'التوبه': 'التوبة', 'براءة': 'التوبة'}
for a, b in ALIASES.items():
    BYNAME[norm_name(a)] = BYNAME[norm_name(b)]

AR = '٠١٢٣٤٥٦٧٨٩'


def to_int(s):
    return int(''.join(str(AR.index(c)) if c in AR else c for c in s))


def strip_tags(s):
    return re.sub(r'<[^>]+>', '', s)


def skeleton(s):
    s = re.sub(r'[ً-ٰٟـۖ-ۭ࣓-ࣿ]', '', s)
    s = re.sub(r'[أإآٱ]', 'ا', s).replace('ى', 'ي').replace('ة', 'ه').replace('ؤ', 'و').replace('ئ', 'ي')
    s = re.sub(r'[^ء-ي ]', '', s)
    return re.sub(r'\s+', ' ', s).strip()


VERSE = re.compile(r'﴿(.*?)﴾\s*(?:‏)?\s*(?:[\[\(]([^\]\)<]{1,60})[\]\)])?', re.S)
REF = re.compile(r'^\s*([^:：\d٠-٩]+?)\s*[:：]\s*([\d٠-٩]+)\s*(?:[-–ـ]\s*([\d٠-٩]+))?\s*$')


def site_files(root, path, changed):
    skip_dirs = {'.git', 'node_modules', 'assets', 'tools', 'refs', '.claude', '__pycache__'}
    if changed:
        out = subprocess.run(['git', 'status', '--porcelain', '-uall'], cwd=root, capture_output=True, text=True,
                             encoding='utf-8').stdout
        files = []
        for line in out.splitlines():
            p = line[3:].strip().strip('"')
            if p.endswith('.html'):
                files.append(p)
        cand = files
    else:
        cand = []
        for dp, dn, fn in os.walk(os.path.join(root, path)):
            dn[:] = [d for d in dn if d not in skip_dirs or (d == 'refs' and False)]
            for f in fn:
                if f.endswith('.html'):
                    cand.append(os.path.relpath(os.path.join(dp, f), root).replace('\\', '/'))
    res = []
    for p in cand:
        p = p.replace('\\', '/')
        parts = p.split('/')
        if parts[0] in skip_dirs - {'refs'} or 'refs' in parts:
            continue
        # generated lesson pages duplicate src/: skip them (src/ is the source of truth)
        if parts[0] != 'src' and re.match(r'lecture\d+\.html$', parts[-1]):
            continue
        if parts[0] == 'src' and not os.path.exists(os.path.join(root, p)):
            continue
        if path != '.' and not p.startswith(path.replace('\\', '/').rstrip('/')):
            continue
        res.append(p)
    return sorted(set(res))


def load_mushaf(root):
    p = os.path.join(root, 'tools', 'data', 'quran.txt')
    if not os.path.exists(p):
        return None
    m = {}
    for line in io.open(p, encoding='utf-8'):
        line = line.rstrip('\n')
        parts = line.split('|', 2)
        if len(parts) == 3 and parts[0].isdigit() and parts[1].isdigit():
            m[(int(parts[0]), int(parts[1]))] = skeleton(parts[2])
    return m or None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--path', default='.')
    ap.add_argument('--changed', action='store_true')
    ap.add_argument('--summary', action='store_true')
    a = ap.parse_args()
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8')
    root = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
    files = site_files(root, a.path, a.changed)
    mushaf = load_mushaf(root)
    problems = []
    warns = []
    seen = {}
    total = 0
    for f in files:
        text = io.open(os.path.join(root, f), encoding='utf-8').read()
        for m in VERSE.finditer(text):
            total += 1
            line = text.count('\n', 0, m.start()) + 1
            body = re.sub(r'\s+', ' ', strip_tags(m.group(1))).strip()
            refs = (m.group(2) or '').strip()
            where = '%s:%d' % (f, line)
            info = None
            if not refs:
                warns.append((where, 'NO-REF (check that the surah and ayah are given in the text nearby)', body))
                row = (where, '?', body, 'NO-REF')
            else:
                rtxt = re.sub(r'\s*وغيرها\s*$', '', strip_tags(refs))
                row = None
                shown = []
                for one in re.split(r'[؛;،]', rtxt):
                    one = one.strip()
                    if not one:
                        continue
                    rm = REF.match(one)
                    if not rm:
                        n0 = BYNAME.get(norm_name(one))
                        if n0:                       # surah name only, e.g. [العصر]
                            shown.append(NAMES[n0 - 1])
                            continue
                        problems.append((where, 'BAD-REF [' + one + ']', body))
                        row = (where, refs, body, 'BAD-REF')
                        break
                    name, v1, v2 = rm.group(1), to_int(rm.group(2)), to_int(rm.group(3)) if rm.group(3) else None
                    n = BYNAME.get(norm_name(name))
                    if not n:
                        problems.append((where, 'UNKNOWN-SURAH [' + name + ']', body))
                        row = (where, refs, body, 'UNKNOWN-SURAH')
                        break
                    last = v2 or v1
                    flag = ''
                    if v1 < 1 or last > AYAT[n - 1] or (v2 and v2 < v1):
                        problems.append((where, 'AYAH-OUT-OF-RANGE [%s: %s, surah has %d]' % (NAMES[n - 1], one, AYAT[n - 1]), body))
                        row = (where, refs, body, 'AYAH-OUT-OF-RANGE')
                        break
                    if mushaf and len(re.split(r'[؛;،]', rtxt)) == 1:
                        parts = [mushaf.get((n, k)) for k in range(v1, last + 1)]
                        if any(p is None for p in parts):
                            flag = 'MUSHAF-MISSING'
                        else:
                            full = ' '.join(parts)
                            sk = skeleton(body.replace('...', ' ').replace('…', ' '))
                            if sk not in full and not all(c.strip() in full for c in re.split(r'\s{2,}', sk) if c.strip()):
                                problems.append((where, 'WORDS-DIFFER-FROM-MUSHAF [%s: %s]' % (NAMES[n - 1], one), body))
                                flag = 'WORDS-DIFFER'
                    shown.append('%s: %s' % (NAMES[n - 1], one.split(':', 1)[-1].strip()))
                    row = row or (where, '', body, flag)
                if row is None or row[1] == '':
                    row = (where, ' ؛ '.join(shown), body, row[3] if row else '')
            if not a.summary:
                print('%s  [%s]  %s%s' % (row[0], row[1], row[2], ('   <-- ' + row[3]) if row[3] else ''))
    print()
    print('files scanned: %d, verses found: %d, mushaf compare: %s' % (len(files), total, 'ON' if mushaf else 'OFF (no tools/data/quran.txt: read the wording)'))
    if warns:
        print('WARNINGS (%d): quotations with no [surah: ayah] right after them' % len(warns))
        for w, kind, body in warns:
            print('  %s  %s' % (w, body))
    if problems:
        print('PROBLEMS (%d):' % len(problems))
        for w, kind, body in problems:
            print('  %s  %s  %s' % (w, kind, body))
        sys.exit(1)
    print('no mechanical problems')


main()
