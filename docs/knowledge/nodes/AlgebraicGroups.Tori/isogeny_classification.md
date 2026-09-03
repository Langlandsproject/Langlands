---
id: tori.isogeny_classification
title: Tori up to Isogeny Are Rational Representations
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.f_tori_galois_module_classification
- tori.split_anisotropic_decomposition
source:
  spans:
  - artifact: voskresenskii-algebraic-tori
    locator: "Chapter 1"
    format: section
    note: "Tori, lattices, and the rational character module as isogeny invariant."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the isogeny classification stated over an arbitrary field, with the semisimplicity input (Maschke over Q) and the complete-invariant claim both explicit?"
  verdict: "Yes. The statement is field-independent; semisimplicity of Q[Q]-modules for the finite quotient Q is the only representation-theoretic input."
tags:
- torus
- isogeny
- rational-representation
- theorem
- AlgebraicGroups.Tori
---

# Tori up to Isogeny Are Rational Representations

An **isogeny** of tori is a surjective \(k\)-homomorphism with finite
kernel; two tori are **isogenous** if they are connected by a chain
of isogenies (a symmetric relation for tori, via dual isogenies).

**Theorem.** Let \(\Theta = \operatorname{Gal}(k_s/k)\).

1. Two tori \(T, T'\) over \(k\) are isogenous iff
   \[
   X^*(T) \otimes_{\mathbb{Z}} \mathbb{Q}
   \;\cong\;
   X^*(T') \otimes_{\mathbb{Z}} \mathbb{Q}
   \]
   as \(\mathbb{Q}\)-representations of \(\Theta\): the rational
   character module is a **complete isogeny invariant**.
2. The category of tori over \(k\) **up to isogeny** (morphisms
   tensored with \(\mathbb{Q}\)) is anti-equivalent to the category
   of continuous finite-dimensional \(\mathbb{Q}\)-representations
   of \(\Theta\) (equivalently, of \(\mathbb{Q}[Q]\)-modules for
   finite quotients \(Q\) of \(\Theta\)). This category is
   **semisimple** (Maschke over \(\mathbb{Q}\)), so every torus is
   isogenous to a product of tori that are *irreducible up to
   isogeny*, uniquely up to reordering.

*Proof.*
By [[node:tori.f_tori_galois_module_classification]], tori
correspond anti-equivalently to \(\Theta\)-lattices. A
\(k\)-homomorphism \(f : T \to T'\) is an isogeny iff
\(X^*(f) : X^*(T') \to X^*(T)\) is injective with finite cokernel,
iff \(X^*(f) \otimes \mathbb{Q}\) is an isomorphism: surjectivity of
\(f\) with finite kernel translates through the anti-equivalence to
exactness of
\(0 \to X^*(T') \to X^*(T) \to X^*(\ker f) \to 0\) with
\(X^*(\ker f)\) finite. Hence isogenies become isomorphisms after
\(\otimes\, \mathbb{Q}\), giving that the rational module is an
isogeny invariant. Conversely, an isomorphism
\(\phi : X^*(T')_{\mathbb{Q}} \to X^*(T)_{\mathbb{Q}}\) can be
scaled by a positive integer so that
\(N\phi(X^*(T')) \subseteq X^*(T)\) with finite index; \(N\phi\) is
then a lattice map realizing an isogeny \(T \to T'\). This proves
(1), and (2) follows since morphisms up to isogeny are
\(\operatorname{Hom}\otimes\mathbb{Q}\) on lattices, i.e. morphisms
of rational representations; semisimplicity is Maschke for the
finite quotient through which \(\Theta\) acts.

**Example.** The split–anisotropic decomposition
([[node:tori.split_anisotropic_decomposition]]) is the isotypic
decomposition isolating the trivial \(\mathbb{Q}[\Theta]\)-isotype:
\(T\) is isogenous to \(T_d \times T_a\) with
\(X^*(T_d)_{\mathbb{Q}}\) the trivial isotype and
\(X^*(T_a)_{\mathbb{Q}}\) its complement. \(\square\)
