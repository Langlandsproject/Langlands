---
id: conjugacy_classes.unipotent_orbits
title: Unipotent Orbits
kind: definition
status: admitted
primary_topic: conjugacy_classes
topics:
- conjugacy_classes
uses:
- conjugacy_classes.unipotent_elements
- conjugacy_classes.jordan_decomposition
- conjugacy_classes.nilpotent_orbits
- reductive_structure.reductive_groups
source:
  spans:
  - artifact: collingwood-mcgovern-nilpotent-orbits
    locator: "Chapter 3"
    format: chapter
    note: "Unipotent classes in semisimple groups; Bala-Carter classification on the group side."
  - artifact: springer-linear-algebraic-groups
    locator: "Section 3.7"
    format: section
    note: "Unipotent conjugacy classes and their number in each type."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the classification of unipotent orbits parallel the classification of nilpotent orbits, and does it work in good characteristic?"
  verdict: "Yes. For G connected reductive over an algebraically closed field, the G-conjugacy classes in the unipotent variety U are called unipotent orbits (or unipotent classes). In characteristic 0, they biject with nilpotent orbits via exp (or the Springer isomorphism). In good characteristic p, the classification still follows the same combinatorial recipe (Bala-Carter, weighted Dynkin diagrams), with minor modifications for bad primes."
tags:
- unipotent-orbits
- conjugacy
- bala-carter
- weighted-dynkin-diagrams
---

# Unipotent Orbits

## Definition

Let \(G\) be a connected reductive group over an algebraically closed field
\(k\). The **unipotent orbits** of \(G\) are the orbits of \(G\) acting on
the unipotent variety \(\mathcal{U}\) by conjugation:
\[
g \cdot u = g u g^{-1}, \quad g \in G(k),\; u \in \mathcal{U}(k).
\]

There are **finitely many** unipotent orbits; their number depends only on the
root datum (root system) of \(G\).

## Classification

The unipotent orbits of \(G\) are classified by the same combinatorial data
as nilpotent orbits in \(\mathrm{Lie}(G)\):

| Method | Description |
|---|---|
| **Bala-Carter** | Distinguished parabolic subgroups \(P\) with Levi \(L\); pairs \((L, \mathcal{O}_L^{\mathrm{reg}})\) |
| **Weighted Dynkin diagrams** | Labellings of the Dynkin diagram by \(\{0, 1, 2\}\) |
| **Partitions** (type A) | Partitions of \(n\) parametrise unipotent orbits of \(\mathrm{GL}_n\) |
| **Partitions** (types B,C,D) | B-partitions / D-partitions for \(\mathrm{SO}_n\), \(\mathrm{Sp}_{2n}\) |

## The regular and subregular orbits

- **Regular orbit**: The unique dense orbit; consists of elements \(u \in \mathcal{U}\)
  with \(\dim C_G(u) = \mathrm{rank}(G)\). Exists in all characteristics.
- **Subregular orbit**: The second largest orbit (by closure order);
  its closure is \(\overline{\mathcal{O}_{\mathrm{sub}}} = \mathcal{U} \setminus \mathcal{O}_{\mathrm{reg}}\).
- **Trivial orbit**: The single-point orbit \(\{1\}\).

## Closure ordering

The set of unipotent orbits carries the **closure order**: \(\mathcal{O}_1 \le \mathcal{O}_2\)
if \(\mathcal{O}_1 \subseteq \overline{\mathcal{O}_2}\). This gives a partial
order whose Hasse diagram is the same as for nilpotent orbits.

## Correspondence with nilpotent orbits

In characteristic \(0\) (or good characteristic \(p\) via the Springer isomorphism),
the identification \(\mathcal{U} \cong \mathcal{N}\) is \(G\)-equivariant, giving
a bijection:
\[
\{\text{unipotent orbits in }G\} \xleftrightarrow{\;\sim\;}
\{\text{nilpotent orbits in }\mathrm{Lie}(G)\}.
\]
