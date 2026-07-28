---
id: foundational_inputs.hopf_algebras
title: Hopf Algebras
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
  prompt: "Is the theory of Hopf algebras treated over an arbitrary commutative base ring R, not just over a field?"
  verdict: "Yes. The definitions and axioms are recorded over any commutative ring R; the field case is a special instance."
tags:
- external-background
- hopf-algebras
- foundational-inputs
---

# Hopf Algebras

A **Hopf algebra** is the algebra structure on the coordinate ring of
an affine group scheme. The five-fold definition consists of an
\(R\)-module \(A\) equipped with:

| name | type | role |
|---|---|---|
| multiplication \(\mu\) | \(A \otimes_R A \to A\) | algebra product |
| unit \(\eta\) | \(R \to A\) | algebra unit |
| comultiplication \(\Delta\) | \(A \to A \otimes_R A\) | coalgebra coproduct |
| counit \(\varepsilon\) | \(A \to R\) | coalgebra counit |
| antipode \(S\) | \(A \to A\) | inverse map |

subject to associativity, unit, coassociativity, counit, **bialgebra
compatibility** (\(\Delta\) and \(\varepsilon\) are algebra maps), and
the **antipode axiom**

\[
\mu \circ (S \otimes \operatorname{id}_A) \circ \Delta
  \;=\;
\mu \circ (\operatorname{id}_A \otimes S) \circ \Delta
  \;=\;
\eta \circ \varepsilon.
\]

The geometric content of the antipode axiom is the group-axiom
\(g \cdot g^{-1} = e\).

## Hierarchy of structures

| Level | Structure | Adds |
|---|---|---|
| Algebra | \(\mu, \eta\) | associativity, unit |
| Coalgebra | \(\Delta, \varepsilon\) | coassociativity, counit |
| Bialgebra | both | bialgebra compatibility |
| Hopf algebra | bialgebra + \(S\) | antipode axiom |

A Hopf algebra is **commutative** if \(\mu \circ \tau = \mu\) (algebra
multiplication is commutative), and **cocommutative** if
\(\tau \circ \Delta = \Delta\) (comul is symmetric).

The dictionary with group schemes:

| Hopf algebra over \(R\) | Affine group scheme over \(\operatorname{Spec} R\) |
|---|---|
| commutative | affine |
| cocommutative | abelian (commutative group law) |

## Canonical examples

1. **Group algebra \(R[G]\)** for a group \(G\): group-like Hopf
   structure \(\Delta(g) = g \otimes g\), \(\varepsilon(g) = 1\),
   \(S(g) = g^{-1}\). Corresponds to the constant group scheme
   \(\underline{G}\) (or to the diagonalisable group of which \(G\) is
   the character group, depending on convention).

2. **Polynomial Hopf algebra \(R[T]\)** with primitive structure:
   \(\Delta(T) = T \otimes 1 + 1 \otimes T\), \(\varepsilon(T) = 0\),
   \(S(T) = -T\). Corresponds to
   [[node:affine_group_schemes.additive_group_scheme|\(\mathbb{G}_a\)]].

3. **Laurent polynomial Hopf algebra \(R[T, T^{-1}]\)** with group-like
   structure: \(\Delta(T) = T \otimes T\), \(\varepsilon(T) = 1\),
   \(S(T) = T^{-1}\). Corresponds to
   [[node:affine_group_schemes.multiplicative_group_scheme|\(\mathbb{G}_m\)]].

4. **Coordinate Hopf algebra \(R[X_{ij}, \det^{-1}]\)** of
   \(\operatorname{GL}_n\) with matrix-multiplication coproduct
   \(\Delta(X_{ij}) = \sum_k X_{ik} \otimes X_{kj}\).

5. **Universal enveloping algebra \(U(\mathfrak{g})\)** of a Lie algebra:
   cocommutative non-commutative Hopf algebra; primitive elements are
   the Lie algebra.

## Key constructions

- **Tensor product**: \(A \otimes_R B\) of two Hopf algebras is a Hopf
  algebra (with diagonal structure).
- **Restriction of scalars**: for a ring map \(R \to R'\), an \(R'\)-Hopf
  algebra restricts to an \(R\)-Hopf algebra.
- **Base change**: \(A \otimes_R R'\) is an \(R'\)-Hopf algebra.
- **Quotients by Hopf ideals**: ideals closed under comul and antipode
  give quotient Hopf algebras (corresponding to closed subgroups).

## Antipode anti-multiplicativity

For ANY Hopf algebra \(A\) (commutative or not),
\(S(a \cdot b) = S(b) \cdot S(a)\): the antipode is an
**anti-homomorphism** for the multiplication. For commutative \(A\),
this reduces to \(S(ab) = S(a) S(b)\), making \(S\) an algebra
homomorphism — see
[[node:affine_group_schemes.antipode_multiplicativity_commutative_hopf|the
commutative version]].

## Mathlib formalisation

- `Mathlib.RingTheory.HopfAlgebra.Basic` — the typeclass + antipode
  axioms.
- `Mathlib.RingTheory.Bialgebra.Basic` — the Bialgebra layer.
- `Mathlib.RingTheory.Coalgebra.Basic` — the Coalgebra layer.
- `Mathlib.RingTheory.HopfAlgebra.TensorProduct`,
  `MonoidAlgebra`, etc. — specific instances.
- `Mathlib.RingTheory.Coalgebra.Convolution` — the convolution
  semiring structure on linear maps, used to formulate the antipode
  axiom and study convolution inverses.

In this project,
[[node:affine_group_schemes.hopf_spec_functor|`hopfSpec`]] makes
Hopf algebras into affine group schemes via Spec; the inverse direction
(coordinate Hopf algebra of a given affine group scheme) is the content
of [[node:affine_group_schemes.coordinate_hopf_algebra_of_group_scheme|the
coordinate Hopf algebra]] node.

## References

- Sweedler, *Hopf Algebras* (1969).
- Montgomery, *Hopf Algebras and Their Actions on Rings* (CBMS, 1993).
- Underwood, *Fundamentals of Hopf Algebras* (Universitext, 2015).

## Prerequisite Topics

- [[node:foundational_inputs.commutative_algebra|Commutative Algebra]]
