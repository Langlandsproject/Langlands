---
id: root_data.cartan_matrices_and_dynkin_diagrams
title: Cartan Matrices and Dynkin Diagrams
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.root_systems
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Cartan matrices and Dynkin diagrams treated abstractly as combinatorial data classifying root systems?"
  verdict: "Yes. Both are intrinsic to a root system and a choice of base; the diagrammatic classification (A, B, C, D, E_6, E_7, E_8, F_4, G_2) is type-independent."
tags:
- cartan-matrices
- dynkin-diagrams
- root-data-and-duality
---

# Cartan Matrices and Dynkin Diagrams

The **Cartan matrix** and **Dynkin diagram** are combinatorial
distillations of a root system: the matrix encodes pairwise root
relations as integers, and the diagram is its pictorial encoding.
Together they classify finite-type root systems and, with them, the
simple algebraic groups.

## Cartan matrix

Let \(\Phi\) be a root system with base \(\Delta = \{\alpha_1, \ldots, \alpha_r\}\).
The **Cartan matrix** is
\[
C \;=\; (c_{ij})_{1 \le i, j \le r}, \qquad c_{ij} \;=\; \langle \alpha_i, \alpha_j^\vee \rangle.
\]

Equivalently: \(c_{ij}\) is the integer such that the reflection
\(s_j\) acts on \(\alpha_i\) by \(s_j(\alpha_i) = \alpha_i - c_{ij} \alpha_j\).

Properties:

- \(c_{ii} = 2\) for all \(i\);
- \(c_{ij} \in \{0, -1, -2, -3\}\) for \(i \ne j\);
- \(c_{ij} = 0 \iff c_{ji} = 0\) (orthogonality is symmetric);
- The matrix \((c_{ij} + c_{ji})\) is positive-definite (the
  positive-definite property of \(\Phi\)).

## Dynkin diagram

The **Dynkin diagram** is a finite graph encoding the Cartan matrix:

- One vertex per simple root \(\alpha_i\).
- Between distinct \(\alpha_i, \alpha_j\): edges encoded by
  \(c_{ij} \cdot c_{ji} \in \{0, 1, 2, 3\}\):
  - 0: no edge,
  - 1: single edge,
  - 2: double edge,
  - 3: triple edge.
- Arrow on multi-edges: pointing from the longer root to the shorter
  (in standard normalisation \((\alpha_i, \alpha_i) \ge (\alpha_j, \alpha_j)\)).

A Dynkin diagram is **connected** iff the root system is irreducible
(equivalently, the corresponding Lie algebra/simple group is simple).

## Classification

**Theorem (Killing, Cartan, Dynkin).** The connected Dynkin diagrams
of finite-type irreducible root systems are exactly:

| Type | Diagram | Rank |
|---|---|---|
| \(A_n\) | line of \(n\) vertices, all single | \(n \ge 1\) |
| \(B_n\) | line, double edge at one end pointing in | \(n \ge 2\) |
| \(C_n\) | line, double edge at one end pointing out | \(n \ge 3\) |
| \(D_n\) | "Y-shape": line with a forked end | \(n \ge 4\) |
| \(E_6, E_7, E_8\) | "T-shape": three legs of varying lengths | 6, 7, 8 |
| \(F_4\) | line of 4 with double edge in middle | 4 |
| \(G_2\) | two vertices, triple edge | 2 |

## Examples

### Type \(A_2\) (corresponding to \(\mathrm{SL}_3\))

Cartan matrix:
\[
C \;=\; \begin{pmatrix} 2 & -1 \\ -1 & 2 \end{pmatrix}.
\]
Diagram: two vertices joined by a single edge \(\bullet - \bullet\).

### Type \(B_2 = C_2\) (\(\mathrm{Sp}_4 = \mathrm{Spin}_5\))

Cartan matrices:
\[
B_2: \begin{pmatrix} 2 & -1 \\ -2 & 2 \end{pmatrix}, \qquad
C_2: \begin{pmatrix} 2 & -2 \\ -1 & 2 \end{pmatrix}.
\]
Diagram: two vertices, double edge \(\bullet = \bullet\) with arrow
direction encoding short/long roots.

### Type \(G_2\)

Cartan matrix:
\[
C \;=\; \begin{pmatrix} 2 & -1 \\ -3 & 2 \end{pmatrix}.
\]
Diagram: two vertices, triple edge \(\bullet \equiv \bullet\).

### Type \(E_8\)

Cartan matrix is \(8 \times 8\); diagram is a "T"-shape:
\(\bullet - \bullet - \bullet - \bullet - \bullet - \bullet - \bullet\)
with one extra vertex attached to the third from one end.

## Duality on diagrams

The **dual diagram** swaps:

- \(B_n \leftrightarrow C_n\) (arrow reversal in the diagram);
- \(F_4\) is self-dual under arrow reversal (sends \(F_4\) to itself
  via the central symmetry).

All other types are self-dual under root-system duality (the arrow
reversal is trivial since there are no double edges, or coincides
with the type).

The Langlands dual group corresponds to this swap on the dual side.

## Connection to Coxeter diagrams

A **Coxeter diagram** records only the orders of the products of
simple reflections:
\[
m_{ij} \;=\; \mathrm{ord}(s_i s_j) \in \{2, 3, 4, 6\}.
\]

The Dynkin diagram has more information than the Coxeter diagram: it
distinguishes \(B_n\) from \(C_n\) (same Coxeter, different Dynkin).

## Reflection groups and finite-type Coxeter groups

The Coxeter group of a Dynkin diagram is a **finite reflection
group**, classified by:

\[
A_n, \quad B_n = C_n \text{ (same Coxeter)}, \quad D_n, \quad E_6, E_7, E_8, F_4, G_2,
\]

plus non-crystallographic types \(H_3, H_4, I_2(p)\) that are not
realised by root systems with integral Cartan matrix.

## Mathlib

`Mathlib.LinearAlgebra.RootSystem.IsCrystallographic` and related
modules formalise the Dynkin-classification side; the diagram
classification (which combinations of A, B, C, D, E, F, G can occur)
is partly there.

## References

- Bourbaki, *Groupes et Algèbres de Lie* IV–VI (1968).
- Humphreys, *Introduction to Lie Algebras and Representation Theory*
  (1972), §3, §11.
- Carter, *Finite Groups of Lie Type* (1985), §1.
- Serre, *Complex Semisimple Lie Algebras* (1987).

## Prerequisite Topics

- [[node:root_data.root_systems|Root Systems]]
