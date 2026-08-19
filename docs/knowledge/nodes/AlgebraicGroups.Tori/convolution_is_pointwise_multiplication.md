---
id: tori.convolution_is_pointwise_multiplication
title: Convolution Is Pointwise Multiplication
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
- AlgebraicGroups.AffineGroupSchemes
uses:
- tori.algebraic_tori
- affine_group_schemes.group_scheme_homomorphism
- affine_group_schemes.coordinate_hopf_algebra_of_group_scheme
- affine_group_schemes.hopf_spec_grpobj_via_yoneda
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the statement given both for point groups of an arbitrary affine group scheme and for character groups, over an arbitrary base?"
  verdict: "Yes. The identification is stated for T-points of any affine group scheme and specialized to characters; the base ring is arbitrary."
tags:
- convolution
- characters
- theorem
- tori
---

# Convolution Is Pointwise Multiplication

Let \(G = \operatorname{Spec} A\) be an affine group scheme over
\(R\) with coordinate Hopf algebra \(A\), and let \(T\) be an
\(R\)-scheme. Under the affine identification
\[
G(T) \;=\; \operatorname{Hom}_{R\text{-sch}}(T, G)
\;\cong\; \operatorname{Hom}_{R\text{-alg}}\bigl(A,\, \Gamma(T)\bigr),
\]
the group law of \(G\) on \(T\)-points corresponds to the
**convolution product**
\[
\varphi * \psi \;=\; \mu_{\Gamma(T)} \circ (\varphi \otimes \psi)
\circ \Delta_A ,
\]
with unit \(\eta \circ \varepsilon_A\) and inverse
\(\varphi \circ S_A\).

**Specialization to characters.** For an affine group scheme \(G'\),
the pointwise product of characters
\(\chi_1 \chi_2 : G' \to \mathbb{G}_m\) corresponds, under the
coordinate-ring bridge
([[node:affine_group_schemes.group_scheme_homomorphism]]), to the
convolution product on
\(\operatorname{Hom}_{R\text{-bialg}}(R[\mathbb{Z}], O(G'))\), and
under [[node:tori.characters_as_group_like_elements]] to the ring
product of group-like elements. This is the justification for
carrying character groups by convolution structures in the Lean
development.

*Proof.*
The group law \(G \times_R G \to G\) corresponds contravariantly to
the comultiplication \(\Delta_A : A \to A \otimes_R A\). Given
\(T\)-points \(\varphi, \psi : A \to \Gamma(T)\), their product point
is the composite
\(A \xrightarrow{\Delta} A \otimes A \xrightarrow{\varphi \otimes \psi}
\Gamma(T) \otimes \Gamma(T) \xrightarrow{\mu} \Gamma(T)\) — the
convolution. The unit point corresponds to the counit and the
inverse to precomposition with the antipode, by the same
translation of the unit and inversion morphisms. For characters:
the pointwise product \(\chi_1\chi_2\) is the composite
\(G' \xrightarrow{\Delta_{G'}} G' \times G'
\xrightarrow{\chi_1 \times \chi_2} \mathbb{G}_m \times \mathbb{G}_m
\xrightarrow{m} \mathbb{G}_m\), whose coordinate-ring translation is
exactly the convolution of the corresponding bialgebra maps. On
group-like elements \(u_i = \chi_i(e^1)\), convolution evaluates to
\(u_1 u_2\).
