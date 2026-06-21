# Claude Design — review & strategy brief

_For the next phase: review the live exhibit in Claude Design and decide how far to push
"each component more accurate and adjustable through inputs." Written 2026-06-20._

## Snapshot

- **Live:** https://takuanbouzu.github.io/gregg-geometry/ — GitHub Pages, branch `codex-web-build`.
- **Self-contained:** all runtime JS vendored under `assets/vendor/` (no CDN); only Google Fonts load
  externally (graceful fallback). The HTML is plain + static, so it imports/reviews cleanly.
- **Built this session:** the two movies (Fleishman Sequence, Cluster-Structures), the dashed
  motion-guide language, the stand-up rework, the symmetry theory note, the share + future-proofing
  pass, plus targeted graphics fixes (label haloing, Stage-6 ghost cleanup, axis-view perspective
  flatten). See `HANDOFF.md` for the full state and the **Graphical QA watchlist**.

## Component inventory (what could become adjustable)

| Component | Today | Already interactive? |
|---|---|---|
| Instrument (`index.html`) | 10-stage lesson, orbit/zoom, layer toggles, stages | **Yes** — most parametric already |
| Movies (`fleishman-sequence`, `cluster-structures`) | choreographed films; scrub/speed/replay, `?clean=1` | Timeline only (geometry is fixed) |
| Deep-dives (`lost-triangle`, `cube-diagonals`, `rhombic-dodecahedron`, `silver-triangle`) | 3-D orbit/zoom viewers | **Yes** — orbit, no parameter inputs |
| Constructions (`*-construction*.html`) | animated step-by-step (2-D + 3-D) | Timeline only |
| Poster | fixed print plate | No (by design) |

## "More accurate" — mostly a sign-off task, not engineering

The geometry is already mathematically exact (rhombic dodecahedron, the 26-face truncation, the
1 : √2 : √3 triangle, `arctan(1/√2)` angles — all verified). What's left under "accurate" is
**editorial, gated on Gregg**, not code:

- Confirm the Vector House DXF values (`M = 66√2`, etc.) and the "Vector House" / "silver fold"
  vocabulary → then un-hide the page.
- Decide the angle-precision convention (rounded vs `35.264°`).
- Optional 1:1 fidelity adds (e.g. the red √4 "next-root" triangles in the fleishman opener) — small,
  contained code.

Net: near-zero engineering for "accuracy"; the bottleneck is Gregg's confirmation.

## "Adjustable through inputs" — feasibility, in three tiers

**Tier A — cheap, high ROI (the already-interactive pages).** The deep-dives already orbit/zoom and
their geometry is built by parameterisable functions. Add a small set of sliders/number-fields bound
to existing builders: truncation amount `t` (rhombicube), array/neighbour count (space-fill), fold
angle (Vector House), silver-ratio `σ` exploration, viewing axis. The instrument's Stage 5
("Interactive Controls") is the natural home for live manipulation. **Worth doing.**

**Tier B — build the framework once.** A shared, themed **parametric control panel** that extends the
GF design system (sliders/toggles/number inputs that match the nav + sun/moon toggle). Build once,
reuse on every page cheaply. This is the smart investment that makes Tier A fast everywhere.

**Tier C — heavy, diminishing returns.** Making the **movies** fully adjustable fights their nature —
they're choreographed films and their value is the narrative. Better to pair a movie with a separate
"explore" page, or expose just 1–2 params in a paused mode (the cluster truncation `t` is already a
parameter — cheap to surface). A universal "every value adjustable" CAD-style rebuild is essentially
a new product (multi-week). **Recommend selective, not wholesale.**

## Bandwidth estimate (rough, in focused half-day sessions)

| Work | Estimate |
|---|---|
| Shared themed control-panel component (Tier B framework) | ~1 session |
| Wire meaningful sliders into 3 deep-dive pages (Tier A) | ~1–1.5 sessions |
| Instrument Stage-5 live-manipulation controls | ~1 session |
| Surface `t` (+ maybe ratio) as a paused "explore" control in Cluster-Structures | ~0.5–1 session |
| **Strong "adjustable v1" across the interactive pages** | **~4–5 sessions** |
| Movies-as-sandboxes / every-value-adjustable (Tier C) | + several sessions each, sharp ROI drop |

## Recommendation

1. **Build the shared control-panel component, then add sliders to the pages that are already
   interactive** (deep-dives + instrument). Highest ratio of insight-per-effort.
2. **Leave the movies as films** — optionally one or two "explore" toggles, not a full sandbox.
3. **Skip the universal parametric rebuild** unless the goal becomes a teaching-tool *product*.
4. **"More accurate" = get Gregg's sign-off** (values, vocabulary, angle convention); the code is
   ready for it.

## Open decisions to settle in the review

- Angle convention (rounded vs precise) — pending Gregg.
- Vector House data/vocabulary — pending Gregg; page hidden until confirmed.
- How far to take parametric controls (Tier A only, or A+B, or beyond).
