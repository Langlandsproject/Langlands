---
id: linear_algebraic_groups.general_linear_group_scheme_points
title: Points of GL_n Are Invertible n×n Matrices over R
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.general_linear_group_scheme
- linear_algebraic_groups.points_functor_definition
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the formula hold for arbitrary commutative \\(k\\)-algebras \\(R\\)?"
  verdict: "Yes. The formula \\(\\operatorname{GL}_n(R) = \\operatorname{GL}_n(R)\\) (invertible matrices over \\(R\\)) is natural in any commutative algebra \\(R\\) over the base."
tags:
- functor-of-points
- general-linear-group
- theorem
- linear-algebraic-groups
---

# Points of \(\operatorname{GL}_n\) Are Invertible \(n \times n\) Matrices over \(R\)

Let \(k\) be a field, \(n\) a positive integer, and \(R\) a commutative
\(k\)-algebra. There is a natural isomorphism of groups

\[
\operatorname{GL}_{n, \operatorname{Spec} k}(R) \;\cong\; \operatorname{GL}_n(R),
\]

where the right-hand side is the group of \(n \times n\) matrices over
\(R\) with invertible determinant under multiplication.

*Proof.*  
The
[[node:linear_algebraic_groups.points_functor_definition|\(R\)-points of \(\operatorname{GL}_n\) over \(\operatorname{Spec} k\)]]
are \(k\)-algebra homomorphisms
\(k[x_{ij}][\det^{-1}] \to R\). Such a homomorphism is determined by the
images \(r_{ij} \in R\) of the indeterminates \(x_{ij}\), subject to the
condition that the image of \(\det^{-1}\) is the multiplicative inverse
of \(\det(r_{ij})\); equivalently, the matrix \((r_{ij}) \in M_n(R)\)
must have an invertible determinant in \(R\). Hence

\[
\operatorname{GL}_n(R) \;\cong\; \{(r_{ij}) \in M_n(R) \,:\, \det(r_{ij}) \in R^\times\} \;=\; \operatorname{GL}_n(R).
\]

To verify the bijection is a group isomorphism, compute the product of
two matrix points \((r_{ij}), (s_{ij}) \in \operatorname{GL}_n(R)\)
under the comultiplication
\(\Delta(x_{ij}) = \sum_k x_{ik} \otimes x_{kj}\). The image of
\(x_{ij}\) under the composed hom is \(\sum_k r_{ik} \cdot s_{kj}\),
which is the \((i, j)\)-entry of the matrix product \((r_{ij})(s_{ij})\).
The identity corresponds to \(\varepsilon(x_{ij}) = \delta_{ij}\),
giving the identity matrix; the inverse to \(S(x_{ij}) = \det^{-1} \cdot
C_{ji}\), giving the matrix inverse. All three match the standard group
structure on \(\operatorname{GL}_n(R)\).  
\(\square\)
