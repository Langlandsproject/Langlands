---
id: affine_group_schemes.spec_representability_via_global_sections
title: Hom Into Spec via Global Sections (Spec ⊣ Γ Adjunction)
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- affine_group_schemes.coordinate_rings_and_hopf_algebras
- foundational_inputs.affine_schemes
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
  declarations:
    - Langlands.AlgebraicGeometry.AlgHomPointsPresheaf.specRepresentability
    - Langlands.AlgebraicGeometry.AlgHomPointsPresheaf.homOverToAlgHom
    - Langlands.AlgebraicGeometry.AlgHomPointsPresheaf.algHomToHomOver
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Does the statement apply to arbitrary schemes T over Spec R, not only affine T?"
  verdict: "Yes. This is the crux: the bijection holds for every T (not necessarily affine), because the target is affine. The bijection is natural in T."
tags:
- spec
- yoneda
- adjunction
- theorem
- linear-algebraic-groups
---

# Hom Into Spec via Global Sections (\(\operatorname{Spec} \dashv \Gamma\) Adjunction)

Let \(R\) be a commutative ring and \(A\) a commutative \(R\)-algebra.
For any scheme \(T\) over \(\operatorname{Spec} R\) (not necessarily
affine), there is a natural bijection of sets

\[
\operatorname{Hom}_{\mathsf{Sch}/\operatorname{Spec} R}(T,\, \operatorname{Spec} A)
\;\;\simeq\;\;
\operatorname{Hom}_{R\text{-Alg}}\bigl(A,\, \Gamma(T, \mathcal{O}_T)\bigr),
\]

where the right-hand side gives \(\Gamma(T, \mathcal{O}_T)\) its
canonical \(R\)-algebra structure via the structure morphism
\(T \to \operatorname{Spec} R\). The bijection is natural in \(T\).

*Proof.*  
This is the global-sections-versus-Spec adjunction, restricted to
morphisms living over \(\operatorname{Spec} R\). Concretely, given
\(f : T \to \operatorname{Spec} A\) over \(\operatorname{Spec} R\), the
pullback on global sections gives
\(f^\sharp : A = \Gamma(\operatorname{Spec} A, \mathcal{O}) \to \Gamma(T, \mathcal{O}_T)\)
as an \(R\)-algebra hom. Conversely, given an \(R\)-algebra hom
\(\varphi : A \to \Gamma(T, \mathcal{O}_T)\), the universal property of
\(\operatorname{Spec}\) on the affine target gives a unique scheme
morphism \(T \to \operatorname{Spec} A\) whose induced map on global
sections is \(\varphi\); compatibility over \(\operatorname{Spec} R\)
follows automatically because \(\varphi\) is \(R\)-linear.

Naturality in \(T\) is immediate: a morphism \(g : T' \to T\) sends an
\(R\)-algebra hom \(A \to \Gamma(T, \mathcal{O}_T)\) to its composition
with \(g^\sharp : \Gamma(T, \mathcal{O}_T) \to \Gamma(T', \mathcal{O}_{T'})\),
matching the precomposition on the scheme-morphism side.  
\(\square\)

**Mathlib state.** This is `Spec ⊣ Γ` (`AlgebraicGeometry.ΓSpec.adjunction`
or `Spec.adjunction` depending on the formulation). The "over
`Spec R`" version follows by passing to the slice category. Both are
in Mathlib master.
