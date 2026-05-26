---
id: descent_and_forms.vogan_diagrams
title: Vogan Diagrams
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.real_forms
- root_data_and_duality.root_data
- root_data_and_duality.galois_action_on_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Vogan diagrams treated uniformly across all real reductive groups, both simply-laced and non-simply-laced?"
  verdict: "Yes. Vogan diagrams are Dynkin diagrams decorated with compact/non-compact markings and an optional diagram automorphism; the construction applies to all real forms of simple Lie algebras."
tags:
- vogan-diagrams
- descent-and-forms
---

# Vogan Diagrams

A **Vogan diagram** is a Dynkin diagram with two additional decorations
encoding a real form: vertices coloured "compact" or "non-compact,"
and an optional diagram automorphism. Vogan diagrams classify real
forms of complex semisimple Lie algebras combinatorially.

## Definition

A **Vogan diagram** of a simple Lie algebra of type \(X_n\) is a
Dynkin diagram of type \(X_n\) together with:

1. A choice of base \(\Delta\) (simple roots);
2. A 2-colouring of \(\Delta\): each \(\alpha \in \Delta\) marked
   **white** (compact) or **black** (non-compact);
3. Optionally: a diagram automorphism \(\sigma\) compatible with the
   colouring.

Constraints:
- If \(\sigma = \mathrm{id}\) (trivial diagram automorphism): the
  Vogan diagram corresponds to an **inner real form**.
- If \(\sigma \ne \mathrm{id}\): the Vogan diagram corresponds to an
  **outer real form**.

## From Vogan diagram to real form

A Vogan diagram determines a real form \(G_\mathbb{R}\) of the complex
form \(G_\mathbb{C}\) of type \(X_n\) via the **Cartan involution**:

- \(\theta\) acts on the Cartan as \(\sigma\) (diagram automorphism);
- For each simple root \(\alpha\):
  - White: \(\theta\) is trivial on \(\mathfrak{g}_\alpha\) (compact
    direction);
  - Black: \(\theta\) is \(-1\) on \(\mathfrak{g}_\alpha\) (non-compact
    direction).

The fixed points of \(\theta\) give the Cartan involution / maximal
compact subgroup of \(G_\mathbb{R}\).

## Equivalence classes

Two Vogan diagrams give the same real form iff they differ by a
sequence of **Cayley transforms** through non-compact simple roots.

For each Dynkin type, there is a standard "normal form" Vogan diagram
for each real form; classification is done by tabulating these.

## Examples

### \(\mathfrak{sl}_n\) (type \(A_{n-1}\))

| Vogan diagram | Real form |
|---|---|
| all white, \(\sigma = \mathrm{id}\) | \(\mathfrak{su}(n)\) (compact) |
| all black, \(\sigma = \mathrm{id}\) | \(\mathfrak{sl}_n(\mathbb{R})\) (split) |
| pattern of black/white | \(\mathfrak{su}(p, q)\) (mixed signature) |
| with \(\sigma\) = reverse | \(\mathfrak{sl}_n(\mathbb{H})\) (\(n\) even) |

### \(\mathfrak{so}_{2n+1}\) (type \(B_n\))

\(\mathrm{Out} = 1\), so only inner real forms:
- \(\mathfrak{so}(2n+1)\) (compact, all white);
- \(\mathfrak{so}(p, q)\) with \(p + q = 2n+1\) (mixed black/white).

### \(\mathfrak{e}_8\)

Three real forms: compact \(\mathfrak{e}_{8(-248)}\), split
\(\mathfrak{e}_{8(8)}\), and the intermediate \(\mathfrak{e}_{8(-24)}\).
Vogan diagrams: respectively all white, all black, and a specific
colouring of 8 nodes.

## Borel-de Siebenthal theorem

**Theorem (Borel-de Siebenthal).** Real forms of a complex simple Lie
algebra \(\mathfrak{g}_\mathbb{C}\) of type \(X_n\) are classified by:

- Vogan diagrams modulo equivalence (Cayley transforms);
- Equivalently, conjugacy classes of order-2 elements in
  \(\mathrm{Aut}(\mathfrak{g}_\mathbb{C})\).

The conjugacy classes of involutions are computable via **extended
Dynkin diagrams** (Kac labels): for each node of the extended Dynkin
diagram, there is a corresponding involution.

## Real-form invariants

From a Vogan diagram \((X_n, \text{colouring}, \sigma)\) one can read:

- **Compact rank** = number of white vertices + dim of automorphism
  fixed space (for outer forms).
- **Non-compact rank** = number of black vertices.
- **Signature of the Killing form** = (compact dim) - (non-compact
  dim).

## Role in Langlands

- **Real Langlands**: Vogan diagrams give the input for the
  ABV / Vogan parametrisation of L-packets.
- **Discrete series**: existence of discrete series for a real form
  is read off from the Vogan diagram (compact-modulo-centre maximal
  torus condition).
- **Cohomological induction**: Vogan-Zuckerman cohomological
  induction is parametrised by sub-diagrams of the Vogan diagram.

## References

- Vogan, *Representations of Real Reductive Lie Groups* (1981), §6.
- Knapp, *Lie Groups Beyond an Introduction* (2002), Ch. VI.
- Onishchik–Vinberg, *Lie Groups and Algebraic Groups* (1990).
- Adams–Barbasch–Vogan (1992), §3.

## Prerequisite Topics

- [[node:descent_and_forms.real_forms|Real Forms]]
- [[node:root_data_and_duality.root_data|Root Data]]
- [[node:root_data_and_duality.galois_action_on_root_data|Galois Action on Root Data]]
