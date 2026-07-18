---
id: affine_group_schemes.trivial_representation_example
title: Trivial Representation as a Comodule
kind: example
status: admitted
primary_topic: affine_group_schemes
topics:
  - affine_group_schemes
uses:
  - affine_group_schemes.comodule_definition
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Comodule
  declarations:
  - Langlands.AlgebraicGeometry.trivialCoaction_apply
    - Langlands.AlgebraicGeometry.trivialCoaction
    - Langlands.AlgebraicGeometry.trivialComodule
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Does the trivial comodule construction require a Hopf algebra?"
  verdict: 'No. A bialgebra is enough: the coaction uses the group-like element \(1\), and the axioms use \(\Delta(1)=1\otimes 1\) and \(\varepsilon(1)=1\).'
tags:
  - example
  - representation
  - comodule
  - linear-algebraic-groups
---

# Trivial Representation as a Comodule

Let \(R\) be a commutative semiring, let \(A\) be a bialgebra over \(R\),
and let \(V\) be an \(R\)-module. The **trivial \(A\)-comodule** on \(V\)
has coaction

\[
\rho(v) = v \otimes 1.
\]

This satisfies the axioms of
[[node:affine_group_schemes.comodule_definition|an \(A\)-comodule]]:
coassociativity follows from
\[
\Delta(1)=1\otimes 1,
\]
and the counit axiom follows from \(\varepsilon(1)=1\).

When \(A = \mathcal{O}(G)\) is the coordinate Hopf algebra of an affine
group scheme \(G\), this comodule corresponds to the representation on
which every \(R\)-point of \(G\) acts by the identity on \(V\).
