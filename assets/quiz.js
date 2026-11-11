/* Score for the multiple-choice quizzes (form.quiz containing .mcq blocks).

   Progressive enhancement: without this file the quizzes still reveal the answer and the
   explanation (that part is CSS only). With it, a score bar is added:
   - one dot per question (green = right, red = wrong) and a line of text;
   - the FIRST answer to each question counts: the other options lock until "reset";
   - nothing is stored or sent anywhere, and the page text is never built from HTML strings
     (only textContent / classList), as the security rules require.

   The right option of each question is the one marked class="opt ok" in the page. */
(function () {
  'use strict';

  var DIGITS = '٠١٢٣٤٥٦٧٨٩';
  var refreshers = [];

  function arabic(n) {
    return String(n).replace(/[0-9]/g, function (d) { return DIGITS.charAt(Number(d)); });
  }

  function remark(correct, total) {
    if (correct === total) { return 'أحسنت! أتقنت هذا الاختبار.'; }
    if (correct / total >= 0.75) { return 'جيد؛ راجع الأسئلة التي أخطأت فيها.'; }
    return 'أعد قراءة الدرس ثم أعد المحاولة.';
  }

  function radios(scope) {
    return Array.prototype.slice.call(scope.querySelectorAll('input[type="radio"]'));
  }

  function setUp(form) {
    var questions = Array.prototype.slice.call(form.querySelectorAll('.mcq'));
    var total = questions.length;
    if (total === 0) { return; }

    var bar = document.createElement('p');
    bar.className = 'score';
    bar.hidden = true;
    bar.setAttribute('role', 'status');
    bar.setAttribute('aria-live', 'polite');

    var dotsBox = document.createElement('span');
    dotsBox.className = 'dots';
    dotsBox.setAttribute('aria-hidden', 'true');
    var dots = questions.map(function () {
      var dot = document.createElement('span');
      dot.className = 'dot';
      dotsBox.appendChild(dot);
      return dot;
    });

    var text = document.createElement('span');
    text.className = 'txt';

    bar.appendChild(dotsBox);
    bar.appendChild(text);

    var resetButton = form.querySelector('.rst');
    if (resetButton && resetButton.parentNode === form) {
      form.insertBefore(bar, resetButton);
    } else {
      form.appendChild(bar);
    }

    function chosen(question) {
      return question.querySelector('input[type="radio"]:checked');
    }

    // Lock the options that were not picked, so the first answer is the one that counts.
    function lock(question) {
      radios(question).forEach(function (r) { if (!r.checked) { r.disabled = true; } });
    }

    function update() {
      var answered = 0;
      var correct = 0;
      questions.forEach(function (question, i) {
        var pick = chosen(question);
        dots[i].className = 'dot';
        if (!pick) { return; }
        answered += 1;
        lock(question);
        var option = pick.closest('.opt');
        var right = !!option && option.classList.contains('ok');
        if (right) { correct += 1; }
        dots[i].classList.add(right ? 'ok' : 'bad');
      });

      bar.hidden = (answered === 0);
      if (answered < total) {
        bar.setAttribute('data-state', 'running');
        text.textContent = 'أجبتَ عن ' + arabic(answered) + ' من ' + arabic(total) +
          ' · الصحيح حتى الآن: ' + arabic(correct);
      } else {
        bar.setAttribute('data-state', correct === total ? 'perfect' : 'done');
        text.textContent = 'نتيجتك: ' + arabic(correct) + ' من ' + arabic(total) +
          ' — ' + remark(correct, total);
      }
    }

    form.addEventListener('change', function (event) {
      var target = event.target;
      if (target && target.type === 'radio') { update(); }
    });

    // "reset" fires before the browser clears the answers, so unlock and recount right after.
    form.addEventListener('reset', function () {
      window.setTimeout(function () {
        radios(form).forEach(function (r) { r.disabled = false; });
        update();
      }, 0);
    });

    refreshers.push(update);
    update();
  }

  function init() {
    Array.prototype.forEach.call(document.querySelectorAll('form.quiz'), setUp);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  // Back/forward navigation can restore answers the browser remembered: count them too.
  window.addEventListener('pageshow', function () {
    refreshers.forEach(function (refresh) { refresh(); });
  });
})();
