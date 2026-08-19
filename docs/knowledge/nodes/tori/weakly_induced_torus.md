---
id: tori.weakly_induced_torus
title: Weakly Induced Torus
kind: definition
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.induced_tori
- tori.tamely_ramified_torus
- foundational_inputs.local_fields
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Definition B.6.2"
    format: section
    note: "Weakly induced tori: induced after a tamely ramified extension."
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Remark B.6.3"
    format: section
    note: "Equivalence with the wild inertia group permuting a basis of the character lattice."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are the extension-theoretic and wild-inertia-permutation characterizations both recorded, with the inclusion of the induced class?"
  verdict: "Yes. The definition is by a tame extension making the torus induced; the equivalent condition is a wild-inertia-permuted basis, and induced tori are noted to be weakly induced."
tags:
- torus
- weakly-induced
- ramification
- definition
- tori
---

# Weakly Induced Torus

Let \(k\) be a Henselian discretely valued field with wild inertia
group \(P \subseteq \Theta\), and let \(k_t \subseteq k_s\) be the
maximal tamely ramified extension of \(k\), so
\(P = \operatorname{Gal}(k_s/k_t)\).

A torus \(T\) over \(k\) is **weakly induced** if there exists a
tamely ramified extension \(\ell/k\) such that \(T_\ell\) is
[[node:tori.induced_tori|induced]]. Equivalently:

- \(T_{k_t}\) is induced; equivalently
- \(X^*(T)\) (equivalently \(X_*(T)\)) has a \(\mathbb{Z}\)-basis
  permuted by the wild inertia group \(P\).

Every induced torus is weakly induced, and every
[[node:tori.tamely_ramified_torus|tamely ramified torus]] is weakly
induced (the wild inertia then acts trivially, so any basis is
permuted). The class is designed for integral-model theory: it is
recorded at the integral-model stage of this topic that the standard
integral model of a torus is smooth with well-behaved congruence
filtration exactly under this hypothesis, which is why the class —
rather than the tame or induced classes — is the natural boundary of
the good theory.
