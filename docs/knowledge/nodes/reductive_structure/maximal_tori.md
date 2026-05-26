---
id: reductive_structure.maximal_tori
title: Maximal Tori
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.reductive_groups
- reductive_structure.algebraic_tori
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are maximal tori treated for arbitrary reductive groups over arbitrary fields, including the rational and geometric versions?"
  verdict: "Yes. Maximal tori exist in any connected reductive group over a field; over algebraically closed fields they are all conjugate (Borel); over general fields the rational maximal tori form a richer set."
tags:
- maximal-tori
- reductive-structure
---

# Maximal Tori

A **maximal torus** of a reductive group \(G\) is a torus
\(T \subseteq G\) of maximal dimension. Maximal tori are the
"Cartan-like" subgroups of \(G\): they encode the rank, give rise to
the root datum, and (over non-algebraically-closed fields) capture
the rational structure of \(G\).

## Definition

A **torus** in an algebraic group \(G\) is a closed subgroup
isomorphic to \(\mathbb{G}_m^r\) over the algebraic closure (or more
generally, an algebraic torus). A **maximal torus** is a torus not
properly contained in any larger torus.

## Existence and conjugacy (algebraic closure)

**Theorem.** Let \(G\) be a connected linear algebraic group over an
algebraically closed field \(k\). Then:
1. \(G\) contains a maximal torus.
2. All maximal tori of \(G\) are conjugate by elements of \(G(k)\).
3. The dimension of any maximal torus is the same; this common
   dimension is the **rank** of \(G\).

For \(G\) reductive: the maximal tori all have the same character
lattice and root datum, giving the well-defined notions of root
datum, Weyl group, etc.

## Over arbitrary fields

For \(G\) reductive over a non-closed field \(k\):

- Maximal tori always exist (by Galois descent of a geometric maximal
  torus).
- Different conjugacy classes of maximal tori over \(k\) exist; they
  are parametrised by \(H^1(k, N_G(T_0))\) for a fixed reference torus.
- The **stable** conjugacy of maximal tori is governed by the
  geometric Weyl group action.

## Split, non-split, and anisotropic maximal tori

A maximal torus \(T \subseteq G\) is:

- **Split** if \(T \cong \mathbb{G}_m^r\) over \(k\);
- **Anisotropic** if \(T\) has no \(k\)-rational characters
  (\(X^*(T)^\Gamma = 0\));
- General \(T\) is a "twisted" form combining split and anisotropic
  parts.

The **maximal split subtorus** \(A \subseteq G\) is the largest torus
that is split over \(k\); its dimension is the **\(k\)-split rank** of
\(G\).

## Examples

### \(\operatorname{GL}_n\)

Standard maximal torus: \(T = \) diagonal invertible matrices,
\(T \cong \mathbb{G}_m^n\). Always split.

Other maximal tori: stabilisers of decompositions \(k^n = V_1 \oplus \cdots \oplus V_r\)
where \(V_i\) are absolutely irreducible \(\mathrm{Gal}(\bar k/k)\)-modules.
Over \(\mathbb{Q}\): includes anisotropic tori coming from extension
fields \(k(\alpha)\) with degree dividing \(n\).

### \(\operatorname{SO}_n\) (real)

Maximal split torus has rank \(\lfloor n/2 \rfloor\). The compact
form \(\mathrm{SO}_n^{\mathrm{cpt}}\) has an anisotropic maximal torus
(the standard compact maximal torus from symmetric-space theory).

### Anisotropic example: \(R^{(1)}_{K/k}\mathbb{G}_m\)

The norm-one torus is anisotropic over \(k\) (the fixed lattice
\(X^*(T)^\Gamma\) is trivial); maximal anisotropic torus in
\(\mathrm{SL}_1(D)\) for a division algebra \(D/k\).

## Normaliser and Weyl group

For a maximal torus \(T \subseteq G\):
\[
N_G(T) / T \;\cong\; W(G, T),
\]
the **Weyl group** of \(G\) relative to \(T\). Over \(\bar k\), this
agrees with the abstract Weyl group of the root datum.

For non-split \(G\): the **rational Weyl group** \(N_G(T)(k)/T(k)\)
is the Galois fixed points of \(W\), often a proper subgroup of the
absolute one.

## Cartan subalgebras

The Lie algebra of a maximal torus, \(\mathfrak{t} = \operatorname{Lie}(T)\),
is a **Cartan subalgebra** of \(\mathfrak{g}\): an abelian
self-normalising subalgebra of maximal dimension.

In characteristic 0 (or good positive characteristic), Cartan
subalgebras and maximal tori are in bijection (under
\(\mathfrak{t} \mapsto Z_G(\mathfrak{t})\)).

## Steinberg's theorem on tori

**Theorem (Steinberg).** Let \(G\) be a simply connected semisimple
algebraic group over a perfect field \(k\). The conjugacy classes of
maximal tori of \(G\) over \(k\) are in bijection with the
\(F\)-conjugacy classes in \(W\) (the absolute Weyl group), where
\(F\) is the Frobenius automorphism for \(k\) over its prime field.

This is the foundational result for the **Deligne-Lusztig theory** of
representations of finite reductive groups: each maximal torus
contributes a "twisted" Deligne-Lusztig variety.

## Role in Langlands

- **Cuspidal Levis**: every Levi subgroup is the centraliser of a
  rational maximal torus's split component.
- **Deligne-Lusztig representations**: for finite reductive groups,
  characters are parametrised by pairs \((T, \theta)\) with \(T\) a
  rational maximal torus and \(\theta\) a character of \(T(\mathbb{F}_q)\).
- **Endoscopy**: endoscopic data are organised by stable conjugacy
  classes of maximal tori (or their dual cocenters).
- **Local Langlands at the Iwahori block**: indexed by characters of
  maximal tori restricted to maximal compact subgroups.

## Mathlib

`Mathlib.LinearAlgebra.RootSystem.*` handles Cartan-like data
abstractly; specific algebraic-group maximal tori are not formalised.

## References

- Borel, *Linear Algebraic Groups* (1991), §11, §13.
- Springer, *Linear Algebraic Groups* (1998), §6, §13.
- Steinberg, *Endomorphisms of linear algebraic groups* (Mem.\ AMS
  1968).
- Conrad, *Reductive group schemes* (Notes, 2014), §3.

## Prerequisite Topics

- [[node:reductive_structure.reductive_groups|Reductive Groups]]
- [[node:reductive_structure.algebraic_tori|Algebraic Tori]]
