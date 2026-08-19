---
id: kottwitz.isocrystals_with_g_structure
title: Isocrystals with G-Structure
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Kottwitz
topics:
- AlgebraicGroups.Kottwitz
uses:
- kottwitz.b_of_g
- kottwitz.sigma_conjugacy_classes
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are isocrystals with G-structure defined for arbitrary reductive groups, with the bijection to B(G)?"
  verdict: "Yes. The category of G-isocrystals is equivalent to the groupoid of σ-conjugacy classes B(G); the GL_n case (= Dieudonné-Manin) is the prototype."
tags:
- isocrystals
- g-structure
- kottwitz-structures
---

# Isocrystals with G-Structure

For a connected reductive group \(G\) over \(F\), an **isocrystal
with \(G\)-structure** (or **\(G\)-isocrystal**) is a tensor-functorial
generalisation of an isocrystal, classified by \(B(G)\). They are the
\(p\)-adic analogue of representations of \(G\) and the natural setting
for the Newton stratification of Shimura varieties.

## Definition

Let \(F\) be a non-archimedean local field with residue field
\(\mathbb{F}_q\), \(\breve F\) the completion of \(F^{\mathrm{unr}}\),
\(\sigma\) the Frobenius automorphism.

### \(\mathrm{GL}_n\)-case (= classical isocrystal)

An **isocrystal** of dimension \(n\) over \(F\) is a pair \((V, F_V)\)
where:
- \(V\) is a finite-dimensional \(\breve F\)-vector space of dim \(n\);
- \(F_V : V \to V\) is a \(\sigma\)-linear bijection.

Isomorphism classes (under \(\sigma\)-linear \(\breve F\)-linear maps)
form a category.

**Dieudonné-Manin classification.** \(\mathrm{GL}_n\)-isocrystals up to
isomorphism are classified by **Newton polygons** in \([0, n]\) (=
multisets of \(n\) rational numbers with denominator \(\le n\)).

### General \(G\)

A **\(G\)-isocrystal** is a tensor functor
\[
\mathcal{I}_b : \mathrm{Rep}_F(G) \;\longrightarrow\; \mathrm{Isoc}(F),
\]
from finite-dimensional \(F\)-representations of \(G\) to isocrystals,
compatible with tensor products and duals.

Concretely: given \(b \in G(\breve F)\), define
\(\mathcal{I}_b(V, \rho) = (V \otimes \breve F, \rho(b) \circ \sigma_V)\).
Two such functors are isomorphic iff the corresponding \(b\)'s are
\(\sigma\)-conjugate in \(G(\breve F)\):

\[
\{G\text{-isocrystals}\} / \cong \;\stackrel{\sim}{\longrightarrow}\; B(G).
\]

## Equivalence via Tannakian formalism

The classification reduces to: the **groupoid** of \(G\)-isocrystals
is equivalent to the **action groupoid** of \(\sigma\)-conjugacy
classes \(B(G)\), with morphisms = elements of stabilisers
\(\{g : g b \sigma(g)^{-1} = b\}\).

This makes the structure of \(B(G)\) intrinsically Tannakian: it
classifies fiber functors on \(\mathrm{Rep}_F(G)\) with values in
\(\mathrm{Isoc}(F)\).

## Slopes and Newton

Given a \(G\)-isocrystal \(\mathcal{I}_b\):

- Apply to a representation \(\rho : G \to \mathrm{GL}_n\):
  \(\rho_*(\mathcal{I}_b)\) is a classical isocrystal with Newton
  polygon a specific multiset.
- The slope decomposition of \(\rho_*(\mathcal{I}_b)\) refines the
  \(G\)-data.
- The **Newton point** of \(b\) (as a rational cocharacter modulo \(W\))
  is the universal slope datum, recovering all \(\rho_*\)-Newton
  polygons by composition.

## Examples

### \(\mathrm{GL}_n\)-isocrystals

Slope decomposition: \(V = \bigoplus_\lambda V_\lambda\) where
\(V_\lambda\) is the maximal subspace on which \(F^k\) has all
eigenvalues of valuation \(k \cdot \lambda\) (Dieudonné-Manin).

For a single rational slope \(\lambda = p/q\) (\(\gcd(p, q) = 1\)):
the unique "simple" isocrystal of slope \(\lambda\) has dimension \(q\).

### \(G = T\) a torus

\(T\)-isocrystals = \(\sigma\)-conjugacy classes in \(T(\breve F)\)
\(\cong X_*(T)^\Gamma\); the Newton map is the inclusion
\(X_*(T)^\Gamma \hookrightarrow X_*(T)_\mathbb{Q}^\Gamma\).

### \(\mathrm{Sp}_{2n}\)-isocrystals

Slope decompositions are constrained by the symplectic structure:
the multiset of slopes \(\{\lambda_i\}\) satisfies
\(\lambda_i + \lambda_{2n+1-i} = 0\) (symmetric around \(0\)).

## Hodge structure analogues

A **Hodge \(G\)-structure** on an \(G\)-isocrystal: a filtration of
the underlying vector spaces compatible with the \(G\)-action. For
\(\mathrm{GL}_n\), this is the classical Hodge filtration.

**Mazur-Kottwitz inequality**: the Hodge polygon lies below the Newton
polygon (with equal endpoints). This is a refinement of
Mazur's classical Hodge-Newton theorem to \(G\)-structures.

## Role in Langlands

- **Shimura varieties**: the reduction modulo \(p\) of a Shimura
  variety \(\mathrm{Sh}_K\) is stratified by the Newton stratification
  of \(B(G)\); each stratum corresponds to a class of \(G\)-isocrystals.
- **Rapoport-Zink spaces**: the deformation spaces of (\(p\)-divisible
  groups with \(G\)-structure) are parametrised by elements of
  \(B(G)\); their geometry is studied via the affine Deligne-Lusztig
  variety.
- **Local Langlands and isocrystals**: the **Fargues-Fontaine curve**
  realises \(G\)-isocrystals geometrically and gives a new approach
  to local Langlands.

## References

- Kottwitz, *Isocrystals with additional structure I, II* (Compositio
  1985, 1997).
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996).
- Rapoport–Zink, *Period spaces for p-divisible groups* (Annals of
  Math.\ Studies 1996).
- Fargues–Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge
  p-adique* (Astérisque 2018).

## Prerequisite Topics

- [[node:kottwitz.b_of_g|B(G)]]
- [[node:kottwitz.sigma_conjugacy_classes|Sigma-Conjugacy Classes]]
