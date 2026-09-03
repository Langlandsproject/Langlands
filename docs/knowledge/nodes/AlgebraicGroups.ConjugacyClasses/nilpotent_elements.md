---
id: conjugacy_classes.nilpotent_elements
title: Nilpotent Elements
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- conjugacy_classes.lie_algebras_of_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Are nilpotent elements treated for general Lie algebras (not just classical
    / matrix Lie algebras), with both the abstract and the matrix-theoretic characterisations?
  verdict: Yes. The definition via ad-nilpotency is intrinsic to any Lie algebra;
    the equivalence with matrix-nilpotency for any faithful representation is standard.
tags:
- nilpotent-elements
- nilpotent-orbits
---
# Nilpotent Elements

A **nilpotent element** of a Lie algebra \(\mathfrak{g}\) is one whose
adjoint action is a nilpotent linear operator. Together with their
conjugacy classification (= nilpotent orbits), they form the
combinatorial backbone of representation theory and the geometric
input to Langlands.

## Definition

Let \(\mathfrak{g}\) be a finite-dimensional Lie algebra over a field
\(k\). An element \(X \in \mathfrak{g}\) is **nilpotent** if
\(\operatorname{ad}(X) : \mathfrak{g} \to \mathfrak{g}\),
\(Y \mapsto [X, Y]\), is a nilpotent endomorphism, i.e.\
\(\operatorname{ad}(X)^N = 0\) for some \(N\).

For \(\mathfrak{g}\) reductive (or more generally, for \(X\) in any
faithful linear representation), this is equivalent to: \(X\) acts
nilpotently on **some** (equivalently, every) faithful linear
representation.

## Jordan decomposition

**Theorem (Jordan decomposition).** For \(X \in \mathfrak{g}\) (\(\mathfrak{g}\)
semisimple, or more generally with appropriate hypotheses), there
exist unique commuting elements \(X_s, X_n \in \mathfrak{g}\) with:

- \(X = X_s + X_n\);
- \(\operatorname{ad}(X_s)\) semisimple, \(\operatorname{ad}(X_n)\)
  nilpotent;
- \([X_s, X_n] = 0\).

\(X_s\) is the **semisimple part** and \(X_n\) the **nilpotent part**
of \(X\). They are polynomials in \(X\) with no constant term.

## Examples

### \(\mathfrak{gl}_n\) and \(\mathfrak{sl}_n\)

For \(X \in \mathfrak{gl}_n\) (a matrix), nilpotent in the Lie-algebra
sense iff nilpotent as a matrix (\(X^N = 0\)). The Jordan decomposition
agrees with the usual matrix Jordan decomposition.

### \(\mathfrak{so}_n\)

\(X \in \mathfrak{so}_n\) (skew-symmetric matrices) nilpotent iff
\(X^N = 0\). The Jordan block structure of \(X\) (viewed as an
\(n \times n\) matrix) must be compatible with the bilinear form
preserved by \(\mathrm{SO}_n\); parity constraints apply (see
[[node:conjugacy_classes.bala_carter_classification|Bala-Carter]]).

### Nilpotent cone

The set of all nilpotent elements is the **nilpotent cone**:
\[
\mathcal{N} \;:=\; \{X \in \mathfrak{g} : X \text{ is nilpotent}\}.
\]

\(\mathcal{N}\) is:

- a closed cone (closed under scalar multiplication);
- an algebraic variety, irreducible for semisimple \(\mathfrak{g}\);
- of dimension \(\dim \mathfrak{g} - \mathrm{rank}\, \mathfrak{g}\);
- the **null cone** of the adjoint action (image of \(0\) under the
  Chevalley-Steinberg map \(\mathfrak{g} \to \mathfrak{g} /\!\!/ G\)).

## Properties of nilpotent elements

For \(X \in \mathfrak{g}\) nilpotent in a semisimple \(\mathfrak{g}\):

- \(\exp(X) \in G\) is a well-defined unipotent element of the
  algebraic group \(G\) (in good characteristic; for char \(0\) the
  exponential converges as a polynomial).
- The map \(X \mapsto \exp(X)\) is a bijection between nilpotent
  elements and unipotent elements (Springer).
- The orbit \(G \cdot X\) under the adjoint action is finite-dimensional
  and has a "good" geometry (Springer fibre).

## Regular and subregular nilpotents

- **Regular nilpotent**: \(X \in \mathcal{N}\) is regular if
  \(\dim Z_\mathfrak{g}(X) = \mathrm{rank}\, \mathfrak{g}\) (minimal
  possible). The regular nilpotents form a single open dense
  \(G\)-orbit in \(\mathcal{N}\).
- **Subregular**: \(\dim Z_\mathfrak{g}(X) = \mathrm{rank}\, \mathfrak{g} + 2\);
  a unique \(G\)-orbit of codimension 2 in \(\mathcal{N}\).
- **Principal nilpotent**: synonym for regular nilpotent (for
  semisimple Lie algebras).

For \(\mathfrak{sl}_n\): the regular nilpotent corresponds to the
partition \((n)\) (single Jordan block); subregular = \((n-1, 1)\).

## Jacobson-Morozov

**Theorem (Jacobson-Morozov).** Every nonzero nilpotent \(X \in \mathfrak{g}\)
(\(\mathfrak{g}\) semisimple, good characteristic) extends to an
\(\mathfrak{sl}_2\)-triple \((X, H, Y)\):

- \([H, X] = 2X\), \([H, Y] = -2Y\), \([X, Y] = H\);
- \(X\), \(Y\) are nilpotent, \(H\) is semisimple.

Two extensions are \(Z_G(X)\)-conjugate. This is the foundation of
the [[node:conjugacy_classes.weighted_dynkin_diagrams|weighted Dynkin
diagram]] classification.

## Mathlib

`Mathlib.Algebra.Lie.Nilpotent` defines nilpotent Lie algebras and
provides basic properties; nilpotent elements of a fixed Lie algebra
are not (yet) a separate object.

## References

- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993), Ch. 1.
- Humphreys, *Conjugacy Classes in Semisimple Algebraic Groups* (Math.\
  Surveys 1995).
- Jantzen, *Nilpotent Orbits in Representation Theory* (2004).

## Prerequisite Topics

- [[node:conjugacy_classes.lie_algebras_of_reductive_groups|Lie Algebras of Reductive Groups]]
