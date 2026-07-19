---
id: buildings_and_parahorics.smooth_affine_group_schemes_over_valuation_rings
title: Smooth Affine Group Schemes over Valuation Rings
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- affine_group_schemes.affine_algebraic_groups
- foundational_inputs.local_fields
- linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are smooth affine group schemes over valuation rings treated as the natural integral models, valid over both discrete and general (non-discrete) valuation rings?"
  verdict: "Yes. The notion of a smooth affine O-group scheme works for any base ring; for valuation rings the additional 'good reduction' conditions and Bruhat-Tits theory apply."
tags:
- group-schemes
- valuation-rings
- buildings-and-parahorics
---

# Smooth Affine Group Schemes over Valuation Rings

A **smooth affine group scheme over a valuation ring \(\mathcal{O}\)**
is an affine group scheme \(\mathcal{G} / \mathcal{O}\) that is
smooth as a morphism of schemes. These give the **integral models** of
algebraic groups, especially relevant for reductive groups over local
fields.

## Setup

Let \(\mathcal{O}\) be a valuation ring (or more generally, a Dedekind
domain) with field of fractions \(F\). A **smooth affine
\(\mathcal{O}\)-group scheme** is an affine group scheme
\(\mathcal{G} \to \mathrm{Spec}\, \mathcal{O}\) such that the structure
morphism is **smooth**.

Equivalently: the special fibre \(\bar{\mathcal{G}}\) at the maximal
ideal is smooth (with the appropriate finite type / flatness
conditions automatically holding).

## Generic and special fibres

For a smooth affine \(\mathcal{O}\)-group scheme \(\mathcal{G}\):

- **Generic fibre** \(\mathcal{G}_F = \mathcal{G} \otimes_\mathcal{O} F\):
  affine group scheme over \(F\); typically reductive.
- **Special fibre** \(\bar{\mathcal{G}} = \mathcal{G} \otimes_\mathcal{O} \mathbb{F}\)
  (over the residue field \(\mathbb{F}\)): connected smooth affine
  group scheme.

Both fibres have the same dimension (smoothness ensures equidimension).

## Examples

### \(\mathrm{GL}_n / \mathbb{Z}_p\)

\(\mathcal{G} = \mathrm{GL}_n\) as a \(\mathbb{Z}_p\)-group scheme;
generic fibre = \(\mathrm{GL}_n(\mathbb{Q}_p)\); special fibre =
\(\mathrm{GL}_n(\mathbb{F}_p)\). Smooth and reductive on both sides
("good reduction").

### Néron model of an elliptic curve

For an elliptic curve \(E / \mathbb{Q}_p\): the **Néron model**
\(\mathcal{E} / \mathbb{Z}_p\) is a smooth commutative group scheme
whose generic fibre is \(E\); the special fibre is the **identity
component** of the reduction (could be elliptic, multiplicative, or
additive depending on reduction type).

### Parahoric group schemes

For a connected reductive \(G / F\) and a facet \(\mathcal{F}\) of the
Bruhat-Tits building: the **parahoric group scheme**
\(\mathcal{G}_\mathcal{F}\) is a specific smooth affine
\(\mathcal{O}_F\)-group scheme with generic fibre \(G\). See
[[node:buildings_and_parahorics.parahoric_group_schemes|parahoric group schemes]].

### Bruhat-Tits "smooth models"

Every connected reductive \(G/F\) admits a smooth affine
\(\mathcal{O}_F\)-model; in fact, a **family** of them indexed by
facets of \(\mathcal{B}(G, F)\). The hyperspecial models give the
"best" integral structure (when \(G\) is unramified).

## Properties

For a smooth affine \(\mathcal{O}\)-group scheme \(\mathcal{G}\):

- **\(\mathcal{O}\)-points**: \(\mathcal{G}(\mathcal{O})\) is a
  topological group (locally compact for \(\mathcal{O}\) compact),
  compact when \(\mathcal{O}\) is a complete DVR.
- **Smoothness**: \(\mathcal{G}(\mathcal{O}) \twoheadrightarrow \bar{\mathcal{G}}(\mathbb{F})\)
  is surjective (Hensel's lemma + smoothness).
- **Pro-unipotent radical**: the kernel
  \(\ker(\mathcal{G}(\mathcal{O}) \to \bar{\mathcal{G}}(\mathbb{F}))\)
  is a pro-\(p\) group.

## Hensel's lemma and lifting

**Theorem (Hensel).** For a smooth \(\mathcal{O}\)-scheme \(X\): every
\(\mathbb{F}\)-point lifts to an \(\mathcal{O}\)-point. Hence
\(X(\mathcal{O}) \twoheadrightarrow X(\mathbb{F})\) is surjective.

For \(\mathcal{G}\) a smooth affine \(\mathcal{O}\)-group scheme: the
reduction map \(\mathcal{G}(\mathcal{O}) \twoheadrightarrow \bar{\mathcal{G}}(\mathbb{F})\)
is a surjective group homomorphism.

## Néron-Ogg-Shafarevich

For an abelian variety \(A / F\) (\(F\) local), \(A\) has good
reduction (= extends to a smooth abelian \(\mathcal{O}_F\)-scheme)
iff the Galois representation on \(T_\ell(A)\) is unramified for some
(equivalently, every) prime \(\ell \ne p\).

This criterion extends to reductive groups: "good reduction" of \(G\)
corresponds to \(G\) being unramified.

## Construction of integral models

For \(G\) reductive over \(F\):

1. **Conrad-Gabber-Prasad**: develops the general theory of smooth
   affine integral models.
2. **Bruhat-Tits**: constructs parahoric models indexed by the
   building.
3. **Yu**: a uniform/alternative construction of Bruhat-Tits
   parahoric models.

These are all smooth affine \(\mathcal{O}_F\)-group schemes
specialising to various reductive / non-reductive integral models.

## Role in Langlands

- **Local-global compatibility**: smooth integral models at each
  place are essential for global automorphic theory.
- **Reduction of Shimura varieties**: smooth integral models of the
  reductive group give the smooth integral models of the Shimura
  variety.
- **Hecke algebras**: parahoric / hyperspecial Hecke algebras are
  defined via smooth integral models.

## References

- Bosch–Lütkebohmert–Raynaud, *Néron Models* (Ergebnisse 1990).
- Bruhat–Tits, *Groupes réductifs sur un corps local I, II*.
- Conrad–Gabber–Prasad, *Pseudo-reductive Groups* (2010, 2015).
- Conrad, *Reductive group schemes* (Notes, 2014).
- Yu, *Bruhat-Tits theory: a new approach* (preprint, 2002).

## Prerequisite Topics

- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
- [[node:foundational_inputs.local_fields|Local Fields]]
- [[node:linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras|Smoothness, Tangent Spaces, and Lie Algebras]]
