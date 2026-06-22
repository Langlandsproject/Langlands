---
id: linear_algebraic_groups.additive_group_scheme
title: Additive Group Scheme 𝔾_a
kind: definition
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.algebraic_group_definition
- linear_algebraic_groups.basic_examples
- linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Examples.Ga
  declarations:
    - Polynomial.gaComul
    - Polynomial.gaCounit
    - Polynomial.gaAntipode
    - Polynomial.instBialgebra
    - Polynomial.instHopfAlgebra
    - Langlands.AlgebraicGeometry.Examples.additiveGroup
    - Langlands.AlgebraicGeometry.Examples.additiveGroup.instGrpObj
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the construction stated over an arbitrary base scheme \\(S\\)?"
  verdict: "Yes. The construction is functorial in \\(S\\); a fixed base ring is a special case obtained by setting \\(S = \\operatorname{Spec} R\\)."
tags:
- example
- definition
- additive-group
- linear-algebraic-groups
---

# Additive Group Scheme \(\mathbb{G}_a\)

Let \(S\) be a scheme. The **additive group scheme over \(S\)**, denoted
\(\mathbb{G}_{a,S}\), is defined by base change from the integers:

\[
\mathbb{G}_{a,S} \;=\; S \,\times_{\operatorname{Spec} \mathbb{Z}}\, \operatorname{Spec} \mathbb{Z}[T].
\]

Its coordinate Hopf algebra over the base is the polynomial ring in one
variable \(T\), with the **additive Hopf structure**:

\[
\Delta(T) = T \otimes 1 + 1 \otimes T, \qquad
\varepsilon(T) = 0, \qquad
S(T) = -T.
\]

The structure morphism \(\mathbb{G}_{a,S} \to S\) is the first projection
of the fiber product; it is affine (Spec of a polynomial ring is affine
relative to the base) and locally of finite type (a polynomial ring in
one variable is finitely generated).

Hence \(\mathbb{G}_{a,S}\) is an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(S\) (or, in characteristic \(0\), a smooth one-dimensional
algebraic group). Its functor of points is identified by
[[node:linear_algebraic_groups.additive_group_scheme_points|the additive points formula]].
