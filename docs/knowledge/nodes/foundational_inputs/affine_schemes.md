---
id: foundational_inputs.affine_schemes
title: Affine Schemes
kind: topic
status: admitted
primary_topic: foundational_inputs
topics:
- foundational_inputs
uses:
- foundational_inputs.commutative_algebra
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the treatment scheme-theoretic and base-independent, not specialised to varieties over an algebraically closed field?"
  verdict: "Yes. Affine schemes are defined over any commutative ring; classical varieties are the special case `R = k` an algebraically closed field plus a reducedness hypothesis."
tags:
- external-background
- affine-schemes
- foundational-inputs
---

# Affine Schemes

The category of **affine schemes** is the opposite of the category of
commutative rings:

\[
\mathsf{AffSch} \;\simeq\; \mathsf{CommRing}^{\mathrm{op}}, \qquad
R \;\longleftrightarrow\; \operatorname{Spec} R.
\]

This duality is the bridge between commutative algebra and algebraic
geometry, and the foundation on which the entire Langlands roadmap is
built.

## Definition

An **affine scheme** is a locally ringed space \(X = \operatorname{Spec} R\)
where \(R\) is a commutative ring, the underlying topological space is
the prime spectrum (set of prime ideals with the Zariski topology), and
the structure sheaf \(\mathcal{O}_X\) localises to \(R_\mathfrak{p}\) at
each prime \(\mathfrak{p}\).

## The Spec functor

\(\operatorname{Spec} : \mathsf{CommRing}^{\mathrm{op}} \to \mathsf{Scheme}\)
is fully faithful. Its essential image is the full subcategory of
affine schemes. The left adjoint is the **global sections** functor
\(\Gamma : \mathsf{Scheme}^{\mathrm{op}} \to \mathsf{CommRing}\),
\(X \mapsto \Gamma(X, \mathcal{O}_X)\).

The unit of the adjunction \(X \to \operatorname{Spec} \Gamma(X, \mathcal{O}_X)\)
is an isomorphism iff \(X\) is affine.

## Why affine schemes are central

- They form the basic open cover of any scheme.
- Many properties (affine, finite type, smooth) reduce locally to
  ring-theoretic conditions.
- Group schemes that are affine over a base ring are exactly Hopf
  algebras (see
  [[node:foundational_inputs.hopf_algebras|Hopf algebras]]
  and [[node:linear_algebraic_groups.coordinate_rings_and_hopf_algebras|coordinate
  rings and Hopf algebras]]).

## Basic examples

| Affine scheme | Ring |
|---|---|
| \(\operatorname{Spec} \mathbb{Z}\) | \(\mathbb{Z}\) |
| \(\operatorname{Spec} \mathbb{Z}[T] = \mathbb{A}^1_{\mathbb{Z}}\) | polynomial ring |
| \(\operatorname{Spec} \mathbb{Z}[T_1, \dots, T_n] = \mathbb{A}^n_{\mathbb{Z}}\) | multi-variable polynomial |
| \(\operatorname{Spec} \mathbb{Z}[T, T^{-1}] = \mathbb{A}^1 \setminus \{0\}\) | Laurent polynomials |
| \(\operatorname{Spec} R/I\) | quotient ring → closed subscheme of \(\operatorname{Spec} R\) |

## Properties preserved by Spec

- Ring homomorphism injective ↔ Spec dominant
- Ring hom surjective ↔ Spec closed immersion
- Ring hom finite type ↔ Spec locally of finite type
- Ring is Noetherian ↔ Spec locally Noetherian
- Ring is reduced/integral ↔ Spec reduced/integral

## Over a base

For a fixed base ring \(R\), an **\(R\)-affine scheme** is an affine
scheme \(X = \operatorname{Spec} A\) with a chosen ring homomorphism
\(R \to A\) (equivalently, a chosen morphism
\(\operatorname{Spec} A \to \operatorname{Spec} R\)). The category of
such is

\[
\mathsf{AffSch}_R \;\simeq\; (\mathsf{CommAlg}_R)^{\mathrm{op}}.
\]

This is the setting in which group schemes over \(\operatorname{Spec} R\)
are formalised in this project.

## Mathlib formalisation

- `Mathlib.AlgebraicGeometry.Scheme` — Schemes as locally ringed
  spaces.
- `Mathlib.AlgebraicGeometry.AffineScheme` — Affine schemes.
- `Mathlib.AlgebraicGeometry.GammaSpecAdjunction` — The `Γ ⊣ Spec`
  adjunction.
- `Mathlib.CategoryTheory.Comma.Over` — Over-categories for "over a
  base".

In this project, [[node:linear_algebraic_groups.hopf_spec_functor|`hopfSpec`]]
is the lift of `Spec` to Hopf algebras, producing affine group schemes.

## Prerequisite Topics

- [[node:foundational_inputs.commutative_algebra|Commutative Algebra]]
