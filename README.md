# Gregg Fleishman — The Lost Triangle

An interactive web exhibit of architect **Gregg Fleishman's** geometric system: the
"Lost Triangle" (`1 : √2 : √3`), the rhombic dodecahedron, the FCC lattice that packs
space, and the furniture and architecture that grow out of them.

Static HTML — no build step. The animated pages use **Three.js** (ES modules) + **GSAP**;
the rest is plain SVG/Canvas. Every page shares one design system and a light/dark
("Paper" / "Night") toggle.

## Pages

| Page | What it is |
|---|---|
| `index.html` | **The Geometry Lesson** — the interactive 3D instrument |
| `mathematics.html` | **The Lost Triangle** — the narrative, with an expandable symmetry theory note |
| `fleishman-sequence.html` | A ~44s cinematic build: the plan Lost Triangle stands up into the cube, the rhombic cell, and space-filling |
| `cluster-structures.html` | A ~62s continuation: the RHOMBICUBE, two viewing axes, the truncation, and a gold-jewel close |
| `lost-triangle.html` · `cube-diagonals.html` · `rhombic-dodecahedron.html` · `silver-triangle.html` | 3D deep-dives into individual constructions |
| `lost-triangle-construction.html` · `lost-triangle-construction-3d.html` | Animated step-by-step constructions (plan → space) |
| `poster/poster.html` | The print poster (fixed cream plate) |

## Design system

Three shared assets in `assets/` drive everything:

- **`gf-tokens.css`** — the canonical tokens (ground, type, the geometry colour roles).
  Dark ("Night") is the default; `:root[data-theme="light"]` is the "Paper" palette.
- **`gf-theme.js`** — the light/dark controller (loaded synchronously, no flash);
  persists to `localStorage`, fires a `gf-themechange` event.
- **`gf-scene.js`** — the matching night/paper **geometry palette for the WebGL pages**,
  so 3D scenes and page chrome stay in sync across the toggle.

The animated "movie" pages share one architecture: a single scrubbable GSAP timeline, fat
lines (`Line2`) drawn on via the render loop (seek-exact), a gimbal-free camera rig, and a
dashed "motion-guide" language that expresses each geometric movement. Add `?clean=1` to any
movie URL to hide all chrome for clean video capture.

## Run locally

No dependencies — serve the folder over HTTP (ES-module import maps need `http://`, not
`file://`):

```bash
python3 -m http.server 8000
# then open http://localhost:8000/
```

## Credits

Original drawings, artworks, and the underlying geometric work are by **Gregg Fleishman**.
Exhibit site by White Cube Society.
