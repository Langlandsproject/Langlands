---
id: conjugacy_classes.geometric_conjugacy
title: Geometric Conjugacy and Deligne–Lusztig Theory
kind: definition
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- conjugacy_classes.semisimple_conjugacy_classes
- conjugacy_classes.stable_conjugacy_classes
- root_data.dual_reductive_groups
- root_data.langlands_dual_groups
source:
  spans:
  - artifact: deligne-lusztig-representations-of-reductive-groups-over-finite-fields
    locator: "§1–2"
    format: section
    note: "Geometric conjugacy of characters of maximal tori; parametrisation of Deligne-Lusztig representations."
  - artifact: carter-finite-groups-lie-type
    locator: "Chapter 5"
    format: section
    note: "Geometric conjugacy and the classification of irreducible characters of G(F_q)."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is geometric conjugacy defined for all connected reductive groups over finite fields, and does it give a partition of the characters of G(F_q)?"
  verdict: "Yes. For G a connected reductive group over F_q with Frobenius F, geometric conjugacy is an equivalence relation on pairs (T, θ) where T is an F-stable maximal torus and θ ∈ T(F_q)^∨. It partitions the irreducible characters of G(F_q) into Lusztig series, each labelled by a geometric conjugacy class (a semisimple conjugacy class in the dual group G*)."
tags:
- geometric-conjugacy
- deligne-lusztig
- finite-groups-lie-type
- dual-group
- lusztig-series
---

# Geometric Conjugacy and Deligne–Lusztig Theory

## Setting

Let $G$ be a connected reductive group over $\mathbb{F}_q$ with Frobenius
endomorphism $F : G \to G$. Write $G^F = G(\mathbb{F}_q)$ for the finite group
of rational points. Let $G^*$ be the **Langlands dual** (or Deligne–Lusztig
dual) group over $\mathbb{F}_q$ with dual Frobenius $F^*$.

## Pairs $(T, \theta)$

A **character datum** is a pair $(T, \theta)$ where:

- $T \subset G$ is an $F$-stable maximal torus.
- $\theta : T^F \to \mathbb{C}^\times$ is a character of the finite group $T^F = T(\mathbb{F}_q)$.

Each such pair gives a **Deligne–Lusztig virtual character**
$R_T^\theta \in \mathrm{class\ functions}(G^F)$.

## Geometric conjugacy

Two pairs $(T_1, \theta_1)$ and $(T_2, \theta_2)$ are **geometrically conjugate**
if there exists $g \in G(\bar{\mathbb{F}}_q)$ such that $g T_1 g^{-1} = T_2$
and $\theta_2 = \theta_1 \circ \mathrm{Ad}(g^{-1})$ (as characters on $T_2^F$).

This is coarser than $G^F$-conjugacy of pairs: it uses elements from
$G(\bar{\mathbb{F}}_q)$, not just $G(\mathbb{F}_q)$.

## Parametrisation via $G^*$

The geometric conjugacy classes of pairs $(T, \theta)$ are in bijection with
**$F^*$-stable semisimple conjugacy classes** $[s]$ in $G^*$:
$$\{(T, \theta)\}/\text{geom. conj.} \xleftrightarrow{\;\sim\;}
\{[s] : s \in G^*, F^*(s) \sim_{\mathrm{conj}} s\}/G^*(\bar{\mathbb{F}}_q).$$

For $G = \mathrm{GL}_n$, this bijects with conjugacy classes of semisimple
elements in $\mathrm{GL}_n(\bar{\mathbb{F}}_q)$.

## Lusztig series

The **Lusztig series** $\mathcal{E}(G^F, [s])$ is the set of irreducible
characters of $G^F$ that appear as constituents of some $R_T^\theta$ with
$(T, \theta)$ geometrically conjugate to the class corresponding to $[s]$.

**Lusztig's theorem:** The sets $\mathcal{E}(G^F, [s])$ (for $[s]$ ranging
over semisimple classes in $G^*$) partition the irreducible characters of $G^F$:
$$\mathrm{Irr}(G^F) = \bigsqcup_{[s] \in G^{*F^*}_{\mathrm{ss}}/\sim}
\mathcal{E}(G^F, [s]).$$

The series $\mathcal{E}(G^F, [1])$ (for $s = 1$) consists of the **unipotent
characters** and is the most important; its classification reduces to the
case $G = G^*$ and involves the theory of character sheaves.

## Connection to the Langlands programme

Geometric conjugacy classes of $(T, \theta)$ are the finite-field analogue of
**unramified Langlands parameters**: a semisimple element $s \in G^*$ gives,
via the local Langlands correspondence for unramified representations, a
Frobenius-semisimple Weil-Deligne parameter $\varphi_s$.
