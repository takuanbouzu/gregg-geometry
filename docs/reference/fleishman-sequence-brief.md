# Build & Refine: The Fleishman √2 Sequence — animated geometric construction

You are a skilled design + creative-coding agent. Build a single, self-contained HTML animation and then **iteratively refine it on your own** against the rubric in §8 until it passes (or you hit the iteration cap). Render your own output, look at it, critique it, fix the highest-severity issue, repeat.

---

## 1. The one rule that governs everything

**Gregg Fleishman is the main character.** This animates *his* thinking: a single ratio, √2, generating his whole system. Use **his** vocabulary only — *the module, the √2 system, the Lost Triangle, the rhombic cell, space-filling*. 

Do **NOT** put any academic apparatus on screen: no "dual polyhedron," "cuboctahedron," "vertex figure," "Dorman Luke," "midsphere," "Voronoi." That formal framing lives in a separate essay, never in this visual. If a caption needs a name, use Gregg's.

---

## 2. Objective

A polished, brand-consistent animation that builds the construction **one element at a time**, in three continuous acts on one canvas:

1. **Plan (top-down):** the Lost Triangle drawing assembles flat — three construction circles, the unit square + diagonal (√2), the blue √2 fold, the magenta √3 "Lost Triangle."
2. **Quarter-orbit:** a pure *vertical* 90° camera move from top-down to front view (azimuth locked during the tilt), as the flat drawing fades.
3. **Into space:** the module redraws as a 3D cube with the Lost Triangle (√2 face diagonal, √3 space diagonal), then **the √2 keeps going** — "raise a face on every plane of the cube" forms the rhombic cell (every face a √2 diamond, diagonals √2 : 1), and one neighbor cell appears to imply space-filling. Close on **"one module → the whole of space."**

Deliverable: one `.html` file, no build step, openable directly. Controls: Replay, Pause, a scrub slider, speed selector. A `?clean=1` URL flag hides all UI and centers the canvas for clean screen-capture to video.

---

## 3. Tech (recommended, not mandatory)

- **Three.js** (ESM via CDN, e.g. jsDelivr `three@0.160`) with **Line2 / LineGeometry / LineMaterial** for crisp fat lines that read at any size. Animate "draw-on" by progressively rebuilding each line's point list (`LineGeometry.setPositions`), and circles/arcs as partial polylines.
- **GSAP** (cdnjs) for one master, scrubbable, paused timeline. Tie camera moves into the same timeline so the scrubber drives the camera too.
- Camera: a **gimbal-free rig** — a pivot Group at the look-at target, camera as its child at `(0,0,R)`; orbit by rotating `pivot.rotation.x` from `-π/2` (top-down) to `0` (front). Add azimuth (`pivot.rotation.y`) only *after* the vertical orbit, as a gentle settle. Reset all camera values at timeline position 0 so Replay starts clean.
- If you prefer a different stack, fine — but you must hit the same visual quality, the line draw-on, and the continuous single-camera orbit.

---

## 4. Brand system (verbatim)

```
bg            #0B0B0B   (warm near-black)
text          #F0EDE8   (bone)
text-dim      #8A8480
gold/accent   #C8A96E   (chrome, captions emphasis, angle measures)
geo-unit      #F0EDE8   (edge "1" — bone)
geo-face      #4A90D9   (√2 — blue)
geo-space     #E0349E   (√3 / Lost Triangle — magenta, the signature)
geo-green     #3CCB8E   (proof-triangle / cell-face fill)
construction circles: bone @ ~0.40 opacity
fonts: Syne (display/brand), Space Grotesk (UI), Space Mono (captions, math labels)
```

Captions: Space Mono, small, centered under the canvas; emphasized term in gold.

---

## 5. Exact geometry (already verified — do not re-derive)

### 5a. Plan / Lost Triangle (measured from the source artwork; pixel space, viewBox `0 0 1026 1016`)
Map every plan point to the 3D ground plane with: `world = ((px-159)/287, 0, (py-264)/287)` (so the unit square's side = 1 unit).

```
Unit square corners:  TL(159,264) TR(446,264) BR(446,507) BL(159,507)
Square diagonals:     TL–BR and TR–BL   (these are the √2 face diagonals; draw in blue)
Construction circles: center(298,387) r185 · center(409,552) r195 · center(703,482) r193   (bone, ~0.40)
Blue √2 fold (rhombus, fill blue ~0.85):  top(444,351) right(725,549) bottom(447,753) left(166,555)
White inner half-triangle (fill bone):    (444,351) (166,555) (444,552)
Magenta Lost Triangle (fill magenta ~0.9): (453,360) apex(848,387) (617,715)
  magenta internal divider line: apex(848,387) → (535,537)
Plan labels: "1" near (300,238) bone · "√2" near (250,400) blue · "√3" near (690,520) magenta
```

### 5b. 3D cube + Lost Triangle (unit cube, y-up)
```
O(0,0,0) X(1,0,0) Z(0,0,1) A(1,0,1) B(1,1,1)  (plus top corners O2(0,1,0) X2(1,1,0) Z2(0,1,1))
Base square (bone, prominent):  O–X, X–A, A–Z, Z–O
Full cube as faint ghost (~0.16): the 12 cube edges
Face diagonal √2 (blue):  O→A
Vertical lift (bone, =1):  A→B
Space diagonal √3 (magenta): O→B          ← the Lost Triangle in space
Proof triangle fill (green ~0.16): O–A–B
Right angle at A; angle arc at O = atan(1/√2) = 35.264°
Labels: 1 (vertical), √2 (O–A), √3 (O–B), 35.26° (at O)
```

### 5c. The rhombic cell — Gregg-native construction (NO duality language)
Build it as **"raise a face on every plane of the cube"**: keep the 8 cube corners; add one apex over each of the 6 cube faces, forming an octahedron of apexes. The cube's edges become the **short (length-1) diagonals** of the rhombic faces; corner→apex segments are the cell edges. Every face is a √2 diamond.

```
Cube corners: the 8 points (x,y,z) with x,y,z ∈ {0,1}
6 face apexes (cube center C=(0.5,0.5,0.5) ± unit along each axis):
   (1.5,0.5,0.5) (-0.5,0.5,0.5) (0.5,1.5,0.5) (0.5,-0.5,0.5) (0.5,0.5,1.5) (0.5,0.5,-0.5)
Cell edges: every corner–apex pair at distance √0.75 (= 24 edges, 12 rhombic faces)
Highlighted √2 diamond face:  apex(1.5,0.5,0.5) – corner(1,1,0) – apex(0.5,1.5,0.5) – corner(1,1,1)
   long diagonal (apex–apex) = √2  → draw magenta, label "√2"
   short diagonal (corner–corner) = 1 → draw bone, label "1"
Neighbour cell (implies space-filling): translate the whole cell by (1,1,0); draw faint (~0.13)
```
This is mathematically exact: 24 cell edges, 12 rhombic faces, every face-diagonal ratio √2 : 1.

---

## 6. Sequence script & captions (Gregg's voice)

| Act | Beat | Caption (gold = **bold**) |
|----|------|---------------------------|
| 0 (optional intro) | root spiral √1·√2·√3·√4 | Gregg's root sequence · **√1 · √2 · √3 · √4** |
| 1 | circles | Three circles · **1 : √2 : √3** |
| 1 | square | The module · **the unit square** |
| 1 | diagonal | Its diagonal · **√2** |
| 1 | blue fold | (fold fills) |
| 1 | magenta | **The Lost Triangle** · √3 |
| 2 | orbit | Stand it up · **plan → space** |
| 3 | cube | The module becomes a **cube** |
| 3 | √2 / lift / √3 | Face diagonal · **√2** → Lift one unit → Space diagonal · **√3 — the Lost Triangle in space** |
| 3 | angle | **θ = 35.264°** |
| 3 | cell intro | Gregg's √2 doesn't stop at the triangle |
| 3 | raise faces | Raise a face on every plane of the cube |
| 3 | cell | The **rhombic cell** — every face a √2 diamond |
| 3 | ratio | **√2 : 1** — the ratio that packs space |
| 3 | fill | **One module → the whole of space** |

Pacing: ~30–40s total at 1×; each draw-on eases in; captions cross-fade. Keep it unhurried but never static.

---

## 7. Self-refinement loop (do this — don't stop at first draft)

Run this loop autonomously:

1. **Build / edit** the file.
2. **Render it** and capture frames you can actually look at — at minimum the final frame of each act (plan complete, mid-orbit, cube+Lost Triangle, rhombic cell). Use a headless browser (e.g. Playwright/Puppeteer) to screenshot; WebGL needs `--use-gl=swiftshader` or similar if no GPU. If you genuinely cannot render WebGL, state that and fall back to careful static review + (if available) compare the plan act to the reference image.
3. **Score against the rubric (§8).** Write the score and the single highest-severity problem.
4. **Fix that one problem.** Re-render. Re-score.
5. **Repeat** until every rubric item is "pass" or you reach **6 iterations**. Then output the final file and a short changelog of what each iteration fixed.

Bias toward visual truth over assumptions: if you think a value is right but the render disagrees, the render wins.

---

## 8. Acceptance rubric (each must pass)

- **Fidelity:** the plan act reads as the Lost Triangle artwork — square top-left with diagonals + circumscribing circle, blue √2 fold with white inner triangle, magenta √3 triangle pointing right, three overlapping circles.
- **Orbit:** the camera move from top-down to front is a clean *vertical* quarter-turn; no gimbal flip, no roll; the plan is upright at the start and the cube reads as a solid 3/4 view at the end.
- **Legibility (critical):** during the rhombic-cell act the scene does **not** become a tangle. The highlighted √2 diamond is clearly the front face with its two diagonals readable. If busy, fade the cube ghost / earlier lines once the cell forms.
- **Story discipline:** zero academic terms on screen; every caption in Gregg's voice; the √2 is visibly the through-line from triangle → cube → cell.
- **Line quality:** crisp, consistent-weight lines (no 1px aliasing); fills sit behind outlines; labels never overlap the caption or clip the frame.
- **Controls:** Replay restarts cleanly (camera resets), Pause/Resume works, the scrubber drives both drawing and camera, speed selector works.
- **Clean mode:** `?clean=1` removes all chrome and centers the canvas with adequate margins for 16:9 and 1:1 capture.
- **Self-contained:** one file; only CDN deps (Three.js, GSAP, Google Fonts); no console errors.

---

## 9. Output

Return: (1) the final single HTML file, (2) the iteration changelog, (3) any rubric item you could not fully verify and why, and (4) 2–3 specific suggestions for a human reviewer to check (e.g. exact camera framing, cell legibility).

*The whole piece must feel like Gregg's idea unfolding — quiet, exact, inevitable. The math is the material; he is the author.*
