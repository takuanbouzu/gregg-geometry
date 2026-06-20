# Duality, Vertex Figures, and the Dorman Luke Construction
## Theoretical Context for Gregg Fleishman's Geometric System

*Research report prepared June 2026 by Yuto / White Cube Society*
*For handoff to Claude Code session — Gregg Fleishman Legacy Project*

---

## 1. The Observation

Gregg Fleishman's work — particularly the slot joint, the √2 system, the rhombic dodecahedron, and the FCC lattice — can be formally understood through the lens of **dual polyhedra theory** and specifically the **Dorman Luke construction**. This is not a loose analogy; the mathematical structure maps precisely onto Gregg's physical and architectural practice.

This report establishes the theoretical grounding, identifies the lineage of thinkers who have approached this territory, and locates the gap in the literature that Gregg's work uniquely occupies.

---

## 2. The Dorman Luke Construction

### What It Is

The Dorman Luke construction is a geometric method for deriving the face shape of a **dual polyhedron** from the **vertex figure** of its primal. It was formalized by Dorman Luke and detailed in Magnus Wenninger's *Dual Models* (Cambridge University Press, 1983).

**The steps:**
1. At vertex V of a uniform polyhedron, mark points A, B, C, D — the midpoints of each edge meeting at V. (VA = VB = VC = VD, equidistant from V.)
2. Connect A, B, C, D to form the **vertex figure** ABCD.
3. Draw the **circumcircle** of ABCD.
4. Draw the **tangent line** to the circumcircle at each corner (A, B, C, D).
5. Mark points E, F, G, H where adjacent tangent lines intersect.

The polygon EFGH is the face of the dual polyhedron corresponding to vertex V.

### The Critical Condition: The Intersphere

The construction only works when the polyhedron has a **midsphere** (intersphere) — a sphere tangent to every edge at its midpoint. This sphere is shared by both the primal polyhedron and its dual. For uniform polyhedra (vertex-transitive), this condition is always met.

**The midsphere is the geometric bridge between a structure and its dual.** Every edge of both the primal and dual is tangent to the same sphere.

### The Canonical Example

Wikipedia's illustration uses the **cuboctahedron → rhombic dodecahedron**. This is not incidental to Gregg's work — it is the exact transformation at the center of his geometric system.

- The cuboctahedron (vector equilibrium) is the vertex-transitive primal
- Its vertex figures are squares
- The Dorman Luke construction applied to those square vertex figures, using the shared midsphere, produces **rhombic faces**
- The resulting dual is the **rhombic dodecahedron**
- The rhombic dodecahedron is also the **Voronoi cell of the FCC lattice**
- The diagonal ratio of those rhombic faces is **√2 : 1**

This is why Gregg's √2 system, the rhombic dodecahedron, and the FCC lattice are not three separate interests — they are the same mathematical fact expressed in three different registers.

---

## 3. The Core Principle in Architectural Terms

The Dorman Luke construction encodes a generative relationship:

> **The geometry of connection (vertex figure + circumcircle tangency) fully determines the geometry of the resulting face — and therefore the geometry of the dual structure.**

In Gregg's physical work, the **slot joint** is the vertex figure. How pieces meet at a node — the angle, the slot width, the √2 proportioning — determines the planar geometry of each structural panel or face, which in turn determines the space-filling behavior of the whole system.

Gregg is not just working *with* rhombic dodecahedra. He is physically instantiating the process by which the rhombic dodecahedron is generated — building the Dorman Luke construction in plywood and aluminum at furniture and architectural scale.

---

## 4. The Theoretical Lineage

### 4.1 Peter Pearce — *Structure in Nature is a Strategy for Design* (MIT Press, 1978)

**Most direct precursor.** Pearce is a designer and theorist who worked directly with both Charles Eames and Buckminster Fuller. His 1978 MIT Press book is a sustained argument for exactly the principle at stake here: that joint geometry (vertex figure) determines structural typology.

Key contributions:
- Founded **Synestructics, Inc.** to produce physical kits embodying space-filling polyhedral systems
- Argued that nature's structural strategies (crystals, cells, shells) are based on **modular components + least-energy configurations** — the same logic as polyhedral duality
- Developed saddle polyhedra and minimal surface extensions of these ideas
- Explicitly worked with the rhombic dodecahedron and FCC tessellation
- Led designers "beyond the right angle and the cube into a richer world of forms based on the triangle, the hexagon, and general polyhedra"

Pearce's work is the closest theoretical parallel to Gregg's, operating in the same Californian design-science tradition and arriving at structurally identical conclusions through material/physical experimentation rather than formal mathematical derivation.

**Notably absent in Pearce:** he does not cite the Dorman Luke construction or dual polyhedra theory as his theoretical basis. He arrived at the same place through structural intuition and biological analogy.

### 4.2 Konrad Wachsmann — *The Turning Point of Building* (1961)

**The universal joint as structural vertex figure.** Wachsmann was a German-American architect and engineer whose decades-long obsession was finding the "universal knot" — a single connector geometry that could generate any space frame structure.

Key contributions:
- Developed the **Mobilar Structure** system (1944–45) for USAF aircraft hangars: one standardized tetrahedral connector, infinite structural extension
- Took out nearly 100 patents for jointing and panel systems
- Understood that the node *is* the structure — the joint geometry determines what space the structure can fill
- His search for the "universal knot" is the architectural version of the Dorman Luke question: what vertex configuration generates the most powerful dual?

Wachsmann is essentially asking: *if I design this vertex figure, what structure emerges?* He never formalizes it in terms of duality theory, but the operational logic is identical.

### 4.3 Buckminster Fuller — Synergetics and the Vector Equilibrium

**The cuboctahedron as origin.** Fuller's "vector equilibrium" is the cuboctahedron — the primal polyhedron whose dual, via Dorman Luke, is the rhombic dodecahedron. Fuller understood this as the "zero state" or ground state of spatial structure, from which all other forms derive by contraction or transformation.

Key contributions:
- **Energetic-Synergetic geometry**: the tetrahedron and octahedron as the fundamental space-filling units (the FCC lattice decomposed)
- **Geodesic domes** are physically dual polyhedra: geodesic polyhedra are the duals of Goldberg polyhedra
- The hub-and-strut system of geodesic construction is a physical vertex figure determining the face geometry of the dome
- Fuller's concept of "doing more with less" through spherical enclosure is directly related to the midsphere / intersphere property

Like Pearce and Wachsmann, Fuller arrives at the duality principle physically and intuitively without naming it in mathematical terms.

### 4.4 D'Arcy Wentworth Thompson — *On Growth and Form* (1917)

The deep background. Thompson's foundational argument — that biological forms arise from physical and geometric forces, not just evolution — established the paradigm within which Pearce, Fuller, and implicitly Gregg all work. Thompson's analysis of cell packing, soap bubble geometry, and skeletal structures is an early description of Voronoi tessellation and minimal-surface duality, predating the formal mathematics.

### 4.5 Contemporary Computational Work (2020–present)

Recent computational research has formally connected Voronoi decomposition to interlocking structural assemblies — closing the loop between the mathematical theory and physical construction.

**"Interlocking Vaults by Voronoi Decomposition of 3D Space"** (Yadav et al., 2020, Shape Modeling International):
- Generates interlocking vault modules by decomposing 3D space via Voronoi cells around curves
- The interface geometry between modules (= the shared face of adjacent Voronoi cells) determines structural interlocking — exactly the dual-face-from-vertex-figure relationship
- Extends the Abeille vault tradition (Joseph Abeille, French architect, late 1600s) — structures that interlock through face geometry alone, no fasteners

**Topological Interlocking Assemblies** (active research area, 2020s):
- Studies how **face geometry at interfaces** determines global structural behavior
- Directly formalizes the Dorman Luke principle: what happens at the vertex/face interface determines what the whole structure can do
- Includes Penrose tiling extensions, stereotomic assembly, and 3D printing applications

**George Hart** — mathematical sculptor who has worked extensively with FCC constructions and rhombic dodecahedra, building physical models that demonstrate the Voronoi/dual relationships. His documentation at georgehart.com/rp/FCC.html is a useful visual reference.

---

## 5. The Gap — What No One Has Explicitly Said

Every thinker in this lineage has arrived at the vertex-figure-determines-structure principle through one of three routes:
1. **Structural intuition** (Wachsmann, Fuller)
2. **Biological analogy** (Pearce, D'Arcy Thompson)
3. **Computational discovery** (contemporary Voronoi research)

None of them appear to have formally named the **Dorman Luke construction** or the **mathematical theory of dual uniform polyhedra** as the underlying principle they are enacting.

Gregg's work sits in this gap. His system:
- Encodes the Dorman Luke relationship physically (slot joint = vertex figure → face of dual)
- Centers on the specific cuboctahedron → rhombic dodecahedron transformation that is the Dorman Luke canonical example
- Uses the √2 proportioning that is a direct consequence of that transformation's geometry (the rhombic face diagonal ratio)
- Achieves no-fastener construction through the same face-interface interlocking logic that topological interlocking research formalizes computationally

**The framing for Gregg's legacy:** He is working at the intersection of the Pearce/Fuller/Wachsmann design-science tradition and the formal mathematical theory of polyhedral duality — but has arrived there through independent material and geometric research, not through either tradition directly. The Dorman Luke construction is the missing theoretical frame that formally describes what his slot joint system is doing.

---

## 6. Key References

### Primary Sources
- Wenninger, Magnus. *Dual Models*. Cambridge University Press, 1983. — Formal treatment of Dorman Luke construction
- Pearce, Peter. *Structure in Nature is a Strategy for Design*. MIT Press, 1978. — Closest direct theoretical ancestor
- Wachsmann, Konrad. *The Turning Point of Building: Structure and Design*. 1961. — Universal joint / space frame theory
- Fuller, R. Buckminster. *Synergetics: Explorations in the Geometry of Thinking*. Macmillan, 1975.
- Thompson, D'Arcy Wentworth. *On Growth and Form*. Cambridge University Press, 1917.

### Mathematical References
- Wikipedia: [Dual Uniform Polyhedron — Dorman Luke Construction](https://en.wikipedia.org/wiki/Dual_uniform_polyhedron#Dorman_Luke_construction)
- Wolfram MathWorld: [Dorman-Luke Construction](https://mathworld.wolfram.com/Dorman-LukeConstruction.html)
- George Hart: [Face Centered Cubic Constructions (Rhombic Dodecahedra)](http://georgehart.com/rp/FCC.html)

### Contemporary Research
- Yadav et al. "Interlocking Vaults by Voronoi Decomposition of 3D Space." *Shape Modeling International*, 2020. [ResearchGate](https://www.researchgate.net/publication/341977545_Interlocking_Vaults_by_Voronoi_Decomposition_of_3D_Space)
- "Advancing Topological Interlocking Structures: Recent Developments, Applications, and Challenges in Civil Engineering." *Springer Nature*, 2024. 
- Springer: [Rhombic Dodecahedron Grid — Coordinate System and 3D Digital Object Definitions](https://link.springer.com/chapter/10.1007/978-3-030-14085-4_3)

---

## 7. Implications for the Legacy Project

### For the Geometry Lesson Web Experience (Phase 2)
The Dorman Luke construction could be one of the core interactive lessons — showing how the slot joint generates the rhombic face, how the rhombic face tiles space, how the FCC lattice emerges. This would give Gregg's intuitive system a formal mathematical narrative arc.

### For the Master Context Document
This theoretical framing should be added to the Master Context as a new section: *"Mathematical Theory: Dual Polyhedra and the Dorman Luke Construction."* It positions Gregg not just as a craftsman or artist but as a practitioner whose work formally instantiates a mathematical principle that the design-science tradition has circled around for decades without naming.

### For Future Writing / Exhibition
The lineage — D'Arcy Thompson → Fuller/Wachsmann/Pearce → Gregg → contemporary topological interlocking — provides a historical narrative that situates Gregg's work within a serious intellectual tradition while also identifying his specific original contribution: arriving independently at the Dorman Luke duality principle through material research, and encoding it in a physical slot joint system that achieves architectural scale.

---

*End of report. Prepared for handoff to Claude Code / codex session for integration into master context documentation.*
