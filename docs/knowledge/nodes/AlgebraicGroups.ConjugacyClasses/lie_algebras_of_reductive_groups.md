---
id: conjugacy_classes.lie_algebras_of_reductive_groups
title: Lie Algebras of Reductive Groups
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras
- reductive_groups.reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Are Lie algebras of reductive groups treated over arbitrary fields, with
    the structure of reductive Lie algebras both abstractly and concretely?
  verdict: Yes. The Lie algebra of a reductive group is defined functorially as the
    tangent space at the identity; in characteristic zero this gives the classical
    semisimple/reductive Lie algebra theory.
tags:
- lie-algebras
- reductive-groups
- nilpotent-orbits
---
# Lie Algebras of Reductive Groups

The **Lie algebra** \(\mathfrak{g} = \operatorname{Lie}(G)\) of a
reductive algebraic group \(G\) is the tangent space at the identity,
equipped with the Lie bracket from the group structure. It encodes the
infinitesimal symmetries of \(G\) and is the natural setting for the
representation theory, the Killing form, root data, and nilpotent
orbit theory.

## Definition

For an algebraic group \(G\) over a field \(k\):
\[
\operatorname{Lie}(G) \;:=\; T_e G \;=\; \ker(G(k[\varepsilon]/\varepsilon^2) \to G(k)),
\]
the tangent space at the identity \(e\). The Lie bracket
\([X, Y]\) is induced from the group commutator
\((g, h) \mapsto ghg^{-1}h^{-1}\).

For smooth \(G\): \(\dim \operatorname{Lie}(G) = \dim G\).

## Structure for reductive \(G\)

If \(G\) is a connected reductive algebraic group over an algebraically
closed field \(k\) of characteristic 0 (or good characteristic), then
\(\mathfrak{g}\) is a **reductive Lie algebra**:

- \(\mathfrak{g} = \mathfrak{z} \oplus [\mathfrak{g}, \mathfrak{g}]\),
  with \(\mathfrak{z} = \operatorname{Lie}(Z(G)^\circ)\) abelian and
  \([\mathfrak{g}, \mathfrak{g}] = \operatorname{Lie}(G_{\mathrm{der}})\)
  semisimple.
- **Killing form** \(\kappa(X, Y) = \mathrm{tr}(\operatorname{ad}\,X \circ \operatorname{ad}\,Y)\)
  is non-degenerate on \([\mathfrak{g}, \mathfrak{g}]\).

## Root space decomposition

For \(T \subseteq G\) a maximal torus and
\(\mathfrak{t} = \operatorname{Lie}(T)\):
\[
\mathfrak{g} \;=\; \mathfrak{t} \;\oplus\; \bigoplus_{\alpha \in \Phi} \mathfrak{g}_\alpha,
\]
where \(\mathfrak{g}_\alpha\) is the 1-dimensional **root space**:
\(\mathfrak{g}_\alpha = \{X \in \mathfrak{g} : [H, X] = \alpha(H) X \text{ for all } H \in \mathfrak{t}\}\).

The root spaces \(\mathfrak{g}_\alpha\) are 1-dimensional in characteristic
0 (a key part of the root datum classification); in positive
characteristic they remain 1-dimensional in good characteristic.

## Examples

### \(\mathfrak{gl}_n\) and \(\mathfrak{sl}_n\)

- \(\mathfrak{gl}_n = M_n(k)\), all \(n \times n\) matrices, with bracket
  \([X, Y] = XY - YX\).
- \(\mathfrak{sl}_n = \{X \in M_n : \mathrm{tr}\,X = 0\}\), the
  trace-zero matrices.
- \(\mathfrak{gl}_n = \mathfrak{sl}_n \oplus k \cdot I\); \(\mathfrak{sl}_n\)
  semisimple, \(kI\) the abelian centre.

### \(\mathfrak{so}_n\)

\(\mathfrak{so}_n = \{X \in M_n : X + X^T = 0\}\), skew-symmetric
matrices. Dimension \(\binom{n}{2}\).

### \(\mathfrak{sp}_{2n}\)

\(\mathfrak{sp}_{2n} = \{X : X^T J + J X = 0\}\), with \(J\) the
standard symplectic form. Dimension \(n(2n+1)\).

### Exceptional Lie algebras

- \(G_2\): 14-dim (derivations of octonions);
- \(F_4\): 52-dim (derivations of \(H_3(\mathbb{O})\));
- \(E_6\): 78-dim, \(E_7\): 133-dim, \(E_8\): 248-dim.

## The exponential map

In characteristic 0: \(\exp : \mathfrak{g} \to G\) is defined and
gives a local diffeomorphism near 0/identity. Restricted to nilpotent
elements:
\[
\exp : \mathcal{N} \;\xrightarrow{\sim}\; \mathcal{U},
\]
a bijection (in fact, an isomorphism of varieties) between the
nilpotent cone and the unipotent variety. This is the **Springer
isomorphism**.

In positive characteristic: \(\exp\) is not well-defined globally, but
in **good characteristic** the Springer isomorphism still holds (as a
variety isomorphism that may not literally be the exponential).

## Adjoint representation

\(G\) acts on \(\mathfrak{g}\) by conjugation:
\(\operatorname{Ad}(g)(X) = g X g^{-1}\) (in matrix terms). This is
the **adjoint representation**, a homomorphism
\(\operatorname{Ad} : G \to \mathrm{GL}(\mathfrak{g})\), with image
the **adjoint group** \(G_{\mathrm{ad}} = G/Z(G)\) and kernel \(Z(G)\).

The induced map on Lie algebras is \(\mathrm{ad} : \mathfrak{g} \to \operatorname{End}(\mathfrak{g})\),
\(X \mapsto [X, -]\).

## Killing form and invariants

The **Killing form** \(\kappa : \mathfrak{g} \otimes \mathfrak{g} \to k\):
\[
\kappa(X, Y) \;:=\; \mathrm{tr}_{\mathfrak{g}}(\mathrm{ad}\, X \circ \mathrm{ad}\, Y).
\]

Properties:

- Symmetric, \(G\)-invariant, bilinear;
- Non-degenerate on a semisimple Lie algebra (Cartan's criterion);
- Restricts to a positive-definite form on a compact real form;
- Gives the basic invariant theory of \(G\) acting on \(\mathfrak{g}\).

## Mathlib status

`Mathlib.Algebra.Lie.*` has:

- Lie algebras (general, semisimple, nilpotent, solvable);
- Killing form;
- Root systems via `Mathlib.LinearAlgebra.RootSystem`.

The Lie algebra of a specific algebraic group (e.g.\
\(\operatorname{Lie}(\mathrm{GL}_n)\)) is not yet directly formalised
as such; the path goes via formal group schemes.

## References

- Humphreys, *Introduction to Lie Algebras and Representation Theory*
  (1972).
- Bourbaki, *Groupes et Algèbres de Lie* I–III, VII–VIII.
- Borel, *Linear Algebraic Groups* (1991), §3.
- Milne, *Reductive Groups* (notes), §3.

## Prerequisite Topics

- [[node:linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras|Smoothness, Tangent Spaces, and Lie Algebras]]
- [[node:reductive_groups.reductive_groups|Reductive Groups]]
