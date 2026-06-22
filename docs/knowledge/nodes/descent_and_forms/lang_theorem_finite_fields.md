---
id: descent_and_forms.lang_theorem_finite_fields
title: Lang Theorem for Connected Algebraic Groups over Finite Fields
kind: theorem
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
- linear_algebraic_groups
uses:
- descent_and_forms.galois_cohomology
- descent_and_forms.twisted_conjugacy_classes
- linear_algebraic_groups.lie_algebra_of_algebraic_group
- linear_algebraic_groups.identity_component_normal_finite_index
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Theorem 4.4.17"
    format: section
    note: "Lang's theorem: the Lang map is surjective for connected algebraic groups over finite fields."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is this the finite-field Frobenius version used for finite groups of Lie type?"
  verdict: "Yes. The theorem is stated for a connected algebraic group over a finite field and the Frobenius endomorphism attached to that field."
tags:
- springer
- lang-theorem
- finite-field
- frobenius
- theorem
- descent
---

# Lang Theorem for Connected Algebraic Groups over Finite Fields

Let \(G\) be a connected algebraic group over a finite field \(F_q\), and let
\(\sigma:G\to G\) be the \(q\)-Frobenius endomorphism. The Lang map
\[
L_\sigma:G\to G,\qquad x\mapsto \sigma(x)x^{-1}
\]
is surjective.

Equivalently, every element of \(G\) is \(\sigma\)-conjugate to the identity.
In Galois-cohomological language, this gives
\[
H^1(F_q,G)=1
\]
for connected algebraic groups.

*Proof.*  
The differential of the Frobenius morphism is zero, so the differential of
\(L_\sigma\) at the identity is the negative identity after identifying
tangent spaces by right translation. Translating the same computation shows
that \(dL_\sigma\) is bijective at every point. Hence the image of
\(L_\sigma\) contains a nonempty open subset of \(G\).

Let \(a\in G\). The same argument applied to the twisted map
\[
x\mapsto \sigma(x)a x^{-1}
\]
shows that its image contains a nonempty open subset. Since connected
algebraic groups are irreducible, the two nonempty open subsets intersect.
An intersection point gives \(a=\sigma(x)x^{-1}\) for some \(x\), proving
surjectivity.
