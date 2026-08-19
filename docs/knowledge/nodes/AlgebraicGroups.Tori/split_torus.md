---
id: tori.split_torus
title: Split Torus
kind: definition
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
- tori.torus_definition
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.SplitTorus
  declarations:
  - Langlands.Tori.splitTorus
  - Langlands.Tori.SplitTorus
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 13.2"
    format: section
    note: "Split tori and the triviality of the Galois action."
verification:
  definition: accepted
  proof: not_applicable
  alignment: pending
generality:
  reviewed: true
  prompt: "Is splitness characterized both by an isomorphism over k and by the Galois module?"
  verdict: "Yes. Both characterizations are recorded and their equivalence follows from the classification of tori by Galois lattices."
tags:
- torus
- split
- definition
- AlgebraicGroups.Tori
---

# Split Torus

A torus \(T\) over \(k\) is **split** if
\(T \cong \mathbb{G}_{m,k}^{\,n}\) over \(k\) itself. Equivalently,
the \(\Theta\)-action on \(X^*(T)\) (equivalently on \(X_*(T)\)) is
trivial; equivalently, every character of \(T_{k_s}\) is defined over
\(k\).

For a split torus the character and cocharacter lattices are plain
lattices \(\mathbb{Z}^n\) with trivial Galois action, and
\(T(k) \cong (k^\times)^n\); more canonically
\(T(k) = X_*(T) \otimes_{\mathbb{Z}} k^\times\) via
\(\lambda \otimes x \mapsto \lambda(x)\).
