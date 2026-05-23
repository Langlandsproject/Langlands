---
id: linear_algebraic_groups.regular_representation_example
title: Regular Representation as a Comodule
kind: example
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.comodule_definition
- linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Comodule
  declarations:
    - Langlands.AlgebraicGeometry.regularComodule
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the example stated over an arbitrary base field?"
  verdict: "Yes. The construction works over any commutative base ring; only the field case is used by the embedding argument."
tags:
- example
- representation
- comodule
- linear-algebraic-groups
---

# Regular Representation as a Comodule

Let \(R\) be a commutative ring and \(A\) a Hopf \(R\)-algebra with
comultiplication \(\Delta : A \to A \otimes_R A\) and counit
\(\varepsilon : A \to R\). The pair
\((A, \Delta)\) is an
[[node:linear_algebraic_groups.comodule_definition|$A$-comodule]]: the
coaction is \(\Delta\) itself.

Coassociativity follows from the coassociativity axiom of \(\Delta\);
the counit axiom follows from the counit axiom of \(A\) as a coalgebra.

This is called the **regular representation** (or **regular comodule**)
of \(A\). Geometrically, if \(A = \mathcal{O}(G)\) is the coordinate Hopf
algebra of an
[[node:linear_algebraic_groups.affine_group_scheme_definition|affine group scheme]]
\(G\), the regular representation corresponds to the action of \(G\) on
its own coordinate ring by right translation. The regular representation
is generally infinite-dimensional; finding finite-dimensional sub-comodules
inside it is the subject of
[[node:linear_algebraic_groups.finite_dim_subcomodule_lemma|the finite generation lemma]].
