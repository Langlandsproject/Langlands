---
id: tori.induced_torus
title: Induced Torus
kind: definition
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.weil_restriction_of_tori
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Definition 2.5.1"
    format: section
    note: "Induced tori via a Galois-invariant basis of the character lattice; terminology discussion."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are both the lattice-theoretic and the product-of-Weil-restrictions descriptions given, with their equivalence explained?"
  verdict: "Yes. The permutation-basis condition is the definition and the decomposition into Weil restrictions is derived from the orbit decomposition of the basis."
tags:
- torus
- induced
- quasi-trivial
- definition
- AlgebraicGroups.Tori
---

# Induced Torus

A torus \(T\) over \(k\) is **induced** (synonym in the literature:
*quasi-trivial*) if the lattice \(X^*(T)\) — equivalently
\(X_*(T)\) — has a \(\mathbb{Z}\)-basis permuted by \(\Theta\), i.e.
is a permutation module.

**Product description.** \(T\) is induced if and only if
\[
T \;\cong\; \prod_{i} R_{E_i/k}\,\mathbb{G}_m
\]
for finitely many finite separable extensions \(E_i/k\). Indeed, a
permutation basis decomposes into \(\Theta\)-orbits; the stabilizer of
a basis vector is an open subgroup \(\Theta_i \subseteq \Theta\)
(openness by continuity of the action on the discrete lattice), with
fixed field \(E_i\), and the orbit spans a copy of
\(\mathbb{Z}[\Theta/\Theta_i] = X^*(R_{E_i/k}\mathbb{G}_m)\) by
[[node:tori.weil_restriction_of_tori]]. Conversely a product of such
Weil restrictions has permutation character lattice.

In particular \(T(k) \cong \prod_i E_i^\times\), and induced tori are
exactly the tori whose arithmetic reduces to that of
\(\mathbb{G}_m\) over finite separable extensions — the reason they
serve as the resolving class for arbitrary tori
(see [[node:tori.induced_resolution]]).

**Terminology warning** (following the source). Induced tori are
sometimes called *quasi-split tori* in the literature. This knowledge
base avoids that usage: *every* torus is a quasi-split reductive
group, so "quasi-split" carries no information about a torus.
