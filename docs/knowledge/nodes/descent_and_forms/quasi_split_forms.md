---
id: descent_and_forms.quasi_split_forms
title: Quasi-Split Forms
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.rational_forms_of_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are quasi-split forms treated as the canonical representative of each outer-form class, valid over arbitrary fields?"
  verdict: "Yes. The existence and uniqueness of a quasi-split form within each outer-form class works for any base field and any reductive type."
tags:
- quasi-split-forms
- descent-and-forms
---

# Quasi-Split Forms

A **quasi-split form** of a reductive group is one with a Borel
subgroup defined over the base field. Quasi-split forms are the
"largest" forms in their outer-twist class — every form differs from
the quasi-split one only by an inner twist. They are the natural
"canonical representatives" in the classification of reductive
groups.

## Definition

Let \(G\) be a connected reductive group over a field \(k\). \(G\) is
**quasi-split** if it has a **Borel subgroup defined over \(k\)**:
\[
\exists \, B \subseteq G, \; B \text{ a Borel subgroup with } B = B_k.
\]

Equivalently: \(G\) admits a **\(k\)-rational pinning**, i.e.\ a
maximal torus, Borel, and root vectors all defined over \(k\) (modulo
sign).

## Existence and uniqueness

**Theorem.** Every outer-form class contains a unique **quasi-split**
form (up to \(k\)-isomorphism).

The quasi-split form is the **trivial inner twist** within its
outer-form class: \(H^1(k, G_{\mathrm{ad}})\) measures the inner twists
from the quasi-split form.

**Theorem.** Every connected reductive \(k\)-group \(G\) is an inner
form of a unique quasi-split form.

## Examples

### Quasi-split forms of \(\mathrm{GL}_n\)

For \(\mathrm{GL}_n\) (which has \(\mathrm{Out} = \mathbb{Z}/2\)):

- **Trivial outer twist**: quasi-split form = \(\mathrm{GL}_n(k)\)
  itself (split). Inner forms: \(\mathrm{GL}_r(D)\) for \(D/k\) of
  degree \(n/r\).
- **Non-trivial outer twist** (via quadratic extension \(K/k\)):
  quasi-split form = \(\mathrm{U}(n)\) (= unitary group of the
  standard Hermitian form). Inner forms: \(\mathrm{U}(p, q)\) with
  \(p + q = n\) for Hermitian forms of signature \((p, q)\).

### Quasi-split form of \(D_4\): triality

For the triality form of \(D_4\) (over a cubic Galois extension \(K/k\)),
the quasi-split form is \({}^3 D_4\): the unique form with a Borel
defined over \(k\) and Galois action permuting the three outer
"leaves" of the Dynkin diagram cyclically.

### Quasi-split form of \(E_6\)

\(E_6^{\mathrm{qs}}\) is the unique outer form of \(E_6\) over \(k\)
admitting a Borel; over \(\mathbb{R}\) it is the **split form**
\(E_{6(6)}\) (in Cartan's notation).

## Borel-Serre criterion

**Theorem.** A connected reductive \(G/k\) is quasi-split iff
\(H^1(k, B)\) is trivial for some Borel \(B \subseteq G\) defined
over \(\bar k\) (equivalently: there is a Galois-equivariant Borel of
\(G_{\bar k}\)).

This is equivalent to the Galois action factoring through
\(\mathrm{Out}(G)\), preserving a chosen pinning.

## Quasi-split reductive groups have a Whittaker model

For a quasi-split \(G\) over a local field \(F\) with a Borel
\(B = T U\): there is a non-degenerate character \(\psi : U(F) \to \mathbb{C}^\times\)
(in particular generic), and the **Whittaker model**
\(\mathrm{Hom}_{U(F)}(\pi, \psi)\) is non-trivial for many \(\pi\).

In contrast: for an inner form that is **not** quasi-split, the
Whittaker model can be zero for all irreducible \(\pi\)
(non-generic representations are then the rule).

## Role in Langlands

- **L-packets**: structured around the quasi-split form. The L-packet
  of an L-parameter \(\varphi\) contains a unique **generic** member
  on the quasi-split form (= a member with non-trivial Whittaker
  model).
- **Endoscopy**: defined relative to the quasi-split form as the
  reference; inner forms enter via the rigid-inner-form formalism.
- **Trace formula**: Arthur's stable trace formula compares trace
  formulas on \(G\) and its endoscopic groups; the quasi-split form
  serves as the "stable" reference.
- **Galois representations**: for quasi-split groups, L-parameters
  match cleanly with Galois representations (without ambiguity from
  inner twists).

## Mathlib

Not yet formalised.

## References

- Borel–Tits, *Groupes réductifs* (Publ.\ IHES 1965).
- Tits, *Classification of algebraic semisimple groups* (Proc.\ AMS
  Symp.\ 1966).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984).
- Borel, *Linear Algebraic Groups* (1991), §16.

## Prerequisite Topics

- [[node:descent_and_forms.rational_forms_of_reductive_groups|Rational Forms of Reductive Groups]]
