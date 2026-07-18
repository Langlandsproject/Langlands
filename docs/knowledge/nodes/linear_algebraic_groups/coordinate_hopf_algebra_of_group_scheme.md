---
id: linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
title: Coordinate Hopf Algebra of an Affine Group Scheme
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.affine_group_scheme_definition
- linear_algebraic_groups.coordinate_rings_and_hopf_algebras
- foundational_inputs.hopf_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the construction stated for affine group schemes over an arbitrary base ring \\(R\\)?"
  verdict: "Yes. \\(R\\) is any commutative ring; specialization to a field is left to consumers."
tags:
- coordinate-ring
- hopf-algebra
- definition
- linear-algebraic-groups
---

# Coordinate Hopf Algebra of an Affine Group Scheme

Let \(R\) be a commutative ring and let \(G\) be an
[[node:linear_algebraic_groups.affine_group_scheme_definition|affine group scheme]]
over \(\operatorname{Spec} R\), with structure morphism \(\pi : G \to
\operatorname{Spec} R\). Since \(\pi\) is affine, the direct image
\(\pi_* \mathcal{O}_G\) is a quasi-coherent sheaf of \(R\)-algebras on
\(\operatorname{Spec} R\), corresponding to the \(R\)-algebra of global
sections

\[
\mathcal{O}(G) \;=\; \Gamma(G,\, \mathcal{O}_G).
\]

The group object structure on \(G\) — multiplication \(m : G \times_R G \to
G\), identity \(e : \operatorname{Spec} R \to G\), and inverse \(i : G \to
G\) — pulls back to \(R\)-algebra morphisms

\[
\Delta : \mathcal{O}(G) \to \mathcal{O}(G) \otimes_R \mathcal{O}(G), \qquad
\varepsilon : \mathcal{O}(G) \to R, \qquad
S : \mathcal{O}(G) \to \mathcal{O}(G),
\]

called **comultiplication**, **counit**, and **antipode** respectively.
These maps make \(\mathcal{O}(G)\) into a commutative Hopf algebra over
\(R\); the Hopf algebra axioms (coassociativity, counit, and antipode
identities) are dual to the group object axioms (associativity, unit,
and inverse) on \(G\).

The assignment \(G \mapsto \mathcal{O}(G)\) is contravariantly
functorial: a morphism of affine group schemes \(G \to G'\) over
\(\operatorname{Spec} R\) induces a morphism of Hopf \(R\)-algebras
\(\mathcal{O}(G') \to \mathcal{O}(G)\) in the opposite direction.

In the project's Lean development, the existence of
\(\mathcal{O}(G)\) is recorded via the global-sections functor
\(\Gamma\); the Hopf structure side is handled by
[[node:linear_algebraic_groups.hopf_spec_functor|the Spec functor on Hopf algebras]],
which is the inverse functor.
