# Codex Handback - Gregg Geometry Site

**Branch:** `codex-web-build`  
**Date:** 2026-06-17  
**Preview:** from the repo root, serve the static files and open `index.html`.

## What I built

- Installed the new 10-stage Geometry Lesson prototype as the site hub at `index.html`.
- Preserved the previous cube-diagonals page as `cube-diagonals.html`.
- Copied the lesson assets into the repo:
  - `assets/handsketch.jpg`
  - `assets/arch/*.jpg`
  - `poster/poster.html`
  - `poster/Fleishman_Geometry_Poster_v1.svg`
  - `poster/Fleishman_Geometry_Poster_v1.png`
- Added shared navigation across the hub, legacy pages, and poster.
- Added Stage 9 architecture image cards with lazy texture loading.
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
- Added: `CODEX_HANDBACK.md`

## TODO(claude)

- `index.html`: verify every Stage 9 architecture photo caption, date, and project label before publication.
- Confirm whether "Rhombicube" should be the public-facing standard name or whether Gregg prefers another term.
- Confirm whether the Stage 6 silver ratio framing should remain an investigation or can be stated more directly.
- Confirm whether the Stage 10 XYZ Cartesian expansion should stay labelled as hypothesis.

## Known issues / not yet built

- Separate `vector-house.html` and `silver-triangle.html` pages were not built in this pass. Their concepts are represented inside the lesson stages, but the requested standalone pages remain lower-priority follow-up work.
- Mobile is usable but dense. The nav scrolls horizontally, and the layer panel/rail fit, but final visual polish should tune small-screen spacing.
- I did not push to GitHub yet; the branch is local and ready for review/commit/push.

## Verification

Tested with Playwright against a temporary local Node static server:

- `index.html` loads with no browser console errors or warnings.
- Clicked through to Stage 9; Stage 9 caption and toggles are visible.
- Architecture image requests all returned `200 OK`.
- `cube-diagonals.html`, `lost-triangle.html`, `rhombic-dodecahedron.html`, and `poster/poster.html` all load with clean browser consoles.
- Desktop and mobile screenshots were captured during QA and visually inspected.
- Screenshot pixel samples confirmed nonblank rendered output:
  - desktop 1440x1000 sample pixels included `(96,116,117,255)` and `(82,86,93,255)`
  - mobile 390x844 sample pixels included `(87,105,105,255)` and `(88,94,102,255)`

## Prompt for Claude Code to continue

Continue the Gregg Fleishman Legacy Project in the `gregg-geometry` repo on branch `codex-web-build`. Read `CODEX_HANDBACK.md`, then verify the geometry, captions, dates, and terminology. Highest priority: confirm or rewrite the Stage 9 architecture captions and dates, then polish the mobile layout. Lower priority: build standalone `vector-house.html` and `silver-triangle.html` pages if still desired. Preserve the project framing as a legacy system and geometry archive, not a website cleanup.
