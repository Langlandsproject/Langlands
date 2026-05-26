---
id: root_data_and_duality.based_root_data
title: Based Root Data
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are based root data defined as the structure invariant of (split) reductive groups over arbitrary fields/bases?"
  verdict: "Yes. Based root data classify split connected reductive groups uniquely up to isomorphism, over any base — the celebrated 'existence and uniqueness theorem'."
tags:
- based-root-data
- root-data-and-duality
---

# Based Root Data

A **based root datum** is the combinatorial invariant that classifies
split connected reductive groups. The classification theorem
(Demazure / Chevalley) states:

\[
\{\text{split connected reductive } G/k\} \;\leftrightarrow\; \{\text{based root data}\}.
\]

This is the algebraic-geometric analogue of "compact Lie groups are
classified by their root data" in classical Lie theory.

## Definition

A **root datum** is a quadruple \((X, \Phi, X^\vee, \Phi^\vee)\) where:

- \(X, X^\vee\) are finite-rank free \(\mathbb{Z}\)-modules paired
  perfectly \(\langle -, - \rangle : X \times X^\vee \to \mathbb{Z}\);
- \(\Phi \subseteq X\) is a finite set (**roots**);
- \(\Phi^\vee \subseteq X^\vee\) is a finite set (**coroots**);
- there is a bijection \(\Phi \leftrightarrow \Phi^\vee\),
  \(\alpha \leftrightarrow \alpha^\vee\) satisfying:
  - \(\langle \alpha, \alpha^\vee \rangle = 2\);
  - reflections \(s_\alpha(x) = x - \langle x, \alpha^\vee \rangle \alpha\)
    preserve \(\Phi\) (and dually \(\Phi^\vee\)).

A **based** root datum adds a choice of **base** (= simple roots)
\(\Delta \subseteq \Phi\): a subset such that every root is a
non-negative or non-positive integer combination of \(\Delta\).

## Interpretation for a reductive group

For a split connected reductive group \(G\) over \(k\) with split
maximal torus \(T\):

- \(X = X^*(T) = \operatorname{Hom}(T, \mathbb{G}_m)\) is the
  **character lattice** (a free \(\mathbb{Z}\)-module of rank \(= \dim T\));
- \(X^\vee = X_*(T) = \operatorname{Hom}(\mathbb{G}_m, T)\) is the
  **cocharacter lattice**;
- \(\Phi \subseteq X\) is the set of nonzero weights of \(T\) acting on
  \(\operatorname{Lie}(G)\) (**roots**);
- For each \(\alpha \in \Phi\), there is a canonical "SL_2-triple"
  giving \(\alpha^\vee : \mathbb{G}_m \to T\) (**coroot**).

A choice of Borel subgroup \(B \supseteq T\) gives the base: the
**simple roots** are the weights of \(T\) on \(\operatorname{Lie}(B/T)\)
that are not sums of two positive roots.

## Classification

**Theorem (Chevalley / Demazure–Grothendieck).** Over any field \(k\),
the assignment \(G \mapsto (\text{based root datum})\) is a bijection
between isomorphism classes of split connected reductive \(k\)-groups
and isomorphism classes of based root data.

Moreover, this works over \(\mathbb{Z}\): every based root datum lifts
canonically to a **Chevalley group scheme** \(G_{\mathbb{Z}}\) over
\(\mathbb{Z}\), and the split form over any base is obtained by base
change.

## Connection to Dynkin diagrams

A based root datum determines a **Dynkin diagram**:

- vertices = simple roots;
- edges record the angles between simple roots via the Cartan integers
  \(c_{ij} = \langle \alpha_i, \alpha_j^\vee \rangle\).

The connected Dynkin diagrams classify **simple root systems** (and
hence simply connected simple algebraic groups):

\[
A_n, B_n, C_n, D_n, E_6, E_7, E_8, F_4, G_2.
\]

For semisimple groups, the based root datum decomposes as a product of
"isogeny classes" indexed by the simply connected and adjoint forms in
each Dynkin type.

## Duality

The **dual root datum** \((X^\vee, \Phi^\vee, X, \Phi)\) swaps roots
and coroots. Under the classification theorem, this corresponds to the
**Langlands dual group** \({}^L G\) of \(G\):

\[
G = \mathrm{SL}_n \leftrightarrow {}^L G = \mathrm{PGL}_n, \qquad
G = \mathrm{SO}_{2n+1} \leftrightarrow {}^L G = \mathrm{Sp}_{2n},
\]

and so on. Langlands duality is the cornerstone of the Langlands
correspondence.

## Outer automorphisms

\(\operatorname{Out}(G) \cong \operatorname{Aut}(\text{based root datum})\)
for connected reductive \(G\). This is the **rigidity** that makes the
classification a classification: there is no continuous moduli of
reductive groups, only the discrete combinatorial data.

## Prerequisite Topics

- [[node:root_data_and_duality.root_data|Root Data]]
