---
id: linear_algebraic_groups.algebra_hom_composed_with_antipode_is_algebra_hom
title: Composition of an Algebra Hom with the Antipode Is an Algebra Hom
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.antipode_anti_multiplicativity
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfObjectBridge
  declarations:
    - Langlands.AlgebraicGeometry.HopfAntipode.algHomCompAntipode
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "What is the minimal commutativity hypothesis — on the source A, on the target B, or both?"
  verdict: "Commutativity of B alone suffices. The antipode is anti-multiplicative on A; composing with f gives anti-mult in B; commutativity of B then symmetrises this to multiplicativity. A need not be commutative for this result."
tags:
- antipode
- algebra-hom
- theorem
- linear-algebraic-groups
---

# Composition of an Algebra Hom with the Antipode Is an Algebra Hom

Let \(R\) be a commutative ring, \(A\) an \(R\)-Hopf algebra with
antipode \(S : A \to A\), and \(B\) a **commutative** \(R\)-algebra.
For any \(R\)-algebra homomorphism \(f : A \to B\), the composition

\[
f \circ S : A \to B
\]

is again an \(R\)-algebra homomorphism.

This is the technical fact that makes the inverse of the convolution
group structure on \([[node:linear_algebraic_groups.algebra_homs_form_group_under_convolution|\operatorname{Hom}_{R\text{-Alg}}(A, B)]]\)
well-defined.

*Proof.*  
\(R\)-linearity of \(f \circ S\) is automatic. Preservation of the
unit:

\[
(f \circ S)(1_A) \;=\; f(S(1_A)) \;=\; f(1_A) \;=\; 1_B,
\]

where the middle equality uses \(S(1_A) = 1_A\) (antipode preserves
unit).

Preservation of multiplication. By
[[node:linear_algebraic_groups.antipode_anti_multiplicativity|antipode anti-multiplicativity]],
\(S(a \cdot b) = S(b) \cdot S(a)\). Applying \(f\) (an algebra hom),

\[
(f \circ S)(a \cdot b) \;=\; f(S(b) \cdot S(a)) \;=\; f(S(b)) \cdot f(S(a)) \;=\; (f \circ S)(b) \cdot (f \circ S)(a).
\]

By **commutativity of \(B\)**, \((f \circ S)(b) \cdot (f \circ S)(a) = (f \circ S)(a) \cdot (f \circ S)(b)\),
hence

\[
(f \circ S)(a \cdot b) \;=\; (f \circ S)(a) \cdot (f \circ S)(b).
\]

\(\square\)

**Remark.** \(A\) need not be commutative for this result. The
commutativity of \(B\) alone is enough to "fix" the anti-multiplicativity
of \(S\) into ordinary multiplicativity of \(f \circ S\).
