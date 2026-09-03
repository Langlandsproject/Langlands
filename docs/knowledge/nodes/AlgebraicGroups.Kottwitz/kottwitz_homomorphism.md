---
id: kottwitz.kottwitz_homomorphism
title: Kottwitz Homomorphism
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Kottwitz
topics:
- AlgebraicGroups.Kottwitz
uses:
- kottwitz.algebraic_fundamental_group
- root_data.galois_action_on_root_data
- foundations.local_fields
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the Kottwitz homomorphism stated uniformly for connected reductive groups over local fields?"
  verdict: "Yes. The Kottwitz map is a functorial homomorphism B(G) → pi_1(G)_Gamma for any connected reductive G over a local field; specialisations to tori and to GL_n are corollaries."
tags:
- kottwitz-map
- kottwitz-homomorphism
- kottwitz-structures
---

# Kottwitz Homomorphism

The **Kottwitz homomorphism** \(\kappa_G : B(G) \to \pi_1(G)_\Gamma\)
is the canonical map from \(\sigma\)-conjugacy classes in
\(G(\breve F)\) to the Galois-coinvariants of the algebraic
fundamental group. Together with the **Newton map** it makes
[[node:kottwitz.b_of_g|\(B(G)\)]] into a tractable
combinatorial set.

## Setup

Let \(F\) be a non-archimedean local field with residue field
\(\mathbb{F}_q\), completion of the maximal unramified extension
\(\breve F\), Frobenius \(\sigma\), absolute Galois group
\(\Gamma = \operatorname{Gal}(\bar F/F)\). Let \(G\) be a connected
reductive group over \(F\) and \(\pi_1(G)\) its **algebraic
fundamental group** ([[node:kottwitz.algebraic_fundamental_group|see node]]).

## Construction

### Case 1: \(G = T\) a torus

For a torus \(T\) over \(F\), \(\pi_1(T) = X_*(T)\) and the Kottwitz
map is given by the **valuation**:
\[
\kappa_T : B(T) \;\longrightarrow\; X_*(T)_\Gamma, \qquad
[t \in T(\breve F)] \;\longmapsto\; v(t),
\]
where \(v : T(\breve F) \to X_*(T)\) extracts the valuation
\(\langle \chi, t \rangle \mapsto v(\chi(t))\) coordinate-wise.

This map is a **bijection** \(\kappa_T : B(T) \xrightarrow{\sim} X_*(T)_\Gamma\).

### Case 2: \(G\) connected reductive

For general \(G\), Kottwitz constructs \(\kappa_G\) by combining
functoriality and the torus case. There is a canonical surjection
\(G \twoheadrightarrow G/G_{\mathrm{der}}\) onto the abelianisation
(a torus), inducing
\[
\kappa_G : B(G) \;\longrightarrow\; B(G/G_{\mathrm{der}}) \;=\; X_*(G/G_{\mathrm{der}})_\Gamma \;=\; \pi_1(G)_\Gamma.
\]

(More precisely: Kottwitz uses a \(z\)-extension or the
Borovoi-Kottwitz crossed-module formalism to handle non-simply-connected
derived groups uniformly.)

## Properties

- **Functoriality.** For \(f : G \to G'\), the diagram
  \[
  \begin{array}{ccc}
  B(G) & \to & B(G') \\
  \downarrow & & \downarrow \\
  \pi_1(G)_\Gamma & \to & \pi_1(G')_\Gamma
  \end{array}
  \]
  commutes.
- **Surjectivity.** \(\kappa_G : B(G) \to \pi_1(G)_\Gamma\) is
  surjective.
- **Fibres.** The fibre over \(\bar\mu \in \pi_1(G)_\Gamma\) is
  parametrised by the **Newton map** restricted to that fibre.

## The Kottwitz theorem

**Theorem (Kottwitz 1997).** The product map
\[
(\kappa_G, \nu_G) : B(G) \;\longrightarrow\; \pi_1(G)_\Gamma \times (X_*(T)_\mathbb{Q})^\Gamma/W
\]
is **injective**, with image characterised by a compatibility condition
(image of \(\kappa_G\) under the natural map equals the projection of
\(\nu_G\)).

This gives a complete combinatorial description of \(B(G)\).

## Examples

### \(G = \mathrm{GL}_n\)

\(\pi_1(\mathrm{GL}_n) = \mathbb{Z}\) via the determinant; Frobenius
acts trivially, so \(\pi_1(\mathrm{GL}_n)_\Gamma = \mathbb{Z}\).

The Kottwitz map \(\kappa : B(\mathrm{GL}_n) \to \mathbb{Z}\) sends an
isocrystal of slope sum \(s\) (i.e.\ Newton polygon ending at height
\(s\)) to \(s\). Equivalently, \(\kappa(b) = v(\det b)\) for any
representative \(b \in \mathrm{GL}_n(\breve F)\).

### \(G = \mathrm{SL}_n\)

\(\pi_1(\mathrm{SL}_n) = 0\), so \(\kappa\) is trivial. Hence
\(B(\mathrm{SL}_n)\) is classified by the Newton point alone (subject
to the constraint that the slope sum is \(0\)).

### \(G = \mathrm{PGL}_n\)

\(\pi_1(\mathrm{PGL}_n) = \mathbb{Z}/n\); \(\kappa\) detects the
isocrystal modulo \(n\), i.e.\ the **Brauer class** in
\(\mathrm{Br}(F)[n]\).

## Local Langlands and inner forms

\(\pi_0(\kappa_G) := \ker(\kappa_G \to \pi_1(\mathrm{ad}\, G)_\Gamma)\)
classifies the **inner forms** of \(G\):

\[
H^1(F, G_{\mathrm{ad}}) \;\cong\; \pi_1(G_{\mathrm{ad}})_\Gamma \;\cong\; \text{(inner forms of } G\text{)}.
\]

This is the bridge to local Langlands: each inner form gives an
L-packet, and the union of L-packets over inner forms is the
"extended" L-packet whose internal structure is governed by the
Kottwitz map.

## References

- Kottwitz, *Isocrystals with additional structure II* (Compositio
  Math. 1997).
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996).
- Borovoi, *Abelian Galois cohomology of reductive groups* (Mem. AMS
  1998).

## Prerequisite Topics

- [[node:kottwitz.algebraic_fundamental_group|Algebraic Fundamental Group]]
- [[node:root_data.galois_action_on_root_data|Galois Action on Root Data]]
- [[node:foundations.local_fields|Local Fields]]
