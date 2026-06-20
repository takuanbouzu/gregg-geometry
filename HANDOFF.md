# Gregg Geometry — Session Handoff

_Last updated: 2026-06-20. Repo: `~/Code/gregg-geometry` (local git; SSH push set up for GitHub account **takuanbouzu** but **not yet pushed**)._

This is the live handoff for the next Claude Code session. Read it first.

---

## What this site is

An interactive web exhibit of Gregg Fleishman's geometric system (the "Lost Triangle"
`1 : √2 : √3`, the rhombic dodecahedron, the FCC lattice, his furniture/architecture).
Static HTML pages — no build step. Three.js (r128 global, or ES-module) + GSAP for the
animated pages; plain SVG/Canvas elsewhere. Served as static files.

---

## Design system (the spine of the site)

Three shared assets in `assets/` drive everything:

- **`gf-tokens.css`** — the canonical token system. Dark ("Gregg Night") is the default;
  `:root[data-theme="light"]` is the light ("Paper") palette. Defines ground/chrome
  (`--bg`, `--bg-surface`, `--bg-elevated`, `--tx`, `--tx-dim`, `--accent` = gold `#C8A96E`
  dark / `#8A6A2F` light), the **geometry role contract** (`--geo-unit/face/space/tri/angle`,
  shared verbatim by brand pages and the WebGL scenes so chrome + 3D match), fonts
  (Syne / Cormorant Garamond / Space Grotesk / Space Mono), the shared sticky nav (`#gfnav`),
  and the pinned sun/moon toggle component (`.gf-toggle`).
- **`gf-theme.js`** — the light/dark controller. Loaded **synchronously in `<head>`** so it
  applies the stored theme before first paint (no flash). Sets `data-theme="light"` on
  `<html>` (absent = dark), persists to `localStorage['gf-theme']`, syncs the toggle glyph,
  and fires a `gf-themechange` event on `document`. API: `window.gfTheme.get()/.set()/.toggle()`.
- **`gf-scene.js`** — shared night/paper **geometry palette for the WebGL pages**
  (`window.GF_SCENE.active()` → `{ink,grid,ghost,muted,unit,face,space,tri,angle,halo}` as CSS
  strings; `.onChange(cb)`, `.reload`). Mirrors the instrument so all 3D scenes match.

### How each page themes (three patterns)
1. **Pure CSS pages** (`mathematics.html`) — tokens only; theme live, no JS scene.
2. **WebGL deep-dives** (`lost-triangle`, `cube-diagonals`, `rhombic-dodecahedron`,
   `silver-triangle`, `vector-house`, `lost-triangle-construction-3d`) — read colors from
   `GF_SCENE.active()` and **reload on toggle** (`GF_SCENE.onChange(GF_SCENE.reload)`) to rebuild
   the scene in the new palette. `fleishman-sequence` is the same idea with its own `P` palette
   object and a reload that **preserves scroll** (long narrative).
3. **Live-recolor pages** (`index` instrument, `lost-triangle-construction.html` SVG) — recolor
   without reload. `index` bridges the nav toggle ↔ its own 3-theme engine (`applyTheme`,
   night↔paper) bidirectionally with a `gfThemeSyncing` guard. The SVG construction reads CSS
   vars live, so toggling `data-theme` recolors it instantly.

### Conventions to respect
- **Angle precision** (see also the `gregg-angle-precision-convention` memory):
  - **Reference / confirmed-geometry pages** keep **precise decimals** — `35.264°`, `54.736°`,
    `70.5°`, `109.5°`, `125.25°`, `144.75°`. Never round these. Pages: `index` Geometry Lesson,
    `lost-triangle`, `cube-diagonals`, `rhombic-dodecahedron`, `silver-triangle`, `vector-house`,
    `poster`, both `lost-triangle-construction*` pages.
  - **Narrative interactive** (`fleishman-sequence`) uses deliberately **rounded whole degrees**
    (`70° = 2×35°`, `120°`). Leave as-is.
- The **poster SVG** is a fixed cream print — it does **not** invert with theme (only its page
  frame does). Treat like a framed print.
- WebGL **furniture materials** in `fleishman-sequence` (`#2B2533` aubergine / `#C9A77B` birch)
  are physical objects — left theme-neutral on purpose.

---

## Page inventory (all themeable, dark default)

| File | What it is | Theme mechanism |
|---|---|---|
| `index.html` | The instrument (3D Geometry Lesson, gated `/command` aside) | nav toggle ↔ `applyTheme` bridge |
| `mathematics.html` | "The Lost Triangle" narrative (Gregg's drawings) + links to the constructions | CSS tokens |
| `fleishman-sequence.html` | Big scroll narrative (2D canvas + 3D) | `P` palette + reload w/ scroll preserve |
| `lost-triangle.html` | Lost-Triangle 3D orbit viewer | `GF_SCENE` + reload |
| `cube-diagonals.html` | Cube diagonals 3D | `GF_SCENE` + reload |
| `rhombic-dodecahedron.html` | Rhombic dodecahedron 3D | `GF_SCENE` + reload |
| `silver-triangle.html` | Silver triangle / σ=1+√2 3D | `GF_SCENE` + reload |
| `vector-house.html` | Vector House DXF/fold 3D | `GF_SCENE` + reload |
| `poster/poster.html` | Print poster (fixed cream SVG) + frame | tokens (print stays cream) |
| `lost-triangle-construction.html` | **NEW** GSAP 2D SVG construction (1:√2:√3) | live CSS-var recolor (no reload) |
| `lost-triangle-construction-3d.html` | **NEW** GSAP 2D→3D construction | `GF_SCENE` + reload |

`docs/dorman-luke-duality-research.md` — **NEW** research report (theory: Dorman Luke
construction, dual polyhedra, the Pearce/Fuller/Wachsmann lineage). Reference, not a page yet.

The shared nav has **8 canonical items** (Geometry Lesson, The Lost Triangle, Fleishman
Sequence, Cube Diagonals, Rhombic Dodecahedron, Vector House, Silver Triangle, Poster) + the
toggle. The nav scrolls horizontally with the toggle pinned right.

---

## OUTSTANDING — pick up here

1. **Promote the two construction pages into the global nav.** They are currently reachable
   only via `mathematics.html` (two outline buttons) and direct URL; they are NOT in the shared
   8-item nav, so they feel second-class and their own nav doesn't list them. Decide the IA
   (likely a 9th/10th nav item, or a sub-group under "The Lost Triangle") and apply the nav
   markup to **all 11 pages** for consistency (root pages use `lost-triangle-construction*.html`;
   `poster/poster.html` needs `../` prefixes). This was deferred as an end-of-session IA call.

2. **Build the Dorman Luke interactive lesson.** `docs/dorman-luke-duality-research.md` §7
   explicitly proposes this as a core lesson: show how the slot joint (vertex figure) →
   circumcircle tangents → rhombic face → rhombic dodecahedron (Voronoi cell of FCC), the
   cuboctahedron → rhombic dodecahedron dual, and the √2 face-diagonal ratio. This is the
   biggest remaining build. It would become a new themed page (use `gf-tokens` + `gf-theme` +
   `gf-scene` from the start) and a nav item.

3. **Merge the Dorman Luke research into the Master Context doc** in Drive
   (`…/Gregg Fleishman Legacy Project/03_MASTER_CONTEXT/`) as a new section — the research file
   itself recommends this (§7.2). Not done this session (separate doc, in Drive not the repo).

4. **Push to GitHub.** Nothing is pushed yet. SSH is configured (account `takuanbouzu`); set the
   remote to SSH and push when ready. User said to push only when asked.

5. _(Optional polish)_ Upgrade the `GF_SCENE`-reload deep-dives to **live recolor** (like the
   `index` instrument and the SVG construction) so toggling doesn't reload. Lower priority; the
   reload is reliable and the deep-dives are single-view.

---

## Dev / preview notes

- Node is at `~/.local/node` (not on PATH): prefix with `export PATH="$HOME/.local/node/bin:$PATH"`.
- **Preview**: the Claude Preview MCP can't serve the Drive path; this repo lives in `~/Code` and
  `/tmp/gregg-preview` is a **symlink** to it, served by `.claude/launch.json` config **`gregg`**
  on **port 8766** (`python3 -m http.server`). Start: `preview_start({name:"gregg"})`. If a stale
  python server holds 8766, `lsof -ti:8766 | xargs kill -9` then restart.
- The preview **caches HTML** aggressively and prefetches nav links — always **cache-bust** when
  re-checking an edited page: `location.replace(url + '?cb=' + Date.now())`.
- WebGL/GSAP rAF is **throttled** in the headless preview until you interact. To screenshot a
  finished animation, drive the scrub: `scrub.value=1000; scrub.dispatchEvent(new Event('input',{bubbles:true}))`.
  Use `preview_screenshot` (compositor) for WebGL — DOM measurements often read 0 in this preview.

---

## This session's commits (newest first)

- `Convert fleishman-sequence to the GF system with light/dark`
- `Reskin the 6 legacy pages to the GF system with light/dark`
- `Make the GF design system themeable + add a shared light/dark toggle`

Plus the in-progress commit incorporating the two construction deliverables + this handoff (the
2 construction pages, `docs/dorman-luke-duality-research.md`, `mathematics.html` links).
