---
id: root_data_and_duality.langlands_dual_groups
title: Langlands Dual Groups
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.pinned_dual_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the Langlands dual group treated for reductive groups over arbitrary fields, with Galois action when needed?"
  verdict: "Yes. The dual group hat G is defined intrinsically from the root datum and is a connected reductive group over C; the Galois action is added separately to form the L-group."
tags:
- langlands-dual-groups
- root-data-and-duality
---

# Langlands Dual Groups

The **Langlands dual group** \(\hat G\) (also called the
**Langlands–Deligne dual** or simply the **dual group**) of a
connected reductive group \(G\) is the complex reductive group whose
root datum is dual to that of \(G\). It is the recipient of L-parameters
on the "Galois side" of the Langlands correspondence.

## Definition

Let \(G\) be a connected reductive group over a field \(k\), with
root datum \((X^*, \Phi, X_*, \Phi^\vee)\). The **Langlands dual
group** \(\hat G\) is the connected reductive group over
\(\mathbb{C}\) (or any algebraically closed field of characteristic
\(0\)) whose root datum is
\[
(X_*, \Phi^\vee, X^*, \Phi),
\]
i.e.\ the dual root datum with characters and cocharacters swapped.

By the classification of split reductive groups, \(\hat G\) is unique
up to isomorphism. A **pinning** of \(\hat G\) — a choice of Borel,
torus, and root vectors — makes \(\hat G\) functorial in \(G\).

## Basic examples

| \(G\) | \(\hat G\) | Type swap |
|---|---|---|
| \(\mathrm{GL}_n\) | \(\mathrm{GL}_n\) | self-dual |
| \(\mathrm{SL}_n\) | \(\mathrm{PGL}_n\) | \(A_{n-1}\) sc ↔ \(A_{n-1}\) ad |
| \(\mathrm{Sp}_{2n}\) | \(\mathrm{SO}_{2n+1}\) | \(C_n \leftrightarrow B_n\) |
| \(\mathrm{SO}_{2n+1}\) | \(\mathrm{Sp}_{2n}\) | \(B_n \leftrightarrow C_n\) |
| \(\mathrm{SO}_{2n}\) | \(\mathrm{SO}_{2n}\) | self-dual (\(D_n\)) |
| \(\mathbb{G}_m\) | \(\mathbb{G}_m\) | self-dual torus |
| \(\mathrm{U}(n)\) (\({}^2 A_{n-1}\)) | \(\mathrm{GL}_n\) with Galois twist | outer form |
| \(G_2\) | \(G_2\) | self-dual |
| \(F_4\) | \(F_4\) | self-dual |
| \(E_6\) sc | \(E_6\) ad | non-trivial centre dualises |
| \(E_7\) sc | \(E_7\) ad | non-trivial centre dualises |
| \(E_8\) | \(E_8\) | self-dual |

## Why the swap?

Root data are inherently \"asymmetric\" between characters and
cocharacters of the maximal torus. The swap exchanges:

- characters \(\leftrightarrow\) cocharacters;
- roots \(\leftrightarrow\) coroots;
- long roots \(\leftrightarrow\) short roots (in non-simply-laced
  types, this gives \(B_n \leftrightarrow C_n\) and \(F_4 \leftrightarrow F_4\)
  via a non-trivial swap);
- \(Z(G) \leftrightarrow \pi_1(\hat G)\) and vice versa.

The last point is the **Kottwitz duality**: \(Z(\hat G)\) is the
Pontryagin dual of \(\pi_1(G)\):
\[
Z(\hat G) \;=\; \operatorname{Hom}(\pi_1(G), \mathbb{C}^\times).
\]

## The L-group

For \(G\) not split, the Galois group
\(\Gamma = \operatorname{Gal}(\bar k/k)\) acts on the root datum of
\(G\), hence (via the swap) on \(\hat G\) as a group of pinned
automorphisms. The **L-group** is the semidirect product:
\[
{}^L G \;=\; \hat G \rtimes \Gamma
\]
(or its Weil-form variant \(\hat G \rtimes W_F\) for local fields).

This is the receptacle of L-parameters and the natural target for
functoriality.

## Geometric Satake

The Langlands dual group has a **purely geometric** characterisation
in the geometric Langlands programme:

**Theorem (Mirković–Vilonen, Ginzburg).** The category of perverse
sheaves on the affine Grassmannian \(\mathrm{Gr}_G\) (with the
\(L^+ G\)-equivariant structure) is equivalent (as a tensor category)
to \(\mathrm{Rep}(\hat G)\):
\[
\mathrm{Perv}_{L^+ G}(\mathrm{Gr}_G) \;\simeq\; \mathrm{Rep}(\hat G).
\]

This gives a Tannakian construction of \(\hat G\) intrinsic to the
geometry of \(G\) — not as a combinatorial dual but as the symmetry
group of a perverse-sheaf category.

## Role in Langlands

- **L-parameters**: continuous homomorphisms
  \(\varphi : W_F \times \mathrm{SL}_2(\mathbb{C}) \to {}^L G\) up to
  \(\hat G\)-conjugacy.
- **L-packets**: fibres of the conjectural map
  \(\{\text{irreps of } G(F)\} \to \{\text{L-parameters}\}\).
- **L-functions**: \(L(s, \pi, r)\) for an L-parameter \(\varphi_\pi\)
  and a finite-dimensional representation \(r : {}^L G \to \mathrm{GL}_N\).
- **Functoriality**: morphisms \({}^L H \to {}^L G\) conjecturally
  transfer automorphic representations of \(H\) to \(G\).
- **Endoscopy**: endoscopic groups arise as centralisers of semisimple
  elements in \(\hat G\).

## References

- Borel, *Automorphic L-functions* (Proc.\ Sympos.\ Pure Math.\ 33,
  Corvallis 1979).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984).
- Mirković–Vilonen, *Geometric Langlands duality and representations
  of algebraic groups over commutative rings* (Annals 2007).
- Bezrukavnikov, *On two geometric realizations of an affine Hecke
  algebra* (Publ.\ IHES 2016).

## Prerequisite Topics

- [[node:root_data_and_duality.pinned_dual_groups|Pinned Dual Groups]]
