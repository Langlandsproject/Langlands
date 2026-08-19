---
id: affine_group_schemes.algebraic_group_definition
title: Algebraic Group over a Base
kind: definition
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.affine_group_scheme_definition
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
  declarations:
  - Langlands.AlgebraicGeometry.instIsAlgebraicGroup
  - Langlands.AlgebraicGeometry.IsAlgebraicGroup
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Does the definition follow the modern Milne / SGA 3 convention without smoothness?"
  verdict: "Yes. Smoothness is intentionally not part of the definition; \\(\\mu_n\\) and \\(\\alpha_p\\) in characteristic \\(p\\) are algebraic groups but not smooth, and we want to admit them as instances."
tags:
- algebraic-group
- definition
- linear-algebraic-groups
---

# Algebraic Group over a Base

Let \(S\) be a scheme. An **algebraic group over \(S\)** is an
[[node:affine_group_schemes.affine_group_scheme_definition|affine group scheme]]
\(G\) over \(S\) whose structure morphism \(G \to S\) is locally of finite
type.

Following the modern convention (Milne, *Algebraic Groups*; SGA 3), we do
**not** require \(G\) to be smooth over \(S\). Smoothness is a separate
hypothesis added where the theory needs it (for example, to identify the
identity component or to make a Lie-algebra argument work). Important
non-smooth examples include \(\mu_n\) and \(\alpha_p\) over a field of
characteristic \(p\).

In the project's Lean development this is the typeclass aggregator
\(\texttt{IsAlgebraicGroup}\,G\,S\), which extends
\(\texttt{IsAffineGroupScheme}\,G\,S\) and
\(\texttt{LocallyOfFiniteType}\,(G \downarrow S)\). When the base \(S\) is
the spectrum of a field, the term *linear algebraic group* is also used
(Milne / Borel / Humphreys / Springer).
