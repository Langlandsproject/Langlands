---
id: linear_algebraic_groups.linear_algebraic_group_definition
title: Definition of Linear Algebraic Groups
kind: definition
status: needs_definition_review
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- foundations.fields_and_field_extensions
- foundations.affine_schemes
- foundations.hopf_algebras
- affine_group_schemes.coordinate_rings_and_hopf_algebras
verification:
  definition: needs_revision
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition stated in a scheme-theoretic form broad enough for later reductive group theory?"
  verdict: "Yes. The main definition is affine finite type group scheme over a field, with optional smoothness separated as a convention rather than built in."
tags:
- linear-algebraic-groups
- affine-group-schemes
- definitions
---

# Definition of Linear Algebraic Groups

## Setup

Let $k$ be a field. Write $\operatorname{Sch}_{/k}$ for schemes over
$\operatorname{Spec} k$, and write $\operatorname{AffSch}_{/k}$ for affine schemes over
$\operatorname{Spec} k$.

A group object in $\operatorname{Sch}_{/k}$ is a $k$-scheme $G$ equipped with morphisms

$$
m:G\times_k G\to G,\qquad
e:\operatorname{Spec} k\to G,\qquad
i:G\to G
$$

satisfying the associativity, identity, and inverse diagrams.

## Definition

A linear algebraic group over $k$ is an affine group scheme of finite type over $k$.
Equivalently, it is a group object $G$ in $\operatorname{Sch}_{/k}$ such that the
structure morphism

$$
G\to \operatorname{Spec} k
$$

is affine and of finite type.

Equivalently, it is a group object in $\operatorname{AffSch}_{/k}$ whose coordinate
ring is a finitely generated $k$-algebra.

## Coordinate Ring Form

If $G=\operatorname{Spec} A$ is affine, then the group structure on $G$ is the same as
a commutative Hopf $k$-algebra structure on $A=k[G]$:

$$
\Delta:A\to A\otimes_k A,\qquad
\epsilon:A\to k,\qquad
S:A\to A.
$$

Here:

- $\Delta$ is dual to multiplication $m:G\times_k G\to G$;
- $\epsilon$ is dual to the identity section $e:\operatorname{Spec}k\to G$;
- $S$ is dual to inversion $i:G\to G$.

Thus a linear algebraic group over $k$ is equivalently the spectrum of a finitely
generated commutative Hopf $k$-algebra.

## Relation With Classical Language

When $k$ is algebraically closed and one works only with reduced objects, this agrees
with the classical language of affine algebraic groups: affine algebraic varieties
with regular multiplication and inverse maps.

The scheme-theoretic definition is slightly broader. In positive characteristic it
allows nonreduced examples, such as infinitesimal group schemes. If a text intends
only smooth groups, smoothness should be added as a separate hypothesis:

$$
G\to \operatorname{Spec} k \text{ is smooth.}
$$

## Nonexamples

Not every group object over $\operatorname{Spec} k$ is linear algebraic. For example,
an elliptic curve over $k$ is a group scheme of finite type over $k$, but it is proper
rather than affine, so it is not a linear algebraic group.

This is why the word affine is essential in the definition.

## Examples

- The additive group $\mathbb{G}_a=\operatorname{Spec} k[x]$.
- The multiplicative group $\mathbb{G}_m=\operatorname{Spec} k[x,x^{-1}]$.
- The general linear group $\operatorname{GL}_n$.
- The special linear group $\operatorname{SL}_n$.
- Any closed subgroup scheme of $\operatorname{GL}_n$.

## Lean Formalization Comment

In Lean/mathlib terms, the natural package for this definition is:

```lean
G : Over (Spec (.of k))
[CategoryTheory.GrpObj G]
[AlgebraicGeometry.IsAffineHom G.hom]
[AlgebraicGeometry.LocallyOfFiniteType G.hom]
```

Smoothness should be an additional typeclass assumption when the intended convention
requires smooth algebraic groups.

## Related Nodes

- [[node:affine_group_schemes.coordinate_rings_and_hopf_algebras|Coordinate Rings and Hopf Algebras]]
- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
- [[node:linear_algebraic_groups.morphisms_and_closed_subgroups|Morphisms and Closed Subgroups]]
