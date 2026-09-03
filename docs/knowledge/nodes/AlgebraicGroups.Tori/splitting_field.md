---
id: tori.splitting_field
title: The Minimal Splitting Field of a Torus
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.f_tori_galois_module_classification
source:
  spans:
  - artifact: borel-linear-algebraic-groups
    locator: "Section 8.11"
    format: section
    note: "Tori split over a finite separable extension."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the splitting field shown to be finite Galois with Galois group embedding into GL_n(Z), over an arbitrary base field?"
  verdict: "Yes. The argument uses only continuity of the Galois action on the discrete character lattice."
tags:
- torus
- splitting-field
- theorem
- AlgebraicGroups.Tori
---

# The Minimal Splitting Field of a Torus

Let \(T\) be a torus of rank \(n\) over \(k\). Then:

1. \(T\) splits over a finite separable extension of \(k\);
2. there is a unique minimal splitting field \(E/k\) inside \(k_s\); it
   is finite Galois over \(k\), namely the fixed field of
   \(\ker\bigl(\Theta \to \operatorname{Aut}(X^*(T))\bigr)\);
3. the action of \(\operatorname{Gal}(E/k)\) on \(X^*(T)\) is
   faithful, giving an embedding
   \(\operatorname{Gal}(E/k) \hookrightarrow
   \operatorname{Aut}(X^*(T)) \cong \operatorname{GL}_n(\mathbb{Z})\).

In particular the isomorphism classes of rank-\(n\) tori over \(k\)
correspond to conjugacy classes of continuous homomorphisms
\(\Theta \to \operatorname{GL}_n(\mathbb{Z})\), and every torus is
split by a finite Galois extension whose group is a finite subgroup of
\(\operatorname{GL}_n(\mathbb{Z})\).

*Proof.*
The \(\Theta\)-action on the discrete finitely generated group
\(X^*(T)\) is continuous: each character of \(T_{k_s}\) is defined
over a finite subextension, and a finite generating set is therefore
stabilized by an open subgroup of \(\Theta\). Hence
\(N = \ker(\Theta \to \operatorname{Aut} X^*(T))\) is an open normal
subgroup, and its fixed field \(E\) is finite Galois over \(k\) with
\(\operatorname{Gal}(E/k) = \Theta/N\) acting faithfully on
\(X^*(T)\).

Over \(E\) the Galois group \(\operatorname{Gal}(k_s/E) = N\) acts
trivially on \(X^*(T)\), so by
[[node:tori.f_tori_galois_module_classification]] the torus \(T_E\)
corresponds to the trivial \(\operatorname{Gal}(k_s/E)\)-lattice
\(\mathbb{Z}^n\), i.e. \(T_E \cong \mathbb{G}_{m,E}^n\) is split. Any
splitting field \(L \subseteq k_s\) of \(T\) must satisfy
\(\operatorname{Gal}(k_s/L) \subseteq N\), i.e. \(L \supseteq E\), so
\(E\) is the unique minimal one. The final classification statement is
the anti-equivalence again.
