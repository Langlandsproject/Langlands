---
id: reductive_groups.borel_subgroups
title: Borel Subgroups
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
uses:
- tori.algebraic_tori
- reductive_groups.solvable_groups
- linear_algebraic_groups.connected_components
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Borel subgroups defined over an arbitrary base, distinguishing the split (defined-over-k) case from the geometric (defined-over-k-bar) case?"
  verdict: "Yes. The geometric Borel exists over the separable closure; a k-rational Borel exists iff G is quasi-split."
tags:
- borel-subgroups
- reductive-structure
---

# Borel Subgroups

A **Borel subgroup** of a connected reductive (or more generally,
connected smooth affine) algebraic group \(G\) is a **maximal connected
solvable closed subgroup**. Borel subgroups are the foundational
building block for the structure theory of reductive groups.

## Definition

A closed subgroup \(B \subseteq G\) is a Borel subgroup if:

1. \(B\) is connected.
2. \(B\) is solvable.
3. \(B\) is maximal among connected solvable closed subgroups.

Equivalently (over an algebraically closed field), \(B\) is a Borel
iff the quotient \(G/B\) is a complete (projective) variety. The
**flag variety** \(G/B\) is the home of much of the geometric
representation theory of \(G\).

## Borel's fixed-point theorem

**Theorem (Borel).** Every connected solvable algebraic group acting
on a complete variety has a fixed point.

Consequence: any two Borel subgroups of \(G\) are conjugate (over an
algebraically closed field). The Borel subgroups form a single
conjugacy class.

## Borel subgroup of \(\operatorname{GL}_n\)

The standard Borel \(B \subseteq \operatorname{GL}_n\) is the subgroup
of **upper-triangular invertible matrices**. It has dimension
\(\binom{n+1}{2}\) and the structure

\[
B \;\cong\; T \ltimes U,
\]

where \(T\) is the diagonal torus and \(U\) is the unipotent radical
(strictly upper-triangular matrices, an iterated extension of
\(\mathbb{G}_a\)'s).

The flag variety \(\operatorname{GL}_n / B\) is the variety of
**complete flags** \(0 \subset V_1 \subset V_2 \subset \dots \subset V_n = k^n\)
with \(\dim V_i = i\), of dimension \(\binom{n}{2}\).

## Borel pairs and maximal tori

A **Borel pair** is a pair \((B, T)\) where \(B\) is a Borel subgroup
and \(T \subseteq B\) is a maximal torus. Every Borel subgroup contains
a maximal torus (a result of Chevalley); the Borel pairs are all
conjugate under \(G(\bar{k})\).

A Borel pair determines:

- a **basis** of the root system (the simple roots are the characters
  of \(T\) appearing in \(\operatorname{Lie}(B/T)\)),
- a **positive system** of roots (those appearing in \(\operatorname{Lie}(B)\)),
- a **based root datum** (see
  [[node:root_data.based_root_data|based root data]]).

## Bruhat decomposition

For a connected reductive group \(G\) with Borel \(B\), maximal torus
\(T \subseteq B\), and Weyl group \(W = N_G(T)/T\):

\[
G \;=\; \bigsqcup_{w \in W} B w B
\]

as a disjoint union of double cosets. This is the **Bruhat
decomposition**; the cells \(BwB\) are locally closed subvarieties of
\(G\), and the closure relations are governed by the **Bruhat order**
on \(W\).

## Parabolic subgroups

A **parabolic subgroup** of \(G\) is a closed subgroup containing some
Borel. Equivalently, a closed subgroup \(P\) such that \(G/P\) is a
complete variety. For \(G\) split, parabolics containing a fixed Borel
\(B\) are in bijection with subsets of the simple roots.

For \(\operatorname{GL}_n\), parabolic subgroups are **stabilisers of
partial flags**.

## \(k\)-rational vs.\ geometric Borel subgroups

Over a non-algebraically closed field \(k\):

- The set of Borel subgroups of \(G_{\bar{k}}\) carries a Galois
  action.
- \(G\) is **quasi-split** iff there is a Galois-fixed (equivalently,
  \(k\)-rational) Borel subgroup.
- The classification of forms via
  [[node:forms.forms_of_algebraic_groups|Galois cohomology]]
  is closely tied to the existence and conjugacy of \(k\)-Borels.

## Prerequisite Topics

- [[node:tori.algebraic_tori|Algebraic Tori]]
- [[node:reductive_groups.solvable_groups|Solvable Groups]]
- [[node:linear_algebraic_groups.connected_components|Connected Components]]
