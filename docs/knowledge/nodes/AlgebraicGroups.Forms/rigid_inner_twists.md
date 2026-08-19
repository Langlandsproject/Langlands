---
id: forms.rigid_inner_twists
title: Rigid Inner Twists
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.pure_inner_twists
- forms.galois_cohomology
- kottwitz.algebraic_fundamental_group
- kottwitz.kottwitz_homomorphism
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are rigid inner twists defined uniformly as the Kaletha refinement of inner twists?"
  verdict: "Yes. A rigid inner twist is a Galois cocycle valued in a special gerbe E_G; the construction is uniform for connected reductive groups over local fields."
tags:
- rigid-inner-twists
- kaletha
- descent-and-forms
---

# Rigid Inner Twists

A **rigid inner twist** (Kaletha) is the cocycle-level counterpart of
a rigid inner form: a 1-cocycle valued in a "Galois gerbe"
\(\mathcal{E}_G\) that rigidifies the central data of an inner twist.
Rigid inner twists are the foundation of modern local Langlands across
inner forms.

## Setup

Let \(F\) be a local field with absolute Galois group \(\Gamma\), and
\(G\) a connected reductive group over \(F\). Pure inner twists are
\(Z^1(F, G)\), but the natural map
\[
H^1(F, G) \;\to\; H^1(F, G_{\mathrm{ad}})
\]
is **not always surjective** — some inner forms have no pure inner
twist representative. Kaletha's solution:

## Galois gerbe \(\mathcal{E}_G\)

Kaletha constructs a "Galois gerbe" \(\mathcal{E}_G\) — a sheaf of
groupoids over the étale site of \(\mathrm{Spec}\, F\) — fitting into
an exact sequence
\[
1 \;\to\; \mathcal{C} \;\to\; \mathcal{E}_G \;\to\; G \;\to\; 1,
\]
where \(\mathcal{C}\) is the "canonical band" coming from the
pro-finite inverse system of finite multiplicative-type subgroups of
\(Z(G^{\mathrm{sc}})\) (the centre of the simply connected cover).

\(\mathcal{C}\) is engineered so that
\(H^2(F, \mathcal{C})\) absorbs the obstructions to lifting inner forms
to pure inner twists.

## Rigid inner twists

A **rigid inner twist** is a class in
\[
H^1(F, \mathcal{E}_G) \;:=\; H^1_{\mathrm{rig}}(\Gamma, \mathcal{E}_G),
\]
the **rigid cohomology** of \(\mathcal{E}_G\). The natural projection
\(\mathcal{E}_G \twoheadrightarrow G\) gives a map
\[
H^1(F, \mathcal{E}_G) \;\to\; H^1(F, G),
\]
and Kaletha's main theorem says this map is surjective and
**canonically maps onto** all inner twists modulo precisely controlled
central data.

## Properties

- **Surjection onto inner forms**: the composite
  \(H^1(F, \mathcal{E}_G) \to H^1(F, G_{\mathrm{ad}})\) is surjective;
  every inner form has a rigid representative.
- **Refinement of pure**: pure inner twists embed into rigid inner
  twists as \(H^1(F, G) \hookrightarrow H^1(F, \mathcal{E}_G)\) via the
  natural quotient.
- **Kottwitz formula**: \(H^1(F, \mathcal{E}_G)\) is computable via
  Kaletha's local Tate-Nakayama duality (an extension of classical
  Tate-Nakayama).

## Examples

### Quasi-split \(G\)

Trivial rigid inner twist: the identity cocycle. Rigid inner twists
of \(G\) parametrise all inner forms (with central data) starting
from the quasi-split form.

### Non-quasi-split inner forms

For inner forms not arising from pure inner twists (e.g.\ certain
non-split forms of \(\mathrm{Spin}\) groups): rigid inner twists
provide the cocycle representatives that ordinary \(H^1(F, G)\) misses.

## Connection with Kottwitz isocrystal formalism

Kaletha's rigid inner twist formalism is closely related to the
**Kottwitz isocrystal formalism** for inner forms. There is a natural
map
\[
H^1(F, \mathcal{E}_G) \;\to\; B(G)_{\mathrm{basic}},
\]
identifying rigid inner twists with basic \(\sigma\)-conjugacy classes
(modulo central character data).

This gives a uniform framework comparing:
- Local Langlands (parameters into \({}^L G\));
- Inner forms (\(H^1(F, G_{\mathrm{ad}})\));
- Rigid inner twists (\(H^1(F, \mathcal{E}_G)\));
- Kottwitz set (\(B(G)\)).

## Role in Langlands

- **Canonical L-packet bijection**: \(\Pi_\varphi^{\mathrm{rig}}(G^{\xi}(F)) \cong \mathrm{Irr}(S_\varphi^+)\)
  uses rigid inner twists \(\xi\) as the parametrising data.
- **Endoscopic transfer factors**: the precise normalisation across
  inner forms requires rigid inner twists.
- **Global Langlands**: Kaletha (2018) extends to global rigid inner
  forms, with a global Galois gerbe and a "Hasse-principle-like"
  exact sequence.

## References

- Kaletha, *Rigid inner forms of real and p-adic groups* (Annals 2016).
- Kaletha, *Rigid inner forms vs isocrystals* (J.\ EMS 2018).
- Kaletha, *Global rigid inner forms and multiplicities of discrete
  automorphic representations* (Invent.\ Math.\ 2018).

## Prerequisite Topics

- [[node:forms.pure_inner_twists|Pure Inner Twists]]
- [[node:forms.galois_cohomology|Galois Cohomology]]
- [[node:kottwitz.algebraic_fundamental_group|Algebraic Fundamental Group]]
- [[node:kottwitz.kottwitz_homomorphism|Kottwitz Homomorphism]]
