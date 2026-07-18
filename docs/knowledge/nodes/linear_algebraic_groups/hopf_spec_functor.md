---
id: linear_algebraic_groups.hopf_spec_functor
title: Spec Functor on Hopf Algebras
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
- linear_algebraic_groups.hopf_spec_grpobj_via_yoneda
- foundational_inputs.affine_schemes
- foundational_inputs.hopf_algebras
lean:
  repository: langlands
  modules:
  - LanglandsLean.AlgebraicGeometry.HopfSpec
  - LanglandsLean.AlgebraicGeometry.HopfSpecFunctor
  declarations:
  - Langlands.AlgebraicGeometry.algSpec
  - Langlands.AlgebraicGeometry.hopfSpec
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.algHomToHomOverGrp
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.algSpec
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.gammaOver
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.homOverGrpToAlgHom
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.hopfSpec
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.hopfSpecGrpObjFromGrp
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.pointsPresheafGrp
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.pointsPresheafGrpMap
  - Langlands.AlgebraicGeometry.HopfSpecFunctor.pointsRepresentabilityGrp
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: Is the functor defined for an arbitrary commutative base ring \(R\), not
    only a field?
  verdict: Yes. The construction is over any \(R \in \mathsf{CommRingCat}\); restricting
    to a field is a special case.
tags:
- hopf-spec
- functor
- definition
- linear-algebraic-groups
---

# Spec Functor on Hopf Algebras

Let \(R\) be a commutative ring. The classical Spec functor

\[
\operatorname{Spec} : \mathsf{CommRingCat}^{\mathrm{op}} \to \mathsf{Scheme}
\]

restricts to a functor on commutative \(R\)-algebras

\[
\operatorname{algSpec}_R : (\mathsf{CommAlgCat}\,R)^{\mathrm{op}} \to \mathsf{Over}(\operatorname{Spec} R),
\]

sending a commutative \(R\)-algebra \(A\) to the affine scheme
\(\operatorname{Spec} A\), regarded as a scheme over \(\operatorname{Spec}
R\) via the structure morphism \(\operatorname{Spec}(R \to A)\). The
functor is the composition of the equivalence
\(\mathsf{CommAlgCat}\,R \simeq R\,/\,\mathsf{CommRingCat}\) with the
opposite of the equivalence \(\mathsf{Over}(\operatorname{Spec} R) \simeq
(\operatorname{Spec} R\,/\,\mathsf{Scheme})^{\mathrm{op}}\) and
post-composition with \(\operatorname{Spec}\) on the under category.

Group objects in \((\mathsf{CommAlgCat}\,R)^{\mathrm{op}}\) are the same
as commutative Hopf \(R\)-algebras. Lifting \(\operatorname{algSpec}_R\)
to group objects yields the **Spec functor on Hopf algebras**:

\[
\operatorname{hopfSpec}_R : \mathsf{Grp}((\mathsf{CommAlgCat}\,R)^{\mathrm{op}})
  \longrightarrow \mathsf{Grp}(\mathsf{Over}(\operatorname{Spec} R)).
\]

## Construction via Yoneda

The naive approach \((\operatorname{algSpec}_R).\operatorname{mapGrp}\)
requires \(\operatorname{algSpec}_R\) to be a monoidal functor, which in
turn requires monoidal-category instances on the intermediate
categories \((R\,/\,\mathsf{CommRingCat})^{\mathrm{op}}\) and
\(\mathsf{Over}(\operatorname{op} R)\) that are not in Mathlib master.

We adopt instead the **Yoneda construction**:

- **Object level**: for each commutative \(R\)-Hopf algebra \(A\),
  [[node:linear_algebraic_groups.hopf_spec_grpobj_via_yoneda|the group
  object structure on \(\operatorname{Spec} A\)]] is produced by
  \(\operatorname{GrpObj.ofRepresentableBy}\) applied to the
  group-valued points presheaf
  \(T \mapsto \operatorname{Hom}_{R\text{-Alg}}(A, \Gamma(T, \mathcal{O}_T))\).
  Set
  \(\operatorname{hopfSpec}_R(A) := \bigl(\operatorname{algSpec}_R(A),\, \text{this }\operatorname{GrpObj}\bigr)\).

- **Morphism level**: a morphism of Hopf algebras \(f : A \to A'\) is in
  particular an algebra hom; \(\operatorname{algSpec}_R(f) : \operatorname{Spec} A' \to \operatorname{Spec} A\)
  is a morphism in \(\mathsf{Over}(\operatorname{Spec} R)\). Because both
  \(\operatorname{GrpObj}\) structures are defined by Yoneda from the
  convolution group structure on algebra homs, and post-composition by
  \(f\) is a group hom on the convolution side (since \(f\) preserves
  the comultiplication, counit, and antipode), the induced morphism is
  a group object morphism.

- **Functoriality**: identity and composition follow from
  \(\operatorname{algSpec}_R\) being a functor, plus the Yoneda
  determination of the group-object morphism.

In the project's Lean development, the object-level construction lives
in
[[node:linear_algebraic_groups.hopf_spec_grpobj_via_yoneda|the dedicated
node]]; functoriality is established on top of it. The combined
package \(\operatorname{hopfSpec}_R\) is what replaces the
\(\texttt{sorry}\) placeholder in
\(\texttt{lean/LanglandsLean/AlgebraicGeometry/HopfSpec.lean}\).
