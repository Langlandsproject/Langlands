---
id: tori.weil_restriction_of_tori
title: Weil Restriction of Tori
kind: theorem
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.f_tori_galois_module_classification
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Section 2.5, page 86"
    format: book-page
    note: "Weil restriction of G_m along a finite separable extension and its induced character lattice."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the statement for an arbitrary torus over an arbitrary finite separable extension, with the induced-module description of both lattices?"
  verdict: "Yes. The extension is any finite separable one and the source torus arbitrary; both the character and cocharacter lattices are identified as induced modules."
tags:
- torus
- weil-restriction
- theorem
- tori
---

# Weil Restriction of Tori

Let \(E/k\) be a finite separable field extension, \(\Theta_E =
\operatorname{Gal}(k_s/E) \subseteq \Theta\), and let \(S\) be a torus
over \(E\) of rank \(m\). The Weil restriction \(R_{E/k}S\) — the
affine \(k\)-group with functor of points
\[
(R_{E/k}S)(A) \;=\; S(A \otimes_k E)
\quad \text{for } k\text{-algebras } A
\]
— is a torus over \(k\) of rank \([E:k]\,m\), with
\[
X^*\!\bigl(R_{E/k}S\bigr) \;=\;
\operatorname{Ind}_{\Theta_E}^{\Theta} X^*(S),
\qquad
X_*\!\bigl(R_{E/k}S\bigr) \;=\;
\operatorname{Ind}_{\Theta_E}^{\Theta} X_*(S)
\]
as \(\Theta\)-modules. In particular
\(X^*(R_{E/k}\mathbb{G}_m) = \mathbb{Z}[\Theta/\Theta_E]\), the
permutation module on the coset space, and
\((R_{E/k}\mathbb{G}_m)(k) = E^\times\).

*Proof.*
Representability of \(R_{E/k}S\) by an affine \(k\)-group of finite
type is the standard existence of Weil restriction along the finite
locally free morphism \(\operatorname{Spec} E \to \operatorname{Spec} k\)
(source span). To see that it is a torus, base change to \(k_s\):
since \(E/k\) is separable,
\(E \otimes_k k_s \cong \prod_{\iota} k_s\) indexed by the
\([E:k]\) embeddings \(\iota : E \to k_s\), giving
\[
(R_{E/k}S)_{k_s} \;\cong\; \prod_{\iota} S \times_{E, \iota} k_s
\;\cong\; \mathbb{G}_{m}^{[E:k]\,m},
\]
so \(R_{E/k}S\) is a torus of the stated rank.

The displayed product decomposition identifies
\(X^*((R_{E/k}S)_{k_s})\) with
\(\bigoplus_{\iota} X^*(S \times_{E,\iota} k_s)\); the group
\(\Theta\) permutes the factors through its action on the embeddings
\(\iota\), i.e. on \(\Theta/\Theta_E\), and \(\Theta_E\) acts on the
factor at the distinguished embedding through its action on
\(X^*(S)\). This is exactly the induced module
\(\operatorname{Ind}_{\Theta_E}^{\Theta} X^*(S)\), and dually for
cocharacters. Finally \((R_{E/k}S)(k) = S(k \otimes_k E) = S(E)\), in
particular \(E^\times\) for \(S = \mathbb{G}_m\).
