---
id: linear_algebraic_groups.hopf_spec_functor
title: Spec Functor on Hopf Algebras
kind: definition
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
- foundational_inputs.affine_schemes
- foundational_inputs.hopf_algebras
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.HopfSpec
  declarations:
    - Langlands.AlgebraicGeometry.algSpec
    - Langlands.AlgebraicGeometry.hopfSpec
verification:
  definition: accepted
  proof: not_applicable
  alignment: pending
generality:
  reviewed: true
  prompt: "Is the functor defined for an arbitrary commutative base ring \\(R\\), not only a field?"
  verdict: "Yes. The construction is over any \\(R \\in \\mathsf{CommRingCat}\\); restricting to a field is a special case."
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
\operatorname{algSpec}_R : (\mathsf{CommAlgCat}\,R)^{\mathrm{op}} \to \mathsf{Over}(\operatorname{Spec} R)
\]

sending a commutative \(R\)-algebra \(A\) to the affine scheme
\(\operatorname{Spec} A\), regarded as a scheme over \(\operatorname{Spec}
R\) via the structure morphism \(\operatorname{Spec}\) of the algebra
map \(R \to A\). The functor is the composition of the equivalence
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

In the project's Lean development, \(\texttt{algSpec}\) is implemented
directly as the composition above. The Hopf-level functor
\(\texttt{hopfSpec}\) is declared but not yet implemented (placeholder
with \(\texttt{sorry}\)): the body \(\texttt{(algSpec R).mapGrp}\)
requires \(\texttt{Functor.Monoidal}\) on \(\texttt{algSpec R}\), which
in turn requires monoidal-category instances on the intermediate
categories (\((R\,/\,\mathsf{CommRingCat})^{\mathrm{op}}\) and
\(\mathsf{Over}(\operatorname{op} R)\)) that are not yet in Mathlib
master. An object-level hand-roll is a viable alternative path.
