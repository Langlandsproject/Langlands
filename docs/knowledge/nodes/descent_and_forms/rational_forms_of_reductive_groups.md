---
id: descent_and_forms.rational_forms_of_reductive_groups
title: Rational Forms of Reductive Groups
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.forms_of_algebraic_groups
- reductive_structure.reductive_groups
- root_data_and_duality.root_data
- descent_and_forms.galois_cohomology
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are rational forms of reductive groups classified uniformly via Galois cohomology, including inner and outer forms?"
  verdict: "Yes. Forms of a split reductive group G_0 are classified by H^1(k, Aut(G_0)); the split/quasi-split/inner-form structure of this set is captured uniformly via the exact sequence 1 → G_0,ad → Aut(G_0) → Out(G_0) → 1."
tags:
- rational-forms
- reductive-groups
- descent-and-forms
---

# Rational Forms of Reductive Groups

A **rational form** of a reductive group \(G\) over a field \(k\) is a
\(k\)-form: a reductive group \(G'\) over \(k\) with
\(G'_{\bar k} \cong G_{\bar k}\). Rational forms are classified by
Galois cohomology of the automorphism group of \(G_{\bar k}\), and
they organise the entire Langlands programme over fields.

## Definition

Let \(G\) be a connected reductive group over a separably closed
field \(\bar k\). A **rational form** of \(G\) over a subfield
\(k \subseteq \bar k\) is a connected reductive \(k\)-group \(G'\)
such that \(G' \otimes_k \bar k \cong G\).

\(G\) itself may not be defined over \(k\); the question is whether
there is a \(k\)-form at all, and how many.

## Classification

Fix a split connected reductive \(G_0\) over \(k\) (e.g., the
Chevalley form). All other forms of \(G_0 \otimes \bar k\) are
classified by:
\[
\{\text{forms of } G_0 \text{ over } k\}/\cong \;\stackrel{\sim}{\longleftrightarrow}\; H^1(k, \mathrm{Aut}(G_0)).
\]

## Inner vs.\ outer decomposition

The exact sequence
\[
1 \;\to\; G_{0, \mathrm{ad}} \;\to\; \mathrm{Aut}(G_0) \;\to\; \mathrm{Out}(G_0) \;\to\; 1
\]
gives a long exact sequence in cohomology:
\[
1 \to G_{0, \mathrm{ad}}(k) \to \mathrm{Aut}(G_0)(k) \to \mathrm{Out}(G_0)(k) \to H^1(k, G_{0, \mathrm{ad}}) \to H^1(k, \mathrm{Aut}(G_0)) \to H^1(k, \mathrm{Out}(G_0)).
\]

So:

1. The **outer form structure** of \(G\) is classified by a map
   \(\Gamma_k \to \mathrm{Out}(G_0)\) (modulo conjugacy).
2. The **inner forms** within a fixed outer-form class are classified
   by \(H^1(k, G_{0, \mathrm{ad}}^c)\), where \(G_{0, \mathrm{ad}}^c\)
   is the adjoint group of the quasi-split form \(c\).

## Quasi-split forms

A form \(G\) is **quasi-split** if it has a Borel subgroup defined
over \(k\) (equivalently: \(H^1(k, B)\) is trivial for some Borel
\(B \subseteq G\)).

Every outer-form class contains a unique quasi-split form (up to
isomorphism); inner forms differ by a class in \(H^1(k, G_{\mathrm{ad}})\).

\(G_0\) (split) is the quasi-split form with trivial outer twist;
\(\mathrm{U}(n)\) is the quasi-split form in the outer twist class of
the non-trivial diagram automorphism.

## Examples

### \(\mathrm{GL}_n\)

\(\mathrm{Aut}(\mathrm{GL}_n) = \mathrm{PGL}_n \rtimes \mathbb{Z}/2\)
(inner = \(\mathrm{PGL}_n\), outer = transpose-inverse).

| Form | \(\Gamma_k\)-action |
|---|---|
| Split \(\mathrm{GL}_n\) | trivial |
| Inner forms = \(\mathrm{GL}_r(D)\) for \(D / k\) central simple of degree \(n\) | non-trivial cocycle in \(\mathrm{PGL}_n\) |
| Outer form \(\mathrm{U}(n, K/k)\) | non-trivial in \(\mathbb{Z}/2\); inner twist by Hermitian form |

### \(\mathrm{SL}_n\)

Inner forms: \(\mathrm{SL}_1(D)\) for division algebras \(D\) of
degree \(n\); the **norm-one** subgroup of \(D^\times\).

Outer forms over \(\mathbb{R}\): special unitary groups
\(\mathrm{SU}(p, q)\) and \(\mathrm{SU}^*(2n)\) (the quaternionic
form).

### \(E_6\)

Two classes of outer forms: \(E_6^{\mathrm{split}}\) (trivial Galois)
and \({}^2 E_6\) (non-trivial Galois). Inner forms then refine each.

## Tits index

A **Tits index** records the combinatorial data of a rational form:

- The Dynkin diagram of the absolute root system;
- The Galois orbits on the Dynkin diagram;
- The distinguished vertices (= simple roots defined over \(k\)).

The Tits index gives a complete classification of reductive groups
over a fixed field \(k\) (Tits, 1966).

## Hasse principle

**Theorem (Kneser-Harder-Chernousov).** For a simply connected
semisimple group \(G\) over a number field \(F\):
\[
\Sha^1(F, G) \;:=\; \ker\Big(H^1(F, G) \to \prod_v H^1(F_v, G)\Big) \;=\; 1.
\]

Equivalently, every \(G\)-torsor that is trivial locally everywhere is
trivial globally.

For non-simply-connected groups: \(\Sha^1(F, G)\) can be non-trivial,
and is computable via Borovoi's abelianised Galois cohomology.

## Role in Langlands

- **Forms of \(G\) at all places**: \(G\) over \(F\) determines forms
  \(G_v\) over each local completion \(F_v\); these forms organise
  the local L-packet structure.
- **Adelic local-global**: \(G(\mathbb{A}_F) = \prod_v G(F_v)\) makes
  sense once each local form is fixed; rational structure ensures the
  product is well-defined.
- **Strong approximation**: simply connected semisimple groups satisfy
  strong approximation (\(G(F) \cdot G(F_v)\) is dense in
  \(G(\mathbb{A}_F)\) for any place \(v\) of positive rank); this is
  the basis of many automorphic argument.

## Mathlib

Not formalised; depends on Galois cohomology infrastructure.

## References

- Tits, *Classification of algebraic semisimple groups* (Proc.\ AMS
  Symp.\ 1966).
- Platonov–Rapinchuk, *Algebraic Groups and Number Theory* (1994).
- Borel–Serre, *Théorèmes de finitude en cohomologie galoisienne*
  (Comment.\ Math.\ Helv.\ 1964).
- Conrad, *Reductive group schemes* (Notes, 2014), §7.

## Prerequisite Topics

- [[node:descent_and_forms.forms_of_algebraic_groups|Forms of Algebraic Groups]]
- [[node:reductive_structure.reductive_groups|Reductive Groups]]
- [[node:root_data_and_duality.root_data|Root Data]]
- [[node:descent_and_forms.galois_cohomology|Galois Cohomology]]
