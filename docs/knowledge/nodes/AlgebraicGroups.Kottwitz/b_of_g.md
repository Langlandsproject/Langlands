---
id: kottwitz.b_of_g
title: B(G)
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Kottwitz
topics:
- AlgebraicGroups.Kottwitz
uses:
- kottwitz.sigma_conjugacy_classes
- kottwitz.kottwitz_homomorphism
- kottwitz.algebraic_fundamental_group
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is B(G) treated for reductive groups over local fields uniformly, not specialised to GL_n?"
  verdict: "Yes. B(G) is defined for any connected reductive group G over a non-archimedean local field, with the GL_n case as the most concrete example (isocrystals)."
tags:
- b-g
- kottwitz
- kottwitz-structures
---

# B(G)

For a connected reductive group \(G\) over a non-archimedean local
field \(F\) (or equivalently over the Witt-vector ring), the **Kottwitz
set** \(B(G)\) is the set of \(\sigma\)-conjugacy classes in \(G(\breve F)\),
where \(\breve F\) is the completion of the maximal unramified extension
of \(F\) and \(\sigma\) is the Frobenius. \(B(G)\) is the basic
arithmetic invariant of \(G\) controlling its forms, isocrystals, and
Newton stratification.

## Definition

Let \(F\) be a non-archimedean local field with residue field
\(\mathbb{F}_q\), completion of the maximal unramified extension
\(\breve F = \widehat{F^{\mathrm{unr}}}\), Frobenius automorphism
\(\sigma : \breve F \to \breve F\). For a connected reductive group
\(G\) over \(F\):

\[
B(G) \;=\; G(\breve F) \;/\; \sigma\text{-conjugacy},
\]

where two elements \(g, h \in G(\breve F)\) are
\(\sigma\)-**conjugate** if \(h = x g \sigma(x)^{-1}\) for some
\(x \in G(\breve F)\).

## The Kottwitz invariants

Kottwitz introduced two fundamental invariants
\(\kappa : B(G) \to X^*(Z(\hat G))^{\Gamma}\) and
\(\nu : B(G) \to (X_*(T)_\mathbb{Q})^{\Gamma}/W\) (the **Newton
homomorphism**):

- \(\kappa\) is the **Kottwitz homomorphism**, classifying the image in
  the algebraic fundamental group;
- \(\nu\) is the **Newton point** (an element of the rational
  cocharacter chamber).

**Kottwitz's theorem:** the pair \((\kappa, \nu)\) is injective on
\(B(G)\).

## Examples

### \(G = \mathrm{GL}_n\)

By Dieudonné–Manin, \(\sigma\)-conjugacy classes in \(\mathrm{GL}_n(\breve F)\)
are classified by **isocrystals** of dimension \(n\), which are
parametrised by their Newton polygons (= multisets of \(n\) rational
numbers with denominators \(\le n\)).

Equivalently, \(B(\mathrm{GL}_n) \cong\) {Newton polygons in
\([0, 1]\) of slope length \(\le n\)}.

### \(G\) a torus

For a torus \(T\), \(B(T) = X_*(T)^{\Gamma}\) (Galois invariants of the
cocharacter lattice). The Newton map is the identity composed with the
embedding into \((X_*(T)_\mathbb{Q})^{\Gamma}\).

### General \(G\)

\(B(G)\) is partitioned into **Newton strata** indexed by \(\nu \in (X_*(T)_\mathbb{Q})^{\Gamma}/W\),
with each stratum a torsor for the central kernel. The set has a
partial order (the **Bruhat-like order** on Newton points), with
**basic** strata corresponding to elements where \(\nu\) is central.

## Why B(G) matters

- **Affine Deligne-Lusztig varieties.** Indexed by elements of \(B(G)\)
  paired with elements of an affine Weyl group; their geometry encodes
  much of the \(p\)-adic representation theory.
- **Local Langlands.** The set \(B(G)\) parametrises the "inner forms"
  of \(G\) showing up in Kottwitz's parametrisation of local
  L-packets.
- **Shimura varieties.** The reduction modulo \(p\) of Shimura
  varieties has a Newton stratification indexed by elements of \(B(G)\)
  (Rapoport).
- **Hodge–Newton decomposition.** Compatibility of Newton and Hodge
  filtrations on a \(\mathrm{GL}_n\) isocrystal.

## References

- Kottwitz, *Isocrystals with additional structure I, II* (Compos. Math.
  1985, 1997).
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996).
- Görtz, *Affine Deligne–Lusztig varieties and the geometry of
  Shimura varieties* (notes, 2009).

## Prerequisite Topics

- [[node:kottwitz.sigma_conjugacy_classes|Sigma-Conjugacy Classes]]
- [[node:kottwitz.kottwitz_homomorphism|Kottwitz Homomorphism]]
- [[node:kottwitz.algebraic_fundamental_group|Algebraic Fundamental Group]]
