---
id: linear_algebraic_groups.multiplicative_group_scheme_points
title: Points of 𝔾_m Are the Units of R
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.multiplicative_group_scheme
- linear_algebraic_groups.points_functor_definition
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the formula hold for arbitrary commutative \\(k\\)-algebras \\(R\\)?"
  verdict: "Yes. The formula \\(\\mathbb{G}_m(R) = R^\\times\\) is natural in any commutative algebra \\(R\\) over the base."
tags:
- functor-of-points
- multiplicative-group
- theorem
- linear-algebraic-groups
---

# Points of \(\mathbb{G}_m\) Are the Units of \(R\)

Let \(k\) be a field and \(R\) a commutative \(k\)-algebra. There is a
natural isomorphism of abelian groups

\[
\mathbb{G}_{m,\operatorname{Spec} k}(R) \;\cong\; R^\times,
\]

where \(R^\times\) denotes the group of multiplicative units of \(R\).

*Proof.*  
The
[[node:linear_algebraic_groups.points_functor_definition|\(R\)-points of \(\mathbb{G}_m\) over \(\operatorname{Spec} k\)]]
are \(k\)-algebra homomorphisms \(k[T, T^{-1}] \to R\). Such a
homomorphism is determined by the image of \(T\), which must be a unit
(since \(T \cdot T^{-1} = 1\) forces the image of \(T^{-1}\) to be the
inverse of the image of \(T\)). Conversely, any unit \(u \in R^\times\)
gives such a homomorphism by sending \(T \mapsto u\) and
\(T^{-1} \mapsto u^{-1}\). Hence

\[
\mathbb{G}_m(R) \;\cong\; \operatorname{Hom}_{k\text{-Alg}}(k[T, T^{-1}], R) \;\cong\; R^\times.
\]

To verify the bijection is a group isomorphism, evaluate the
multiplication on pairs \((u, v) \in R^\times \times R^\times\). The
comultiplication \(\Delta(T) = T \otimes T\) sends \(T\) in the composed
hom to \(uv\), recovering the multiplication of \(R^\times\). The
identity corresponds to \(\varepsilon(T) = 1\), and the inverse to
\(S(T) = T^{-1}\). All three match the multiplicative group structure on
\(R^\times\).  
\(\square\)
