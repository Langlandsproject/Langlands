---
id: kottwitz_structures.kottwitz_map_on_b_of_g
title: Kottwitz Map on B(G)
kind: topic
status: admitted
primary_topic: kottwitz_structures
topics:
- kottwitz_structures
uses:
- kottwitz_structures.b_of_g
- kottwitz_structures.algebraic_fundamental_group
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the Kottwitz map on B(G) treated as the canonical projection to the algebraic fundamental group, for arbitrary reductive groups?"
  verdict: "Yes. The Kottwitz map κ : B(G) → π_1(G)_Γ is functorial in G and surjective; together with the Newton map it injects B(G) into a combinatorial set."
tags:
- kottwitz-map
- b-g
- kottwitz-structures
---

# Kottwitz Map on B(G)

The **Kottwitz map** \(\kappa_G : B(G) \to \pi_1(G)_\Gamma\) projects
\(\sigma\)-conjugacy classes to the Galois coinvariants of the
algebraic fundamental group. Together with the
[[node:kottwitz_structures.newton_map|Newton map]], it gives a complete
combinatorial description of \(B(G)\).

## Setup

Let \(F\) be a non-archimedean local field, \(\breve F\) the
completion of \(F^{\mathrm{unr}}\), \(\sigma\) the Frobenius. Let
\(G\) be a connected reductive group over \(F\) and
\(\pi_1(G) = X_*(T)/\mathbb{Z}\Phi^\vee\) its algebraic fundamental
group, with Galois group \(\Gamma\) acting.

The **Kottwitz map** is a canonical homomorphism
\[
\kappa_G : B(G) \;\longrightarrow\; \pi_1(G)_\Gamma,
\]
where \(\pi_1(G)_\Gamma = \pi_1(G) / (\sigma - 1)\pi_1(G)\) are the
Frobenius coinvariants.

## Construction

### Torus case

For \(G = T\) a torus: \(\pi_1(T) = X_*(T)\) and the Kottwitz map is
the **valuation**:
\[
\kappa_T : B(T) \to X_*(T)_\Gamma, \qquad [t] \mapsto v(t),
\]
where \(v(t) \in X_*(T)\) is the cocharacter
\(\chi \mapsto v(\chi(t))\). This is a bijection
\(B(T) \xrightarrow{\sim} X_*(T)_\Gamma\).

### General \(G\)

For a connected reductive \(G\): use the abelianisation map
\(G \twoheadrightarrow G/G_{\mathrm{der}}\) (a torus) and functoriality:
\[
\kappa_G : B(G) \;\to\; B(G/G_{\mathrm{der}}) \;\stackrel{\kappa_T}{=}\; X_*(G/G_{\mathrm{der}})_\Gamma \;=\; \pi_1(G)_\Gamma.
\]

For non-simply-connected derived groups, the construction uses a
**\(z\)-extension** or the Borovoi-Kottwitz crossed-module formalism.

## Properties

- **Functoriality**: For \(f : G \to G'\), the diagram
  \(B(G) \to B(G')\), \(\pi_1(G)_\Gamma \to \pi_1(G')_\Gamma\)
  commutes.
- **Surjectivity**: \(\kappa_G\) is surjective.
- **Compatibility with Newton map**: the image of \(\nu : B(G) \to (X_*(T)_\mathbb{Q})^\Gamma/W\)
  satisfies
  \(\bar\nu = \kappa_G \pmod{\text{linear span of coroots}}\)
  — i.e.\ the Newton point projects to the Kottwitz image under the
  natural map \((X_*(T)_\mathbb{Q})^\Gamma \to \pi_1(G)_\mathbb{Q}^\Gamma\).

## Kottwitz's theorem

**Theorem (Kottwitz 1997).** The combined map
\[
(\kappa_G, \nu_G) : B(G) \;\hookrightarrow\; \pi_1(G)_\Gamma \times (X_*(T)_\mathbb{Q})^\Gamma / W
\]
is **injective**.

The image is characterised by an "admissibility" condition: \(\nu\)
must dominate \(\kappa_G\) in the dominance order, and the projection
of \(\nu\) to \(\pi_1(G)_\Gamma \otimes \mathbb{Q}\) must equal
\(\kappa_G\).

This is the **Kottwitz classification theorem** of \(B(G)\).

## Examples

### \(\mathrm{GL}_n\)

\(\pi_1(\mathrm{GL}_n) = \mathbb{Z}\), Galois acts trivially, so
\(\pi_1(\mathrm{GL}_n)_\Gamma = \mathbb{Z}\).

\(\kappa_{\mathrm{GL}_n} : B(\mathrm{GL}_n) \to \mathbb{Z}\) sends an
isocrystal of dimension \(n\) and slope sum \(s\) (i.e.\ Newton polygon
ending at height \(s\)) to \(s\). Equivalently, \(\kappa(b) = v(\det b)\).

### \(\mathrm{SL}_n\)

\(\pi_1(\mathrm{SL}_n) = 0\), so \(\kappa\) is trivial. \(B(\mathrm{SL}_n)\)
is then classified by the Newton point alone, subject to
"slope sum = 0."

### \(\mathrm{PGL}_n\)

\(\pi_1(\mathrm{PGL}_n) = \mathbb{Z}/n\); \(\kappa\) detects the
**Brauer class** of the isocrystal (modulo \(n\)).

## Basic strata

The **basic elements** of \(B(G)\) are those with \(\kappa\) Galois-
trivial (in some technical sense) — equivalently, central Newton point.
They are in bijection (in a precise sense) with
\(\pi_1(G)_\Gamma / (\text{torsion})\) and are the "supersingular"
classes.

## Role for inner forms

\(\pi_0(\kappa_G) := \ker(\kappa_G \to \pi_1(\mathrm{ad}\, G)_\Gamma)\)
classifies the **inner forms** of \(G\) over \(F\):
\[
H^1(F, G_{\mathrm{ad}}) \;\cong\; \pi_1(G_{\mathrm{ad}})_\Gamma \;\hookrightarrow\; \pi_1(G)_\Gamma.
\]

So each inner form of \(G\) over \(F\) corresponds to a specific basic
class in \(B(G)\) — the bridge between cohomological inner-form theory
and \(\sigma\)-conjugacy.

## References

- Kottwitz, *Isocrystals with additional structure II* (Compositio
  1997).
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996).
- Görtz, *Affine Deligne-Lusztig varieties and the geometry of
  Shimura varieties* (notes, 2009).

## Prerequisite Topics

- [[node:kottwitz_structures.b_of_g|B(G)]]
- [[node:kottwitz_structures.algebraic_fundamental_group|Algebraic Fundamental Group]]
