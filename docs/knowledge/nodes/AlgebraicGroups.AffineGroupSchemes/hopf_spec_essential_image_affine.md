---
id: affine_group_schemes.hopf_spec_essential_image_affine
title: Essential Image of Spec Is Affine Group Schemes
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.hopf_spec_functor
- affine_group_schemes.affine_group_scheme_definition
verification:
  statement: accepted
generality:
  reviewed: true
  prompt: "Is the essential image characterized intrinsically (without finite-type or smoothness)?"
  verdict: "Yes. The characterization is geometric: a group scheme \\(G\\) is in the essential image iff its underlying scheme is affine. No finite type or smoothness condition."
tags:
- hopf-spec
- equivalence
- theorem
- linear-algebraic-groups
---

# Essential Image of Spec Is Affine Group Schemes

The essential image of the
[[node:affine_group_schemes.hopf_spec_functor|Spec functor on Hopf algebras]]

\[
\operatorname{hopfSpec}_R : \mathsf{Grp}((\mathsf{CommAlgCat}\,R)^{\mathrm{op}})
  \longrightarrow \mathsf{Grp}(\mathsf{Over}(\operatorname{Spec} R))
\]

consists exactly of the
[[node:affine_group_schemes.affine_group_scheme_definition|affine group schemes]]
over \(\operatorname{Spec} R\) — equivalently, those group objects \(G\)
in \(\mathsf{Over}(\operatorname{Spec} R)\) whose underlying scheme
\(G\) is affine. Combined with
[[node:affine_group_schemes.hopf_spec_fully_faithful|full faithfulness]],
this yields an equivalence of categories

\[
\mathsf{Grp}((\mathsf{CommAlgCat}\,R)^{\mathrm{op}})
  \;\;\simeq\;\;
\bigl\{\, G \in \mathsf{Grp}(\mathsf{Over}(\operatorname{Spec} R)) \,:\, G \text{ is affine} \,\bigr\}.
\]

*Proof sketch.*  
The corresponding statement at the algebra level: the essential image
of \(\operatorname{algSpec}_R\) is the affine schemes over
\(\operatorname{Spec} R\). This follows from the standard equivalence
between commutative \(R\)-algebras and affine schemes over
\(\operatorname{Spec} R\) (one direction by global sections, the other
by \(\operatorname{Spec}\)).

To lift to the Hopf level: given an affine group object \(G\) in
\(\mathsf{Over}(\operatorname{Spec} R)\), the underlying scheme is
\(\operatorname{algSpec}_R(A)\) for the commutative \(R\)-algebra
\(A = \Gamma(G, \mathcal{O}_G)\) ([[node:affine_group_schemes.coordinate_hopf_algebra_of_group_scheme|the coordinate algebra]]).
The group object structure on \(G\) endows \(A\) with comultiplication,
counit, and antipode (each is the pullback of the corresponding
scheme-level morphism), making \(A\) a commutative \(R\)-Hopf algebra.
Under [[node:affine_group_schemes.hopf_spec_grpobj_via_yoneda|the
Yoneda construction]] of \(\operatorname{hopfSpec}_R\), the
\(\operatorname{GrpObj}\) it produces on \(\operatorname{algSpec}_R(A)\)
matches the original \(\operatorname{GrpObj}\) on \(G\) (because both
are uniquely determined by the convolution group structure on
\(\operatorname{Hom}_{R\text{-Alg}}(A, -)\)).

The inverse functor at the algebra level is the global-sections functor
\(\Gamma : G \mapsto \mathcal{O}(G)\); see
[[node:affine_group_schemes.coordinate_hopf_algebra_of_group_scheme|the coordinate Hopf algebra]].  
\(\square\)
