---
id: buildings.bruhat_tits_buildings
title: Bruhat-Tits Buildings
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Buildings
topics:
- AlgebraicGroups.Buildings
uses:
- buildings.bruhat_tits_apartments
- buildings.bn_pairs_and_tits_systems
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Bruhat-Tits buildings defined for arbitrary reductive groups over non-archimedean local fields, not just for split groups?"
  verdict: "Yes. The construction works for any connected reductive group over a non-archimedean local field; the split case is the model, and non-split forms are handled via Galois descent of apartments."
tags:
- bruhat-tits-buildings
- buildings-and-parahorics
---

# Bruhat-Tits Buildings

The **Bruhat-Tits building** \(\mathcal{B}(G, F)\) of a reductive
group \(G\) over a non-archimedean local field \(F\) is the affine
building attached to \(G(F)\). It is a complete CAT(0) metric space
on which \(G(F)\) acts by simplicial isometries, and the canonical
geometric object encoding the local arithmetic of \(G\).

## Construction (split case)

Let \(G\) be a split connected reductive group over \(F\), with split
maximal torus \(T\), cocharacter lattice \(X_* = X_*(T)\), coroots
\(\Phi^\vee\), and extended affine Weyl group
\(\tilde W = W \ltimes X_*\).

The building \(\mathcal{B}(G, F)\) is constructed as follows:

1. The **standard apartment** \(\mathbb{A}\) is \(X_* \otimes \mathbb{R}\),
   tiled by alcoves under \(\tilde W\).
2. \(G(F)\) acts on \(\mathbb{A}\) through the **Iwahori-Weyl group**
   \(\tilde W\), extending to an action on \(\mathbb{A}\) via affine
   transformations.
3. The building is glued from copies of \(\mathbb{A}\) using
   \(G(F)\)-conjugacy: \(\mathcal{B}(G, F) = G(F) \times \mathbb{A} / \sim\),
   where \((g, a) \sim (g h, h^{-1} a)\) for \(h \in N_G(T)(F)\).

Equivalently: \(\mathcal{B}(G, F)\) is the building of the affine
BN-pair \((G(F), I, N_G(T)(F), S_{\mathrm{aff}})\).

## Properties

**Theorem (Bruhat-Tits).** \(\mathcal{B}(G, F)\) is:

- a complete CAT(0) metric space (non-positively curved);
- a simplicial complex of dimension equal to the split rank of \(G\);
- acted on by \(G(F)\) properly and simplicially;
- the building has **apartments** isomorphic to Euclidean space of
  dimension \(= \mathrm{rank}\, G\), tiled by alcoves.

The CAT(0) property gives a "centre" to any bounded subgroup: every
bounded subgroup of \(G(F)\) has a fixed point in \(\mathcal{B}(G, F)\),
the foundation of the **Bruhat-Tits fixed-point theorem**.

## Construction (general case)

For \(G\) connected reductive over \(F\) but not split:

1. Let \(L/F\) be a finite Galois extension splitting \(G\).
2. Construct \(\mathcal{B}(G_L, L)\) for the split form over \(L\).
3. Take Galois invariants:
   \[
   \mathcal{B}(G, F) \;=\; \mathcal{B}(G_L, L)^{\mathrm{Gal}(L/F)}.
   \]
4. The result is the affine building of \(G(F)\); it has dimension
   equal to the **\(F\)-split rank** of \(G\).

For an anisotropic group (e.g.\ \(\mathrm{SL}_1(D)\) for a division
algebra \(D\)), the building is a single point.

## Examples

### \(\mathrm{SL}_2(\mathbb{Q}_p)\)

\(\mathcal{B}(\mathrm{SL}_2, \mathbb{Q}_p)\) is the **\((p+1)\)-regular
tree**:

- vertices = homothety classes of \(\mathbb{Z}_p\)-lattices in
  \(\mathbb{Q}_p^2\);
- edges connect lattices \(L \supseteq L'\) with \(L/L' = \mathbb{Z}/p\);
- each vertex has \(p+1\) neighbours (= the \(p+1\) lines in
  \(\mathbb{F}_p^2\)).

This is the simplest non-trivial affine building, and the prototype
for understanding \(p\)-adic representations of \(\mathrm{SL}_2\) and
the local Langlands correspondence.

### \(\mathrm{SL}_n(F)\)

\(\mathcal{B}(\mathrm{SL}_n, F)\) is \((n-1)\)-dimensional:

- vertices = homothety classes of \(\mathcal{O}_F\)-lattices in
  \(F^n\);
- chambers = chains \(L_0 \supseteq L_1 \supseteq \cdots \supseteq L_{n-1} \supsetneq pL_0\)
  of nested lattices.

Each apartment is \(\mathbb{R}^{n-1}\) tiled by the affine type
\(\tilde A_{n-1}\) tessellation.

### \(\mathrm{SO}_n(F)\), \(\mathrm{Sp}_{2n}(F)\)

Buildings of type \(\tilde B_n\), \(\tilde C_n\), \(\tilde D_n\); the
combinatorics involve isotropic lattice flags.

## Vertices and parahoric subgroups

Each vertex \(v \in \mathcal{B}(G, F)\) has a stabiliser
\(\mathrm{Stab}_{G(F)}(v) = K_v\) called a **parahoric subgroup**.
Different vertex types give different parahorics:

- **Hyperspecial vertices**: stabilisers \(\cong G(\mathcal{O}_F)\)
  for a smooth reductive group scheme \(G/\mathcal{O}_F\); these exist
  iff \(G\) is **unramified** over \(F\).
- **Special vertices**: maximal compact subgroups; always exist.
- **Generic vertices**: stabilisers are smaller subgroups (parahorics
  with non-trivial pro-unipotent radical).

The Iwahori subgroup \(I\) is the stabiliser of a chamber (= an
**alcove** = maximal simplex).

## Reduction map

There is a **building reduction** map: for each parahoric \(P_v\),
the quotient \(P_v / P_v^+\) (where \(P_v^+\) is the pro-unipotent
radical) is a connected reductive group \(\bar P_v\) over the
residue field. This gives the **reductive quotient** of the parahoric.

For a hyperspecial vertex: \(\bar P_v = G(\mathbb{F}_q)\).

## Role in Langlands

- **Local Langlands**: depth, level, and types in the Bushnell-Kutzko
  / Yu / Kim theory of supercuspidal representations are organised by
  the building's geometry.
- **Iwahori-Hecke algebra** \(\mathcal{H}(I \backslash G(F)/I)\) is
  the algebra of \(I\)-bi-invariant functions; its representation
  theory is the geometric setup for Langlands at the Iwahori block.
- **Affine Grassmannian** \(\mathrm{Gr}_G = G(F)/G(\mathcal{O}_F)\)
  is an ind-scheme version of the vertex set; geometric Satake
  realises \(\mathrm{Rep}(\hat G)\) on its perverse sheaves.
- **Mod \(p\) Langlands**: the building's cell complex computes
  pro-\(p\) Iwahori-Hecke algebra cohomology.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (Publ.\
  IHES 1972, 1984).
- Tits, *Reductive groups over local fields* (Proc.\ AMS Symp.\ 1979).
- Brown, *Buildings* (1989).
- Garrett, *Buildings and Classical Groups* (1997).
- Yu, *Bruhat-Tits theory: a new approach* (preprint, 2002).

## Prerequisite Topics

- [[node:buildings.bruhat_tits_apartments|Bruhat-Tits Apartments]]
- [[node:buildings.bn_pairs_and_tits_systems|BN-Pairs and Tits Systems]]
