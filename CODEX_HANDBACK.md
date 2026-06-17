# Codex Handback - Gregg Geometry Site

**Branch:** `codex-web-build`  
**Date:** 2026-06-17  
**Preview:** from the repo root, serve the static files and open `index.html`.

## What I built

- Installed the new 10-stage Geometry Lesson prototype as the site hub at `index.html`.
- Preserved the previous cube-diagonals page as `cube-diagonals.html`.
- Kept the visible build image-free for now:
  - Stage 1 uses generated notebook linework instead of the hand sketch raster.
  - Stage 9 uses schematic architecture linework instead of photo cards.
  - Raster JPG/PNG assets were removed from the branch.
- Added shared navigation across the hub, legacy pages, and poster.
- Added Stage 9 architecture schematic cards.
- Added standalone Vector House and Silver Triangle deep-dive pages.
- Added independent layer toggles for:
  - original sketch
  - construction lines
  - points and labels
  - ratios
  - angle measures
  - cube framework
  - root triangles
  - rhombic dodecahedron
  - dihedral family
  - architecture
  - XYZ axes
- Expanded the Stage 9 dihedral family labels to the full table from the brief.
- Added no-op inline favicons to prevent browser `favicon.ico` 404 console noise.

## Page map

- `index.html` - primary 10-stage Geometry Lesson hub.
- `cube-diagonals.html` - archived legacy Cube Diagonals deep dive.
- `lost-triangle.html` - legacy Lost Triangle deep dive.
- `rhombic-dodecahedron.html` - legacy Rhombic Dodecahedron deep dive.
- `poster/poster.html` - poster page, linked from all main navs and linked back to the lesson/deep dives.

## Files changed or added

- Changed: `index.html`
- Changed: `lost-triangle.html`
- Changed: `rhombic-dodecahedron.html`
- Added: `cube-diagonals.html`
- Added: `assets/`
- Added: `poster/`
- Added: `vector-house.html`
- Added: `silver-triangle.html`
- Added: `CODEX_HANDBACK.md`

## TODO(claude)

- `index.html`: verify every Stage 9 architecture caption, date, and project label before publication.
- Confirm whether "Rhombicube" should be the public-facing standard name or whether Gregg prefers another term.
- Confirm whether the Stage 6 silver ratio framing should remain an investigation or can be stated more directly.
- Confirm whether the Stage 10 XYZ Cartesian expansion should stay labelled as hypothesis.
- `vector-house.html`: confirm whether Gregg wants "silver fold" and "Vector House" used as public vocabulary, and confirm unit values before publication.

## Known issues / not yet built

- Mobile is usable but dense. The nav scrolls horizontally, and the layer panel/rail fit, but final visual polish should tune small-screen spacing.
- The branch has been pushed to GitHub as `codex-web-build`.

## Verification

Tested with Playwright against a temporary local Node static server:

- `index.html` loads with no browser console errors or warnings.
- Clicked through to Stage 9; Stage 9 caption and toggles are visible.
- Stage 9 architecture schematics render without raster image requests.
- `cube-diagonals.html`, `lost-triangle.html`, `rhombic-dodecahedron.html`, and `poster/poster.html` all load with clean browser consoles.
- `vector-house.html` and `silver-triangle.html` load as standalone interactive deep dives with clean browser consoles.
- Desktop and mobile screenshots were captured during QA and visually inspected.
- Screenshot pixel samples confirmed nonblank rendered output:
  - desktop 1440x1000 sample pixels included `(96,116,117,255)` and `(82,86,93,255)`
  - mobile 390x844 sample pixels included `(87,105,105,255)` and `(88,94,102,255)`

## Prompt for Claude Code to continue

Continue the Gregg Fleishman Legacy Project in the `gregg-geometry` repo on branch `codex-web-build`. Read `CODEX_HANDBACK.md`, then verify the geometry, captions, dates, and terminology. Highest priority: confirm or rewrite the Stage 9 architecture captions and dates, verify the new Vector House vocabulary/unit notes, and polish the mobile layout. Preserve the project framing as a legacy system and geometry archive, not a website cleanup.
