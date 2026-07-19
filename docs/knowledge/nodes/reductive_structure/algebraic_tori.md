---
id: reductive_structure.algebraic_tori
title: Algebraic Tori
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- linear_algebraic_groups.linear_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are algebraic tori treated in the general form (twisted forms of split tori), not just split tori over an algebraically closed field?"
  verdict: "Yes. Tori split after an étale base change; the classification covers split, non-split, and non-isotropic forms uniformly via the Galois module structure on the character lattice."
tags:
- tori
- reductive-structure
---

# Algebraic Tori

An **algebraic torus** over a field \(k\) is a smooth affine algebraic
group \(T/k\) that becomes isomorphic to a power of \(\mathbb{G}_m\)
after base change to a separable closure: \(T_{\bar{k}} \cong \mathbb{G}_m^r\).
The integer \(r\) is the **rank** of \(T\).

## Definition

\(T\) is a torus iff there exists a finite separable extension \(K/k\)
such that \(T_K \cong \mathbb{G}_{m,K}^r\). The minimal such \(K\) is
the **splitting field** of \(T\).

\(T\) is **split** if \(K = k\) (no extension needed); \(T\) is
**anisotropic** if \(T\) has no \(k\)-rational characters
(\(X^*(T)^{\Gamma} = 0\)).

## The character / cocharacter lattice

For any torus \(T\) over \(k\):

- **Character lattice** \(X^*(T) = \operatorname{Hom}_{k\text{-grp}}(T_{\bar{k}}, \mathbb{G}_m)\), a free \(\mathbb{Z}\)-module of rank \(r\);
- **Cocharacter lattice** \(X_*(T) = \operatorname{Hom}_{k\text{-grp}}(\mathbb{G}_m, T_{\bar{k}})\), free of rank \(r\);
- Perfect pairing \(X^*(T) \otimes X_*(T) \to \mathbb{Z}\).

The Galois group \(\Gamma = \operatorname{Gal}(\bar{k}/k)\) acts on
\(X^*(T)\) (and dually on \(X_*(T)\)). The category of algebraic tori
over \(k\) is anti-equivalent to the category of finitely generated free
\(\mathbb{Z}\)-modules with continuous \(\Gamma\)-action:

\[
\{\text{tori}/k\}^{\mathrm{op}} \;\simeq\; \{\Gamma\text{-lattices}\}.
\]

Under this equivalence, split tori correspond to lattices with trivial
\(\Gamma\)-action.

## Examples

- \(\mathbb{G}_m\): \(X^* = \mathbb{Z}\), trivial Galois action.
- \(\mathbb{G}_m^n\): \(X^* = \mathbb{Z}^n\), trivial Galois action.
- The **norm torus** \(R_{K/k}^{(1)}(\mathbb{G}_m)\) (kernel of the
  norm \(R_{K/k} \mathbb{G}_m \to \mathbb{G}_m\)): the splitting field
  is \(K\); the Galois action permutes a basis.
- The **Weil restriction** \(R_{K/k} \mathbb{G}_m\): coinduced module
  \(\operatorname{Ind}_{\operatorname{Gal}(\bar k/K)}^\Gamma \mathbb{Z}\).

## Role in reductive groups

For a connected reductive group \(G/k\):

- A **maximal torus** is a maximal-rank closed subtorus.
- All maximal tori are conjugate over \(\bar{k}\) (the **maximal-torus
  uniqueness theorem**).
- The **rank** of \(G\) is the rank of any maximal torus.
- The **split rank** = maximal rank of a split subtorus; controls
  many arithmetic-geometric properties of \(G\).

The character lattice of a maximal torus is the foundation of the
[[node:root_data_and_duality.based_root_data|based root datum]], and
hence of the entire structure theory of reductive groups.

## Anisotropic vs.\ quasi-split tori

- A torus is **anisotropic over \(k\)** if it has no \(k\)-rational
  cocharacters (= compact for archimedean \(k\)).
- A reductive group is **anisotropic** if its centre is anisotropic and
  it has no proper parabolic \(k\)-subgroup.

For \(k\) a number field, anisotropic groups give arithmetic quotients
that are compact at archimedean places; isotropic groups give
non-compact quotients.

## Mathlib

- `Mathlib.LinearAlgebra.RootSystem.*` — root systems and character
  lattices abstractly.
- The project has [[node:affine_group_schemes.multiplicative_group_scheme|\(\mathbb{G}_m\)]]
  formalised; products give split tori \(\mathbb{G}_m^r\). General
  (non-split) tori require étale descent infrastructure.

## Prerequisite Topics

- [[node:linear_algebraic_groups.linear_algebraic_groups|Linear Algebraic Groups]]
