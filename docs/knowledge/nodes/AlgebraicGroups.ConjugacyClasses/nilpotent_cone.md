---
id: conjugacy_classes.nilpotent_cone
title: Nilpotent Cone
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- conjugacy_classes.nilpotent_elements
- conjugacy_classes.adjoint_action
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Is the nilpotent cone treated as a closed subvariety of any reductive Lie
    algebra, not just classical types?
  verdict: Yes. The nilpotent cone is intrinsic to any semisimple/reductive Lie algebra
    over a field of good characteristic; the Springer resolution and Kostant's theorem
    are uniform statements.
tags:
- nilpotent-cone
- nilpotent-orbits
---
# Nilpotent Cone

The **nilpotent cone** \(\mathcal{N} \subseteq \mathfrak{g}\) is the
closed subvariety of nilpotent elements in a Lie algebra. It is the
geometric scaffolding for the entire theory of nilpotent orbits, the
target of the Springer resolution, and a source of remarkable
varieties in representation theory.

## Definition

Let \(\mathfrak{g}\) be the Lie algebra of a connected reductive
algebraic group \(G\) over an algebraically closed field \(k\) of
characteristic 0 (or good characteristic). The **nilpotent cone** is
\[
\mathcal{N} \;:=\; \{X \in \mathfrak{g} : X \text{ is nilpotent}\}.
\]

Equivalently:
\[
\mathcal{N} \;=\; \{X \in \mathfrak{g} : \operatorname{ad}(X) \text{ is nilpotent}\}
\;=\; \{X : 0 \in \overline{G \cdot X}\}.
\]

## Basic properties

- \(\mathcal{N}\) is a **closed conical** subvariety (closed under
  scalar multiplication).
- **Irreducible** for \(\mathfrak{g}\) semisimple.
- **Dimension**: \(\dim \mathcal{N} = \dim \mathfrak{g} - \mathrm{rank}\, \mathfrak{g}\).
- **Normal** as an algebraic variety.
- **Singular** at every non-regular nilpotent.

## Kostant's theorem

**Theorem (Kostant 1963).** Let \(\mathfrak{g}\) be semisimple. The
**adjoint quotient** \(\chi : \mathfrak{g} \to \mathfrak{g} /\!\!/ G\)
is flat, and \(\mathcal{N} = \chi^{-1}(0)\) is a **complete
intersection** in \(\mathfrak{g}\), cut out by the \(r\) basic
\(G\)-invariants \(p_1, \ldots, p_r\) (\(r = \mathrm{rank}\,\mathfrak{g}\)).

For \(\mathfrak{gl}_n\): \(p_i = \mathrm{tr}(X^i)\), and \(\mathcal{N}\)
is cut out by \(\mathrm{tr}(X) = \mathrm{tr}(X^2) = \cdots = \mathrm{tr}(X^n) = 0\),
equivalently by the vanishing of the non-constant coefficients of the
characteristic polynomial.

## Springer resolution

The **Springer resolution**
\[
\mu : \tilde{\mathcal{N}} \;\longrightarrow\; \mathcal{N}
\]
is a proper birational morphism, where
\(\tilde{\mathcal{N}} = T^*(G/B) = \{(X, B') : X \in \operatorname{Lie}(R_u(B'))\}\).
It is an isomorphism over the open regular nilpotent orbit and
contracts other fibres (**Springer fibres** \(\mathcal{B}_X = \mu^{-1}(X)\))
to lower-dimensional varieties.

## Examples

### \(\mathfrak{gl}_n\) and \(\mathfrak{sl}_n\)

\(\mathcal{N}\) = nilpotent matrices; \(\dim \mathcal{N} = n^2 - n\).
Orbits indexed by partitions of \(n\); closure order = dominance.

### \(\mathfrak{sl}_2\)

\(\mathcal{N}\) is the 2-dimensional quadric cone
\(\{X \in \mathfrak{sl}_2 : X^2 = 0\}\), with three orbits: 0,
regular nilpotent (open), the rays connecting them collapsed.

### Exceptional types

\(E_8\): \(\dim \mathcal{N} = 240\); 70 orbits stratifying it.
\(G_2\): \(\dim \mathcal{N} = 12\); 5 orbits.

## Stratification by orbits

\(\mathcal{N}\) is the disjoint union of finitely many \(G\)-orbits,
each locally closed and even-dimensional. The **closure relations**
give a partial order with:

- minimum: \(\{0\}\) (zero orbit);
- maximum: **regular nilpotent** orbit (= principal), open dense;
- minimum non-trivial: **minimal nilpotent orbit**, of dimension
  \(2h^\vee - 2\) (\(h^\vee\) = dual Coxeter number).

## Connection to flag variety

The Springer resolution is the cotangent bundle
\(\tilde{\mathcal{N}} = T^*(G/B)\), so \(\mathcal{N}\) is "transverse"
to the flag variety. Concretely:

- **Steinberg variety** \(Z = \tilde{\mathcal{N}} \times_{\mathcal{N}} \tilde{\mathcal{N}}\)
  carries a convolution algebra structure;
- \(H_{\bullet}^{BM}(Z, \mathbb{C}) \cong \mathbb{C}[W]\) (Borel-Moore
  homology = group algebra of Weyl group) — this is the **Springer
  algebra**.

## Geometric Satake

Under Mirković-Vilonen / geometric Satake, the nilpotent cone of
\(\hat G\) corresponds to the affine Grassmannian of \(G\), with
strata bijection: \(\hat G\)-orbits in \(\hat{\mathcal{N}}\) ↔
\(G(\mathcal{O})\)-orbits in \(\mathrm{Gr}_G\).

## Role in Langlands

- **Springer correspondence**: nilpotent orbits ↔ irreps of \(W\)
  (with extra component-group data), via top-cohomology of Springer
  fibres.
- **A-parameters**: the \(\mathrm{SL}_2\) factor in Arthur parameters
  corresponds (via Jacobson-Morozov) to a nilpotent orbit in
  \(\mathrm{Lie}(\hat G)\); refines L-packets to A-packets.
- **Wavefront sets**: invariants of admissible representations
  parametrised by nilpotent orbits in \(\mathfrak{g}\).

## Mathlib

Not formalised.

## References

- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993).
- Chriss–Ginzburg, *Representation Theory and Complex Geometry*
  (1997).
- Kostant, *Lie group representations on polynomial rings* (Amer.\ J.\
  Math.\ 1963).

## Prerequisite Topics

- [[node:conjugacy_classes.nilpotent_elements|Nilpotent Elements]]
- [[node:conjugacy_classes.adjoint_action|Adjoint Action]]
