# -*- coding: utf-8 -*-
"""Diagram helpers for lesson pages (theme colours, RTL, role=img + aria-label).

  tree(label, root, branches)            root on the right, coloured branches, leaves on the left
  grid(label, headers, rows, widths)     a table; the first column is the rightmost one
  fill_placeholders(path, {name: html})  replaces <!--SVG:name--> markers in a lesson source

A course keeps its diagram definitions in <course>/refs/diagrams.py and runs them once,
before build.ps1. See .claude/courses-plan.md (step 3) and tools/check-labels.md."""
import io, sys

COLORS = ['accent', 'gold', 'red']


def esc(s):
    return s.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;').replace('"', '&quot;')


def tree(label, root, branches, leaf_w=330, branch_w=190, root_w=170, min_width=820):
    """branches: list of (title, [leaf, ...]) or (title, [leaf...], color)."""
    gap_leaf, gap_group, box_h = 34, 16, 26
    W = 20 + leaf_w + 70 + branch_w + 70 + root_w + 20
    leaf_x = 20
    br_x = leaf_x + leaf_w + 70
    root_x = br_x + branch_w + 70
    y = 20
    placed = []
    for i, b in enumerate(branches):
        title, leaves = b[0], b[1]
        color = b[2] if len(b) > 2 else COLORS[i % 3]
        n = max(len(leaves), 1)
        ys = [y + k * gap_leaf + box_h / 2 for k in range(n)]
        cy = (ys[0] + ys[-1]) / 2
        placed.append((title, leaves, color, ys, cy))
        y += n * gap_leaf + gap_group
    H = int(y - gap_group + 20 + 6)
    root_cy = (placed[0][4] + placed[-1][4]) / 2
    out = []
    out.append('<div class="panel scroll"><svg viewBox="0 0 %d %d" width="100%%" style="min-width:%dpx;display:block" role="img" aria-label="%s">' % (W, H, min_width, esc(label)))
    paths = {c: [] for c in COLORS}
    for title, leaves, color, ys, cy in placed:
        x1, x2 = root_x, br_x + branch_w
        mx = (x1 + x2) / 2
        paths[color].append('M%d %.0f C%.0f %.0f %.0f %.0f %d %.0f' % (x1, root_cy, mx, root_cy, mx, cy, x2, cy))
        for ly in ys[:len(leaves)]:
            a, b2 = br_x, leaf_x + leaf_w
            m2 = (a + b2) / 2
            paths[color].append('M%d %.0f C%.0f %.0f %.0f %.0f %d %.0f' % (a, cy, m2, cy, m2, ly, b2, ly))
    for c in COLORS:
        if paths[c]:
            out.append('<path d="%s" fill="none" stroke-width="1.6" opacity=".8" style="stroke:var(--%s)"/>' % (' '.join(paths[c]), c))
    out.append('<rect x="%d" y="%.0f" width="%d" height="44" rx="22" style="fill:var(--ink)"/>' % (root_x, root_cy - 22, root_w))
    out.append('<text x="%.0f" y="%.0f" text-anchor="middle" direction="rtl" font-size="15" font-weight="700" style="font-family:var(--display);fill:var(--bg)">%s</text>' % (root_x + root_w / 2, root_cy + 5, esc(root)))
    for title, leaves, color, ys, cy in placed:
        out.append('<rect x="%d" y="%.0f" width="%d" height="32" rx="8" stroke-width="1.5" style="fill:var(--%s-soft);stroke:var(--%s)"/>' % (br_x, cy - 16, branch_w, color, color))
        out.append('<text x="%.0f" y="%.0f" text-anchor="middle" direction="rtl" font-size="13.5" font-weight="700" style="fill:var(--%s)">%s</text>' % (br_x + branch_w / 2, cy + 5, color, esc(title)))
        for leaf, ly in zip(leaves, ys):
            out.append('<rect x="%d" y="%.0f" width="%d" height="%d" rx="12" stroke-width="1.2" style="fill:var(--paper);stroke:var(--%s)"/>' % (leaf_x, ly - box_h / 2, leaf_w, box_h, color))
            out.append('<text x="%.0f" y="%.0f" text-anchor="middle" direction="rtl" font-size="12.5" style="fill:var(--ink)">%s</text>' % (leaf_x + leaf_w / 2, ly + 4.5, esc(leaf)))
    out.append('</svg></div>')
    return '\n'.join(out)


def fill_placeholders(path, svgs):
    with io.open(path, encoding='utf-8') as f:
        s = f.read()
    for name, html in svgs.items():
        marker = '<!--SVG:%s-->' % name
        if marker not in s:
            sys.exit('marker missing in %s: %s' % (path, marker))
        s = s.replace(marker, html)
    if '<!--SVG:' in s:
        sys.exit('unfilled marker left in ' + path)
    with io.open(path, 'w', encoding='utf-8', newline='\n') as f:
        f.write(s)


def grid(label, headers, rows, widths, first_color='accent', min_width=640, row_h=40):
    """Table as SVG; the first column is the rightmost one."""
    W = sum(widths) + 40
    H = 20 + 36 + len(rows) * row_h + 14
    xs = []
    x = W - 20
    for w in widths:
        x -= w
        xs.append(x)
    out = ['<div class="panel scroll"><svg viewBox="0 0 %d %d" width="100%%" style="min-width:%dpx;display:block" role="img" aria-label="%s">' % (W, H, min_width, esc(label))]
    for i, h in enumerate(headers):
        if not h:
            continue
        out.append('<rect x="%d" y="14" width="%d" height="32" rx="8" style="fill:var(--ink)"/>' % (xs[i] + 3, widths[i] - 6))
        out.append('<text x="%.0f" y="35" text-anchor="middle" direction="rtl" font-size="13.5" font-weight="700" style="font-family:var(--display);fill:var(--bg)">%s</text>' % (xs[i] + widths[i] / 2, esc(h)))
    for r, row in enumerate(rows):
        y = 54 + r * row_h
        for i, cell in enumerate(row):
            tone = None
            if isinstance(cell, tuple):
                cell, tone = cell
            cx = xs[i] + widths[i] / 2
            if i == 0:
                c = first_color
                out.append('<rect x="%d" y="%d" width="%d" height="%d" rx="8" stroke-width="1.5" style="fill:var(--%s-soft);stroke:var(--%s)"/>' % (xs[i] + 3, y, widths[i] - 6, row_h - 8, c, c))
                out.append('<text x="%.0f" y="%.0f" text-anchor="middle" direction="rtl" font-size="13.5" font-weight="700" style="fill:var(--%s)">%s</text>' % (cx, y + (row_h - 8) / 2 + 5, c, esc(cell)))
            else:
                stroke = tone or 'line'
                fill = (tone + '-soft') if tone else 'paper'
                out.append('<rect x="%d" y="%d" width="%d" height="%d" rx="8" stroke-width="1.2" style="fill:var(--%s);stroke:var(--%s)"/>' % (xs[i] + 3, y, widths[i] - 6, row_h - 8, fill, stroke))
                out.append('<text x="%.0f" y="%.0f" text-anchor="middle" direction="rtl" font-size="12.5" style="fill:var(--ink)">%s</text>' % (cx, y + (row_h - 8) / 2 + 4.5, esc(cell)))
    out.append('</svg></div>')
    return '\n'.join(out)
