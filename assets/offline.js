/* Offline support: registers the service worker (sw.js at the site root) so the pages work without internet after one visit.

   - Runs only on https or localhost (browsers refuse service workers elsewhere, e.g. a page opened from disk).
   - Needs no storage of its own and touches nothing in the page; if registration fails, the site simply works online as before.
   - The address of sw.js comes from this script's own address (assets/offline.js -> ../sw.js), never from the page's URL or any input. */
(function () {
  'use strict';
  if (!('serviceWorker' in navigator)) { return; }
  var secure = window.location.protocol === 'https:' ||
    window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
  if (!secure) { return; }
  var me = document.currentScript;
  if (!me || !me.src) { return; }
  var worker = new URL('../sw.js', me.src).href;
  window.addEventListener('load', function () {
    try {
      navigator.serviceWorker.register(worker).catch(function () { /* blocked or unsupported: stay online-only */ });
    } catch (e) { /* same */ }
  });
})();
