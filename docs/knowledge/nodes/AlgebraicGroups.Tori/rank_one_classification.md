---
id: tori.rank_one_classification
title: Classification of Rank-One Tori
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.split_torus
- tori.norm_one_torus
- tori.f_tori_galois_module_classification
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the classification cover every base field, parametrizing non-split forms by separable quadratic extensions?"
  verdict: "Yes. The proof is the classification of continuous characters of the absolute Galois group with values in GL_1(Z), valid over any field."
tags:
- torus
- rank-one
- classification
- theorem
- AlgebraicGroups.Tori
---

# Classification of Rank-One Tori

Every torus of rank \(1\) over a field \(k\) is isomorphic to exactly
one of:

- the split torus \(\mathbb{G}_m\);
- the norm-one torus \(R^1_{E/k}\mathbb{G}_m\) of a separable
  quadratic extension \(E/k\),

and \(R^1_{E/k}\mathbb{G}_m \cong R^1_{E'/k}\mathbb{G}_m\) if and only
if \(E = E'\) inside \(k_s\). Thus rank-one tori are parametrized by
separable quadratic extensions of \(k\) together with the split one.

*Proof.*
By [[node:tori.f_tori_galois_module_classification]] a rank-one torus
corresponds to a continuous action of \(\Theta\) on
\(\mathbb{Z}\), i.e. a continuous homomorphism
\(\chi : \Theta \to \operatorname{Aut}(\mathbb{Z}) = \{\pm 1\}\)
(conjugation is trivial in an abelian target, so isomorphism classes
are homomorphisms, not just conjugacy classes). If \(\chi\) is trivial
the lattice is trivial and the torus is
[[node:tori.split_torus|split]]. Otherwise \(\ker \chi\) is an open
subgroup of index \(2\), i.e. \(\ker\chi = \operatorname{Gal}(k_s/E)\)
for a uniquely determined separable quadratic extension \(E/k\), and
the lattice is the sign lattice of \(E/k\) — which by
[[node:tori.norm_one_torus]] is the lattice of
\(R^1_{E/k}\mathbb{G}_m\). Distinct \(E\) give distinct kernels, hence
non-isomorphic lattices.
