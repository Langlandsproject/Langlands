---
id: reductive_structure.solvable_groups
title: Solvable Groups
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.unipotent_groups
- linear_algebraic_groups.connected_components
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are solvable algebraic groups treated uniformly over arbitrary fields, with the connected and the non-connected cases both addressed?"
  verdict: "Yes. The Lie-Kolchin theorem, the structure of connected solvable groups as semidirect products of a torus and a unipotent radical, and the role over non-algebraically-closed fields are all standard and uniform."
tags:
- solvable-groups
- reductive-structure
---

# Solvable Groups

A connected **solvable** algebraic group is one with a finite
descending series of normal closed subgroups whose successive
quotients are commutative. Borel subgroups (= maximal connected
solvable subgroups) sit at the heart of reductive group theory.

## Definition

A linear algebraic group \(H\) is **solvable** if there is a chain of
closed subgroups
\[
H = H_0 \;\supseteq\; H_1 \;\supseteq\; \cdots \;\supseteq\; H_n = 1
\]
with each \(H_{i+1}\) normal in \(H_i\) and each quotient \(H_i / H_{i+1}\)
commutative.

Equivalently, the **derived series** \(H, [H, H], [[H, H], [H, H]], \dots\)
terminates at \(1\).

## Lie–Kolchin theorem

**Theorem (Lie–Kolchin).** Let \(G\) be a connected solvable
algebraic group over an algebraically closed field \(k\) acting
linearly on a finite-dimensional vector space \(V\). Then there is a
basis of \(V\) in which \(G\) acts by **upper-triangular matrices**.

Equivalently: every connected solvable subgroup of \(\mathrm{GL}_n\)
is conjugate to a subgroup of the upper-triangular Borel.

## Structure of connected solvable groups

For a connected solvable algebraic group \(B\) over an algebraically
closed field \(k\):

\[
B \;=\; T \ltimes U,
\]

where:
- \(U = R_u(B)\) is the **unipotent radical** (a connected unipotent
  normal subgroup);
- \(T\) is a **maximal torus** of \(B\) (any two are \(U\)-conjugate);
- The product is semidirect.

This is the prototype of the general Levi decomposition.

## Examples

### The standard Borel of \(\mathrm{GL}_n\)

The upper-triangular subgroup \(B \subseteq \mathrm{GL}_n\):
\[
T = \text{diagonal}, \qquad U = \text{strict upper-triangular},
\]
\[
B \;=\; T \ltimes U.
\]

\(B\) is the prototypical connected solvable group.

### Tori

Every torus is commutative, hence solvable. The unipotent radical of a
torus is trivial.

### \(\mathbb{G}_a \rtimes \mathbb{G}_m\)

The "\(ax + b\)" group: \(\mathbb{G}_m\) acts on \(\mathbb{G}_a\) by
multiplication. Connected, solvable, non-abelian, with maximal torus
\(\mathbb{G}_m\) and unipotent radical \(\mathbb{G}_a\).

## Borel subgroups

In a connected reductive group \(G\), a **Borel subgroup** is a
maximal connected solvable subgroup. All Borel subgroups are conjugate
over \(\bar k\); their fixed-point variety \(G/B\) is the **flag
variety**, projective and smooth.

The Borel structure (Lie–Kolchin in disguise) is the geometric source
of the entire Bruhat decomposition and root datum theory of \(G\).

## Solvable groups over non-algebraically-closed fields

Over a general field \(k\), a connected solvable group may not have a
maximal torus defined over \(k\); the obstruction is measured by
\(H^1(k, T)\). For \(k\) a local or global field, this is governed by
Galois cohomology and class field theory.

Examples:
- **Norm one tori** \(R^{(1)}_{K/k}\mathbb{G}_m\) are connected
  solvable (in fact commutative) but not split unless \(K = k\).
- Inner forms of Borel subgroups appear in the study of stable
  conjugacy and endoscopy.

## Role in reductive structure and Langlands

- **Borel subgroups** as maximal connected solvable subgroups define
  the **flag variety** \(G/B\) and the geometric setup of the Bruhat
  decomposition.
- **Parabolic subgroups** are exactly those containing a Borel,
  generalising the solvable case.
- **Eisenstein series** are constructed from solvable parabolics in
  the Langlands–Eisenstein theory; the constant term along a Borel
  recovers the Whittaker function and the Casselman–Shalika formula.

## References

- Borel, *Linear Algebraic Groups* (1991), §10.
- Springer, *Linear Algebraic Groups* (1998), §6.
- Humphreys, *Linear Algebraic Groups* (1975), §17.

## Prerequisite Topics

- [[node:reductive_structure.unipotent_groups|Unipotent Groups]]
- [[node:linear_algebraic_groups.connected_components|Connected Components]]
