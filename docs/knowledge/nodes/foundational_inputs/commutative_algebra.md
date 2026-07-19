---
id: foundational_inputs.commutative_algebra
title: Commutative Algebra
kind: topic
status: admitted
primary_topic: foundational_inputs
topics:
- foundational_inputs
uses: []
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the treatment cover both Noetherian and non-Noetherian settings, since arithmetic applications may require either?"
  verdict: "Yes. Definitions are over general commutative rings; the Noetherian hypothesis is applied selectively where finiteness is essential."
tags:
- external-background
- commutative-algebra
- foundational-inputs
---

# Commutative Algebra

This is the foundational layer: the language and toolkit of commutative
rings, modules, ideals, and their geometric counterpart via
[[node:foundational_inputs.affine_schemes|Spec]].

## Scope

The Langlands roadmap draws on the following commutative-algebra
inputs:

### Rings and ideals

- Commutative rings, ideals (prime, maximal, primary), quotient rings.
- The prime spectrum \(\operatorname{Spec} R\) and the Zariski topology.
- Localisation: \(R[S^{-1}]\), \(R_{\mathfrak{p}}\), \(R[f^{-1}]\).
- Noetherian hypotheses: Hilbert basis theorem, ACC on ideals.

### Modules

- \(R\)-modules: free, projective, flat, finitely generated, finitely
  presented.
- Tensor products \(M \otimes_R N\).
- Module-finite vs. algebra-finite (finite vs. finite type).

### Algebras

- \(R\)-algebras as ring maps \(R \to A\).
- Finitely generated \(R\)-algebras (= \(R[X_1, \dots, X_n]/I\)).
- Polynomial rings, Laurent polynomial rings, multivariate polynomials.

### Hilbert's Nullstellensatz

For an algebraically closed field \(k\) and a finitely generated
\(k\)-algebra \(A\):

- the maximal ideals of \(A\) are in bijection with the
  \(k\)-rational points of \(\operatorname{Spec} A\);
- if \(A\) is a domain, \(\dim A\) (Krull) equals the transcendence
  degree of \(\operatorname{Frac}(A)\) over \(k\).

### Dimension theory

- Krull dimension, transcendence degree, height of primes.
- For Noetherian rings: dimension formulas, dimension equals
  transcendence degree for finitely generated \(k\)-algebras.

### Going up / going down

- Cohen–Seidenberg theorems for integral extensions.
- Properties of integral / faithfully flat / smooth ring maps.

## Smoothness and étale morphisms

For affine group schemes, we need:

- **Smooth** ring maps: locally of finite presentation, formally smooth.
- **Étale** ring maps: smooth + unramified, equivalently
  locally-of-finite-presentation + flat + unramified.
- **Faithfully flat**: flat + the map is surjective on Spec.

These translate into smooth/étale/faithfully-flat morphisms of schemes
under Spec.

## Tensor products and base change

For \(R \to R'\) a ring map and \(A\) an \(R\)-algebra,
\(A \otimes_R R'\) is the **base change** of \(A\) along \(R'\). On
Spec: \(\operatorname{Spec}(A \otimes_R R') = \operatorname{Spec} A \times_{\operatorname{Spec} R} \operatorname{Spec} R'\).

This is the algebraic shadow of the
[[node:affine_group_schemes.base_change|base change]] of schemes.

## Mathlib

The relevant Mathlib namespaces:

- `Mathlib.Algebra.*` — algebra typeclasses (CommRing, CommSemiring, Module, Algebra).
- `Mathlib.RingTheory.*` — ring theory (Ideal, Spec, Localization, MvPolynomial).
- `Mathlib.LinearAlgebra.*` — modules, tensor products.
- `Mathlib.RingTheory.FiniteType` — finite-type algebras (FG of finite-type).

Everything in this DAG that touches commutative algebra reduces to
Mathlib API calls; the project does NOT redevelop commutative algebra
from scratch.

## References

- Atiyah–Macdonald, *Introduction to Commutative Algebra* (1969).
- Eisenbud, *Commutative Algebra with a View Toward Algebraic Geometry*
  (GTM 150, 1995).
- Stacks Project (online) — comprehensive reference.
