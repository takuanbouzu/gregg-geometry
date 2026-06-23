# CLAUDE.md

Guidance for AI assistants working in the **gregg-geometry** repository.

## What this project is

This is the **Gregg Fleishman Legacy Project** — an interactive web archive of the
geometric system underlying the architecture and sculpture of artist/architect
Gregg Fleishman. The central idea is a single **root triangle** with edge ratios
`1 : √2 : √3` (unit edge : face diagonal : space diagonal of a cube), from which an
entire architectural language is derived.

Treat this as a **legacy system and geometry archive**, not a generic website. The
framing, vocabulary, and mathematical claims matter. Do not "clean up" content into a
marketing site, and do not soften or overstate the math (see *Confidence levels* below).

## Tech stack & architecture

- **Pure static site.** No build step, no package manager, no bundler, no framework.
  Every page is a single self-contained `.html` file with inline `<style>` and inline
  `<script>`. Just open the files in a browser.
- **Three.js r128** loaded from CDN (`cdnjs.cloudflare.com/.../three.min.js`) is the
  only external dependency. It powers all WebGL geometry rendering.
- **2D canvas** (`getContext('2d')`) is used inside the Three.js pages to render text
  sprites/labels.
- **No backend, no data files.** All geometry is constructed procedurally in JS.
- Rendering loop is a standard `requestAnimationFrame` animate loop with auto-rotating
  cameras and opacity/grow tweening per stage.

### Page map

| File | Role |
|------|------|
| `index.html` | **Primary hub** — the multi-stage "Geometry Lesson". The biggest and most important file (~870 lines). |
| `cube-diagonals.html` | Legacy deep dive: cube diagonals. |
| `lost-triangle.html` | Legacy deep dive: the "Lost Triangle". |
| `rhombic-dodecahedron.html` | Legacy deep dive: rhombic dodecahedron. |
| `silver-triangle.html` | Standalone deep dive: silver ratio / silver triangle. |
| `vector-house.html` | Standalone deep dive: the "Vector House" / silver fold. |
| `poster/poster.html` | "Infinite Architecture" poster page (embeds the SVG). |
| `poster/Fleishman_Geometry_Poster_v1.svg` / `.png` | Poster source art. |
| `assets/` | Raster reference imagery (`handsketch.jpg`, `arch/*.jpg`). **Currently not referenced by the live pages** — the build is intentionally image-free (geometry is drawn as linework instead). |
| `CODEX_HANDBACK.md` | Historical handoff notes from a prior build pass. Useful context; not a spec. |

## How `index.html` is structured (the important file)

The Geometry Lesson is a **stage-based** interactive. Read these key sections before
editing:

- **`THEMES`** (~line 236): three named themes — `night`, `paper`, `present`. Each
  defines `bg` gradient stops, `fog`, and a palette mapping **roles** → hex colors
  (`unit`, `face`, `space`, `tri`, `angle`, `ink`, axes `xA/yA/zA`, etc.).
  **`paper` (Editorial Paper, warm cream) is the current default** (`let theme=THEMES.paper`).
- **Geometry builders** (~lines 284–365): helper functions `line()`, `glowLine()`,
  `dot()`, `triFill()`, `label()`. Every primitive is tagged with `userData` describing
  *when* and *how* it appears.
- **`STAGES`** array (~line 629): 9 stages, each `{n, title, conf, confTxt, body, cam:{az,el,r}}`.
  The camera target (`cam`) animates per stage.
- **`LAYERS`** array (~line 589): 10 toggleable layers — `sketch`, `construction`,
  `labels`, `ratios`, `angles`, `cube`, `roottri`, `rhombic`, `dihedral`, `axes`
  (axes off by default). Each layer becomes available at a minimum stage (the `avail`
  map inside `setStage`).
- **`setStage(n)`** (~line 668): the core state transition — clamps `n`, fades the
  caption, retargets the camera, resets grow animations, updates stage dots, and
  enables/disables layer toggles based on stage availability.
- **`VIEWS`** (~line 848): camera presets for the view switcher (top / front / side / perspective).
- **Navigation**: keyboard (`ArrowRight/Down` next, `ArrowLeft/Up` prev, `Escape`
  closes info), a hamburger page menu (`#pagemenu`), a settings gear (`#settings`,
  theme switcher), stage dots (`#dots`), and a view switcher (`#views`).

### The per-object convention (`userData` / opt)

Every geometry primitive is created with an options object that drives visibility and
animation. Match this shape when adding geometry:

```js
line(O, A, 'unit', {
  stage: 2,            // first stage at which this appears
  maxStage: 7,         // last stage it stays visible (null = forever)
  layer: 'construction',// which layer toggle controls it
  maxOp: 1,            // peak opacity
  grow: true,          // animate drawing-in when its stage is entered
  overlay: false,      // render as overlay (used by the hand-sketch layer)
  always: false,       // ignore stage gating, always visible
  desc: { t: 'Title', b: 'Body text shown in the info box' }
});
```

Roles passed as the color argument (`'unit'`, `'face'`, `'space'`, `'tri'`, `'angle'`,
`'ink'`, `'xA'`/`'yA'`/`'zA'`) resolve through the active theme, so geometry recolors
automatically when the theme changes. **Never hardcode hex colors on geometry** — use a
role so theme switching keeps working.

Coordinate convention: **Z is up** (`camera.up.set(0,0,1)`). The root triangle uses
`O=(0,0,0)`, `A=(1,1,0)`, `B=(1,1,1)` (origin, face-diagonal endpoint, space-diagonal endpoint).

## Confidence levels — a core project convention

Each stage carries a **confidence tag** (`conf` + `confTxt`) and you must respect this
distinction. The math is honestly graded:

- `confirmed` → *"Confirmed geometry"* — provable, established fact.
- `interp` → *"Gregg-system interpretation"* / built-work claims.
- `hyp` → *"Investigation · not proven"* — e.g. Stage 6 silver ratio.

When editing captions or adding claims, **keep this honest grading**. Do not promote a
hypothesis to confirmed, do not state investigations as proven, and preserve the visual
distinction (the `conf-confirmed` / `conf-interp` / `conf-hyp` caption styling).

## Shared conventions across all pages

- **`#gfnav`** top navigation bar appears on every page with consistent links
  (Geometry Lesson, Cube Diagonals, Lost Triangle, Rhombic Dodecahedron, Vector House,
  Silver Triangle, Poster). The current page is marked `class="active"`, others
  `class="inactive"`. **When adding or renaming a page, update the nav on every page.**
- **Warm cream / editorial paper palette** is the shared visual identity: radial
  `#fffaf0 → #f6f2e8 → #e8deca` background, ink `#141414`, and the role colors
  blue `#1769ff` (unit), orange `#e2811f` (face), pink/red `#d9295f` (space),
  green `#23a76d` (triangle), gold `#927400` (angle). Reuse these, don't invent new ones.
- **Inline favicon** `<link rel="icon" href="data:,">` on every page — keeps the console
  free of `favicon.ico` 404 noise. Keep it.
- **Font**: Inter with system-font fallbacks.
- **Mobile**: pages use `@media` breakpoints (commonly `max-width:720/820/900px`) that
  hide side panels and make the nav horizontally scrollable. Mobile is usable but dense;
  test small screens after layout changes.

## Development workflow

There is no build, lint, or test tooling. To work on this project:

1. **Serve statically and open in a browser.** From the repo root, run any static
   server (e.g. `python3 -m http.server`) and open `index.html`. Opening the `file://`
   directly mostly works, but a local server avoids CDN/CORS surprises.
2. **Verify by loading the page.** Confirm there are **no browser console errors** —
   historically a single stray smart-quote in the inline `<script>` caused a fatal
   `SyntaxError` that blanked the entire canvas. Because the JS is one large inline
   block, a syntax error anywhere kills the whole page. Sanity-check JS edits carefully.
3. **Click through all stages** (1→9) and toggle layers/themes/views to confirm nothing
   regressed. The deep-dive pages should each load with a clean console too.
4. There are no automated tests; prior QA was done with Playwright screenshots + console
   checks, but that is not committed tooling.

### Editing guidance

- Keep pages **self-contained** (inline style + script). Do not introduce a build step,
  npm, or split files into modules unless explicitly asked.
- Keep the only external dependency as the Three.js r128 CDN script.
- When adding geometry to `index.html`, follow the `line/dot/label/triFill` +
  `userData` opt pattern and assign a `stage`, `layer`, and color **role**.
- The build is intentionally **image-free** in the rendered pages (linework, not raster
  photos). Don't add `<img>` references to `assets/` without a clear reason.

## Git & branch workflow

- **Active development branch:** `claude/claude-md-docs-7vl3gv`. Develop and push there;
  create it locally if missing. **Never push to `main` or another branch without explicit
  permission.**
- Push with `git push -u origin <branch-name>`; retry network failures with exponential
  backoff (2s, 4s, 8s, 16s).
- After pushing, ensure a **draft pull request** exists for the branch.
- The site appears to be deployed by pushing (commit history references "Deploy …"),
  consistent with a static-host setup (e.g. GitHub Pages) serving these files directly.

## Vocabulary to verify before publishing

Some terminology is provisional and was flagged for confirmation (see `CODEX_HANDBACK.md`):
"Rhombicube" vs. another name for the rhombic dodecahedron form, and the public use of
"silver fold" / "Vector House". When in doubt about naming, units, captions, dates, or
Stage 9 architecture project labels, **confirm rather than guess** — these are claims
about a real artist's body of work.
