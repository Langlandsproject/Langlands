---
id: buildings_and_parahorics.tits_buildings
title: Tits Buildings
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- reductive_structure.reductive_groups
- reductive_structure.parabolic_subgroups
- buildings_and_parahorics.spherical_buildings
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Tits buildings treated uniformly as simplicial complexes attached to BN-pairs, with both spherical (reductive) and affine (p-adic) variants?"
  verdict: "Yes. The construction from a BN-pair is uniform; specialisations to spherical (reductive over a field) and affine (p-adic) appear as the two main examples but are not the only cases."
tags:
- tits-buildings
- buildings-and-parahorics
---

# Tits Buildings

A **(Tits) building** is a simplicial complex equipped with a system
of apartments — each apartment a Coxeter complex — and a "highly
homogeneous" geometric structure. Buildings provide a uniform
geometric model for reductive groups (spherical buildings) and
\(p\)-adic reductive groups (affine = Bruhat-Tits buildings).

## Axiomatic definition

A **building** is a simplicial complex \(\mathcal{B}\) equipped with a
non-empty system \(\mathcal{A}\) of subcomplexes (called **apartments**)
satisfying:

(B1) Each apartment \(A \in \mathcal{A}\) is isomorphic to the Coxeter
complex \(\Sigma(W, S)\) for some fixed Coxeter system \((W, S)\);

(B2) For any two simplices \(\sigma, \tau \in \mathcal{B}\), there is
an apartment \(A \in \mathcal{A}\) containing both;

(B3) For two apartments \(A, A'\) containing simplices \(\sigma, \tau\),
there is an isomorphism \(A \to A'\) fixing \(\sigma \cap A \cap A'\) and
\(\tau \cap A \cap A'\) pointwise.

\(\mathcal{B}\) is called of **type \((W, S)\)** and inherits a
**Weyl distance** \(\delta : \text{chambers} \times \text{chambers} \to W\).

## Equivalent formulations

- **W-metric.** A pair (set of chambers, function \(\delta\) to \(W\))
  with axioms (W1)-(W4) (Tits).
- **Combinatorial.** A chamber complex satisfying connectedness and
  uniqueness-of-residues axioms.
- **From a BN-pair.** Given a Tits system \((G, B, N, S)\), the
  building has cosets of standard parabolic subgroups as simplices,
  with \(G\) acting.

## Spherical buildings

For a connected reductive group \(G\) over a field \(k\), the
**spherical building** \(\Delta(G, k)\) is:

- vertices = maximal proper parabolic subgroups of \(G(k)\) (modulo
  conjugation);
- chambers = Borel subgroups;
- simplices = parabolics, ordered by reverse inclusion.

The associated Coxeter group is the **finite Weyl group** of \(G\);
apartments are sphere triangulations.

### Example: \(\mathrm{GL}_n\)

\(\Delta(\mathrm{GL}_n, k)\) is the simplicial complex of **proper
non-trivial flags** in \(k^n\). Vertices = proper subspaces; simplices
= flags. Chambers = full (maximal) flags.

This is the prototypical building of type \(A_{n-1}\).

## Affine (Bruhat-Tits) buildings

For \(G\) reductive over a non-archimedean local field \(F\), the
**affine building** \(\mathcal{B}(G, F)\) is built using the affine
BN-pair \((G(F), I, N, S_{\mathrm{aff}})\) with \(I\) the Iwahori
subgroup:

- vertices = maximal parahoric subgroups;
- chambers = Iwahori subgroups;
- apartments = Euclidean Coxeter complexes for the affine Weyl group.

\(\mathcal{B}(G, F)\) carries a natural **CAT(0) metric** (Bruhat-Tits),
making it a complete metric space with non-positive curvature.

### Example: \(\mathrm{SL}_2(\mathbb{Q}_p)\)

\(\mathcal{B}(\mathrm{SL}_2, \mathbb{Q}_p)\) is the **\((p+1)\)-regular
tree**: an infinite tree where every vertex has \(p+1\) neighbours.
This is the simplest non-trivial affine building and the geometric
model for many \(p\)-adic constructions.

## Solomon-Tits theorem

**Theorem (Solomon-Tits).** A spherical building \(\Delta\) of rank
\(r\) is **homotopy-equivalent** to a wedge of \(r\)-spheres:
\[
\Delta \simeq \bigvee S^r.
\]

In particular, \(\widetilde{H}_r(\Delta, \mathbb{Z})\) is free of high
rank — the **Steinberg representation** appears here, foundational to
representation theory of finite reductive groups.

## Tits' classification

**Theorem (Tits, 1974).** Irreducible spherical buildings of rank
\(\ge 3\) are classified: they all come from BN-pairs of simple
algebraic groups (or twisted versions). Rank-2 buildings include
**generalized polygons** (\(n\)-gons), classified for finite case but
not in general.

This is the high-rank generalisation of the Fundamental Theorem of
Projective Geometry, and the proof uses careful "Moufang"-style
axiomatic refinement.

## Role in Langlands

- **Local Langlands**: the affine building of \(G\) over a local
  field is the natural geometric setting for the Bushnell-Kutzko
  theory of **types** and the parameterisation of supercuspidals.
- **Iwahori-Hecke algebras**: \(\mathcal{H}(I \backslash G/I)\) is
  the convolution algebra of \(I\)-bi-invariant functions; its
  category of modules is equivalent to a category of perverse sheaves
  on the affine flag variety.
- **Geometric Satake**: the building's vertices correspond to
  lattices, and the geometry of the affine Grassmannian
  \(\mathrm{Gr}_G\) projects to the building structure.
- **Mod \(p\) Langlands**: the Galois cohomology of buildings (via
  Borel-Serre compactification) realises pro-\(p\) Iwahori-Hecke
  algebras.

## Mathlib

Not formalised; depends on Coxeter group infrastructure and étale
descent.

## References

- Tits, *Buildings of Spherical Type and Finite BN-Pairs* (LNM 386,
  1974).
- Brown, *Buildings* (1989).
- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (Publ.\
  IHES 1972, 1984).
- Abramenko–Brown, *Buildings: Theory and Applications* (2008).
- Tits, *A local approach to buildings* (1980).

## Prerequisite Topics

- [[node:reductive_structure.reductive_groups|Reductive Groups]]
- [[node:reductive_structure.parabolic_subgroups|Parabolic Subgroups]]
- [[node:buildings_and_parahorics.spherical_buildings|Spherical Buildings]]
