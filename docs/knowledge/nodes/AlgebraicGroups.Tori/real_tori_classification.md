---
id: tori.real_tori_classification
title: Classification of Real Tori
kind: example
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.f_tori_galois_module_classification
- tori.split_torus
- tori.norm_one_torus
- tori.weil_restriction_of_tori
source:
  spans:
  - artifact: curtis-reiner-methods
    locator: "Volume I, Section 34"
    format: section
    note: "Integral representations; lattices over Z[C_2] and their three indecomposables."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the example derive the real classification from the lattice classification with the three indecomposable Z[C_2]-lattices identified, including uniqueness of the decomposition?"
  verdict: "Yes. The three indecomposables and the Krull-Schmidt uniqueness for Z[C_2]-lattices are stated, and each is matched to its torus."
tags:
- torus
- real-forms
- example
- AlgebraicGroups.Tori
---

# Classification of Real Tori

Take \(k = \mathbb{R}\), so \(k_s = \mathbb{C}\) and
\(\Theta = \operatorname{Gal}(\mathbb{C}/\mathbb{R}) = C_2 =
\{1, \tau\}\). By
[[node:tori.f_tori_galois_module_classification]], real tori
correspond to \(\mathbb{Z}[C_2]\)-lattices.

**Lattice input.** Every \(\mathbb{Z}[C_2]\)-lattice is a direct sum,
unique up to reordering, of the three indecomposables:
\[
\mathbb{Z}\;(\tau = +1), \qquad
\mathbb{Z}^-\;(\tau = -1), \qquad
\mathbb{Z}[C_2]\;(\text{regular, } \tau \text{ swaps the basis}).
\]
(Integral representation theory of the cyclic group of order 2;
uniqueness is the Krull–Schmidt property for this order.)

**Torus output.** Under the classification the three indecomposables
correspond to:

| lattice | torus | real points |
|---|---|---|
| \(\mathbb{Z}\) (trivial) | \(\mathbb{G}_{m,\mathbb{R}}\) ([[node:tori.split_torus]]) | \(\mathbb{R}^\times\) |
| \(\mathbb{Z}^-\) (sign) | \(S^1 = T^1_{\mathbb{C}/\mathbb{R}}\) ([[node:tori.norm_one_torus]]) | \(\{z \in \mathbb{C}^\times : z\bar z = 1\}\) |
| \(\mathbb{Z}[C_2]\) (regular) | \(\operatorname{Res}_{\mathbb{C}/\mathbb{R}} \mathbb{G}_m\) ([[node:tori.weil_restriction_of_tori]]) | \(\mathbb{C}^\times\) |

Hence **every real torus is, uniquely up to reordering,**
\[
T \;\cong\;
\mathbb{G}_m^{\,a} \times (S^1)^{\,b} \times
\bigl(\operatorname{Res}_{\mathbb{C}/\mathbb{R}} \mathbb{G}_m\bigr)^{c},
\qquad a, b, c \geq 0 .
\]
The rank is \(a + b + 2c\), the split rank is \(a + c\)
(the \(\tau = +1\) fixed sublattice of \(X_*\) has rank \(a+c\)), and
\(T\) is anisotropic iff \(a = c = 0\), i.e. \(T \cong (S^1)^b\) — the
compact real tori.
