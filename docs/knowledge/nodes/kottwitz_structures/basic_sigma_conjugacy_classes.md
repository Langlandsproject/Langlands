---
id: kottwitz_structures.basic_sigma_conjugacy_classes
title: Basic Sigma-Conjugacy Classes
kind: topic
status: admitted
primary_topic: kottwitz_structures
topics:
- kottwitz_structures
uses:
- kottwitz_structures.newton_map
- kottwitz_structures.kottwitz_map_on_b_of_g
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are basic elements of B(G) defined uniformly across reductive groups, with their bijection to inner forms?"
  verdict: "Yes. Basic elements are those with central Newton point; they are in bijection with π_1(G_ad)_Γ ≅ H^1(F, G_ad) = inner forms of G."
tags:
- basic-elements
- sigma-conjugacy
- kottwitz-structures
---

# Basic Sigma-Conjugacy Classes

A \(\sigma\)-conjugacy class \([b] \in B(G)\) is **basic** if its
Newton point is **central**: \(\nu([b]) \in X_*(Z(G))_\mathbb{Q}\).
Basic classes are the "constant-slope" classes — the analogues of
"supersingular" isocrystals — and they classify the inner forms of
\(G\) and the Rapoport-Zink spaces.

## Definition

Let \(b \in G(\breve F)\) and let
\(\nu_b \in X_*(T)_\mathbb{Q}^\Gamma / W\) be its Newton point. The
class \([b] \in B(G)\) is **basic** if \(\nu_b\) is invariant under the
Weyl group action on \(X_*(T)\) — equivalently, \(\nu_b\) is **central**
in \(G\):
\[
\nu_b \in X_*(Z(G))_\mathbb{Q}^\Gamma.
\]

The set of basic classes is denoted \(B(G)_{\mathrm{basic}}\).

## Characterisation

Equivalent conditions for \([b]\) to be basic:

1. The Newton point \(\nu_b\) is central (i.e.\ a cocharacter of
   \(Z(G)\)).
2. The slope decomposition is "all one slope" in the \(G\)-isocrystal
   picture.
3. The Jacobson-Morozov \(\mathrm{SL}_2\)-triple attached to \(b\) is
   **trivial** (the unipotent factor of the Mazur-Kottwitz Hodge
   decomposition is trivial).
4. \([b]\) is **minimal** in its connected component of \(B(G)\) under
   the dominance order on Newton points.

## Bijection with inner forms

**Theorem (Kottwitz).**
\[
B(G)_{\mathrm{basic}} \;\stackrel{\sim}{\longleftrightarrow}\; H^1(F, G_{\mathrm{ad}}) \;=\; \{\text{inner forms of } G \text{ over } F\}.
\]

The bijection is via the Kottwitz map: a basic class \([b]\) has
\(\kappa_G([b]) \in \pi_1(G)_\Gamma\), which (via the dual
identification \(\pi_1(G_{\mathrm{ad}}) = H^1(F, G_{\mathrm{ad}})\) for
basic elements) determines an inner form.

Each basic class \([b]\) determines:

- An **inner twist** \(G_b\) of \(G\) (the centraliser of \(\nu_b\) in
  \(G\), an inner form of \(G\) itself in the basic case).
- A **basic Rapoport-Zink space** \(\mathcal{M}_{G, b, \mu}\) whose
  geometry encodes part of local Langlands.

## Examples

### \(\mathrm{GL}_n\)

\(B(\mathrm{GL}_n)_{\mathrm{basic}}\) = constant-slope Newton polygons,
i.e.\ \(\nu = (s, s, \ldots, s)\) for \(s \in \mathbb{Q}\) with
denominator dividing \(n\).

The basic class with slope \(s = k/n\) (\(\gcd(k, n) = d\)) corresponds
to the central simple algebra \(D_{k/n} = D\) of degree \(n/d\) and
invariant \(k\); the inner form is \(\mathrm{GL}_{d}(D)\).

In particular:
- \(s = 0\): split form \(\mathrm{GL}_n\) (trivial Brauer class).
- \(s = k/n\) with \(\gcd(k, n) = 1\): "supersingular" class, inner
  form is \(\mathrm{SL}_1(D)\) for \(D\) a division algebra of degree
  \(n\) and invariant \(k\).

### \(\mathrm{SL}_n\)

\(\pi_1(\mathrm{SL}_n) = 0\), so \(B(\mathrm{SL}_n)_{\mathrm{basic}}\)
is a single point: the unique inner form is \(\mathrm{SL}_n\) itself.
(Actually \(H^1(F, \mathrm{PGL}_n) \ne 0\), but inner forms of
\(\mathrm{SL}_n\) are \(\mathrm{SL}_1(D)\)'s for division algebras
\(D\) of degree \(n\) — which are the basic classes in
\(B(\mathrm{PGL}_n)\) — but as inner forms of the simply-connected
\(\mathrm{SL}_n\) they don't appear; the relation goes via
\(z\)-extensions.)

### Tori

For a torus \(T\): every \(\sigma\)-conjugacy class is basic
(\(\nu = \kappa\)), and \(B(T) = X_*(T)^\Gamma = \pi_1(T)_\Gamma\) is
in trivial bijection with itself.

## Connectedness of \(B(G)\)

\(B(G)\) has finitely many connected components in the closure order,
each labelled by an element of \(\pi_1(G)_\Gamma\) via the Kottwitz
map. Each component has a unique **basic** class at its minimum (the
Kottwitz image), and a unique generic class at its maximum (the
"ordinary" or top stratum).

## Role in Shimura varieties

For a Shimura datum \((G, X)\) with associated minuscule cocharacter
\(\{\mu\}\): the Newton stratification of \(\mathrm{Sh}_K \pmod p\) has
strata indexed by the **admissible set** \(B(G, \mu) \subseteq B(G)\),
i.e.\ classes \([b]\) with Newton point \(\nu_b\) lying in the convex
hull of \(W\mu\).

The **basic stratum** corresponds to the unique basic class in
\(B(G, \mu)\); it is the "supersingular" stratum, and its geometry is
governed by **Rapoport-Zink spaces** and \(p\)-adic uniformisation.

## Role in Langlands

- **Bijection with inner forms**: basic classes ↔ inner forms is the
  source of the **isocrystal version of local Langlands**.
- **Basic Rapoport-Zink spaces**: deformation spaces of basic
  isocrystals; their cohomology realises local Langlands at the
  basic block (Harris-Taylor for \(\mathrm{GL}_n\)).
- **Fargues-Fontaine curve**: provides a more flexible framework
  unifying all classes, with basic classes as the simplest case.

## References

- Kottwitz, *Isocrystals with additional structure II* (Compositio
  1997).
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996).
- Rapoport–Zink, *Period spaces for p-divisible groups* (Annals of
  Math.\ Studies 1996).

## Prerequisite Topics

- [[node:kottwitz_structures.newton_map|Newton Map]]
- [[node:kottwitz_structures.kottwitz_map_on_b_of_g|Kottwitz Map on B(G)]]
