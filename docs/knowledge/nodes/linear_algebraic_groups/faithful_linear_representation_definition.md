---
id: linear_algebraic_groups.faithful_linear_representation_definition
title: Faithful Linear Representation
kind: definition
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.algebraic_group_definition
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.FaithfulRepresentation
  declarations:
    - Langlands.AlgebraicGeometry.FaithfulLinearRepresentation
    - Langlands.AlgebraicGeometry.GeneralLinearGroupSchemeModel
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Does the definition allow an arbitrary finite-dimensional representation space \\(V\\) over the base field?"
  verdict: "Yes. \\(V\\) is any finite-dimensional \\(k\\)-vector space; the target group scheme is a model of \\(\\operatorname{GL}(V)\\)."
tags:
- representation
- definition
- linear-algebraic-groups
---

# Faithful Linear Representation

Let \(k\) be a field and \(G\) an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(\operatorname{Spec} k\). A **faithful finite-dimensional
representation** of \(G\) consists of:

1. a finite-dimensional \(k\)-vector space \(V\);
2. a scheme-theoretic model of the general linear group
   \(\operatorname{GL}(V)\), namely a scheme over \(\operatorname{Spec}
   k\) equipped with a group object structure realizing the functor
   \(R \mapsto \operatorname{GL}_R(V \otimes_k R)\);
3. a morphism of group schemes \(\rho : G \to \operatorname{GL}(V)\) over
   \(\operatorname{Spec} k\);
4. the requirement that the underlying morphism of schemes \(\rho\) is a
   closed immersion.

Equivalently, a faithful finite-dimensional representation exhibits \(G\)
as a closed subgroup scheme of some scheme-theoretic
\(\operatorname{GL}_n\).

In the project's Lean development the data above is packaged as the
structure \(\texttt{FaithfulLinearRepresentation}\,G\), with the
scheme-theoretic \(\operatorname{GL}(V)\) abstracted as
\(\texttt{GeneralLinearGroupSchemeModel}\,k\,V\) (an interface to be
realized concretely in Phase D4). The existence statement
([[node:linear_algebraic_groups.affine_finite_type_faithful_representation|embedding theorem]])
is recorded as a separate node; its proof is the subject of Phase B.
