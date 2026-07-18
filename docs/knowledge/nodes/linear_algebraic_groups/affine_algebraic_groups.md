---
id: linear_algebraic_groups.affine_algebraic_groups
title: Affine Algebraic Groups
kind: topic
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- linear_algebraic_groups.coordinate_rings_and_hopf_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is this stated for affine group schemes over a base scheme, not just over a field?"
  verdict: "Yes. The constructions and theorems are stated over an arbitrary base; the field case is the special case `S = Spec k`."
tags:
- affine-algebraic-groups
- linear-algebraic-groups
---

# Affine Algebraic Groups

An **affine algebraic group over a scheme \(S\)** is an
[[node:linear_algebraic_groups.affine_group_scheme_definition|affine group scheme]]
\(G/S\) whose structure morphism \(G \to S\) is locally of finite type.
The Path-4 + Level-1 typeclass form recorded by this project is

```
(G : Scheme) [G.Over S]
  [GrpObj (Scheme.asOver G S)]
  [IsAffineHom (G ↘ S)]
  [LocallyOfFiniteType (G ↘ S)]
```

which the aggregator
[[node:linear_algebraic_groups.algebraic_group_definition|`IsAlgebraicGroup`]]
packages as a single typeclass.

## Why "affine"

The word **affine** records that the structure morphism is an affine
morphism: locally on \(S\), \(G\) is the spectrum of a (commutative)
\(\mathcal{O}_S\)-algebra. Equivalently, the global-sections sheaf
\(\Gamma(G, \mathcal{O}_G)\) determines \(G\) entirely (see
[[node:linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme|the
coordinate Hopf algebra]]).

## Why "algebraic"

The condition **locally of finite type** is the right finiteness
hypothesis for the theory:

- It excludes pathological group schemes like the formal group
  \(\operatorname{Spf} R[[T]]\) (not locally of finite type) and
  pro-objects assembled from infinitely many factors.
- It includes all classical examples
  ([[node:linear_algebraic_groups.basic_examples|basic examples]]):
  \(\mathbb{G}_a\), \(\mathbb{G}_m\), \(\mu_n\),
  \(\operatorname{GL}_n\), \(\operatorname{SL}_n\), tori, finite étale
  group schemes.
- It is preserved by closed subgroup schemes, fibre products, and
  quotients by closed normal subgroups (when these exist as schemes).

## Coordinate-ring equivalence

Over a base ring \(R\) (i.e. \(S = \operatorname{Spec} R\)), an affine
algebraic group \(G/S\) is the same data as a finitely-generated
commutative \(R\)-Hopf algebra
\(A = \Gamma(G, \mathcal{O}_G)\). The
[[node:linear_algebraic_groups.hopf_spec_functor|`hopfSpec` functor]]
implements one direction; the
[[node:linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme|coordinate
Hopf algebra]] construction implements the other; together they assemble
the equivalence
[[node:linear_algebraic_groups.hopf_spec_essential_image_affine|stated
on the essential image]].

## Canonical structure theorems

The subject is organised around the following structural results, each
of which has a dedicated node in this DAG once it enters the
formalisation roadmap:

1. **Embedding into \(\operatorname{GL}_n\).** Every affine algebraic
   group over a field embeds as a closed subgroup of some
   \(\operatorname{GL}_n\)
   ([[node:linear_algebraic_groups.embedding_theorem|embedding theorem]]).
2. **Representations as comodules.** \(G\)-representations on a
   \(k\)-vector space \(V\) correspond to
   \(A\)-comodule structures on \(V\)
   ([[node:linear_algebraic_groups.representation_equals_comodule|representation
   equals comodule]]).
3. **Faithful representations exist** (over a field): the
   [[node:linear_algebraic_groups.faithful_linear_representation_definition|regular
   representation]] of \(G\) on \(A\) restricts to a faithful
   finite-dimensional sub-representation
   ([[node:linear_algebraic_groups.affine_finite_type_faithful_representation|finite-type
   faithful representation]]).
4. **Smoothness vs étaleness.** In characteristic zero every algebraic
   group is smooth; in positive characteristic this fails (e.g.
   \(\mu_p\), \(\alpha_p\) are non-smooth).

## Prerequisite Topics

- [[node:linear_algebraic_groups.coordinate_rings_and_hopf_algebras|Coordinate Rings and Hopf Algebras]]
