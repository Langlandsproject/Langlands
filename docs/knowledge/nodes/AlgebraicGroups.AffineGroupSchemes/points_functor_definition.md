---
id: affine_group_schemes.points_functor_definition
title: Functor of Points of a Group Scheme
kind: definition
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.affine_group_scheme_definition
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Points
  declarations:
    - Langlands.AlgebraicGeometry.specOver
    - Langlands.AlgebraicGeometry.specOverHom
    - Langlands.AlgebraicGeometry.points
    - Langlands.AlgebraicGeometry.points.map
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the points functor defined for arbitrary \\(k\\)-algebras \\(R\\), not only \\(R = k\\)?"
  verdict: "Yes. \\(R\\) is any commutative \\(k\\)-algebra; the \\(k\\)-points are the special case \\(R = k\\)."
tags:
- functor-of-points
- definition
- linear-algebraic-groups
---

# Functor of Points of a Group Scheme

Let \(k\) be a field and \(G\) an
[[node:affine_group_schemes.affine_group_scheme_definition|affine group scheme]]
over \(\operatorname{Spec} k\). For any commutative \(k\)-algebra \(R\),
the **\(R\)-points of \(G\)** are

\[
G(R) \;=\; \operatorname{Hom}_{\operatorname{Spec} k}(\operatorname{Spec} R,\, G),
\]

the set of morphisms of schemes \(\operatorname{Spec} R \to G\) commuting
with the structure morphisms to \(\operatorname{Spec} k\). Equivalently,
\(G(R)\) is the hom-set in the slice category \(\mathsf{Over}(\operatorname{Spec} k)\)
from the canonical \(\operatorname{Spec} R\)-object (whose structure
morphism is induced by the algebra map \(k \to R\)) to the canonical
\(G\)-object.

The assignment \(R \mapsto G(R)\) is a functor from commutative
\(k\)-algebras to sets. For \(G\) a group scheme, the functor lands in
groups; see
[[node:affine_group_schemes.points_form_group|$G(R)$ is a group]].

In the project's Lean development \(\texttt{specOver}\,k\,R\) is
\(\operatorname{Spec} R\) packaged as an \(\mathsf{Over}(\operatorname{Spec} k)\)
object, and \(\texttt{points}\,k\,G\,R\) is the hom set above. The
declaration is an \(\texttt{abbrev}\) so that the group instance below
unfolds automatically.
