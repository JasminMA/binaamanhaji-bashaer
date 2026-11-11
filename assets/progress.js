/* Study progress: mark lessons as done and see how far you got.  security-reviewed:storage

   Lesson pages (lectureN.html) get a "done" toggle above the bottom navigation.
   Course pages (index.html with lesson cards) get a progress bar, a done badge on finished
   lessons, a link to the last lesson opened, and a "clear progress" button.

   Storage (display preference only, as the site's security rules allow):
   - one localStorage key holding lesson NUMBERS per course folder, and the last lesson opened;
   - nothing else: no names, no quiz scores, nothing is sent anywhere;
   - everything read back is treated as untrusted and validated (numbers and folder names only),
     is never used as HTML, a URL or a class name, and every storage access is in try/catch.
   If storage is unavailable (private window, blocked) the feature stays off and the pages work as before.
   Without JavaScript nothing appears, so there are no dead buttons. */
(function () {
  'use strict';

  var KEY = 'bm.progress.v1';
  var COURSE_RE = /^[a-z0-9-]+$/;
  var DIGITS = '٠١٢٣٤٥٦٧٨٩';

  function arabic(n) {
    return String(n).replace(/[0-9]/g, function (d) { return DIGITS.charAt(Number(d)); });
  }

  // ---- storage -----------------------------------------------------------------
  function getStore() {
    try {
      var s = window.localStorage;
      var probe = '__bm_probe__';
      s.setItem(probe, '1');
      s.removeItem(probe);
      return s;
    } catch (e) {
      return null;
    }
  }

  var store = getStore();
  if (!store) { return; }

  function emptyState() { return { done: {}, last: {} }; }

  function validNumber(n) {
    return typeof n === 'number' && n % 1 === 0 && n >= 1 && n <= 200;
  }

  // Whatever is in storage may have been edited by anyone: keep only what has the expected shape.
  function clean(raw) {
    var out = emptyState();
    if (!raw || typeof raw !== 'object') { return out; }
    var done = raw.done;
    if (done && typeof done === 'object') {
      Object.keys(done).forEach(function (course) {
        if (!COURSE_RE.test(course) || !Array.isArray(done[course])) { return; }
        var seen = {};
        var list = [];
        done[course].forEach(function (n) {
          if (validNumber(n) && !seen[n]) { seen[n] = true; list.push(n); }
        });
        list.sort(function (a, b) { return a - b; });
        out.done[course] = list;
      });
    }
    var last = raw.last;
    if (last && typeof last === 'object') {
      Object.keys(last).forEach(function (course) {
        if (COURSE_RE.test(course) && validNumber(last[course])) { out.last[course] = last[course]; }
      });
    }
    return out;
  }

  function load() {
    try {
      var text = store.getItem(KEY);
      return text ? clean(JSON.parse(text)) : emptyState();
    } catch (e) {
      return emptyState();
    }
  }

  function save(state) {
    try { store.setItem(KEY, JSON.stringify(state)); } catch (e) { /* storage full or blocked: stay silent */ }
  }

  function isDone(state, course, n) {
    var list = state.done[course];
    return !!list && list.indexOf(n) !== -1;
  }

  function setDone(state, course, n, value) {
    var list = (state.done[course] || []).filter(function (x) { return x !== n; });
    if (value) { list.push(n); }
    list.sort(function (a, b) { return a - b; });
    state.done[course] = list;
  }

  // ---- where are we? -----------------------------------------------------------
  var parts = window.location.pathname.split('/');
  var file = parts[parts.length - 1] || 'index.html';
  var course = parts.length >= 2 ? parts[parts.length - 2] : '';
  if (!COURSE_RE.test(course)) { return; }
  var lessonMatch = /^lecture(\d+)\.html$/.exec(file);

  var refreshers = [];

  // ---- lesson page: the "done" toggle -----------------------------------------
  function setUpLesson(n) {
    var wrap = document.querySelector('.wrap');
    if (!wrap || !validNumber(n)) { return; }

    var row = document.createElement('div');
    row.className = 'pg-row';

    var button = document.createElement('button');
    button.type = 'button';
    button.className = 'pg-done-btn';
    var box = document.createElement('span');
    box.setAttribute('aria-hidden', 'true');
    var label = document.createElement('span');
    button.appendChild(box);
    button.appendChild(label);

    var hint = document.createElement('span');
    hint.className = 'pg-hint';
    hint.textContent = 'يُحفظ في هذا المتصفح فقط';

    row.appendChild(button);
    row.appendChild(hint);

    var bottom = wrap.lastElementChild;
    if (bottom && bottom.tagName === 'NAV') { wrap.insertBefore(row, bottom); } else { wrap.appendChild(row); }

    function render() {
      var done = isDone(load(), course, n);
      button.setAttribute('aria-pressed', done ? 'true' : 'false');
      box.textContent = done ? '✓' : '☐';
      label.textContent = done ? 'تم إنجاز هذا الدرس' : 'تعليم هذا الدرس منجَزًا';
    }

    button.addEventListener('click', function () {
      var state = load();
      setDone(state, course, n, !isDone(state, course, n));
      save(state);
      render();
    });

    // remember the last lesson opened in this course
    var opened = load();
    opened.last[course] = n;
    save(opened);

    refreshers.push(render);
    render();
  }

  // ---- course page: bar, badges, resume link -----------------------------------
  function setUpCourse() {
    var cards = Array.prototype.slice.call(document.querySelectorAll('a.card[href]')).filter(function (a) {
      return /^lecture\d+\.html$/.test(a.getAttribute('href'));
    });
    if (cards.length === 0) { return; }
    var total = cards.length;
    var byNumber = {};
    cards.forEach(function (card) {
      var n = Number(/\d+/.exec(card.getAttribute('href'))[0]);
      byNumber[n] = card;
    });

    var panel = document.createElement('div');
    panel.className = 'pg-panel';
    panel.setAttribute('role', 'group');
    panel.setAttribute('aria-label', 'تقدّمك في هذه المادة');

    var text = document.createElement('p');
    text.className = 'pg-text';

    var meter = document.createElement('progress');
    meter.className = 'pg-meter';
    meter.max = total;
    meter.value = 0;

    var resume = document.createElement('a');
    resume.className = 'pg-resume';

    var reset = document.createElement('button');
    reset.type = 'button';
    reset.className = 'pg-reset';

    panel.appendChild(text);
    panel.appendChild(meter);
    panel.appendChild(resume);
    panel.appendChild(reset);

    var grid = cards[0].parentNode;
    grid.parentNode.insertBefore(panel, grid);

    var badges = {};
    cards.forEach(function (card) {
      var badge = document.createElement('span');
      badge.className = 'pg-badge';
      badge.textContent = '✓ منجَز';
      badge.hidden = true;
      card.appendChild(badge);
      badges[card.getAttribute('href')] = badge;
    });

    var armed = false;
    var armTimer = null;
    function disarm() {
      armed = false;
      reset.textContent = 'مسح التقدّم';
      if (armTimer) { window.clearTimeout(armTimer); armTimer = null; }
    }

    function render() {
      var state = load();
      var count = 0;
      cards.forEach(function (card) {
        var n = Number(/\d+/.exec(card.getAttribute('href'))[0]);
        var done = isDone(state, course, n);
        if (done) { count += 1; }
        card.classList.toggle('pg-done', done);
        badges[card.getAttribute('href')].hidden = !done;
      });
      meter.value = count;
      text.textContent = count === total
        ? 'تم إنجاز كل الدروس: ' + arabic(count) + ' من ' + arabic(total)
        : 'الدروس المنجزة: ' + arabic(count) + ' من ' + arabic(total);

      var lastCard = byNumber[state.last[course]];
      if (lastCard) {
        var heading = lastCard.querySelector('h3');
        resume.hidden = false;
        resume.href = lastCard.getAttribute('href');
        resume.textContent = 'آخر درس مفتوح: الدرس ' + arabic(state.last[course]) +
          (heading ? ' — ' + heading.textContent : '') + ' ←';
      } else {
        resume.hidden = true;
      }
      reset.hidden = (count === 0 && !lastCard);
      if (!armed) { reset.textContent = 'مسح التقدّم'; }
    }

    reset.addEventListener('click', function () {
      if (!armed) {
        armed = true;
        reset.textContent = 'اضغط مرة أخرى لتأكيد المسح';
        armTimer = window.setTimeout(function () { disarm(); }, 4000);
        return;
      }
      var state = load();
      delete state.done[course];
      delete state.last[course];
      save(state);
      disarm();
      render();
    });

    disarm();
    refreshers.push(render);
    render();
  }

  function init() {
    if (lessonMatch) { setUpLesson(Number(lessonMatch[1])); } else { setUpCourse(); }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  // Keep every open page in step: another tab changed the progress, or the browser restored this page from its back/forward cache.
  function refreshAll() { refreshers.forEach(function (refresh) { refresh(); }); }
  window.addEventListener('storage', function (event) {
    if (event.key === KEY || event.key === null) { refreshAll(); }
  });
  window.addEventListener('pageshow', refreshAll);
})();
