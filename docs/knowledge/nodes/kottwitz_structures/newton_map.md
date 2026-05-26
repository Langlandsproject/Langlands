---
id: kottwitz_structures.newton_map
title: Newton Map
kind: topic
status: admitted
primary_topic: kottwitz_structures
topics:
- kottwitz_structures
uses:
- kottwitz_structures.b_of_g
- root_data_and_duality.root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the Newton map defined for arbitrary reductive groups over local fields, not just GL_n?"
  verdict: "Yes. The Newton map ν : B(G) → (X_*(T)_Q)^Γ / W is defined for any connected reductive G over a non-archimedean local field; the GL_n case (Newton polygons) is the prototype."
tags:
- newton-map
- kottwitz-structures
---

# Newton Map

The **Newton map** \(\nu : B(G) \to (X_*(T)_\mathbb{Q})^\Gamma / W\)
extracts a "slope vector" from a \(\sigma\)-conjugacy class, refining
the **Newton polygon** of \(\mathrm{GL}_n\)-isocrystals to arbitrary
reductive groups. Together with the [[node:kottwitz_structures.kottwitz_homomorphism|Kottwitz map]],
it gives the complete combinatorial description of \(B(G)\).

## Setup

Let \(F\) be a non-archimedean local field, \(\breve F\) the completion
of \(F^{\mathrm{unr}}\) with Frobenius \(\sigma\), \(G\) a connected
reductive group over \(F\), and \(T \subseteq G\) a maximal torus.
Let \(\Gamma = \mathrm{Gal}(\bar F/F)\), \(W = W(G, T)\).

## Definition

For \(b \in G(\breve F)\), define its **Newton point** as follows:

1. Some power \(\sigma^n(b) \cdot \sigma^{n-1}(b) \cdots b\) lies in a
   compact subgroup; thus there is a unique homomorphism (after
   passing to a finite extension)
   \[
   \nu_b : \mathbb{D} \to G_{\breve F}
   \]
   from the "pro-torus" \(\mathbb{D} = \mathrm{Spec}\, \breve F[\mathbb{Q}]\)
   to \(G_{\breve F}\), characterised by \(b \cdot \sigma(\nu_b) \cdot b^{-1} = \nu_b\)
   and an integrality condition.
2. Restrict \(\nu_b\) to a rational cocharacter of \(T\) (after
   conjugating into \(T\)):
   \[
   \nu_b \in X_*(T)_\mathbb{Q}.
   \]
3. Project to a dominant element modulo Weyl-group action and
   Galois-invariance:
   \[
   \nu([b]) \in (X_*(T)_\mathbb{Q})^\Gamma / W.
   \]

## Equivalent: slope homomorphism

For \(G = \mathrm{GL}_n\): the Newton point of an isocrystal \((V, F)\)
is its **Newton polygon**, a multiset of rational slopes summing to
\(\dim V\), recorded as a non-increasing sequence
\((\nu_1 \ge \nu_2 \ge \cdots \ge \nu_n)\) with \(\nu_i \in \mathbb{Q}\).

For \(G\) general: the Newton point is the analogue, valued in a
dominant rational cocharacter chamber.

## Properties

- \(\nu\) is well-defined on \(\sigma\)-conjugacy classes:
  \(\nu(b) = \nu(g b \sigma(g)^{-1})\).
- \(\nu\) is **lower semicontinuous** in the right sense (in
  families).
- The image of \(\nu\) is a partially ordered set with **dominance
  order**: \(\nu \le \nu'\) iff \(\nu' - \nu\) is a non-negative
  rational combination of positive coroots.

## Basic vs.\ non-basic

\([b] \in B(G)\) is **basic** if the Newton point \(\nu([b])\) is
**central** in \(G\), i.e.\ \(\nu([b]) \in X_*(Z(G))_\mathbb{Q}\)
(a "constant" slope vector).

The basic locus consists of the \(\sigma\)-conjugacy classes "closest
to the identity" — analogues of "supersingular" isocrystals for
\(\mathrm{GL}_n\).

## Examples

### \(\mathrm{GL}_n\): Newton polygons

\(B(\mathrm{GL}_n)\) = Newton polygons in \([0, n]\) (where the
\(y\)-coordinate is at height = sum of slopes so far, at
\(x = 0, 1, \ldots, n\)).

- Basic strata: slope vector \((s, s, \ldots, s)\) for \(s = k/n\),
  \(k \in \mathbb{Z}\); these are the "supersingular" isocrystals.
- Largest stratum (Hodge-Newton "ordinary"): slopes \((1, 1, \ldots, 1, 0, 0, \ldots, 0)\).

### \(\mathrm{SL}_n\)

\(B(\mathrm{SL}_n)\) corresponds to Newton polygons in \(\mathrm{GL}_n\)
with **slope sum 0**. Newton point in \((X_*(T)_\mathbb{Q})^\Gamma /W\)
with \(X_* = \{(a_i) : \sum a_i = 0\}\).

### Tori

For a torus \(T\) over \(F\): \(B(T) = X_*(T)^\Gamma\) (via the
Kottwitz map), and \(\nu : B(T) \to X_*(T)_\mathbb{Q}^\Gamma\) is just
the inclusion.

## Newton stratification

For each Newton point \(\bar\nu \in (X_*(T)_\mathbb{Q})^\Gamma / W\):
the preimage \(\nu^{-1}(\bar\nu)\) is the **Newton stratum** of \(B(G)\)
at \(\bar\nu\). Newton strata stratify \(B(G)\), with closure relations
given by the dominance order.

For Shimura varieties: the Newton stratification of the reduction
modulo \(p\) corresponds (via Rapoport-Zink uniformisation) to a
Newton stratification of \(B(G_{\mathrm{cong}})\).

## Hodge-Newton decomposition

For an element \(b \in G(\breve F)\) with \(\nu(b)\) lying on a wall
of the dominant chamber, there is a canonical **Hodge-Newton
decomposition** of \(b\) into a Levi piece (slope corresponding to the
wall) and a basic-like piece in the Levi. This is the structural
result behind the **Kottwitz conjecture** on Shimura varieties.

## Role in Langlands

- **Local Shtuka theory**: Newton points classify isoshtukas with
  \(G\)-structure.
- **Affine Deligne-Lusztig varieties** \(X_w(b)\): non-emptiness and
  dimension formulas depend on the Newton point of \(b\) and the
  affine Weyl group element \(w\).
- **Local Langlands at non-tempered**: Arthur parameters with non-
  trivial \(\mathrm{SL}_2\)-factor correspond to non-basic Newton
  points (via Jacobson-Morozov).
- **Reduction of Shimura varieties**: the **Newton stratification** of
  \(\mathrm{Sh}_K \pmod p\) is indexed by \(B(G)\) modulo Kottwitz's
  admissibility conditions.

## References

- Kottwitz, *Isocrystals with additional structure I, II* (Compositio
  1985, 1997).
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996).
- Hartl, *Period spaces in p-adic Hodge theory* (book draft).
- Görtz, *Affine Deligne-Lusztig varieties and the geometry of
  Shimura varieties* (notes, 2009).

## Prerequisite Topics

- [[node:kottwitz_structures.b_of_g|B(G)]]
- [[node:root_data_and_duality.root_data|Root Data]]
