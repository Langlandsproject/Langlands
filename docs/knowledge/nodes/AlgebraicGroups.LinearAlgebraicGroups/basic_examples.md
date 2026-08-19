---
id: linear_algebraic_groups.basic_examples
title: Basic Examples
kind: topic
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- linear_algebraic_groups.linear_algebraic_groups
- linear_algebraic_groups.morphisms_and_closed_subgroups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are the examples stated over an arbitrary base ring or scheme?"
  verdict: "Yes. Each example is defined over an arbitrary commutative base ring `R` (equivalently, base scheme `Spec R`); the field case is the special case."
tags:
- examples
- linear-algebraic-groups
---

# Basic Examples

The following canonical examples appear throughout the theory; they
provide the building blocks from which every classical reductive group
is assembled.

## The additive group \(\mathbb{G}_a\)

[[node:affine_group_schemes.additive_group_scheme|\(\mathbb{G}_{a,R}\)]]
\(= \operatorname{Spec} R[T]\) with primitive Hopf structure
\(\Delta(T) = T \otimes 1 + 1 \otimes T\). Its
[[node:affine_group_schemes.additive_group_scheme_points|functor of
points]] sends \(B \mapsto (B, +)\). One-dimensional, smooth, connected,
non-reductive.

## The multiplicative group \(\mathbb{G}_m\)

[[node:affine_group_schemes.multiplicative_group_scheme|\(\mathbb{G}_{m,R}\)]]
\(= \operatorname{Spec} R[T, T^{-1}]\) with group-like Hopf structure
\(\Delta(T) = T \otimes T\). Its
[[node:affine_group_schemes.multiplicative_group_scheme_points|functor
of points]] sends \(B \mapsto B^\times\). One-dimensional, smooth,
connected, reductive (a torus).

## The \(n\)-th roots of unity \(\mu_n\)

[[node:affine_group_schemes.roots_of_unity_group_scheme|\(\mu_{n,R}\)]]
\(= \operatorname{Spec} R[T]/(T^n - 1) \cong \operatorname{Spec} R[\mathbb{Z}/n]\).
Its points are \(\{x \in B^\times : x^n = 1\}\). Finite of order \(n\);
étale iff \(n\) is invertible in \(R\); for \(n = p = \operatorname{char}(R)\)
it acquires an infinitesimal part.

## The general linear group \(\operatorname{GL}_n\)

[[node:affine_group_schemes.general_linear_group_scheme|\(\operatorname{GL}_{n,R}\)]]
\(= \operatorname{Spec} R[X_{ij}, \det^{-1}]\) with matrix-multiplication
Hopf structure \(\Delta(X_{ij}) = \sum_k X_{ik} \otimes X_{kj}\). Its
[[node:affine_group_schemes.general_linear_group_scheme_points|functor
of points]] sends \(B \mapsto \operatorname{GL}_n(B)\). Of dimension
\(n^2\), smooth, connected, reductive.

## The special linear group \(\operatorname{SL}_n\)

\(\operatorname{SL}_{n,R} = \ker(\det : \operatorname{GL}_{n,R} \to \mathbb{G}_{m,R})\),
i.e. \(\operatorname{Spec} R[X_{ij}] / (\det(X_{ij}) - 1)\). Its points
are matrices of determinant \(1\). Of dimension \(n^2 - 1\), smooth,
connected, simply connected, semisimple.

## Tori (split form)

A **split torus of rank \(r\)** is \(\mathbb{G}_{m,R}^r\), the
\(r\)-fold product. A general **torus** is a group scheme becoming a
split torus after base change to a finite étale cover. Tori have a
character lattice
\(X^*(T) = \operatorname{Hom}(T, \mathbb{G}_m) \cong \mathbb{Z}^r\) in
the split case.

## Finite étale group schemes

Finite groups \(\Gamma\) give rise to constant group schemes
\(\underline{\Gamma}_S\); twisting by Galois action yields finite étale
group schemes more generally. These appear as components of
disconnected algebraic groups and as fundamental groups of tori.

## Diagonal, Borel, unipotent inside \(\operatorname{GL}_n\)

Inside \(\operatorname{GL}_n\):

- the **diagonal torus** \(T \cong \mathbb{G}_m^n\),
- the **Borel subgroup** \(B\) of upper-triangular matrices,
- the **unipotent radical** \(U\) of strictly upper-triangular matrices
  (an iterated extension of \(\mathbb{G}_a\)).

These are the prototypes of maximal tori, Borel subgroups, and unipotent
groups in arbitrary reductive group schemes.

## Trivial group scheme

[[node:affine_group_schemes.trivial_group_scheme|The trivial group
scheme]] \(\mathrm{e}_{/S} = S\) (with the identity structure morphism)
is the terminal object of `Grp(Over S)` — every group scheme has a unique
morphism to it.

## Prerequisite Topics

- [[node:linear_algebraic_groups.linear_algebraic_groups|Linear Algebraic Groups]]
- [[node:linear_algebraic_groups.morphisms_and_closed_subgroups|Morphisms and Closed Subgroups]]
