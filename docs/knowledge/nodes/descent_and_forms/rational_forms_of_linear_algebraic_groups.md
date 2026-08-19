---
id: descent_and_forms.rational_forms_of_linear_algebraic_groups
title: Rational Forms of Linear Algebraic Groups
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.forms_of_algebraic_groups
- linear_algebraic_groups.linear_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are rational forms of linear algebraic groups treated in the general (not necessarily reductive) case?"
  verdict: "Yes. The H^1 classification applies to any linear algebraic group; specialisations to reductive and to tori are noted separately."
tags:
- rational-forms
- linear-algebraic-groups
- descent-and-forms
---

# Rational Forms of Linear Algebraic Groups

A **rational form** of a linear algebraic group is a \(k\)-form: a
linear algebraic group over \(k\) becoming isomorphic to a fixed
geometric model after base change. The classification by Galois
cohomology applies to **arbitrary** linear algebraic groups, not just
the reductive case.

## Definition

Let \(G\) be a linear algebraic group over a separably closed field
\(\bar k\). A **rational form** of \(G\) over \(k\) is a linear
algebraic \(k\)-group \(G'\) such that \(G' \otimes_k \bar k \cong G\).

## Classification

\(G'\)-isomorphism classes of forms of \(G\) over \(k\) are in
bijection with
\[
H^1(k, \mathrm{Aut}(G)).
\]

This works for **any** linear algebraic group \(G\): reductive,
unipotent, solvable, etc.

## Examples

### Tori (specialisation to abelian groups)

A torus \(T\) over \(k\) becomes split over a finite Galois extension
\(K/k\) with Galois group \(\Gamma'\). Forms of the split torus
\(\mathbb{G}_m^n\) are classified by:
\[
H^1(\Gamma', \mathrm{Aut}(\mathbb{G}_m^n)) \;=\; H^1(\Gamma', \mathrm{GL}_n(\mathbb{Z})),
\]
i.e.\ continuous representations \(\Gamma' \to \mathrm{GL}_n(\mathbb{Z})\)
up to conjugation. This recovers the
[[node:tori.algebraic_tori|torus-lattice equivalence]].

### Unipotent groups

\(\mathbb{G}_a\) has no non-trivial forms over a perfect field \(k\)
(\(\mathrm{Aut}(\mathbb{G}_a) = \mathbb{G}_m\) acts by scaling, and
\(H^1(k, \mathbb{G}_m) = 0\) by Hilbert 90 — so the only form is
\(\mathbb{G}_a\) itself).

Over **non-perfect** fields of characteristic \(p\): there can be
"twisted" forms of \(\mathbb{G}_a\) that are not isomorphic to
\(\mathbb{G}_a\) over \(k\) — but such forms are not smooth.

### Solvable groups

For the "\(ax + b\)" group \(\mathbb{G}_a \rtimes \mathbb{G}_m\): a
form is a non-split extension; classified by
\(H^1(k, \mathrm{Aut})\) = \(\mathbb{G}_a \rtimes \mathbb{G}_m\) up to
inner twisting.

### Reductive groups

The largest interesting class: see
[[node:descent_and_forms.rational_forms_of_reductive_groups|reductive forms]].

## Properties

For \(G\) a smooth linear algebraic group over \(k\):

- Forms of \(G\) are smooth and of the same dimension.
- Forms have the same identity component as their base change.
- The set of forms can be infinite (e.g.\ all central simple algebras
  for \(\mathrm{GL}_n\)).

For \(G\) **commutative**: forms classified by an honest abelian group
\(H^1(k, G)\) (the group structure of forms is inherited).

For \(G\) **non-commutative**: forms classified by a pointed set
\(H^1(k, G)\); the "trivial form" is the basepoint.

## Local-global principle

For a global field \(F\), an important question is the **Hasse
principle**:

\[
\Sha^1(F, G) \;:=\; \ker(H^1(F, G) \to \prod_v H^1(F_v, G)) \;\overset{?}{=}\; 0.
\]

- For \(G\) commutative: \(\Sha^1\) is often non-trivial (Tate-
  Shafarevich groups of tori, of abelian varieties...).
- For \(G\) connected reductive simply connected: \(\Sha^1 = 0\)
  (Kneser-Harder-Chernousov; see
  [[node:descent_and_forms.galois_cohomology|Galois cohomology]]).
- For non-simply-connected \(G\): \(\Sha^1\) is computable via Borovoi
  abelianisation.

## Twisting and forms

A 1-cocycle \(c \in Z^1(k, \mathrm{Aut}(G))\) determines a twisted
form \(G^c\). The construction is functorial:

- An exact sequence \(1 \to H \to G \to Q \to 1\) gives
  \(1 \to H^c \to G^c \to Q^c \to 1\), with each group twisted by the
  appropriate cocycle.

This is the technical basis for transferring questions between
different forms (e.g.\ via inner twists).

## Mathlib

Not formalised in general.

## References

- Borel, *Linear Algebraic Groups* (1991), §24.
- Serre, *Cohomologie Galoisienne* (1964), §III.
- Platonov–Rapinchuk, *Algebraic Groups and Number Theory* (1994).

## Prerequisite Topics

- [[node:descent_and_forms.forms_of_algebraic_groups|Forms of Algebraic Groups]]
- [[node:linear_algebraic_groups.linear_algebraic_groups|Linear Algebraic Groups]]
