---
id: reductive_structure.unipotent_groups
title: Unipotent Groups
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- linear_algebraic_groups.linear_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are unipotent groups treated for arbitrary affine algebraic groups over arbitrary fields, with the abelian/non-abelian distinction and characteristic-p subtleties?"
  verdict: "Yes. The definition is via unipotent matrices in any faithful representation (Kolchin), independent of the field; the char p complications are flagged via Witt groups and the exponential failure."
tags:
- unipotent-groups
- reductive-structure
---

# Unipotent Groups

A **unipotent group** is a connected affine algebraic group whose
elements act unipotently in every (equivalently, some) faithful linear
representation. Unipotent groups are the "complementary" half of the
structure theory: every connected linear algebraic group is an
extension of a reductive group by its unipotent radical.

## Definition

Let \(U\) be a connected affine algebraic group over a field \(k\).
The following are equivalent:

- For every faithful representation \(U \hookrightarrow \mathrm{GL}_n\),
  every element of \(U(\bar k)\) is **unipotent** (\(I - g\) is
  nilpotent).
- There exists a closed embedding \(U \hookrightarrow \mathbb{U}_n\)
  into the strict upper-triangular subgroup of \(\mathrm{GL}_n\) for
  some \(n\).
- The Lie algebra \(\operatorname{Lie}(U)\) consists of nilpotent
  endomorphisms (in any faithful representation).

In characteristic \(0\), the exponential gives an iso of varieties
\(\exp : \operatorname{Lie}(U) \xrightarrow{\sim} U\); in characteristic
\(p\) this fails (Witt vectors enter).

## Examples

| Group | Description |
|---|---|
| \(\mathbb{G}_a\) | Additive group, smallest unipotent. |
| \(\mathbb{U}_n\) | Strict upper-triangular \(n \times n\) matrices. |
| Heisenberg \(H_3\) | \(3 \times 3\) upper-unitriangular; non-commutative. |
| Witt vectors \(W_n\) | Char \(p\) phenomenon; not isomorphic to \(\mathbb{G}_a^n\). |

In char \(0\), every connected unipotent group is geometrically
isomorphic to an affine space \(\mathbb{A}^n\) as a variety, but with
a non-trivial group structure when non-commutative.

## Kolchin's theorem

**Theorem (Kolchin).** Let \(V\) be a finite-dimensional vector space
over an algebraically closed field \(k\), and let \(G \subseteq \mathrm{GL}(V)\)
be a connected algebraic subgroup consisting entirely of unipotent
elements. Then \(G\) stabilises a complete flag in \(V\) — i.e.\
\(G \subseteq \mathbb{U}_n\) for some basis.

In particular: every connected unipotent group is a closed subgroup of
\(\mathbb{U}_n\) for some \(n\), and hence **nilpotent** as an abstract
group.

## Structure of commutative unipotent groups

For a commutative unipotent group \(U\) over a perfect field \(k\):

- **Char \(0\)**: \(U \cong \mathbb{G}_a^n\) (as algebraic groups).
- **Char \(p\)**: \(U\) admits a finite filtration whose successive
  quotients are subgroups of \(\mathbb{G}_a\) or of the Witt vector
  groups \(W_n\). The classification involves the Dieudonné module of
  \(U\).

A commutative unipotent group is **\(p\)-torsion** in characteristic
\(p\); in characteristic \(0\) it is torsion-free and divisible.

## Non-commutative unipotent groups

Examples: the Heisenberg group, the upper-triangular unitary group
\(\mathbb{U}_n\), and the unipotent radicals of all proper parabolic
subgroups of reductive groups. The composition factors of any
unipotent group are isomorphic to \(\mathbb{G}_a\) (char \(0\)) or
subgroups of \(\mathbb{G}_a\) (char \(p\)).

## Role in reductive structure

For any connected affine algebraic group \(H\) over \(\bar k\):

- The **unipotent radical** \(R_u(H)\) is the largest connected
  unipotent normal subgroup.
- \(H / R_u(H)\) is **reductive**.
- For \(H\) reductive, \(R_u(H) = 1\) — this is the definition.
- For \(H\) a parabolic subgroup of a reductive \(G\): \(R_u(H)\) is
  the "unipotent radical of the parabolic," and the Levi \(H / R_u(H)\)
  is reductive.

## Role in representation theory

- **Whittaker models.** Generic characters of the unipotent radical
  of a Borel give Whittaker functionals on \(G(F)\)-representations.
- **Bernstein-Zelevinsky.** Derivatives along unipotent radicals of
  parabolics are core invariants of \(\mathrm{GL}_n\)-representations.
- **Nilpotent orbits.** \(\operatorname{Lie}(U)\) for the unipotent
  radical of a parabolic captures nilpotent orbits via the
  Bala-Carter classification.

## Mathlib

Not yet formalised. Examples like \(\mathbb{G}_a\) exist via the
project's [[node:linear_algebraic_groups.basic_examples|basic examples]] node.

## Prerequisite Topics

- [[node:linear_algebraic_groups.linear_algebraic_groups|Linear Algebraic Groups]]
