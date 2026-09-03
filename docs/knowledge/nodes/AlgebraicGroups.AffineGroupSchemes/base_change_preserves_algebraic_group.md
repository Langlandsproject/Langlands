---
id: affine_group_schemes.base_change_preserves_algebraic_group
title: Base Change Preserves Algebraic Group Structure
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.algebraic_group_definition
- affine_group_schemes.base_change
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Examples.Trivial
  declarations:
    - Langlands.AlgebraicGeometry.isAlgebraicGroup_pullback
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the statement formulated for arbitrary base change morphisms \\(f : T \\to S\\)?"
  verdict: "Yes. No assumption on \\(f\\) beyond being a morphism of schemes; the proof composes pullback-stability lemmas for each constituent property."
tags:
- base-change
- theorem
- linear-algebraic-groups
---

# Base Change Preserves Algebraic Group Structure

Let \(f : T \to S\) be a morphism of schemes, and let \(G\) be an
[[node:affine_group_schemes.algebraic_group_definition|algebraic group]]
over \(S\). Then the pullback scheme

\[
G_T \;=\; G \times_S T
\]

is an algebraic group over \(T\), with structure morphism the
second projection \(G_T \to T\) and group object structure obtained by
base change of the group object structure on \(G\).

*Proof.*  
We verify the three constituents of
[[node:affine_group_schemes.algebraic_group_definition|the algebraic group definition]]
in turn.

*Group object structure.* The base-change functor
\(\mathsf{Over}(S) \to \mathsf{Over}(T)\) along \(f\) preserves binary
products and the terminal object (it is a right adjoint to the
post-composition functor), hence sends group objects to group objects.
Concretely, the multiplication, identity, and inverse morphisms of \(G\)
in \(\mathsf{Over}(S)\) pull back to morphisms of \(G_T\) in
\(\mathsf{Over}(T)\) satisfying the same axioms. In the Lean
development this is encoded by Mathlib's
\(\texttt{Scheme.GrpObjAsOverPullback}\).

*Affineness.* The class of affine morphisms is stable under arbitrary
base change. Hence \(G_T \to T\), being the pullback of the affine
morphism \(G \to S\) along \(f\), is affine.

*Locally of finite type.* This class is also stable under arbitrary
base change.

Combining the three, \(G_T\) is an algebraic group over \(T\). In Lean
the conclusion is \(\texttt{isAlgebraicGroup\_pullback}\), which
combines the three preservation lemmas through the Phase A2 aggregator
forwarder.  
\(\square\)
