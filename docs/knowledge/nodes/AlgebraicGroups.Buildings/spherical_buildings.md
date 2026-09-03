---
id: buildings.spherical_buildings
title: Spherical Buildings
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Buildings
topics:
- AlgebraicGroups.Buildings
uses:
- buildings.bn_pairs_and_tits_systems
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are spherical buildings treated uniformly for reductive groups over arbitrary fields?"
  verdict: "Yes. The spherical building of G(k) is defined for any connected reductive G; apartments are spherical Coxeter complexes, and the construction works uniformly across types."
tags:
- spherical-buildings
- buildings-and-parahorics
---

# Spherical Buildings

A **spherical building** is a building whose apartments are sphere
triangulations (= finite Coxeter complexes). They are the buildings of
**finite** Coxeter type and are attached to reductive groups over
arbitrary fields, encoding the Bruhat decomposition geometrically.

## Definition

A simplicial complex \(\Delta\) is a **spherical building** if:

- It is a building (in the sense of Tits);
- Each apartment is a Coxeter complex \(\Sigma(W, S)\) for a **finite**
  Coxeter system \((W, S)\).

Equivalently: a spherical building has finite Weyl group, and each
apartment is a triangulation of a sphere \(S^{r-1}\) (\(r\) = rank).

## Construction from a reductive group

For \(G\) a connected reductive group over a field \(k\) with Borel
\(B\), maximal torus \(T \subseteq B\), normaliser \(N = N_G(T)\):

The **spherical building of \(G\)** is the simplicial complex with:

- **Vertices** = maximal proper parabolic subgroups of \(G(k)\);
- **Simplices** = parabolic subgroups, ordered by reverse inclusion;
- **Chambers** = Borel subgroups of \(G(k)\).

The dimension is \(\mathrm{rank}(G) - 1\); the Weyl group is the
finite Weyl group of \(G\); apartments correspond to conjugacy classes
of maximal split tori.

## Examples

### \(\mathrm{GL}_n\)

The spherical building of \(\mathrm{GL}_n(k)\) is the
**flag complex** of \(k^n\):

- Vertices = proper non-trivial subspaces of \(k^n\);
- Simplices = flags \(V_1 \subsetneq V_2 \subsetneq \cdots \subsetneq V_r\);
- Chambers = full flags \(V_1 \subsetneq \cdots \subsetneq V_{n-1}\).

Apartments correspond to direct-sum decompositions
\(k^n = L_1 \oplus \cdots \oplus L_n\) into lines; each apartment is
the boundary complex of a simplex.

### \(\mathrm{SL}_n(k)\)

Same building as \(\mathrm{GL}_n(k)\) (since central isogenies don't
change parabolic structure).

### \(\mathrm{Sp}_{2n}(k)\)

The spherical building consists of **totally isotropic** subspaces of
\(k^{2n}\) for the symplectic form, ordered by inclusion. Chambers =
maximal isotropic flags. Type \(C_n\) building.

### Finite buildings

For \(k = \mathbb{F}_q\): the spherical building of \(G(\mathbb{F}_q)\)
is a finite simplicial complex; its cohomology gives the **Steinberg
representation** of \(G(\mathbb{F}_q)\).

## Solomon-Tits theorem

**Theorem (Solomon, Tits).** A spherical building \(\Delta\) of rank
\(r\) (= dimension \(r-1\)) is **homotopy-equivalent** to a wedge of
\((r-1)\)-spheres:
\[
\Delta \;\simeq\; \bigvee_{i} S^{r-1}.
\]

The number of spheres in the wedge is \(|G(\mathbb{F}_q)| / |B(\mathbb{F}_q)|\)
in the finite case (= Steinberg's formula).

## Tits classification

**Theorem (Tits 1974).** Irreducible spherical buildings of
**Tits rank \(\ge 3\)** are classified: they are exactly the buildings
of simple algebraic groups (or their close relatives, including
twisted forms).

In rank 2, the buildings are **generalized polygons** (= bipartite
graphs of girth \(2n\) and diameter \(n\)) and are classified only
in the finite or Moufang case.

Tits's classification is a high-rank generalisation of the
Fundamental Theorem of Projective Geometry.

## Moufang property

A spherical building is **Moufang** if it has "many automorphisms" —
specifically, root subgroups \(U_\alpha\) acting transitively on
chambers opposite to a given chamber. All buildings of reductive
groups are Moufang.

In Tits's classification: all irreducible thick spherical buildings of
rank \(\ge 3\) are Moufang. Rank 2 (= generalized polygons) admits
non-Moufang examples (e.g.\ "exotic" generalized hexagons).

## Spherical building vs.\ affine building

For \(G\) over a local field \(F\): there are two buildings:

- **Spherical building**: parametrises parabolic subgroups of \(G(F)\);
  finite-dimensional, sphere triangulation.
- **Affine building** (Bruhat-Tits): parametrises parahoric subgroups;
  Euclidean tiling, infinite-dimensional in the sense that apartments
  are full Euclidean spaces.

The spherical building is the "boundary at infinity" of the affine
building (in a precise visual sense).

## Role in Langlands

- **Steinberg representation**: top cohomology of the spherical
  building of \(G(\mathbb{F}_q)\) gives the Steinberg representation,
  the prototype of "Whittaker-supported" representations.
- **Parabolic induction**: the spherical building organises
  parabolic-induction structure.
- **Cohomological structure**: spherical buildings appear in the
  computation of Borel-Serre boundary cohomology.

## Mathlib

Not formalised.

## References

- Tits, *Buildings of Spherical Type and Finite BN-Pairs* (LNM 386,
  1974).
- Brown, *Buildings* (1989).
- Abramenko–Brown, *Buildings: Theory and Applications* (2008).

## Prerequisite Topics

- [[node:buildings.bn_pairs_and_tits_systems|BN-Pairs and Tits Systems]]
