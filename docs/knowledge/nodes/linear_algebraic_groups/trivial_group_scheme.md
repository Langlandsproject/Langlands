---
id: linear_algebraic_groups.trivial_group_scheme
title: Trivial Group Scheme over a Base
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.algebraic_group_definition
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Examples.Trivial
  declarations:
    - Langlands.AlgebraicGeometry.schemeOverSelf
    - Langlands.AlgebraicGeometry.trivialGrpObj
verification:
  definition: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the trivial group scheme defined over an arbitrary base \\(S\\)?"
  verdict: "Yes. The construction is functorial in \\(S\\) and does not depend on \\(S\\) being affine, of finite type, or over a field."
tags:
- example
- definition
- linear-algebraic-groups
---

# Trivial Group Scheme over a Base

For any scheme \(S\), the **trivial group scheme over \(S\)**, denoted
\(\mathbf{1}_S\), is \(S\) itself, regarded as an object of
\(\mathsf{Over}(S)\) via the identity structure morphism
\(\operatorname{id}_S : S \to S\), equipped with the unique group object
structure: multiplication, identity, and inverse are all the identity
morphism of \(S\) (after suitable identifications via the unit
isomorphism of the Cartesian monoidal structure on \(\mathsf{Over}(S)\)).

Equivalently, \(\mathbf{1}_S\) is the unit object of the Cartesian
monoidal category \(\mathsf{Over}(S)\), which automatically carries a
trivial group object structure.

The trivial group scheme is an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(S\): the identity morphism is both affine and locally of finite
type.

In the project's Lean development, the underlying
\(\texttt{Scheme.Over}\) instance is
\(\texttt{schemeOverSelf}\,S\), and the group object structure is
\(\texttt{trivialGrpObj}\,S\), transported from the unit of
\(\mathsf{Over}(S)\) via \(\texttt{inferInstanceAs}\). The
\(\texttt{IsAlgebraicGroup}\,S\,S\) instance is then synthesized
automatically.
