---
id: linear_algebraic_groups.affine_finite_type_faithful_representation
title: Affine Finite Type Groups Have Faithful Finite-Dimensional Representations
kind: theorem
status: needs_statement_review
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.linear_algebraic_group_definition
- linear_algebraic_groups.coordinate_rings_and_hopf_algebras
- linear_algebraic_groups.morphisms_and_closed_subgroups
verification:
  statement: needs_revision
  proof: gap
generality:
  reviewed: true
  prompt: "Is the theorem stated in the intended scheme-theoretic generality?"
  verdict: "Mostly. The statement is written for affine finite type group schemes over a field; hypotheses can later be specialized to smooth or reduced groups if a reference requires that convention."
tags:
- linear-algebraic-groups
- faithful-representations
- closed-subgroups
- general-linear-group
---

# Affine Finite Type Groups Have Faithful Finite-Dimensional Representations

## Statement

Let $k$ be a field and let $G$ be an affine group scheme of finite type over $k$.
Then there exists a finite-dimensional $k$-vector space $V$ and a faithful
representation

$$
\rho:G\to \operatorname{GL}(V)
$$

such that $\rho$ is a closed immersion of group schemes.

Equivalently, every linear algebraic group over $k$ is isomorphic to a closed subgroup
scheme of $\operatorname{GL}(V)$ for some finite-dimensional $k$-vector space $V$.

If $\operatorname{dim}_k V=n$, this can be written as a closed subgroup scheme

$$
G\to \operatorname{GL}_n
$$

as a closed immersion.

## Idea

The phrase affine finite type means exactly enough to produce a finite-dimensional
faithful representation.

Affineness gives a coordinate ring:

$$
G=\operatorname{Spec} A,\qquad A=k[G].
$$

Finite type says that $A$ is a finitely generated $k$-algebra. The group structure says
that $A$ is a Hopf algebra, with comultiplication

$$
\Delta:A\to A\otimes_k A.
$$

The comultiplication encodes translation of functions on $G$. If

$$
\Delta(f)=\sum_i f_i\otimes a_i,
$$

then the right translates of $f$ lie in the finite-dimensional span of the finitely
many $f_i$.

Thus the regular representation of $G$ on $k[G]$ is locally finite: every regular
function lies in a finite-dimensional $G$-stable subspace.

## Proof Sketch

Choose algebra generators

$$
f_1,\ldots,f_r\in A
$$

for the finitely generated $k$-algebra $A$.

For each generator $f_j$, local finiteness gives a finite-dimensional
$G$-stable subspace

$$
V_j\subseteq A
$$

containing $f_j$.

Let

$$
V=V_1+\ldots+V_r.
$$

Then $V$ is finite-dimensional, $G$-stable, and the elements of $V$ generate $A$ as a
$k$-algebra.

The action of $G$ on $V$ gives a representation

$$
\rho:G\to \operatorname{GL}(V).
$$

Because the matrix coefficients coming from this representation generate the whole
coordinate ring $A=k[G]$, the induced map on coordinate rings

$$
k[\operatorname{GL}(V)]\to k[G]
$$

is surjective. For affine schemes, surjectivity on coordinate rings is equivalent to
being a closed immersion. Therefore $\rho$ realizes $G$ as a closed subgroup scheme of
$\operatorname{GL}(V)$.

## Corollary

Every linear algebraic group over $k$ is a closed subgroup scheme of some general
linear group:

$$
G\subseteq \operatorname{GL}(V)
$$

for a finite-dimensional $k$-vector space $V$.

After choosing a basis of $V$, this becomes

$$
G\subseteq \operatorname{GL}_n.
$$

This is the reason the modern intrinsic definition

$$
\text{linear algebraic group}
=
\text{affine finite type group scheme over } k
$$

matches the classical extrinsic definition as a closed subgroup of a matrix group.

## Conceptual Summary

- Affineness lets us use the coordinate Hopf algebra $k[G]$.
- Finite type gives finitely many algebra generators.
- The Hopf algebra comultiplication makes the regular representation locally finite.
- The generators sit inside a finite-dimensional stable subspace.
- That stable subspace gives a finite-dimensional representation.
- Since the corresponding matrix coefficients generate $k[G]$, the representation is
  faithful and gives a closed immersion into $\operatorname{GL}(V)$.

## Related Nodes

- [[node:linear_algebraic_groups.linear_algebraic_group_definition|Definition of Linear Algebraic Groups]]
- [[node:linear_algebraic_groups.coordinate_rings_and_hopf_algebras|Coordinate Rings and Hopf Algebras]]
- [[node:linear_algebraic_groups.morphisms_and_closed_subgroups|Morphisms and Closed Subgroups]]
