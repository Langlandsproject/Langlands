---
id: affine_group_schemes.affine_group_scheme_definition
title: Affine Group Scheme over a Base
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- affine_group_schemes.affine_algebraic_groups
- foundational_inputs.affine_schemes
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
  declarations:
  - Langlands.AlgebraicGeometry.instIsAffineGroupScheme
    - Langlands.AlgebraicGeometry.IsAffineGroupScheme
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is this definition stated for an arbitrary base scheme \\(S\\)?"
  verdict: "Yes. The base \\(S\\) is an arbitrary scheme; specialization to \\(S = \\operatorname{Spec} k\\) or \\(S = \\operatorname{Spec} O_F\\) is left to consumers."
tags:
- affine-group-scheme
- definition
- linear-algebraic-groups
---

# Affine Group Scheme over a Base

Let \(S\) be a scheme. An **affine group scheme over \(S\)** is a scheme \(G\)
together with:

1. a structure morphism \(G \to S\), making \(G\) an object of the slice
   category \(\mathsf{Over}(S)\);
2. a group object structure on \(G\) in \(\mathsf{Over}(S)\), supplied by
   morphisms

\[
m : G \times_S G \to G, \qquad
e : S \to G, \qquad
i : G \to G,
\]

   subject to the standard associativity, unit, and inverse axioms for
   group objects in a cartesian category;
3. an affineness assumption: the structure morphism \(G \to S\) is affine
   (the preimage of any affine open of \(S\) is an affine scheme).

In the project's Lean development this is the typeclass aggregator
\(\texttt{IsAffineGroupScheme}\,G\,S\), which extends
\(\texttt{GrpObj}(\operatorname{asOver}\,G\,S)\) and
\(\texttt{IsAffineHom}\,(G \downarrow S)\). No smoothness or finite-type
assumption is imposed; those are added separately via additional typeclasses
when the theory requires them.
