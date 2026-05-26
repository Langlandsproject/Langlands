---
id: buildings_and_parahorics.bruhat_tits_apartments
title: Bruhat-Tits Apartments
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- foundational_inputs.local_fields
- buildings_and_parahorics.reductive_groups_over_local_fields
- buildings_and_parahorics.valued_root_data
- buildings_and_parahorics.affine_weyl_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Bruhat-Tits apartments defined uniformly for arbitrary reductive groups over non-archimedean local fields?"
  verdict: "Yes. The apartment is X_*(S)_R for a maximal split torus S, tiled by the extended affine Weyl group; constructions work for split, non-split, and quasi-split reductive groups."
tags:
- bruhat-tits
- apartments
- buildings-and-parahorics
---

# Bruhat-Tits Apartments

A **Bruhat-Tits apartment** is the basic Euclidean piece of the
affine building of a reductive group over a local field. It is a real
vector space tiled by alcoves under the action of the extended affine
Weyl group, and copies of it glue to form the full Bruhat-Tits
building.

## Definition

Let \(G\) be a connected reductive group over a non-archimedean local
field \(F\) with maximal \(F\)-split torus \(S \subseteq G\). The
**standard Bruhat-Tits apartment** is the real vector space
\[
\mathbb{A}(G, S) \;:=\; X_*(S) \otimes_\mathbb{Z} \mathbb{R},
\]
together with the action of the **extended affine Weyl group**
\[
\tilde W \;=\; W(G, S) \;\ltimes\; X_*(S),
\]
where \(W(G, S) = N_G(S)/Z_G(S)\) is the relative Weyl group, and
\(X_*(S)\) acts by translations.

## Structure

\(\mathbb{A}(G, S)\) is tiled by **alcoves** — fundamental domains for
\(\tilde W\) — and **facets** of lower dimensions:

- **Alcoves** (top-dimensional facets) = chambers of the affine
  Coxeter complex.
- **Vertices** (0-dimensional facets) = corners of alcoves.
- **Walls** = boundaries of alcoves = hyperplanes defined by **affine
  roots** \(\psi = \alpha + n\) for \(\alpha\) a relative root and
  \(n \in \mathbb{Z}\).

## Affine root system on \(\mathbb{A}\)

The set of affine roots
\[
\Psi \;=\; \{\alpha + n : \alpha \in \Phi(G, S), \;n \in \mathbb{Z}\}
\]
is the **valued root system** of \((G, F)\). Each \(\psi \in \Psi\)
gives an affine hyperplane \(\ker(\psi) \subseteq \mathbb{A}\).

For non-quasi-split or unramified \(G\): the affine roots may have
non-integer translates (e.g.\ \(\alpha + n/2\) for ramified cases).

## Construction from valued root data

Let \(K = \widehat{F^{\mathrm{unr}}}\) and let \(\sigma\) be Frobenius.
The apartment is constructed via the **valued root datum** of
\((G, S)\): the additional data of:

- A **valuation** \(\omega : K^\times \to \mathbb{Q}\) (normalised so
  \(\omega(\pi) = 1\) for a uniformiser \(\pi\));
- For each root \(\alpha\) and root subgroup \(U_\alpha\): a
  filtration \(U_\alpha = \cup_n U_{\alpha, n}\) compatible with
  \(\omega\).

The apartment is the unique smooth affine space realising this
filtration combinatorics.

## Examples

### \(\mathrm{SL}_2(\mathbb{Q}_p)\)

\(X_*(S) = \mathbb{Z}\); apartment = \(\mathbb{R}\) (1-dimensional).
Affine roots: \(\pm \varepsilon + n\) for \(n \in \mathbb{Z}\), giving
walls at \(\frac{1}{2}\mathbb{Z}\). Alcoves: intervals \([n, n+\frac{1}{2}]\).

The full Bruhat-Tits building is the \((p+1)\)-regular tree, with
each apartment being a "line" in the tree.

### \(\mathrm{SL}_n(F)\)

Apartment = \(\mathbb{R}^{n-1}\) tiled by the affine type-\(\tilde A_{n-1}\)
tessellation; alcoves are \((n-1)\)-simplices.

### \(\mathrm{Sp}_{2n}(F)\)

Apartment = \(\mathbb{R}^n\); type \(\tilde C_n\) tessellation.

## Bruhat-Tits theory

**Theorem (Bruhat-Tits).** Each connected reductive \(G\) over \(F\)
has a **unique** (up to isomorphism) affine building \(\mathcal{B}(G, F)\)
constructed by gluing copies of \(\mathbb{A}(G, S)\) (apartments) along
\(G(F)\)-translates.

The building has the **CAT(0)** property (non-positive curvature),
making it a complete metric space on which \(G(F)\) acts properly by
isometries.

## Galois descent

For \(G\) not necessarily split, but quasi-split:

1. Construct the apartment for \(G_K\) over \(K = \widehat{F^{\mathrm{unr}}}\)
   (split).
2. Take \(\mathrm{Gal}(K/F)\)-invariants:
   \(\mathbb{A}(G, S)^{\mathrm{Gal}} = \mathbb{A}(G_F, S_F)\).

For anisotropic \(G\) (no \(F\)-split torus): the apartment is a
single point, and the building is a single point — but the parahoric
theory is non-trivial via the residue-field reductive structure.

## Role in Langlands

- **Iwahori-Hecke algebra**: arises from the \(G(F)\)-action on the
  apartment via the affine Weyl group.
- **Moy-Prasad filtration**: defined point-by-point on the apartment;
  gives the depth filtration of \(G(F)\) used in supercuspidal
  parametrisation.
- **\(L^2\)-cohomology**: of the building computes pro-\(p\)
  Iwahori cohomology, foundational for mod \(p\) Langlands.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (Publ.\
  IHES 1972, 1984).
- Tits, *Reductive groups over local fields* (Proc.\ AMS Symp.\ 1979).
- Yu, *Bruhat-Tits theory: a new approach* (preprint, 2002).

## Prerequisite Topics

- [[node:foundational_inputs.local_fields|Local Fields]]
- [[node:buildings_and_parahorics.reductive_groups_over_local_fields|Reductive Groups over Local Fields]]
- [[node:buildings_and_parahorics.valued_root_data|Valued Root Data]]
- [[node:buildings_and_parahorics.affine_weyl_groups|Affine Weyl Groups]]
