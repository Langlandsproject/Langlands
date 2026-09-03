---
id: buildings.coxeter_complexes
title: Coxeter Complexes
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Buildings
topics:
- AlgebraicGroups.Buildings
uses:
- root_data.coxeter_systems_and_bruhat_order
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Coxeter complexes defined abstractly from any Coxeter system, with both finite (spherical) and infinite (affine, hyperbolic) cases included?"
  verdict: "Yes. The simplicial Coxeter complex Σ(W, S) is defined for any Coxeter system; the finite case gives the spherical (sphere triangulation) realisation and the infinite case the Euclidean (or hyperbolic) realisation."
tags:
- coxeter-complexes
- buildings-and-parahorics
---

# Coxeter Complexes

A **Coxeter complex** is the simplicial complex of cosets of standard
parabolic subgroups in a Coxeter group. It is the **apartment** in the
theory of buildings — the model fragment from which the full building
is glued.

## Definition

Let \((W, S)\) be a Coxeter system. The **Coxeter complex** \(\Sigma(W, S)\)
is the abstract simplicial complex whose:

- **vertices** are cosets \(w W_{S \setminus \{s\}}\) for \(s \in S, w \in W\)
  (one orbit per simple reflection);
- **simplices** are cosets \(w W_I\) for proper subsets \(I \subsetneq S\),
  ordered by reverse inclusion.

The top-dimensional simplices (**chambers**) correspond to cosets
\(w W_\emptyset = \{w\}\) and are in bijection with \(W\).

## Geometric realisation

### Spherical case (\(W\) finite)

If \(W\) is finite, \(\Sigma(W, S)\) has a natural realisation as a
**sphere triangulation**: \(W\) acts on a Euclidean space \(V\) by
the reflection representation, with the unit sphere
\(S^{r-1} \subseteq V\) (\(r\) = rank) triangulated by the hyperplane
arrangement. Each chamber is a spherical simplex.

### Affine case (\(W\) affine)

For an affine Weyl group \(W_{\mathrm{aff}}\) acting on a Euclidean
space \(\mathbb{E}\) (= \(\mathbb{R}^r\)), the Coxeter complex is the
**Euclidean apartment** — a tiling of \(\mathbb{E}\) by congruent
simplices (alcoves) under the action of \(W_{\mathrm{aff}}\).

### Hyperbolic case

For Coxeter groups with no finite/affine reduction, the realisation
is a tessellation of hyperbolic space.

## Examples

### \(W = S_3\) (type \(A_2\))

\(\Sigma(S_3, S)\) is the boundary of a triangle: 6 chambers
(= permutations), arranged as a hexagonal cycle when realised as the
triangulation of \(S^1\) by 6 arcs.

### \(W = S_4\) (type \(A_3\))

\(\Sigma(S_4, S)\) triangulates a 2-sphere: 24 chambers, 36 edges,
14 vertices. It is the "permutahedron" boundary realised spherically.

### Affine \(\tilde A_1\)

\(W_{\mathrm{aff}} = \langle s_0, s_1 : s_0^2 = s_1^2 = 1 \rangle = \mathbb{Z} \rtimes \mathbb{Z}/2\),
the infinite dihedral group. The Coxeter complex is the
real line tiled by unit intervals; chambers = intervals = 0-simplices'
edges between adjacent vertices.

### Affine \(\tilde A_2\)

The Euclidean plane tiled by equilateral triangles — the **triangular
lattice apartment**. This is the prototype for affine apartments in
type \(A_n\).

## Structure

### Galleries

A **gallery** from chamber \(C\) to chamber \(D\) is a sequence
\(C = C_0, C_1, \ldots, C_n = D\) of chambers with \(C_i, C_{i+1}\)
sharing a codimension-1 face. The minimum length is the **gallery
distance** \(d(C, D)\), equal to the Coxeter group distance.

### Walls and roots

Each codimension-1 simplex (**panel**) is contained in exactly two
chambers. The hyperplane stabilising it (= **wall**) splits the
Coxeter complex into two halves (**roots** in the building sense).
Each wall corresponds to a reflection in \(W\).

### Apartments are thin

A simplicial complex is **thin** if every panel is contained in
exactly two chambers. Coxeter complexes are thin; this is the
characteristic property that distinguishes them from buildings (which
are "thick" except in apartments).

## From Coxeter complex to building

A **building** \(\mathcal{B}\) of type \((W, S)\) is a simplicial
complex obtained by gluing copies of \(\Sigma(W, S)\) (apartments)
according to a system of charts:

- every two chambers lie in a common apartment;
- the gluings between apartments are isomorphisms.

The apartments are the Coxeter complexes; the building itself is
"thick" — most panels are contained in many chambers.

## Role for reductive groups

For a connected reductive group \(G\) over a field \(k\):

- **Spherical building \(\Delta(G, k)\)**: built from the Coxeter
  complex of the **finite** Weyl group of \(G\). Vertices = maximal
  parabolics of \(G\); chambers = Borels.
- **Affine (Bruhat-Tits) building**: for \(G\) over a local field,
  built from the **affine** Coxeter complex of \(G\). Vertices =
  maximal parahoric subgroups; chambers = Iwahori subgroups.

The geometry of these buildings encodes everything from Bruhat
decomposition (spherical case) to the local Langlands correspondence
and the geometric Satake equivalence (affine case).

## References

- Tits, *Buildings of Spherical Type and Finite BN-Pairs* (LNM 386,
  1974), Ch. 2.
- Brown, *Buildings* (1989), Ch. III.
- Abramenko–Brown, *Buildings: Theory and Applications* (2008),
  Ch. 3.

## Prerequisite Topics

- [[node:root_data.coxeter_systems_and_bruhat_order|Coxeter Systems and Bruhat Order]]
