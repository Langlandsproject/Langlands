---
id: conjugacy_classes.semisimple_conjugacy_classes
title: Semisimple Conjugacy Classes
kind: definition
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
- AlgebraicGroups.ReductiveGroups
uses:
- conjugacy_classes.jordan_decomposition
- reductive_groups.reductive_groups
- reductive_groups.maximal_tori
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.4"
    format: section
    note: "Semisimple conjugacy classes and their parametrisation by maximal tori."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the parametrisation of semisimple conjugacy classes by the Weyl group quotient T/W valid over any algebraically closed field?"
  verdict: "Yes. For a connected reductive G over an algebraically closed field k, the inclusion T → G and the action of W = N_G(T)/T give a bijection (semisimple conjugacy classes in G) ↔ T(k)/W."
tags:
- semisimple-elements
- conjugacy
- maximal-tori
- weyl-group
---

# Semisimple Conjugacy Classes

## Setup

Let \(G\) be a connected reductive group over an algebraically closed field
\(k\), with maximal torus \(T \subset G\) and Weyl group \(W = N_G(T)/T\).

## Parametrisation theorem

**Theorem.** Every semisimple element of \(G(k)\) is conjugate to an element
of \(T(k)\), and two elements \(t, t' \in T(k)\) are \(G(k)\)-conjugate if
and only if \(t' = w \cdot t\) for some \(w \in W\). Hence:
\[
\{\text{semisimple conjugacy classes in }G\} \xleftrightarrow{\;\sim\;}
T(k)/W.
\]

This is the group-theoretic analogue of the fact that semisimple matrices are
diagonalisable and are conjugate iff they have the same eigenvalues.

## Structure of the centraliser

For a semisimple element \(s \in T(k)\), the identity component of its
centraliser
\[
C_G(s)^\circ
\]
is a **connected reductive group** (a theorem of Steinberg in characteristic
\(p\), and classical otherwise). Its root system is the sub-root-system
\(\{\alpha \in \Phi : \alpha(s) = 1\}\).

## Density of semisimple elements

The set of semisimple elements is **dense** in \(G\) (in the Zariski topology).
Equivalently, unipotent elements form a closed nowhere-dense subset (the
unipotent variety) of positive codimension \(\mathrm{rank}(G)\).

## Over non-algebraically-closed fields

Over a non-closed field \(F\), semisimple conjugacy classes in \(G(F)\) are
no longer parametrised simply by \(T(F)/W\): one must consider all maximal
\(F\)-tori (not just one split torus), and the parametrisation involves Galois
cohomology. For the Langlands correspondence, semisimple conjugacy classes in
the dual group \({}^L G\) parametrise unramified principal series
representations.
