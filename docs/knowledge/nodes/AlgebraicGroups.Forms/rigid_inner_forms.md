---
id: forms.rigid_inner_forms
title: Rigid Inner Forms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.rigid_inner_twists
- forms.inner_forms
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are rigid inner forms treated as Kaletha's refinement valid for all reductive groups, local fields, and field types?"
  verdict: "Yes. Kaletha's rigid inner forms are defined for arbitrary connected reductive G over a local field; the construction uses a Galois gerbe whose H^1 strictly refines H^1(F, G_ad)."
tags:
- rigid-inner-forms
- kaletha
- descent-and-forms
---

# Rigid Inner Forms

A **rigid inner form** (Kaletha) is an inner form of a connected
reductive group together with a "rigidifying" cohomology class in a
Galois gerbe. Rigid inner forms refine ordinary inner forms — and the
intermediate **pure inner twists** — so that the local Langlands
parametrisation across inner forms is canonical.

## Motivation

For an inner form \(G^*\) of a quasi-split \(G\), the L-packet of an
L-parameter \(\varphi\) is conjecturally indexed by characters of the
S-group \(S_\varphi\). However:
- **Pure inner twists**: work when \(G\) has enough central
  cohomology to lift cocycles cleanly.
- **General inner forms**: lifting can fail, and the parametrisation
  is non-canonical.

**Kaletha's solution (2016):** replace \(G\) by a "Galois gerbe"
\(\mathcal{G}\) whose cohomology \(H^1(F, \mathcal{G})\) surjects onto
all inner forms (with kernel exactly the rigidification data).

## Definition (sketch)

Let \(F\) be a local field with absolute Galois group \(\Gamma\). For a
connected reductive \(G\) over \(F\), Kaletha defines:

- A **Galois gerbe** \(\mathcal{E}\) over \(\Gamma\) — a 2-cocycle in
  finite group cohomology controlling the "central kernel" data;
- Group cohomology \(H^1(F, \mathcal{E})\) computed with cocycle valued
  in a suitable inverse limit of fpqc gerbes;
- A **rigid inner form** is a class in \(H^1(F, \mathcal{E}_G)\), with
  a canonical surjection
  \[
  H^1(F, \mathcal{E}_G) \;\twoheadrightarrow\; H^1(F, G_{\mathrm{ad}}).
  \]

The kernel of this surjection consists of classes that are trivial
inner forms but carry non-trivial "rigid" data — used to refine the
local Langlands parametrisation.

## Properties

- **Surjectivity**: every inner form lifts to a rigid inner form (with
  multiple lifts possible).
- **Refinement of pure**: rigid inner forms refine pure inner twists.
  For \(G\) with simply-connected derived: pure = rigid; for
  non-simply-connected: rigid strictly contains pure.
- **Galois functoriality**: rigid inner forms are functorial in
  morphisms of reductive groups (with appropriate base-change
  conditions).

## Examples

### \(\mathrm{SL}_2\) over local field

\(G = \mathrm{SL}_2 / \mathbb{Q}_p\):
- \(Z(G) = \mu_2\); \(\pi_1(G) = 0\).
- Pure inner twists = inner forms: just two (split and quaternionic).
- Rigid inner forms: same two, but with explicit central data lifted
  via a Galois gerbe.

### \(\mathrm{PGL}_n\)

\(G = \mathrm{PGL}_n / F\) (\(F\) a local field):
- \(\pi_1(G) = \mathbb{Z}/n\); so non-pure cocycles exist.
- Rigid inner forms strictly refine pure ones; the refinement
  parametrises **central characters** of L-packet members.

### Twisted endoscopy

For twisted endoscopy (e.g.\ on \(\mathrm{GL}_n\) with outer
automorphism): rigid inner forms are the natural setting to specify
transfer factors that depend on central characters.

## Local Langlands with rigid inner forms

**Theorem/conjecture (Kaletha).** For each rigid inner form
\(\xi : G^* \to G\) (= rigid representative of an inner form), there
is a canonical bijection:
\[
\Pi_\varphi^{\mathrm{rigid}}(G^\xi) \;\cong\; \mathrm{Irr}(S_\varphi^+),
\]
where \(\Pi_\varphi^{\mathrm{rigid}}\) is the L-packet of rigid
representations of \(G^{\xi}(F)\), and \(S_\varphi^+\) is the
extended component group.

This is the most refined form of the local Langlands correspondence
known, encompassing classical, pure, and rigid versions.

## Computational tools

Cohomology of Galois gerbes is computable via:
- **Tate-Nakayama** for tori (after rigidification);
- **Borovoi abelianisation** for general reductive groups;
- Explicit cocycle representatives for low-dimensional / classical
  cases.

## Role in Langlands

- **Canonical L-packets**: rigid inner forms give the cleanest
  framework for stating and proving local Langlands across inner
  forms.
- **Stability of trace formula**: rigid inner forms refine the
  matching between automorphic L-packets and Galois data.
- **Endoscopic transfer**: rigid inner forms simplify the
  Langlands-Shelstad-Kottwitz transfer factors.

## References

- Kaletha, *Rigid inner forms of real and p-adic groups* (Annals 2016).
- Kaletha, *Global rigid inner forms and multiplicities of discrete
  automorphic representations* (Invent.\ Math.\ 2018).
- Dillery, *Rigid inner forms of arbitrary reductive groups* (preprint).

## Prerequisite Topics

- [[node:forms.rigid_inner_twists|Rigid Inner Twists]]
- [[node:forms.inner_forms|Inner Forms]]
