---
id: linear_algebraic_groups.linear_algebraic_groups
title: Linear Algebraic Groups
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- affine_group_schemes.affine_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the topic stated at the modern scheme-theoretic level over a general base, not specialised to fields?"
  verdict: "Yes. The topic treats affine group schemes over an arbitrary base ring or scheme; the classical field case is the special case `S = Spec k`."
tags:
- linear-algebraic-groups
---

# Linear Algebraic Groups

A **linear algebraic group over a base scheme \(S\)** is, in the modern
sense (Milne, SGA 3), an
[[node:affine_group_schemes.affine_group_scheme_definition|affine group scheme]]
that is locally of finite type over \(S\). Equivalently, a closed
subgroup scheme of some \(\operatorname{GL}_{n,S}\) (see
[[node:linear_algebraic_groups.embedding_theorem|the embedding theorem]]).

When \(S = \operatorname{Spec} k\) for a field \(k\), this recovers the
classical theory of linear algebraic groups over \(k\); when \(S\) is
arbitrary, base change and descent considerations enter.

## Scope of this topic

The `linear_algebraic_groups` topic collects the foundational
infrastructure used throughout the Langlands roadmap:

1. **Definitions and structure.**
   [[node:affine_group_schemes.affine_group_scheme_definition|Affine group scheme]] +
   [[node:affine_group_schemes.algebraic_group_definition|locally of finite type]];
   the Path-4 + Level-1 idiom records this via
   `(G : Scheme) [G.Over S] [GrpObj (Scheme.asOver G S)]` plus
   `[IsAffineHom (G ↘ S)]` and `[LocallyOfFiniteType (G ↘ S)]`.

2. **Coordinate-ring duality.**
   [[node:affine_group_schemes.coordinate_rings_and_hopf_algebras|Coordinate rings and Hopf algebras]]
   establishes that affine group schemes over \(S\) correspond to
   commutative Hopf algebras over \(\Gamma(S, \mathcal{O}_S)\); the
   functor implementing this is
   [[node:affine_group_schemes.hopf_spec_functor|`hopfSpec`]].

3. **Canonical examples.**
   [[node:linear_algebraic_groups.basic_examples|Basic examples]] —
   \(\mathbb{G}_a\), \(\mathbb{G}_m\), \(\mu_n\), \(\operatorname{GL}_n\),
   \(\operatorname{SL}_n\), tori, finite étale group schemes — provide
   the building blocks for everything that follows.

4. **Categorical structure.**
   [[node:linear_algebraic_groups.morphisms_and_closed_subgroups|Morphisms and closed subgroups]],
   [[node:linear_algebraic_groups.kernels_images_and_quotients|kernels and quotients]],
   [[node:affine_group_schemes.base_change|base change]],
   [[node:linear_algebraic_groups.automorphism_groups|automorphism groups]].

5. **Geometric properties.**
   [[node:linear_algebraic_groups.connected_components|Connected components]],
   [[node:linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras|smoothness, tangent spaces, and Lie algebras]].

6. **Representation theory.**
   [[node:affine_group_schemes.representation_equals_comodule|representations as comodules]],
   [[node:affine_group_schemes.faithful_linear_representation_definition|faithful linear representations]],
   the embedding into \(\operatorname{GL}_n\).

## Position in the Langlands roadmap

This topic supplies the foundational layer beneath
[[node:reductive_structure.borel_subgroups|reductive structure]] (root data,
parabolics, Borel subgroups),
[[node:descent_and_forms.forms_of_algebraic_groups|descent and forms]] (inner/outer forms,
quasi-split groups), and
[[node:buildings_and_parahorics.bn_pairs_and_tits_systems|buildings and parahorics]] (the
local-field theory). Every later topic assumes the affine group-scheme
infrastructure recorded here.

## References

- Milne, *Algebraic Groups* (CUP, 2017).
- Waterhouse, *Introduction to Affine Group Schemes* (GTM 66, 1979).
- SGA 3 (Demazure–Grothendieck), *Schémas en Groupes*.
- Jantzen, *Representations of Algebraic Groups* (AMS, 2003).

## Prerequisite Topics

- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
