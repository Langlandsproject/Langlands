---
id: foundational_inputs.basic_combinatorics
title: Basic Combinatorics
kind: topic
status: admitted
primary_topic: foundational_inputs
topics:
- foundational_inputs
uses: []
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is this scope limited to combinatorial objects that actually appear in the Langlands roadmap, rather than the entirety of combinatorics?"
  verdict: "Yes. The focus is on root systems, Weyl groups, partitions, and Young diagrams — the combinatorial backbones of reductive group theory."
tags:
- external-background
- combinatorics
- foundational-inputs
---

# Basic Combinatorics

Several pieces of elementary combinatorics underpin the structure
theory of reductive groups and the classification of their
representations. This topic collects what is needed without
duplicating Mathlib's `Combinatorics.*` directory.

## Finite sets, multisets, sequences

- Cardinality, bijections, finite group actions on finite sets.
- Multisets and partitions of integers.
- Sequences and tuples; the symmetric group \(S_n\) acting on
  \([n]\)-indexed structures.

## Partitions and Young diagrams

A **partition** of \(n\) is a non-increasing sequence
\(\lambda = (\lambda_1, \lambda_2, \dots)\) of non-negative integers
summing to \(n\). Pictorially: a **Young diagram** with \(\lambda_i\)
boxes in row \(i\).

Partitions parametrise:

- conjugacy classes of \(S_n\) (cycle types);
- irreducible representations of \(S_n\) (Specht modules);
- nilpotent conjugacy classes of \(\mathfrak{gl}_n\) (and via Jordan
  blocks, of \(\operatorname{GL}_n\));
- via the Bala–Carter labels, nilpotent classes in exceptional Lie
  algebras (see
  [[node:nilpotent_orbits.bala_carter_classification|Bala–Carter
  classification]]).

## Coxeter groups and Bruhat order

A **Coxeter group** is a group presented by reflection-type generators
satisfying braid relations:

\[
W \;=\; \langle s_1, \dots, s_n \mid (s_i s_j)^{m_{ij}} = 1 \rangle.
\]

For a Coxeter system \((W, S)\):

- **Length function** \(\ell : W \to \mathbb{N}\) (minimal word length
  in generators);
- **Bruhat order**: \(u \le v\) iff a reduced word for \(u\) is a
  subword of some reduced word for \(v\);
- **Weak orders** (left and right);
- **Exchange and deletion properties**.

The Weyl group of a reductive group is naturally a Coxeter group, and
the Bruhat decomposition of \(G\) is indexed by \(W\).

## Posets and lattices

The character lattice \(X^*(T)\) and cocharacter lattice \(X_*(T)\) of
a torus \(T\) are free abelian groups; under the perfect pairing
\(X^*(T) \otimes X_*(T) \to \mathbb{Z}\), they are dual as
\(\mathbb{Z}\)-modules. The pair carries combinatorial structure
(coroots, dominant weights, fundamental Weyl chamber).

## Graphs and Dynkin diagrams

A **Dynkin diagram** is a finite graph (with extra edge data: simple,
double, triple, or directed) encoding a Cartan matrix. The classification
\(A_n, B_n, C_n, D_n, E_6, E_7, E_8, F_4, G_2\) is one of the most
celebrated combinatorial results in mathematics; see
[[node:root_data_and_duality.based_root_data|based root data]].

## Mathlib formalisation

- `Mathlib.Combinatorics.*` — General combinatorics.
- `Mathlib.GroupTheory.Coxeter.*` — Coxeter groups.
- `Mathlib.Combinatorics.Young.*` — Young diagrams.

## References

- Stanley, *Enumerative Combinatorics* (vols. 1–2).
- Humphreys, *Reflection Groups and Coxeter Groups* (CUP, 1990).
- Björner–Brenti, *Combinatorics of Coxeter Groups* (Springer GTM 231,
  2005).
