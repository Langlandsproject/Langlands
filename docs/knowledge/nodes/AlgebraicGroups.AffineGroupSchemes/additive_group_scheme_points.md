---
id: affine_group_schemes.additive_group_scheme_points
title: Points of 𝔾_a Are the Additive Group of R
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.additive_group_scheme
- affine_group_schemes.points_functor_definition
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the formula apply to arbitrary commutative \\(k\\)-algebras \\(R\\)?"
  verdict: "Yes. The formula \\(\\mathbb{G}_a(R) = (R, +)\\) is natural in any commutative algebra \\(R\\) over the base."
tags:
- functor-of-points
- additive-group
- theorem
- linear-algebraic-groups
---

# Points of \(\mathbb{G}_a\) Are the Additive Group of \(R\)

Let \(k\) be a field and \(R\) a commutative \(k\)-algebra. There is a
natural isomorphism of abelian groups

\[
\mathbb{G}_{a,\operatorname{Spec} k}(R) \;\cong\; (R, +).
\]

*Proof.*  
The
[[node:affine_group_schemes.points_functor_definition|\(R\)-points of \(\mathbb{G}_a\) over \(\operatorname{Spec} k\)]]
are morphisms \(\operatorname{Spec} R \to \mathbb{G}_{a, \operatorname{Spec} k}\)
over \(\operatorname{Spec} k\). By the affine-scheme equivalence and the
construction \(\mathbb{G}_{a, \operatorname{Spec} k} = \operatorname{Spec} k[T]\),
such morphisms are in bijection with \(k\)-algebra homomorphisms
\(k[T] \to R\). By the universal property of the polynomial ring, these
are in bijection with elements of \(R\) (the image of \(T\)):

\[
\mathbb{G}_a(R) \;\cong\; \operatorname{Hom}_{k\text{-Alg}}(k[T], R) \;\cong\; R.
\]

To verify that the bijection is a group isomorphism, evaluate the
multiplication \(\mathbb{G}_a(R) \times \mathbb{G}_a(R) \to \mathbb{G}_a(R)\)
on pairs \((r, s) \in R \times R\). This multiplication is induced by
the comultiplication \(\Delta(T) = T \otimes 1 + 1 \otimes T\) of the
coordinate Hopf algebra: the image of \(T\) under the composed algebra
hom \(k[T] \to k[T] \otimes_k k[T] \to R\) (first map \(\Delta\), second
map sending the first factor to \(r\) and the second to \(s\)) is \(r + s\). The
identity element corresponds to \(\varepsilon(T) = 0 \in R\), and
inversion to \(S(T) = -T \in R\). All three coincide with the additive
group structure on \(R\).  
\(\square\)
