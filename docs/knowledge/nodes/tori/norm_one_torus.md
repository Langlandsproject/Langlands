---
id: tori.norm_one_torus
title: Norm-One Torus of a Separable Extension
kind: example
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.weil_restriction_of_tori
- tori.anisotropic_torus
- tori.subtori_and_quotients
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Remark 2.5.15"
    format: section
    note: "The norm-one torus of a quadratic extension as the running example."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the norm-one torus set up for an arbitrary finite separable extension, with the quadratic case identified explicitly?"
  verdict: "Yes. The construction is for any finite separable extension; the quadratic case with its sign lattice and anisotropy is worked out."
tags:
- torus
- norm-one
- example
- tori
---

# Norm-One Torus of a Separable Extension

Let \(E/k\) be a finite separable extension. The norm map on points
\(N_{E/k} : E^\times \to k^\times\) is algebraic: it is the map of
tori
\[
N \;:\; R_{E/k}\mathbb{G}_m \longrightarrow \mathbb{G}_m
\]
which on characters sends the generator of
\(X^*(\mathbb{G}_m) = \mathbb{Z}\) to the norm element
\(\sum_{c \in \Theta/\Theta_E} c \in \mathbb{Z}[\Theta/\Theta_E]\).
The **norm-one torus** is its kernel:
\[
R^{1}_{E/k}\mathbb{G}_m \;=\; \ker\bigl(N : R_{E/k}\mathbb{G}_m \to
\mathbb{G}_m\bigr),
\qquad
R^{1}_{E/k}\mathbb{G}_m(k) = \{x \in E^\times : N_{E/k}(x) = 1\}.
\]

It is a torus of rank \([E:k]-1\): the norm element spans a saturated
\(\Theta\)-stable sublattice \(\mathbb{Z}\cdot N \subseteq
\mathbb{Z}[\Theta/\Theta_E]\) (a generator with content one), so by
[[node:tori.subtori_and_quotients]] the kernel is a subtorus with
\[
X^*\bigl(R^1_{E/k}\mathbb{G}_m\bigr) \;=\;
\mathbb{Z}[\Theta/\Theta_E] \,/\, \mathbb{Z}\!\cdot\! N .
\]

**Quadratic case.** For \([E:k] = 2\) with
\(\operatorname{Gal}(E/k) = \{1,\sigma\}\):
\(X^*(R^1_{E/k}\mathbb{G}_m) \cong \mathbb{Z}\) with \(\sigma\)
acting by \(-1\) (the sign lattice). Its invariants vanish, so the
quadratic norm-one torus is [[node:tori.anisotropic_torus|anisotropic]]
— the smallest non-split torus, and the running counterexample of this
topic: it witnesses the failure of the split-anisotropic decomposition
to be direct, and, over discretely valued fields with ramified
\(E/k\), the failure of the Iwahori subgroup to exhaust the maximal
bounded subgroup (recorded at the arithmetic stage; source span).
