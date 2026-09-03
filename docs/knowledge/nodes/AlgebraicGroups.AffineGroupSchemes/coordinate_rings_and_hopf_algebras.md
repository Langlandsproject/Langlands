---
id: affine_group_schemes.coordinate_rings_and_hopf_algebras
title: Coordinate Rings and Hopf Algebras
kind: topic
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- foundations.commutative_algebra
- foundations.affine_schemes
- foundations.hopf_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does the equivalence hold over an arbitrary commutative base ring, not just a field?"
  verdict: "Yes. The Spec/Γ duality is stated over any commutative base ring `R`; restricting to a field is a special case."
tags:
- coordinate-rings
- hopf-algebras
- linear-algebraic-groups
---

# Coordinate Rings and Hopf Algebras

The foundational duality of this topic is the equivalence between two
ways of presenting the same data:

| Geometric side | Algebraic side |
|---|---|
| affine group scheme \(G \to \operatorname{Spec} R\) | commutative \(R\)-Hopf algebra \(A\) |
| group structure on \(G\) | comultiplication, counit, antipode on \(A\) |
| morphisms \(G \to G'\) over \(R\) | Hopf-algebra homomorphisms \(A' \to A\) |

The bridge is `Spec ⊣ Γ` (affine schemes ↔ commutative algebras),
upgraded to group objects on both sides.

## The dictionary

For an affine \(R\)-Hopf algebra \(A\), the affine group scheme is
\(G = \operatorname{Spec} A\), with structure maps:

- **multiplication** \(\mu_G : G \times_R G \to G\) corresponds to the
  **comultiplication** \(\Delta : A \to A \otimes_R A\);
- **identity** \(e : \operatorname{Spec} R \to G\) corresponds to the
  **counit** \(\varepsilon : A \to R\);
- **inverse** \(\iota : G \to G\) corresponds to the **antipode**
  \(S : A \to A\).

The group axioms on \(G\) translate to the Hopf algebra axioms on \(A\):
associativity ↔ coassociativity, identity ↔ counit axioms, inverse ↔
antipode axioms.

## Categorical formulation

Inverting Spec gives an equivalence of categories

\[
\mathsf{Grp}\bigl((\mathsf{CommAlg}_R)^{\mathrm{op}}\bigr)
  \;\simeq\;
\bigl\{ G \in \mathsf{Grp}(\mathsf{Over}(\operatorname{Spec} R)) :
        G \text{ is affine}\bigr\}.
\]

The left side is realised in this project as group objects in
\((\mathsf{CommAlgCat}\,R)^{\mathrm{op}}\), which by
[[node:foundations.hopf_algebras|Hopf algebras]] is the
ring-theoretic notion of a commutative \(R\)-Hopf algebra.

The right side is captured by the
[[node:affine_group_schemes.affine_group_scheme_definition|`IsAffineGroupScheme`]]
predicate plus the
[[node:affine_group_schemes.hopf_spec_essential_image_affine|essential
image]] characterisation of `hopfSpec`.

## In this project

The Lean formalisation realises the dictionary via:

- [[node:affine_group_schemes.hopf_spec_functor|`hopfSpec`]] — the
  functor `Spec` lifted to Hopf algebras and group schemes.
- [[node:affine_group_schemes.hopf_spec_grpobj_via_yoneda|Yoneda
  construction]] — the actual implementation, bypassing
  monoidal-functor synthesis blockers in Mathlib master.
- [[node:affine_group_schemes.coordinate_hopf_algebra_of_group_scheme|coordinate
  Hopf algebra]] — the inverse direction, \(G \mapsto \Gamma(G, \mathcal{O}_G)\).
- [[node:affine_group_schemes.hopf_spec_fully_faithful|fully
  faithful]] +
  [[node:affine_group_schemes.hopf_spec_essential_image_affine|essential
  image]] — the equivalence.

## Why "commutative" on the Hopf side

This project specifically formalises **commutative** affine group
schemes — those whose coordinate ring is a *commutative* Hopf algebra.
General Hopf algebras (e.g. group algebras of nonabelian groups,
universal enveloping algebras) correspond to "quantum groups" /
noncommutative geometry and lie outside the present scope.

The commutativity of \(G\) (the group law) is independent of the
commutativity of \(A\) (the algebra structure):

- \(A\) commutative \(\iff\) \(G\) is affine over Spec(commutative ring).
- \(G\) commutative as a group \(\iff\) \(A\) is **cocommutative**
  (\(\Delta\) symmetric).

\(\mathbb{G}_a\), \(\mathbb{G}_m\), \(\mu_n\), tori are all
commutative groups (cocommutative Hopf algebras);
\(\operatorname{GL}_n\) and \(\operatorname{SL}_n\) for \(n \ge 2\) are
non-commutative groups (non-cocommutative Hopf algebras).

## Prerequisite Topics

- [[node:foundations.commutative_algebra|Commutative Algebra]]
- [[node:foundations.affine_schemes|Affine Schemes]]
- [[node:foundations.hopf_algebras|Hopf Algebras]]
