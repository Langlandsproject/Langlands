---
id: root_data.galois_action_on_root_data
title: Galois Action on Root Data
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.automorphisms_of_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the Galois action on root data defined for reductive groups over arbitrary fields, capturing both inner and outer twists?"
  verdict: "Yes. The Galois group acts continuously on the root datum of G_bar k via pinned automorphisms; the action determines G up to quasi-split form, and inner forms add a further H^1(k, G_ad)-cocycle."
tags:
- galois-action
- root-data
- root-data-and-duality
---

# Galois Action on Root Data

For a reductive group \(G\) defined over a non-algebraically-closed
field \(k\), the absolute Galois group \(\Gamma = \mathrm{Gal}(\bar k / k)\)
acts on the root datum of \(G_{\bar k}\). This Galois module is the
**core invariant** of \(G\) up to inner forms.

## Setup

Let \(G\) be a connected reductive group over \(k\) with separable
closure \(\bar k\) and absolute Galois group \(\Gamma\). Choose a
maximal torus \(T \subseteq G\) defined over \(k\) (such tori
exist). Then \(T_{\bar k}\) is a split torus over \(\bar k\), and the
root datum \((X^*(T_{\bar k}), \Phi, X_*(T_{\bar k}), \Phi^\vee)\) is
defined.

## Galois action

\(\Gamma\) acts on \(T_{\bar k}\) via its action on \(\bar k\), hence
acts on:
- the character lattice \(X^*(T_{\bar k})\);
- the cocharacter lattice \(X_*(T_{\bar k})\);
- the set of roots \(\Phi\) (preserving it as a subset of
  \(X^*\));
- the set of coroots \(\Phi^\vee\).

The pairing \(\langle -, - \rangle\) is \(\Gamma\)-invariant.

For a fixed pinning of \(G_{\bar k}\), the Galois action need not
preserve the pinning; instead it acts on the **based** root datum
through pinned automorphisms (i.e.\ through
\(\mathrm{Aut}^{\mathrm{pin}}(G_{\bar k}) = \mathrm{Out}(G_{\bar k})\)).

## Classification of forms

**Theorem.** Quasi-split forms of \(G\) over \(k\) (i.e.\ forms with a
\(k\)-rational Borel) are in bijection with continuous homomorphisms
\[
\Gamma \;\longrightarrow\; \mathrm{Out}(G_{\bar k}),
\]
up to conjugacy.

General forms are quasi-split forms further twisted by a class in
\(H^1(k, G_{\mathrm{ad}})\) (an inner twist).

## Inner vs.\ outer

A form \(G' / k\) of \(G\) is:
- **Inner**: \(\Gamma\) acts trivially on the based root datum of
  \(G'_{\bar k}\) — the form is twisted purely "internally" by
  \(G_{\mathrm{ad}}\)-cocycles.
- **Outer**: \(\Gamma\) acts non-trivially on the based root datum;
  the action factors through \(\mathrm{Out}(G_{\bar k})\).

\(\mathrm{GL}_n\) and \(\mathrm{Sp}_{2n}\) have no outer forms (their
Dynkin diagrams have no automorphisms or only trivial ones for
classical Dynkin reasons). \(\mathrm{U}(n)\) is the prototypical
outer form (Galois flip of \(A_{n-1}\)).

## Examples

### \(\mathrm{GL}_n\)

\(\mathrm{Out}(\mathrm{GL}_n) = \mathbb{Z}/2\) (transpose-inverse
automorphism for \(n \ge 2\)). If \(\Gamma \to \mathbb{Z}/2\) is the
quadratic extension associated to \(K/k\), the resulting form is
\(\mathrm{Res}_{K/k} \mathrm{GL}_n^{(\sigma)} = \mathrm{U}(n, K/k)\):
the unitary group of the Hermitian form attached to \(K/k\).

### \(D_4\) and triality

\(\mathrm{Out}(D_4) = S_3\). Continuous homomorphisms
\(\Gamma \to S_3\) factor through finite quotients; for a cubic
extension \(K/k\) with Galois group \(\mathbb{Z}/3\), one gets the
**trialitarian form** \({}^3 D_4\) of \(\mathrm{Spin}_8\).

### \(E_6\)

\(\mathrm{Out}(E_6) = \mathbb{Z}/2\); a quadratic extension gives the
outer form \({}^2 E_6\), denoted \(E_6^{(2)}\).

### Tori

For a torus \(T\): the entire root datum is just the character
lattice (no roots), and the Galois action on \(X^*(T)\) classifies
\(T\) over \(k\) (anti-equivalence with finite-rank free continuous
\(\Gamma\)-modules).

## Action on the dual group

Under root-datum duality, the Galois action on the root datum of \(G\)
becomes a Galois action on the dual root datum of \(\hat G\), hence
on \(\hat G\) by pinned automorphisms. This is precisely the action
defining the **L-group**:
\[
{}^L G \;=\; \hat G(\mathbb{C}) \;\rtimes\; \Gamma.
\]

## Tits indices

The combinatorial data of the Galois action plus the inner-form
cocycle is encoded by a **Tits index**: a Dynkin diagram with:
- \(\Gamma\)-orbits marked;
- distinguished vertices (representing the \(k\)-rational simple
  roots);
- arrows for the Galois action.

Tits indices give a complete classification of reductive groups over
a fixed field, including their quasi-split data.

## Role in Langlands

- **L-group construction**: requires the Galois action on the dual
  root datum.
- **Local Langlands for non-split groups**: L-parameters must respect
  the Galois action — they map into the L-group, not just \(\hat G\).
- **Global Langlands**: the global Galois action on root data is the
  natural compatibility for adelic groups.

## Mathlib

Not yet formalised in the explicit Galois-module setting.

## References

- Tits, *Classification of algebraic semisimple groups* (Proc.\ AMS
  Symp.\ 1966).
- Borel–Tits, *Groupes réductifs* (Publ.\ IHES 1965).
- Platonov–Rapinchuk, *Algebraic Groups and Number Theory* (1994).
- Conrad, *Reductive group schemes* (Notes, 2014), §7.

## Prerequisite Topics

- [[node:forms.rational_forms_of_reductive_groups|Rational Forms of Reductive Groups]]
- [[node:root_data.automorphisms_of_root_data|Automorphisms of Root Data]]
