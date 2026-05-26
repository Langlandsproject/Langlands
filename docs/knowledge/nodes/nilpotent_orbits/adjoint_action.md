---
id: nilpotent_orbits.adjoint_action
title: Adjoint Action
kind: topic
status: admitted
primary_topic: nilpotent_orbits
topics:
- nilpotent_orbits
uses:
- reductive_structure.reductive_groups
- nilpotent_orbits.lie_algebras_of_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the adjoint action defined uniformly for any algebraic group acting on its Lie algebra, with the corresponding orbit structure?"
  verdict: "Yes. The adjoint action G → GL(Lie G) is functorial and intrinsic to any algebraic group; orbit-by-orbit analysis is fundamental for reductive groups."
tags:
- adjoint-action
- nilpotent-orbits
---

# Adjoint Action

The **adjoint action** of an algebraic group \(G\) on its Lie algebra
\(\mathfrak{g}\) is the differential of the conjugation action of
\(G\) on itself. It is the basic geometric setting for nilpotent
orbits, the Chevalley restriction theorem, and the Springer
correspondence.

## Definition

For an algebraic group \(G\) over a field \(k\) with Lie algebra
\(\mathfrak{g} = \operatorname{Lie}(G)\), the **adjoint action** is
the homomorphism of algebraic groups
\[
\operatorname{Ad} : G \;\longrightarrow\; \mathrm{GL}(\mathfrak{g}),
\]
defined as the differential at the identity of the conjugation
homomorphism \(c_g : G \to G\), \(h \mapsto g h g^{-1}\).

Concretely (for \(G \subseteq \mathrm{GL}_n\) and
\(\mathfrak{g} \subseteq M_n\)):
\[
\operatorname{Ad}(g)(X) \;=\; g X g^{-1}.
\]

The induced map on Lie algebras is \(\mathrm{ad} : \mathfrak{g} \to \operatorname{End}(\mathfrak{g})\),
\(X \mapsto [X, -]\).

## Kernel and image

For \(G\) connected:
- \(\ker(\operatorname{Ad}) = Z(G)\), the centre of \(G\);
- \(\operatorname{Ad}(G) = G_{\mathrm{ad}} := G/Z(G)\), the **adjoint
  group**.

For \(G\) reductive, \(G_{\mathrm{ad}}\) is the reductive group with
no centre (\(\pi_1\) is maximal, root datum is "adjoint" form).

## Orbits

The adjoint action partitions \(\mathfrak{g}\) into **adjoint
orbits**:
\[
\mathfrak{g} \;=\; \bigsqcup_{[X]} G \cdot X.
\]

Each orbit \(G \cdot X\) is a locally closed subvariety of
\(\mathfrak{g}\), of dimension \(\dim G - \dim Z_G(X)\).

For \(\mathfrak{g}\) reductive, the orbits fall into three classes
based on the Jordan decomposition \(X = X_s + X_n\):

- **Semisimple orbits**: \(X_n = 0\); parametrised by \(\mathfrak{t}/W\)
  for a fixed Cartan \(\mathfrak{t}\) (Chevalley).
- **Nilpotent orbits**: \(X_s = 0\); finite in number, classified by
  weighted Dynkin diagrams.
- **Mixed orbits**: both parts non-zero; an orbit through \(X\) is a
  "fibered" orbit \((G \cdot X_s) \times_{\bullet} (\text{nilpotent in } Z_G(X_s))\).

## Chevalley restriction theorem

**Theorem (Chevalley).** Let \(\mathfrak{g}\) be a semisimple Lie
algebra with Cartan \(\mathfrak{t}\) and Weyl group \(W = W(\mathfrak{g}, \mathfrak{t})\).
The restriction of polynomial functions gives an isomorphism
\[
k[\mathfrak{g}]^G \;\xrightarrow{\sim}\; k[\mathfrak{t}]^W.
\]

In particular, the categorical quotient
\(\mathfrak{g} /\!\!/ G = \operatorname{Spec}\, k[\mathfrak{g}]^G\)
is isomorphic to \(\mathfrak{t}/W\), a polynomial variety
\(\mathbb{A}^r\) (\(r = \mathrm{rank}\, \mathfrak{g}\)).

The fibres of the **adjoint quotient** \(\chi : \mathfrak{g} \to \mathfrak{t}/W\)
are unions of adjoint orbits with the same semisimple part.

## Examples

### \(\mathfrak{gl}_n\)

Adjoint action: \(\operatorname{Ad}(g)(X) = g X g^{-1}\), conjugation.
Orbits: similarity classes of \(n \times n\) matrices.
Adjoint quotient: characteristic polynomial map
\(\chi : \mathfrak{gl}_n \to \mathbb{A}^n\),
\(X \mapsto (c_1(X), \ldots, c_n(X))\) (coefficients of
\(\det(\lambda I - X)\)).

### \(\mathfrak{sl}_2\)

Three orbits: \(\{0\}\); regular nilpotent (dim 2); semisimple orbit
through any non-zero \(H \in \mathfrak{t}\) (a \(\mathbb{P}^1\)-family
of size 1 modulo \(W\)).

## Springer's resolution of orbit closures

For each nilpotent orbit \(\mathcal{O}_X = G \cdot X\), the closure
\(\overline{\mathcal{O}_X}\) is the union of \(\mathcal{O}_X\) and
strictly smaller orbits in the closure order. The Springer fibre
\(\mathcal{B}_X\) is the preimage of \(X\) under
\(\mu : T^*(G/B) \to \mathcal{N}\), and its cohomology carries a
representation of the Weyl group (Springer).

## Adjoint slice

The **Kostant section** of \(\mathfrak{g}\) along the adjoint quotient
\(\chi\) is a slice \(\Sigma \subseteq \mathfrak{g}\) such that
\(\chi : \Sigma \to \mathfrak{t}/W\) is an isomorphism. Concretely:
\(\Sigma = e + Z_\mathfrak{g}(f)\) for any regular nilpotent
\(\mathfrak{sl}_2\)-triple \((e, h, f)\).

The Kostant section makes the adjoint quotient a trivial bundle over
its image and is essential in geometric Langlands.

## Role in Langlands

- **Springer correspondence** is built on the adjoint orbit
  structure of \(\mathfrak{g}\).
- **Lusztig's classification** of irreducible representations of
  finite reductive groups is organised by the data of an adjoint
  orbit plus a local system on it.
- **Wavefront sets** of admissible representations are constrained to
  adjoint orbit closures in \(\mathfrak{g}^*\); they encode
  "asymptotic singularities."
- **Geometric Langlands**: the Hitchin moduli space is built from the
  adjoint quotient \(\mathfrak{g} \to \mathfrak{t}/W\) on a curve.

## Mathlib

`Mathlib.Algebra.Lie.Derivation` provides general adjoint actions on
Lie algebras; specific algebraic-group cases are not formalised.

## References

- Borel, *Linear Algebraic Groups* (1991), §3.16, §11.2.
- Chriss–Ginzburg, *Representation Theory and Complex Geometry*
  (1997), Ch. 3.
- Kostant, *Lie group representations on polynomial rings* (Amer.\ J.\
  Math.\ 1963).

## Prerequisite Topics

- [[node:reductive_structure.reductive_groups|Reductive Groups]]
- [[node:nilpotent_orbits.lie_algebras_of_reductive_groups|Lie Algebras of Reductive Groups]]
