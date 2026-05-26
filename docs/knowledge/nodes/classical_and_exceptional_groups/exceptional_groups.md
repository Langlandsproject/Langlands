---
id: classical_and_exceptional_groups.exceptional_groups
title: Exceptional Groups
kind: topic
status: admitted
primary_topic: classical_and_exceptional_groups
topics:
- classical_and_exceptional_groups
uses:
- root_data_and_duality.root_systems
- root_data_and_duality.cartan_matrices_and_dynkin_diagrams
- root_data_and_duality.classification_of_split_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are exceptional groups treated as simple algebraic groups over arbitrary fields, including their real and p-adic forms?"
  verdict: "Yes. Each Dynkin type (G_2, F_4, E_6, E_7, E_8) gives a simply connected and adjoint algebraic group defined over any base; non-split real and p-adic forms are classified by Galois cohomology with Vogan/Tits diagrams."
tags:
- exceptional-groups
- classical-and-exceptional-groups
---

# Exceptional Groups

The **exceptional simple algebraic groups** are the five families
\(G_2, F_4, E_6, E_7, E_8\) — the simple groups not arising from
classical bilinear forms. They are the most rigid objects in the
classification and reveal the deepest structure of the Langlands
programme.

## The five Dynkin types

| Type | Rank | Dim | Order of Weyl group | Special features |
|---|---|---|---|---|
| \(G_2\) | 2 | 14 | 12 | Octonion automorphisms; smallest exceptional |
| \(F_4\) | 4 | 52 | 1152 | Automorphisms of \(\mathfrak{e}_6\); both root lengths |
| \(E_6\) | 6 | 78 | 51840 | Diagram has \(\mathbb{Z}/2\) outer automorphism |
| \(E_7\) | 7 | 133 | 2903040 | Centre \(\mathbb{Z}/2\); contains \(E_6 \times \mathrm{GL}_1\) |
| \(E_8\) | 8 | 248 | 696729600 | Simply connected = adjoint; largest exceptional |

## Concrete constructions

- **\(G_2\)**: Automorphism group of the **octonion algebra**
  \(\mathbb{O}\). Equivalently, the stabiliser of a generic
  \(3\)-form on \(\mathbb{R}^7\). Compact form acts transitively on
  \(S^6\).
- **\(F_4\)**: Automorphism group of the **exceptional Jordan
  algebra** \(H_3(\mathbb{O})\) (\(3 \times 3\) Hermitian octonion
  matrices, 27-dimensional).
- **\(E_6\)**: Reduced norm automorphism group of \(H_3(\mathbb{O})\);
  acts on the **Cayley plane** \(\mathbb{OP}^2 = E_6/P\) of dim 16.
- **\(E_7\)**: Acts on the **Freudenthal magic square** at position
  \((4, 3)\); related to symmetries of \(H_3(\mathbb{O})\) at the
  level of Jordan triples.
- **\(E_8\)**: \(248\)-dimensional Lie algebra; the smallest faithful
  representation is the adjoint. \(E_8\) lattice is the unique
  even unimodular lattice in dimension \(8\).

## Centres and fundamental groups

| Type | \(Z\) (sc) | \(\pi_1\) (adj) | self-dual? |
|---|---|---|---|
| \(G_2\) | \(1\) | \(1\) | Yes (Langlands self-dual) |
| \(F_4\) | \(1\) | \(1\) | Yes |
| \(E_6\) | \(\mathbb{Z}/3\) | \(\mathbb{Z}/3\) | No: \(E_6^{\mathrm{sc}}\) ↔ \(E_6^{\mathrm{ad}}\) under duality |
| \(E_7\) | \(\mathbb{Z}/2\) | \(\mathbb{Z}/2\) | No: \(E_7^{\mathrm{sc}}\) ↔ \(E_7^{\mathrm{ad}}\) |
| \(E_8\) | \(1\) | \(1\) | Yes (sc = adj) |

\(G_2\), \(F_4\), \(E_8\) are simply connected = adjoint; \(E_6\) and
\(E_7\) have non-trivial isogenies between simply-connected and
adjoint forms.

## Forms over arbitrary fields

For each exceptional type, the non-split forms over a field \(k\) are
classified by Galois cohomology of the split form, encoded by **Tits
indices** (or **Vogan diagrams** for real forms):

- **\(G_2\)**: Two real forms (split, compact); no inner forms over
  \(p\)-adic fields except split.
- **\(F_4\)**: Two real forms (split, compact, and one intermediate);
  over local fields some non-split forms exist.
- **\(E_6\)**: Real forms include the split form, the compact form,
  and intermediate ones; **outer** forms include \({}^2 E_6\) (the
  Galois group acts non-trivially on the Dynkin diagram).
- **\(E_7\)**: Various real and \(p\)-adic forms; the "intermediate"
  real form \(E_{7(7)}\) plays a role in supergravity.
- **\(E_8\)**: Three real forms (split, compact, one intermediate);
  no outer forms (\(E_8\) Dynkin has no auto).

## Number of nilpotent orbits

By Bala-Carter:

| Type | Nilpotent orbits |
|---|---|
| \(G_2\) | 5 |
| \(F_4\) | 16 |
| \(E_6\) | 21 |
| \(E_7\) | 45 |
| \(E_8\) | 70 |

These bound the complexity of unipotent representation theory.

## Role in Langlands

- **\(G_2\) and \(F_4\)**: serve as test cases for the conjectural
  unipotent local Langlands; the **theta correspondence** for
  \(G_2 \subset \mathrm{SO}_7\) is well-studied.
- **\(E_6\)**: Shimura varieties of \(E_6\)-type provide explicit
  realisations of Galois representations.
- **\(E_7\)**: Cohomology of \(E_7\)-Shimura varieties; the
  \(\mathrm{GL}_{56}\)-functoriality conjecture.
- **\(E_8\)**: A "universal" target for Langlands functoriality;
  conjecturally all Galois representations factor through some
  \({}^L G \subseteq E_8\).
- **Magic square** and **Freudenthal triple systems**: exceptional
  groups appear in unified constructions involving composition
  algebras.

## References

- Jacobson, *Exceptional Lie Algebras* (1971).
- Adams, *Lectures on Exceptional Lie Groups* (1996).
- Carter, *Finite Groups of Lie Type* (1985), Ch. 7.
- Tits, *Classification of algebraic semisimple groups* (Proc.\ AMS
  Symp.\ 1966).
- Springer–Steinberg, *Conjugacy classes* (Lecture Notes 1970).

## Prerequisite Topics

- [[node:root_data_and_duality.root_systems|Root Systems]]
- [[node:root_data_and_duality.cartan_matrices_and_dynkin_diagrams|Cartan Matrices and Dynkin Diagrams]]
- [[node:root_data_and_duality.classification_of_split_reductive_groups|Classification of Split Reductive Groups]]
