---
id: descent_and_forms.kaletha_refined_inner_forms
title: Kaletha Refined Inner Forms
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.rigid_inner_forms
- kottwitz_structures.kottwitz_map_on_b_of_g
- kottwitz_structures.b_of_g
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Kaletha's refined inner forms treated as the most refined parametrisation of inner forms, both local and global?"
  verdict: "Yes. Kaletha's framework gives a canonical refinement of inner forms valid for arbitrary connected reductive groups over local or global fields."
tags:
- kaletha
- inner-forms
- descent-and-forms
---

# Kaletha Refined Inner Forms

**Kaletha's refined inner forms** (also called **isocrystal inner
forms** or **B(G)-inner forms**) parametrise inner forms of a quasi-
split group \(G\) by basic elements of the Kottwitz set \(B(G)\) (or
its global analogue). The framework unifies rigid inner twists with
the Kottwitz isocrystal classification.

## Setup

Let \(F\) be a non-archimedean local field, \(G\) a connected
reductive quasi-split \(F\)-group. Recall:

- **Inner forms** of \(G\): classified by \(H^1(F, G_{\mathrm{ad}})\).
- **Basic strata** \(B(G)_{\mathrm{basic}}\): in bijection with
  \(H^1(F, G_{\mathrm{ad}})\) (Kottwitz).
- **Rigid inner twists**: classified by \(H^1(F, \mathcal{E}_G)\)
  (Kaletha's gerbe).

## Refined inner form

A **refined inner form** is an inner form \(G^*\) of \(G\) together
with a chosen basic element \([b] \in B(G)_{\mathrm{basic}}\)
realising \(G^* = G_b\) as the centraliser of the Newton point of \(b\).

Equivalently: a pair \((G^*, b)\) where \(G^*\) is an inner form and
\(b\) is a basic cocycle in \(G(\breve F)\) inducing the inner twist.

## Comparison with rigid inner twists

**Theorem (Kaletha, *Rigid inner forms vs isocrystals* 2018).** There
is a canonical map
\[
\text{rigid inner twists of } G \;\longrightarrow\; \text{refined inner forms of } G,
\]
realising the isocrystal classification of inner forms within the
rigid framework.

The map is functorial and unifies the two classifications: refined
inner forms are a "geometric" description (via \(B(G)\)) of the same
data that rigid inner twists capture cohomologically (via the gerbe).

## Examples

### \(\mathrm{SL}_2 / \mathbb{Q}_p\)

\(B(\mathrm{SL}_2)_{\mathrm{basic}} = \{[1]\}\) (trivial) for the
quasi-split form (which is split for \(\mathrm{SL}_2\)). So the only
refined inner form is \(\mathrm{SL}_2\) itself.

Inner forms of \(\mathrm{SL}_2\) over \(\mathbb{Q}_p\): \(\mathrm{SL}_2\)
and \(\mathrm{SL}_1(D)\) for the quaternion division algebra \(D\).
But \(B(\mathrm{SL}_2)\) only captures \(\mathrm{SL}_2\) (because
\(\mathrm{SL}_2\) is simply connected); the second form needs a
\(z\)-extension.

### \(\mathrm{PGL}_n / F\)

\(\pi_1(\mathrm{PGL}_n) = \mathbb{Z}/n\); \(B(\mathrm{PGL}_n)_{\mathrm{basic}} = \mathbb{Z}/n\).
Each refined inner form of \(\mathrm{PGL}_n\) is \(\mathrm{PGL}_r(D)\)
for a central simple \(F\)-algebra \(D\) of degree dividing \(n\).

The labelling is exactly by the Brauer invariant in
\(\mathrm{Br}(F)[n] = \mathbb{Z}/n\).

## Global refined inner forms

For a global field \(F\): Kaletha defines **global refined inner
forms** via a global Galois gerbe. The constraint:

- Locally at each place \(v\), the global form restricts to a local
  refined inner form;
- Local data are compatible via a "Hasse-principle gerbe" controlling
  the global rigidification.

This gives a clean framework for global automorphic representations
across inner forms.

## Local-global compatibility

**Theorem (Kaletha, global rigid inner forms).** The local rigid
inner forms at all places of \(F\) and the global rigid inner form
fit into an exact sequence
\[
1 \to H^1_{\mathrm{global}}(F, \mathcal{E}_G) \to \prod_v H^1(F_v, \mathcal{E}_G) \to (\text{Hasse-principle gerbe defect}) \to 0.
\]

This is the modern global Hasse principle for inner forms, refining
the classical Borovoi/Sansuc statements.

## Role in Langlands

- **Multiplicities of discrete automorphic representations**: Kaletha's
  global rigid framework gives canonical formulas for multiplicities
  in terms of L-parameters and S-groups.
- **Endoscopic transfer factors**: refined inner forms give canonical
  normalisations of transfer factors.
- **Compatibility with Arthur's classification**: Arthur's endoscopic
  classification (for classical groups) is naturally stated in terms
  of refined inner forms.

## References

- Kaletha, *Rigid inner forms vs isocrystals* (J.\ EMS 2018).
- Kaletha, *Global rigid inner forms and multiplicities of discrete
  automorphic representations* (Invent.\ Math.\ 2018).
- Kaletha-Minguez-Shin-White, *Endoscopic classification of
  representations: inner forms of unitary groups* (preprint, 2014).

## Prerequisite Topics

- [[node:descent_and_forms.rigid_inner_forms|Rigid Inner Forms]]
- [[node:kottwitz_structures.kottwitz_map_on_b_of_g|Kottwitz Map on B(G)]]
- [[node:kottwitz_structures.b_of_g|B(G)]]
