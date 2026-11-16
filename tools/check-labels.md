# Diagram label-fit check

`tools/check-site.ps1` cannot tell whether an SVG label is wider than its box. Check it in a browser
after building a course (step 3 of `.claude/courses-plan.md`):

1. Serve the repository root over http (the `site` entry in `.claude/launch.json`, port 8765).
2. Open the course page, for example `http://localhost:8765/<specialty>/<course>/index.html`.
3. Run the snippet below in the page (set `pages` to the course's files). It loads each page in a
   hidden frame at 1200px, measures every SVG `<text>` against the `<rect>` drawn before it, and
   lists the labels that do not fit. A free caption that merely sits under a box can be a false alarm.

```js
(async()=>{const pages=['index','lecture1','lecture2'];const out=[];
for(const p of pages){const f=document.createElement('iframe');
f.style.cssText='width:1200px;height:900px;position:absolute;left:-3000px';f.src=p+'.html';
document.body.appendChild(f);await new Promise(r=>f.onload=r);await f.contentDocument.fonts.ready;
for(const t of f.contentDocument.querySelectorAll('main svg text')){let rect=t.previousElementSibling;
while(rect&&rect.tagName!=='rect')rect=rect.previousElementSibling;if(!rect)continue;
const w=t.getComputedTextLength(),rw=+rect.getAttribute('width'),tx=+t.getAttribute('x'),rx=+rect.getAttribute('x');
if(tx<rx||tx>rx+rw)continue;if(w>rw-8)out.push(p+': '+t.textContent+' '+Math.round(w)+'>'+rw);}
f.remove();}return out.length?out.join('\n'):'all labels fit';})()
```

Fix a long label by shortening it or widening the box in the course's `refs/diagrams.py`, then
redraw that diagram. Also load one lesson at phone width and confirm the page itself does not
scroll sideways (wide diagrams scroll inside their own panel).
