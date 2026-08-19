---
id: affine_group_schemes.points_form_group
title: R-Points of a Group Scheme Form a Group
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.points_functor_definition
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Points
  declarations:
    - Langlands.AlgebraicGeometry.points.instGroup
    - Langlands.AlgebraicGeometry.points.map_is_group_hom
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the statement at the right level: arbitrary \\(R\\), arbitrary group scheme, abstract group structure?"
  verdict: "Yes. The result is the categorical consequence of \\(G\\) being a group object; \\(R\\) and \\(G\\) are unconstrained beyond the standing assumptions."
tags:
- functor-of-points
- theorem
- linear-algebraic-groups
---

# R-Points of a Group Scheme Form a Group

Let \(k\) be a field, \(G\) an affine group scheme over
\(\operatorname{Spec} k\), and \(R\) a commutative \(k\)-algebra. Then
the set of \(R\)-points
[[node:affine_group_schemes.points_functor_definition|$G(R)$]]
carries a canonical group structure, with multiplication, identity, and
inverse defined pointwise from the group object structure of \(G\) in
\(\mathsf{Over}(\operatorname{Spec} k)\).

Furthermore, for any \(k\)-algebra homomorphism \(f : R \to R'\), the
induced map \(G(R) \to G(R')\) (sending a \(\operatorname{Spec} k\)-morphism
\(\operatorname{Spec} R \to G\) to its precomposition with
\(\operatorname{Spec}(f) : \operatorname{Spec} R' \to \operatorname{Spec} R\))
is a group homomorphism.

*Proof.*  
The category \(\mathsf{Over}(\operatorname{Spec} k)\) is Cartesian
monoidal (it has all binary products and a terminal object), so for any
group object \(G\) in it and any object \(X\), the hom set
\(\operatorname{Hom}(X, G)\) inherits a group structure: multiplication
is the composition
\(\operatorname{Hom}(X, G) \times \operatorname{Hom}(X, G) \to \operatorname{Hom}(X, G \times G) \to \operatorname{Hom}(X, G)\)
where the second arrow is induced by the multiplication \(G \times G \to G\).
The identity element is the constant map at \(e : 1 \to G\), and the
inverse is post-composition with \(i : G \to G\). The group axioms on
\(\operatorname{Hom}(X, G)\) follow from the group object axioms on
\(G\). Taking \(X = \operatorname{Spec} R\) (canonically over
\(\operatorname{Spec} k\) via the algebra map) gives the group structure
on \(G(R)\). Functoriality in \(R\) reduces to compatibility of
composition with the group operations, which is automatic.  
\(\square\)
