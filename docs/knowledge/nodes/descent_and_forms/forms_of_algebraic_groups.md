---
id: descent_and_forms.forms_of_algebraic_groups
title: Forms of Algebraic Groups
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- affine_group_schemes.base_change
- descent_and_forms.forms_of_algebraic_objects
- descent_and_forms.cocycles_and_twisting
- affine_group_schemes.affine_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are forms treated for arbitrary algebraic groups (not just reductive ones) over an arbitrary base field, including in positive characteristic?"
  verdict: "Yes. The framework is via Galois cohomology and applies to any affine algebraic group; specialisations to reductive / connected / split cases are separate sub-topics."
tags:
- forms
- algebraic-groups
- descent-and-forms
---

# Forms of Algebraic Groups

Two algebraic groups \(G, G'\) over a field \(k\) are called **forms of
each other** if they become isomorphic after base change to a separable
closure: \(G_{\bar{k}} \cong G'_{\bar{k}}\). They are classified by
**Galois cohomology**.

## Definition

Fix an algebraic group \(G_0\) over a separable closure \(k^{\mathrm{sep}}\).
A **form of \(G_0\) over \(k\)** is an algebraic group \(G\) over \(k\)
together with an isomorphism \(G_{k^{\mathrm{sep}}} \cong G_0\). Two
forms are equivalent if they are \(k\)-isomorphic.

The set of equivalence classes is

\[
\{\text{forms of } G_0 \text{ over } k\} \;\leftrightarrow\;
H^1\bigl(\operatorname{Gal}(k^{\mathrm{sep}}/k), \operatorname{Aut}(G_0)\bigr).
\]

This is the **Galois cohomology classification of forms**.

## Inner and outer forms

For a connected reductive group \(G\) over a field, the automorphism
group fits into the exact sequence

\[
1 \to \operatorname{Inn}(G) \to \operatorname{Aut}(G) \to \operatorname{Out}(G) \to 1.
\]

Correspondingly, forms decompose:

- **Inner forms** of \(G\): those with image in
  \(H^1(\operatorname{Gal}, \operatorname{Inn}(G)) = H^1(\operatorname{Gal}, G^{\mathrm{ad}})\).
  Two inner forms have the same "shape" — same root datum + Dynkin
  diagram — and differ only in cocycle data.
- **Outer forms**: those whose image in \(\operatorname{Out}(G)\) is
  non-trivial. These can have a different Dynkin diagram from the
  split form (e.g. \(\mathrm{SU}_n\) is an outer form of
  \(\mathrm{SL}_n\); the Dynkin diagram of \(\mathrm{SU}_n\) is the
  twisted \(A_n\) labelled with Galois action).

## Quasi-split forms

A reductive group \(G\) over \(k\) is **quasi-split** if it has a
Borel subgroup defined over \(k\). Equivalently, \(G\) is the form
obtained from the split form via the canonical "pinned" cocycle on the
based root datum.

Every reductive group has a unique quasi-split inner form (its
**quasi-split form**); inner forms of a quasi-split group \(G^*\) are
classified by

\[
H^1\bigl(\operatorname{Gal}, G^*_{\mathrm{ad}}\bigr).
\]

## Examples

| split form | non-split forms | classification |
|---|---|---|
| \(\operatorname{SL}_n\) | \(\operatorname{SL}_1(D)\) for central simple algebras \(D\) of dim \(n^2\) | Brauer group \(\operatorname{Br}(k)\) of degree \(n\) |
| \(\operatorname{SO}_n\) (split) | non-split orthogonal groups | quadratic forms over \(k\) of dim \(n\) |
| \(\mathrm{PGL}_n\) | none (\(\operatorname{Aut} = \operatorname{Inn}\) for \(n \ne 2\), so inner forms only); these are \(\operatorname{PGL}_1(D)\) | Brauer group |
| \(\operatorname{SL}_n\) over a number field | inner forms = unitary groups + division-algebra forms | local-global compatibility |

## Local–global principle (Hasse principle)

For some groups \(G\), a global form is determined by its local forms
at all places: \(H^1(K, G) \to \prod_v H^1(K_v, G)\) is injective.

- Holds for **simply connected semisimple** groups over a number field
  (Kneser–Harder–Chernousov).
- Fails for tori and adjoint groups.

## Modern refinements

Recent work introduces refined notions of forms for representation
theory:

- **Pure inner forms** ([[node:descent_and_forms.pure_inner_twists|Vogan]]) — refined to track
  more representation-theoretic data;
- **Rigid inner forms** ([[node:descent_and_forms.rigid_inner_twists|Kaletha]]) — uses Galois
  gerbes;
- **Refined inner forms** ([[node:descent_and_forms.kaletha_refined_inner_forms|Kaletha]]) — strictly
  finer than rigid.

These refinements are needed for the proper formulation of the local
Langlands correspondence with character-theoretic precision.

## Prerequisite Topics

- [[node:affine_group_schemes.base_change|Base Change]]
- [[node:descent_and_forms.forms_of_algebraic_objects|Forms of Algebraic Objects]]
- [[node:descent_and_forms.cocycles_and_twisting|Cocycles and Twisting]]
- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
