---
id: linear_algebraic_groups.convolution_of_algebra_homs_is_algebra_hom
title: Convolution of Algebra Homomorphisms Is an Algebra Homomorphism
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.algebra_hom_convolution
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfConvolution
  declarations:
    - Langlands.AlgebraicGeometry.HopfConvolution.convAlg
    - Langlands.AlgebraicGeometry.HopfConvolution.convAlg_toLinearMap
    - Langlands.AlgebraicGeometry.HopfConvolution.convAlg_apply
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the hypothesis 'B commutative' really essential?"
  verdict: "Yes. For non-commutative B, the convolution of two algebra homs is only a linear map, not generally an algebra hom; the proof uses commutativity of B to interchange middle factors. The hypothesis 'A is a bialgebra' is also essential — the algebra-hom property of Δ is what makes f * g respect multiplication."
tags:
- convolution
- hopf-algebra
- theorem
- linear-algebraic-groups
---

# Convolution of Algebra Homomorphisms Is an Algebra Homomorphism

Let \(R\) be a commutative ring, \(A\) an \(R\)-bialgebra, and \(B\) a
commutative \(R\)-algebra. For any two \(R\)-algebra homomorphisms
\(f, g : A \to B\), their
[[node:linear_algebraic_groups.algebra_hom_convolution|convolution]]
\(f * g : A \to B\) is again an \(R\)-algebra homomorphism.

*Proof.*  
We check that \(f * g\) preserves multiplication, the identity
\(1_A\), and is \(R\)-linear (the last is automatic from the definition
\(f * g = m_B \circ (f \otimes g) \circ \Delta\) being a composition of
linear maps).

*Identity.* By the unit axiom of the bialgebra,
\(\Delta(1_A) = 1_A \otimes 1_A\). Hence
\((f * g)(1_A) = m_B(f(1_A) \otimes g(1_A)) = 1_B \cdot 1_B = 1_B\)
since \(f, g\) are algebra homs.

*Multiplication.* For \(a, b \in A\), the **bialgebra axiom**
\(\Delta(ab) = \Delta(a) \cdot \Delta(b)\) (i.e., \(\Delta\) is an
algebra homomorphism with respect to the standard algebra structure on
\(A \otimes A\)) gives

\[
\Delta(ab) \;=\; \sum_{(a),(b)} (a_{(1)} b_{(1)}) \otimes (a_{(2)} b_{(2)}).
\]

Applying \((f * g)\):

\[
(f * g)(ab)
  \;=\; \sum_{(a),(b)} f(a_{(1)} b_{(1)}) \cdot g(a_{(2)} b_{(2)})
  \;=\; \sum_{(a),(b)} f(a_{(1)})\,f(b_{(1)})\,g(a_{(2)})\,g(b_{(2)}),
\]

using that \(f, g\) are algebra homs. Now use the
**commutativity of \(B\)** to rearrange:
\(f(b_{(1)})\,g(a_{(2)}) = g(a_{(2)})\,f(b_{(1)})\). This regroups the
sum into

\[
\biggl(\sum_{(a)} f(a_{(1)}) g(a_{(2)})\biggr) \cdot \biggl(\sum_{(b)} f(b_{(1)}) g(b_{(2)})\biggr)
  \;=\; (f * g)(a) \cdot (f * g)(b).
\]

Hence \(f * g\) preserves multiplication and is therefore an algebra
homomorphism.  
\(\square\)

**Remark.** Without the commutativity of \(B\), the rearrangement step
fails, and \(f * g\) is only an \(R\)-linear map in general. This is why
the construction of the affine group scheme \(\operatorname{Spec} A\)
(for \(A\) a commutative Hopf algebra) is meaningful only when one
restricts to **commutative** target algebras \(B\), and the resulting
group is generally non-commutative as a group (but the underlying
algebras \(A\) and \(B\) remain commutative).
