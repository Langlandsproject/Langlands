---
id: affine_group_schemes.algebra_hom_composed_with_antipode_is_algebra_hom
title: Composition with the Antipode Is an Algebra Hom for Commutative Hopf Algebras
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- affine_group_schemes.antipode_multiplicativity_commutative_hopf
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfObjectBridge
  declarations:
  - Langlands.AlgebraicGeometry.HopfAntipode.algHomCompAntipode_apply
  - Langlands.AlgebraicGeometry.HopfAntipode.algHomCompAntipode
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is this node aligned with the Lean result currently used for affine group coordinate rings?"
  verdict: "Yes. The formalized project theorem assumes the Hopf algebra A is commutative and the target B is commutative; the more general noncommutative-source variant is deferred to the general antipode anti-multiplicativity node."
tags:
- antipode
- algebra-hom
- theorem
- linear-algebraic-groups
---

# Composition with the Antipode Is an Algebra Hom for Commutative Hopf Algebras

Let \(R\) be a commutative ring, \(A\) a **commutative** \(R\)-Hopf algebra
with antipode \(S : A \to A\), and \(B\) a commutative \(R\)-algebra. For
any \(R\)-algebra homomorphism \(f : A \to B\), the composition

\[
f \circ S : A \to B
\]

is again an \(R\)-algebra homomorphism.

This is the technical fact that makes the inverse in
[[node:affine_group_schemes.algebra_homs_form_group_under_convolution|the convolution group of algebra homomorphisms]]
well-defined; the underlying set is
\(\operatorname{Hom}_{R\text{-Alg}}(A, B)\).

*Proof.*  
\(R\)-linearity of \(f \circ S\) is automatic. Preservation of the
unit:

\[
(f \circ S)(1_A) \;=\; f(S(1_A)) \;=\; f(1_A) \;=\; 1_B,
\]

where the middle equality uses \(S(1_A) = 1_A\) (antipode preserves
unit).

Preservation of multiplication. By
[[node:affine_group_schemes.antipode_multiplicativity_commutative_hopf|multiplicativity of the antipode for commutative Hopf algebras]],
\(S(a \cdot b) = S(a) \cdot S(b)\). Applying \(f\) (an algebra hom),

\[
(f \circ S)(a \cdot b) \;=\; (f \circ S)(a) \cdot (f \circ S)(b).
\]

\(\square\)

**Remark.** If the general anti-multiplicativity theorem is formalized for
arbitrary Hopf algebras, then the same conclusion holds for noncommutative
\(A\) whenever \(B\) is commutative. The present node records the
commutative-coordinate-ring version currently used by the affine group
scheme development.
