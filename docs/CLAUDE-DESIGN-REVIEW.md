# Gregg Fleishman exhibit — purpose, vision & next-phase plan

_The pass-on doc. Read this first, then `../HANDOFF.md` for the operational state. Written 2026-06-20._

---

## 1. Why this exists — the north star

Gregg's goal is not to archive his work or to generate clever new architecture. It is to
**pass on wisdom that is overlooked.**

The wisdom is **tacit** — the felt sense of how the Lost Triangle (`1 : √2 : √3`) wants to unfold,
where it goes next, why it's inevitable. Polanyi: _"we know more than we can tell."_ A proof or a
diagram hands over the *facts*; the *wisdom* only deposits **through the hand, by building it over
and over** until the eye catches up. Gregg built his way into seeing it. There is no shortcut that
skips the building.

That is also **why it's overlooked**: tacit knowledge doesn't survive in the channels knowledge
usually travels — papers, drawings, lectures. It lives in the hands of the person who won it, and
dies with them unless someone recreates the conditions to **re-win** it.

> **North star: the exhibit is a machine for re-winning, by hand, what Gregg won by hand.**
> Not an explainer. Not an archive. Not a CAD tool.

**The one test for every decision:** _does this get hands building, or does it just explain?_

(Audience: don't pre-select. It transmits to *anyone willing to build the loops* — the ones who
keep building are the ones it reaches.)

---

## 2. What the north star reframes

- **Stage 1 (the hand-sketch) is sacred.** It's the one place Gregg is a *person* who saw
  something — the human carrier of tacit knowledge. Keep it; honor it. It is not cuttable.
- **The proof pages are scaffolding.** They get out of the way. The *doing* is the content.
- **The sandbox is the heart — but it's a construction kit, not a parameter panel.** Verbs, not
  sliders: *place* a cell, *reflect* it, *fold* it, *truncate* it, *add* a neighbour, *again*. Each
  loop deposits a little tacit insight no caption could.
- **"Non-destructive" is for repetition, not just safety.** You can only build over and over if you
  can fail and reset endlessly. Free, fast, forgiving loops *are* the transmission channel.
- **Don't over-explain.** The hand leads, the eye follows, the mind clicks last — the reverse of
  the usual "explain, then demo."

---

## 3. Build architecture — canon + sandbox, non-destructive by design

1. **One geometry core** (`assets/gf-geometry.js`, sibling to `gf-tokens`/`gf-scene`): named
   parameters with Gregg's confirmed values as the **locked canonical default preset**. Every page
   reads from it. Canon lives in exactly one place, so it can't drift.
2. **Edits are overrides, never mutations:** `params = { ...CANON, ...overrides }`. "Reset to Gregg"
   = drop the overrides. There is nothing to undo because the source was never touched — that *is*
   non-destructive.
3. **Two surfaces, one engine:** the **Exhibit** (everything live today — canonical, locked, the
   authoritative story) and a separate **Lab/Studio** (the live engine + construction kit). You
   cannot break the exhibit from the Lab. Separation is the safety.
4. **Provenance is already invented** — the instrument's `CONFIRMED GEOMETRY` vs
   `INVESTIGATION · NOT PROVEN` badge. Carry it through: anything dialed off Gregg's defaults
   auto-flags **exploratory**, so an experiment is never mistaken for his confirmed work.
5. **Shareable states:** encode params in the URL (`?p=…`). An experiment becomes a *link* — to send
   Gregg, or pull into Claude Design. Non-destructive **and** collaborative.

---

## 4. The recursion landmine — resolve before building "fractal / unfold"

"Fractal" hides a real choice. **The rhombic dodecahedron does NOT self-subdivide into smaller
rhombic dodecahedra** the way a cube splits into 8 cubes. Build a naïve "fractal depth" on that
assumption and the geometry is a lie. The honest, **Gregg-grounded** recursions:

- **The truncation cascade** — rhombicube → Truncated Rhombicube → *Great* Truncated (GT)
  Rhombicube → … Genuinely recursive, exact, and **already documented on his 2005 MathPoster**
  (the "GT" forms). _Lowest risk, maximum provenance — this is the v1._
- **FCC multi-scale packing** — the FCC lattice is self-similar under scaling by 2, so cell-clusters
  can legitimately nest at multiple scales (the "buildable bone" idea). A later move.

Pick the rule first; *then* the "unfold" interaction means something.

---

## 5. First real step — the smallest thing that proves the pattern

1. Extract **one** component — the Cluster-Structures rhombic cell + truncation — into the geometry
   core (`gf-geometry.js`).
2. Stand up a bare **Lab** page driven by build-moves: build the cell, truncate it, step the cascade
   depth — with **"reset to Gregg"** and a **shareable URL**.
3. One page proves the whole pattern (canon / override / non-destructive / build-over-and-over);
   everything else is reuse.

Do **not** start with breadth (every component adjustable) or the full fractal lattice — prove the
loop on one component first.

---

## 6. Where to build it — Code vs Claude Design (honest)

- **Claude Design** (claude.ai/design): great for diverging on the **visual look** of the Lab —
  mockups, aesthetic directions, layout feel. It **cannot** touch this repo, run the geometry,
  verify in a browser, or deploy.
- **Claude Code**: builds, refactors, runs + verifies in a live preview, commits, deploys. The
  geometry core, the non-destructive state model, URL experiments, the Lab itself — **all Code.**

**Recommendation:** build in a **fresh Claude Code session** reading this doc + `../HANDOFF.md`. Use
Claude Design when you want to explore how the Lab should *look* before/while building it.

---

## 7. Bandwidth (rough, in focused half-day sessions) — reframed from *sliders* to *build-moves*

| Work | Estimate |
|---|---|
| Extract one component into the geometry core + bare Lab + non-destructive overrides + URL state | ~1–2 sessions |
| Truncation-cascade recursion in the core | ~1 session |
| Construction-kit build-moves UI (the verbs) + provenance flagging | ~1–2 sessions |
| **Strong "build-over-and-over v1" on one component** | **~3–4 sessions** |
| Reuse across the other components, once the pattern's proven | cheap, incremental |
| Movies-as-sandboxes / every-value-adjustable | sharp ROI drop — defer/skip |

"More accurate" remains a **Gregg sign-off** task (values, vocabulary, angle convention), not
engineering — the code is ready for it.

---

## 8. Current state & pointers

- **Live:** https://takuanbouzu.github.io/gregg-geometry/ — GitHub Pages, branch `codex-web-build`,
  fully self-contained (runtime JS vendored under `assets/vendor/`, no CDN).
- **`../HANDOFF.md`** — operational source of truth, page inventory, and the **Graphical QA
  watchlist** (recurring glitch classes: label-on-fill contrast, axis-view perspective, lingering
  ghost lines, edge-on fat lines, z-fighting, theme-flip, clipping, responsive).
- **Open decisions for Gregg:** angle-display convention (rounded vs `35.264°`); Vector House DXF
  values + "Vector House"/"silver fold" vocabulary (page currently hidden from nav until confirmed).
- **Source material:** `docs/reference/` (the design brief + Gregg's drawings), the 2005 MathPoster
  (in Drive `01_INCOMING/`), `docs/dorman-luke-duality-research.md`.
