---
id: conjugacy_classes.weighted_dynkin_diagrams
title: Weighted Dynkin Diagrams
kind: topic
status: admitted
primary_topic: conjugacy_classes
topics:
- conjugacy_classes
uses:
- conjugacy_classes.nilpotent_orbits
- root_data_and_duality.root_systems
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Are weighted Dynkin diagrams treated as a type-independent invariant of
    nilpotent orbits across all simple Lie types?
  verdict: Yes. The labels in {0,1,2} on simple-root vertices give a uniform invariant;
    the constraints differ by type but the construction is general.
tags:
- weighted-dynkin-diagrams
- nilpotent-orbits
---
# Weighted Dynkin Diagrams

A **weighted Dynkin diagram** is a labelling of the simple roots of a
reductive Lie algebra by weights in \(\{0, 1, 2\}\), serving as the
canonical combinatorial invariant of a nilpotent orbit (or more
precisely, of an \(\mathfrak{sl}_2\)-triple) up to \(G\)-conjugacy.

## Construction

Let \(\mathfrak{g}\) be a complex semisimple Lie algebra (or reductive
over a field of good characteristic) with fixed Cartan subalgebra
\(\mathfrak{h}\) and simple roots \(\Delta = \{\alpha_1, \dots, \alpha_r\}\).
Given a nonzero nilpotent \(X \in \mathfrak{g}\), the **Jacobson–Morozov
theorem** produces an \(\mathfrak{sl}_2\)-triple \((X, H, Y)\) with
\(H \in \mathfrak{g}\) semisimple.

\(H\) can be \(G\)-conjugated into the **dominant chamber** of
\(\mathfrak{h}\). The **weighted Dynkin diagram** of \(X\) is the
labelling
\[
\alpha_i \;\longmapsto\; d_i := \alpha_i(H) \in \{0, 1, 2\}.
\]

**Theorem (Dynkin, Kostant).** The map
\[
\{\text{nilpotent } G\text{-orbits in } \mathfrak{g}\} \;\longrightarrow\;
\{\text{weighted Dynkin diagrams on } \Delta\}
\]
is **injective**, with image characterised by combinatorial conditions
on each Dynkin type. In particular, weighted Dynkin diagrams classify
nilpotent orbits.

## Why the weights are in \{0, 1, 2\}

For an \(\mathfrak{sl}_2\)-triple \((X, H, Y)\) inside a complex
semisimple Lie algebra, all eigenvalues of \(\operatorname{ad}(H)\) on
\(\mathfrak{g}\) are integers (\(\mathfrak{sl}_2\)-representation
theory). The fact that the simple-root values are in \(\{0, 1, 2\}\)
specifically uses that the dominant representative of \(H\) acts on
the simple-root spaces \(\mathfrak{g}_{\alpha_i}\) by an eigenvalue
\(\alpha_i(H) \ge 0\), and the height-grading bound for nilpotent
elements gives the upper bound \(2\).

## Distinguished orbits

A weighted Dynkin diagram with all weights in \(\{0, 2\}\)
corresponds to a **distinguished** nilpotent orbit (an orbit whose
stabiliser \(Z_G(X)^\circ\) is unipotent).

**Theorem (Bala-Carter).** Every nilpotent orbit \(\mathcal{O}\) in
\(\mathfrak{g}\) is induced from a distinguished orbit in a Levi
subalgebra \(\mathfrak{l}\). The weighted Dynkin diagram of
\(\mathcal{O}\) restricts on \(\mathfrak{l}\) to the (\(\{0,2\}\))
diagram of the distinguished orbit, and is zero on simple roots
outside \(\mathfrak{l}\).

This reduces the classification to listing distinguished orbits in
each Levi.

## Examples

### \(\mathfrak{sl}_3\) (type \(A_2\))

Three nilpotent orbits:

| Orbit | Partition | Weighted Dynkin |
|---|---|---|
| \(\{0\}\) | \((1, 1, 1)\) | \(0 - 0\) |
| subregular | \((2, 1)\) | \(1 - 1\) |
| principal | \((3)\) | \(2 - 2\) |

### \(G_2\)

Five nilpotent orbits with weighted Dynkin diagrams
\(0 - 0\), \(0 - 1\), \(1 - 0\), \(0 - 2\), \(2 - 2\) (labels on
short root then long root).

The diagram \(0 - 1\) corresponds to the **minimal** nilpotent orbit;
\(2 - 2\) is the **principal**.

## The Dynkin-Kostant labelling vs. Bala-Carter

Both are bijections from nilpotent orbits to combinatorial data, but
the encodings differ:

- **Dynkin-Kostant** = weighted diagram on the full Dynkin diagram of
  \(\mathfrak{g}\).
- **Bala-Carter** = pair (Levi Dynkin subdiagram, distinguished orbit
  in that Levi).

A Bala-Carter label of the form "Levi type, distinguished decoration"
(e.g.\ \(A_2 + A_1\), \(D_4(a_1)\), \(E_6(a_3)\)) corresponds to a
unique weighted Dynkin diagram and vice versa.

## Role for Langlands

- **Arthur parameters** include an \(\mathfrak{sl}_2\)-factor in
  \(\hat G \times W_F \times \mathrm{SL}_2(\mathbb{C})\), whose
  associated nilpotent orbit determines the **Arthur SL_2** type;
  weighted Dynkin diagrams are the natural labels.
- **Endoscopic transfer** of nilpotent orbits is described in terms of
  weighted Dynkin diagrams.

## References

- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993), Ch. 3.
- Carter, *Finite Groups of Lie Type* (1985), §5.7.
- Bala-Carter, *Classes of unipotent elements in simple algebraic
  groups* (Math. Proc. Camb. Phil. Soc. 1976).

## Prerequisite Topics

- [[node:conjugacy_classes.nilpotent_orbits|Nilpotent Orbits]]
- [[node:root_data_and_duality.root_systems|Root Systems]]
