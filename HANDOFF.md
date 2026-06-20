# Gregg Geometry — Session Handoff

_Last updated: 2026-06-20. Repo: `~/Code/gregg-geometry`. SSH remote `takuanbouzu/gregg-geometry`; the shareable build is on **`codex-web-build`** (pushed). `main` is a separate, older "deploy design pass" (cream default, hamburger menu, view switcher) — intentionally left untouched; reconcile later if wanted._

This is the live handoff for the next Claude Code session. Read it first.

---

## Pre-share status (2026-06-20)

The site was taken to a shareable state: integrity-swept (all internal links/images resolve;
nav consistent — 8 items, 1 active per page; no console errors across every page in night + paper),
`README.md` added, and OG/Twitter social meta added to `index.html` (base URL is the GitHub Pages
default `https://takuanbouzu.github.io/gregg-geometry/` — the project Pages URL is the same whatever
branch serves it; update only if a custom domain is used).

- **Vector House is HIDDEN** — removed from the nav site-wide (file kept, reachable only by direct
  URL) and its visible dev-note stripped, pending confirmation with Gregg of the DXF-derived values
  (`M = 66√2`, etc.) and the "Vector House"/"silver fold" vocabulary. Re-add to nav once confirmed.
- **To go live:** in the repo's **Settings → Pages**, set Source = "Deploy from a branch", Branch =
  **`codex-web-build`**, folder = `/ (root)`. (Claude can't toggle Pages.) The site appears at
  `https://takuanbouzu.github.io/gregg-geometry/`. If a custom domain is used, update the `og:`/
  `twitter:` URLs in `index.html`.

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
   the scene in the new palette.
3. **Live-recolor pages** (`index` instrument, `lost-triangle-construction.html` SVG) — recolor
   without reload. `index` bridges the nav toggle ↔ its own 3-theme engine bidirectionally.

### Conventions to respect
- **Angle precision** (see also the `gregg-angle-precision-convention` memory):
  - **Reference / confirmed-geometry pages** keep **precise decimals** — `35.264°`, `54.736°`,
    `70.5°`, `109.5°`, `125.25°`, `144.75°`. Never round these. Pages: `index` Geometry Lesson,
    `lost-triangle`, `cube-diagonals`, `rhombic-dodecahedron`, `silver-triangle`, `vector-house`,
    `poster`, both `lost-triangle-construction*` pages.
  - **Narrative movies** (`fleishman-sequence`, `cluster-structures`) use Gregg's voice and may
    use rounded or precise angles as appropriate to the caption.
- The **poster SVG** is a fixed cream print — it does **not** invert with theme (only its page
  frame does). Treat like a framed print.

---

## Page inventory (all themeable, dark default)

| File | What it is | Theme mechanism |
|---|---|---|
| `index.html` | The instrument (3D Geometry Lesson) | nav toggle ↔ `applyTheme` bridge |
| `mathematics.html` | "The Lost Triangle" narrative + links to constructions | CSS tokens |
| `fleishman-sequence.html` | ~44s √2-sequence movie (Three.js ESM + GSAP) | `GF_SCENE` + reload |
| `lost-triangle.html` | Lost-Triangle 3D orbit viewer | `GF_SCENE` + reload |
| `cube-diagonals.html` | Cube diagonals 3D | `GF_SCENE` + reload |
| `rhombic-dodecahedron.html` | Rhombic dodecahedron 3D | `GF_SCENE` + reload |
| `silver-triangle.html` | Silver triangle / σ=1+√2 3D | `GF_SCENE` + reload |
| `vector-house.html` | Vector House DXF/fold 3D — **HIDDEN from nav** (see Pre-share status) | `GF_SCENE` + reload |
| `poster/poster.html` | Print poster (fixed cream SVG) + frame | tokens (print stays cream) |
| `lost-triangle-construction.html` | GSAP 2D SVG construction (1:√2:√3) | live CSS-var recolor |
| `lost-triangle-construction-3d.html` | GSAP 2D→3D construction | `GF_SCENE` + reload |
| `cluster-structures.html` | ~62s MathPoster continuation movie (rhombicube → truncation → gold jewel) | `GF_SCENE` + reload |

`docs/dorman-luke-duality-research.md` — research report on Dorman Luke construction + dual polyhedra lineage. Reference only; not yet a page.

`docs/fleishman-sequence-design-zip.html` — **the reference file for the new fleishman-sequence direction** (Claude Design output, preserved from the incoming zip). This is the source for Outstanding #1.

`docs/artwork-gold.png` — gold rhombic dodecahedron artwork, potential closing-frame reference for the movies.

---

## NEW DIRECTION — from the 2026-06-20 incoming zip (`01_INCOMING/Design to code.zip`)

Claude Design produced `fleishman-sequence.html` as a **45-second continuous cinematic movie** using
Three.js r160 (ESM import-map) + GSAP 3.12. This is the intended direction for the animated pages —
**not** the old step-based scroll-narrative. The design zip version is preserved at
`docs/fleishman-sequence-design-zip.html`.

**Key architecture of the new movie pages:**
- One scrubbable GSAP timeline (`tl`, exposed as `window.__tl`).
- Fat-line strokes via `Line2 / LineGeometry / LineMaterial` (crisp at any size, `frustumCulled = false`).
- Draw-on is **render-loop-driven** (not GSAP `onUpdate`) via `updateDraws(tl.time())` so seeking works.
- GSAP drives only: camera props, material opacities (`fade()`), caption cross-fades (`showCap()`).
- Gimbal-free camera rig: `pivot` Group at look-at target, camera child at `(0,0,R)`.
- Controls: Replay, Pause, scrub slider (drives drawing + camera), speed selector.
- `?clean=1` hides all chrome for video capture.
- Palette reads from `GF_SCENE.active()`, reloads on theme change via `GF_SCENE.onChange(GF_SCENE.reload)`.

**Semantic palette (never changes with theme):**
```
bone / unit   →  GF_SCENE.ink      (#F0EDE8 dark / #141414 light)
dim           →  GF_SCENE.muted    (#8A8480 dark / #6b665d light)
gold / accent →  GF_SCENE.angle    (#C8A96E dark / #927400 light)
face  / √2    →  GF_SCENE.face     (#4A90D9 dark / #e2811f light)  ← blue, semantic
space / √3    →  GF_SCENE.space    (#E0349E dark / #d9295f light)  ← magenta, the signature
green / tri   →  GF_SCENE.tri      (#3CCB8E dark / #23a76d light)
```

The MathPoster (`01_INCOMING/MathPoster_ClusterStructures_2005.pdf`) — "Gregg Fleishman's
CLUSTER-STRUCTURES · The Future of Building" (2005) — is the source document for the
`cluster-structures.html` continuation movie. It shows:
- (A) Rhombic Dodecahedron (RHOMBICUBE) — the starting form
- (B) Face dimensions (√2:1)
- (C) Truncated Rhombicube — cut the points → 12 squares + 8 triangles + 6 squares = 26 faces
- (D) Adjacent array with cuboctahedra filling corners
- (E) GT (Great Truncated) Rhombicube — cube faces → octagons, triangle → hexagons
- (F) GT array with truncated octahedra at corners
- (G) Checkerboard array with truncated tetrahedra + truncated cubes
- Forms: T (tetra), O (octa), C (cube), CO (cuboctahedron), TO (trunc. octa), TT (trunc. tetra), TC (trunc. cube)
- Title close: **THINK BIG · CLUSTER-STRUCTURES · The Future of Building**

---

## DESIGN PRINCIPLES (from the 2026-06-20 Claude Design handoff bundle)

The bundle `01_INCOMING/Design agent prompt file-handoff.zip` carried the **design brief +
acceptance rubric** for the movie pages (the three HTML files in it were byte-identical to
`docs/fleishman-sequence-design-zip.html`). Brief + reference imagery are vaulted in
`docs/reference/`:
- `fleishman-sequence-brief.md` — the full spec + §8 acceptance rubric. **The quality bar for
  both movies.** Key rules: Gregg is the main character (his vocabulary only — *module, √2
  system, Lost Triangle, rhombic cell, RHOMBICUBE, space-filling*); **zero academic terms on
  screen** (no "dual polyhedron / cuboctahedron / Voronoi / Dorman Luke"; "octahedron" is OK);
  one element at a time; the √2 is the visible through-line; legibility over density.
- `root-sequence.png`, `lost-triangle-color.png`, `lost-triangle-template.png`,
  `fleishman-sequence-poster.png`, `artwork-gold.png` — fidelity references. The gold-on-black
  rhombic-dodecahedron in `artwork-gold.png` is the **closing aesthetic** (echoed by the
  cluster-structures jewel close).

---

## OUTSTANDING — pick up here

### ✅ 1. DONE — `fleishman-sequence.html` rebuilt on the movie direction (2026-06-20)

Replaced the old step-based narrative with the design-zip movie, adapted to the GF system:
themed chrome from `gf-tokens`, shared `#gfnav` (fixed over the canvas), palette from
`GF_SCENE.active()` + `GF_SCENE.onChange(GF_SCENE.reload)`, `?clean` capture mode, retitled.
Verified in night **and** paper themes, clean console.

**Act 2 rework (stand-up):** instead of fading the flat plan and drawing a fresh cube, the
magenta **Lost Triangle now physically stands up and turns** during the quarter-orbit and lands
exactly on the cube's space-diagonal proof triangle (a vertex morph `stand.p 0→1`, mapped
plan-vtx → `[A, O, B]` so its edges become the √2 leg `O–A`, the √3 hypotenuse `O–B`, and the
unit lift `A–B`; rebuilt per-frame via `updateStand()` in the render loop, so it seeks cleanly).
Act 3a then builds the cube *around* it and `faceDiag`/`lift` overlay its legs; the separate
`spaceDiag`/green `proofFill` draws were dropped (the standing magenta hypotenuse is the √3).
This demonstrates the plan→space geometric connection Gregg's drawing implies — and removed an
edge-on fat-line artifact the old fade produced. _Original adaptation spec, for reference:_

- Add `<link rel="stylesheet" href="assets/gf-tokens.css">` in `<head>`
- Add `<script src="assets/gf-theme.js"></script>` and `<script src="assets/gf-scene.js"></script>` in `<head>` (sync, before module script)
- Read palette from `GF_SCENE.active()` instead of hardcoded hex values:
  ```js
  const SC = GF_SCENE.active();
  function hex(s){ return parseInt(s.replace('#',''), 16); }
  const COL = { bg:hex(SC.bg[1]), bone:hex(SC.ink), dim:hex(SC.muted),
                gold:hex(SC.angle), face:hex(SC.face), space:hex(SC.space), green:hex(SC.tri) };
  const HEX = { bone:SC.ink, dim:SC.muted, gold:SC.angle, face:SC.face, space:SC.space, green:SC.tri };
  ```
- Call `GF_SCENE.onChange(GF_SCENE.reload)` after palette setup
- Replace the `#brand` div with the shared `<nav id="gfnav">` (see any existing page for markup)
- Add `cluster-structures.html` to the nav as a new item
- Add `body.clean #gfnav{opacity:0;pointer-events:none}` to CSS (already has `body.clean #controls`)
- Update `<title>` to "Fleishman Sequence — Gregg Fleishman"

The `#stage{position:fixed;inset:0;z-index:0}` + `#gfnav{position:fixed;z-index:20}` combination
works correctly — the nav floats over the fullscreen canvas.

### ✅ 2. DONE — `cluster-structures.html` built (2026-06-20)

The MathPoster continuation movie (~62s), same Three.js ESM + GSAP architecture as
fleishman-sequence. Acts: **bridge** (rhombic cell + √2 diamond) → **space-fill** (4
face-sharing neighbour cells, "the RHOMBICUBE") → **two axes** (look down an axis → square;
turn → hexagon) → **truncation** (a `morph` param 0→0.5 rebuilt per-frame via a `MorphEdge`
class: surviving edge-middles shrink, gold corner-triangle + apex-square caps blossom → "The
Truncated Rhombicube · 26 faces") → **gold-jewel title close** (12 rhombic faces filled gold,
bone outline, echoing `docs/reference/artwork-gold.png`; "CLUSTER-STRUCTURES · Think big · The
future of building" resolves on a darkened lower band, poster-style). Verified night + paper,
clean console, `?clean=1`, Replay/scrub/speed all reset cleanly (truncation is seek-exact —
`MorphEdge.update(morph.t)` runs in the render loop, never via GSAP onUpdate).

**Geometry note:** origin-centred — corners `(±0.5,±0.5,±0.5)`, apexes `(±1,0,0)…`; 24 edges at
√0.75; 12 rhombic faces; FCC neighbour offsets `(±1,±1,0)` & perms. Hex view = camera along
`(1,1,1)` (`pivot.rotation x:-π/4, y:atan(1/√2)`); square view = down `+Z`.

**Open polish (optional):** the fleishman-sequence opener still omits the red √4 "next-root"
triangles from `root-sequence.png` (noted in the brief as the only gap to a 1:1 trace).

### ✅ DASHED MOTION GUIDES — both movies (2026-06-20)

A shared "motion guide" language expresses each geometric movement (dashed lines, kept strictly
subordinate to the solids). **Implementation:** the `Stroke` class takes an optional
`{dashed,dashSize,gapSize}` — when dashed it builds a static full-length line + `computeLineDistances()`
once (shown/retired by opacity via `fade()`, never by partial progress). A `flows[]` registry +
`addFlow(mat,rate,start,end)` marches `mat.dashOffset` in the render loop, gated to
`!paused && !scrubbing` and the beat window (dt from ticker `deltaTime`, clamped 0.05) so still
frames never drift. **Dash language:** FINE static ghost `0.045/0.035` ("where it was/will be");
COARSE marching vector `0.06/0.05` ("it keeps going"); one COARSE-static gold axis `0.05/0.06`
(rotation spindle). Weight 1.2–1.4 (under every solid edge); opacity ceilings ghost ≤0.34 /
vector ≤0.30 / axis ≤0.22; colour follows GF_SCENE semantics (length→its colour, direction→bone,
axis→gold); only one guide-concept visible at a time per film. Full design rationale: the
synthesized spec from the `dashed-motion-guides-design` workflow.

Guides — **fleishman:** FL-1 stand-up destination ghost (magenta, 14.5–18s), FL-2 flowing legs
under √2/lift (blue+bone, 20–22.7s), FL-3 space-fill vector marching out (magenta, 38.9–43s).
**cluster:** CL-1 four space-fill stubs (bone, 6.6–11s), CL-2 (1,1,1) rotation-axis spindle
(gold, 21.8–29s), CL-3 truncation ghost cage — original cell held dashed while the solid truncates
inside it (bone, 31–46s). All verified in `?clean=1`, clean console, clean Replay.

_Original build spec, for reference:_

**Story arc (Gregg's voice, no academic terms):**

| Act | Duration | Caption |
|-----|----------|---------|
| Bridge | 0–5s | "The rhombic cell · every face a **√2** diamond" |
| Space fill | 5–15s | 4 neighbor cells appear; "**One module → the whole of space** · the RHOMBICUBE" |
| Two axes | 15–28s | Rotate to square-axis (90°) then hex-axis (120°) views |
| Truncation | 28–48s | Animate cutting corners: t: 0→0.5 morphing; "Cut the corners uniformly" → "**The Truncated Rhombicube** · 26 faces" |
| Close | 48–60s | Wide shot + title reveal: "**CLUSTER-STRUCTURES** · Think big · The future of building" |

**Geometry to build (all centered at origin):**

Rhombic Dodecahedron (exact):
```
corners = {(±0.5, ±0.5, ±0.5)} — 8 vertices
apexes  = {(±1,0,0), (0,±1,0), (0,0,±1)} — 6 vertices
edges   = every corner–apex pair at distance √0.75 (24 edges)
faces   = 12 rhombic quads; each = (apex_i, corner_a, apex_j, corner_b)
          where apex_i and apex_j are non-opposite and share corner_a, corner_b
```

FCC neighbor offsets for space-fill (each offset = one shared rhombic face):
```
(1,1,0), (1,-1,0), (-1,1,0), (1,0,1), (1,0,-1), (0,1,1) … (12 total)
Show 4: (1,1,0), (1,0,1), (0,1,1), (-1,1,0)
```

Truncation morphing (t: 0 → 0.5):
```
For each cell edge [corner → apex]:
  new_vtx_near_corner = lerp(corner, apex, t)
  new_vtx_near_apex   = lerp(apex, corner, t)
At t=0.5: adjacent new vertices on the same edge coincide → face collapses to square
Triangular cap per cubic corner (3-valent): 3 lerp points at t from each adjacent apex
Square cap per face apex (4-valent): 4 lerp points at t from each adjacent corner
```

Square-axis view: camera looking along (1,0,0) — shows square cross-section
Hex-axis view: camera looking along (1,1,1) direction — shows hexagonal cross-section

**Closing aesthetic:** see `docs/artwork-gold.png` — the rhombic dodecahedron rendered as a
gold-on-black jewel. The close of cluster-structures should echo this (gold fill on the faces,
white outline, dark bg), then dissolve to the title text "CLUSTER-STRUCTURES" in Syne bold.

### ✅ SYMMETRY THEORY NOTE — mathematics.html (2026-06-20)

A collapsed `<details class="theory">` note in `mathematics.html` (Section Three, "From one
triangle, everything"), closed by default and styled subordinate via tokens (works night + paper).
Three rows — Reflection → `rhombic-dodecahedron.html`, Rotation → `fleishman-sequence.html`
("stands up into space"), Translation → `cluster-structures.html` ("whole of space") — plus a
footnote: the terms only name what Gregg's constructions already do. Per Yuto's supplemental
symmetry note: a *supporting* lens only (footnote/sidebar), never a primary framework. This is the
sole place it surfaces so far — extend only if it proves useful.

### 3. Promote construction pages into the global nav (PRIORITY 2)

`lost-triangle-construction.html` and `lost-triangle-construction-3d.html` are reachable
only via `mathematics.html`. Add them to the nav on **all pages**. Suggested IA: add between
"The Lost Triangle" and "Fleishman Sequence" as "Construction 2D" and "Construction 3D".
`poster/poster.html` needs `../` prefixes on all nav hrefs.

### 4. Build the Dorman Luke interactive lesson (PRIORITY 3)

See `docs/dorman-luke-duality-research.md` §7 for the full spec. New themed page using
`gf-tokens` + `gf-theme` + `gf-scene`.

### 5. Push to GitHub (only when asked)

SSH remote is configured (account `takuanbouzu`). Push only when user explicitly requests.

---

## Dev / preview notes

- Node is at `~/.local/node` (not on PATH): prefix with `export PATH="$HOME/.local/node/bin:$PATH"`.
- **Preview**: repo lives in `~/Code/gregg-geometry`. `/tmp/gregg-preview` is a symlink to it,
  served by `.claude/launch.json` config **`gregg`** on **port 8766** (`python3 -m http.server`).
  Start: `preview_start({name:"gregg"})`. If port 8766 is held: `lsof -ti:8766 | xargs kill -9`.
- Always cache-bust when re-checking edited pages: `location.replace(url + '?cb=' + Date.now())`.
- WebGL/GSAP is throttled in headless preview until interaction. To screenshot a finished animation:
  `scrub.value=1000; scrub.dispatchEvent(new Event('input',{bubbles:true}))`.
  Use `preview_screenshot` (compositor) for WebGL — DOM measurements often read 0 in this preview.

---

## Commits to date (newest first)

- `Convert fleishman-sequence to the GF system with light/dark`
- `Reskin the 6 legacy pages to the GF system with light/dark`
- `Make the GF design system themeable + add a shared light/dark toggle`
- Plus in-progress: two construction pages + dorman-luke research + mathematics.html links
