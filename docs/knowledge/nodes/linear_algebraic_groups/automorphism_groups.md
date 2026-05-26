---
id: linear_algebraic_groups.automorphism_groups
title: Automorphism Groups
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.affine_algebraic_groups
- linear_algebraic_groups.morphisms_and_closed_subgroups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does this topic apply to automorphism schemes of arbitrary objects (modules, group schemes, varieties), not just vector spaces?"
  verdict: "Yes. The functor-of-points formulation works for any object in a category enriched in schemes; the linear case is the prototype."
tags:
- automorphisms
- linear-algebraic-groups
---

# Automorphism Groups

For an object \(X\) of an algebraic-geometric category (a module, a
scheme, a group scheme, a quadratic form, …), the **automorphism group
scheme** \(\operatorname{Aut}(X)\) is the group scheme representing the
functor

\[
B \;\mapsto\; \operatorname{Aut}_{B}(X_B),
\]

where \(X_B = X \otimes B\) (or the appropriate base change) and the
right-hand side is the abstract automorphism group in the category of
\(B\)-objects.

## Examples

- \(\operatorname{Aut}(\mathbb{G}_{a,R}) \cong \mathbb{G}_{m,R}\) (the
  automorphisms of the additive group are multiplications by units —
  for the underlying scheme, this is the polynomial automorphism
  \(T \mapsto u T\) with \(u \in R^\times\)).
- \(\operatorname{Aut}(\mathbb{G}_{m,R}) \cong \mathbb{Z}/2\) (the only
  automorphisms of \(\mathbb{G}_m\) are \(T \mapsto T^{\pm 1}\),
  recording the involution \(T \mapsto T^{-1}\)).
- \(\operatorname{Aut}(V) = \operatorname{GL}(V)\) for \(V\) a free
  module — see
  [[node:linear_algebraic_groups.general_linear_group_scheme|GL_n]].

## \(\operatorname{Aut}\) of a finite-rank free module

For \(V \cong R^n\) finite free, the automorphism scheme
\(\operatorname{Aut}(V)\) IS the general linear group scheme:

\[
\operatorname{Aut}(V) \;=\; \operatorname{GL}(V) \;\cong\; \operatorname{GL}_n.
\]

Its coordinate ring is
\(R[X_{ij}, \det^{-1}]\) with matrix-multiplication Hopf structure. The
isomorphism with \(\operatorname{GL}_n\) depends on a basis of \(V\); a
basis-free presentation works via the functor of points.

## Inner automorphisms

For a group \(G\), inner automorphisms form a homomorphism
\(G \to \operatorname{Aut}(G)\) by conjugation
\(g \mapsto (h \mapsto g h g^{-1})\). The image is denoted
\(\operatorname{Inn}(G)\) and is a closed normal subgroup of
\(\operatorname{Aut}(G)\). The quotient is the **outer automorphism
group** \(\operatorname{Out}(G)\).

## Outer automorphism groups of reductive groups

For a split connected reductive group \(G\) over a field, the outer
automorphism group is canonically isomorphic to the **automorphism
group of the (based) root datum**. This is one of the key inputs into
the [[node:descent_and_forms.forms_of_algebraic_groups|descent and forms]] theory: forms
of \(G\) are classified by \(H^1(\operatorname{Gal}, \operatorname{Aut}(G))\),
and the outer component carries inner-form vs outer-form information.

## Automorphism schemes vs. abstract automorphism groups

The scheme-theoretic \(\operatorname{Aut}(X)\) is **strictly stronger**
than the abstract group \(\operatorname{Aut}_R(X)\) for a fixed base ring
\(R\): the former records automorphisms over all \(R\)-algebras
functorially, the latter just over \(R\) itself. Mathematically the
distinction matters when \(R\) is not algebraically closed (e.g., a
field with non-trivial Galois group).

## Prerequisite Topics

- [[node:linear_algebraic_groups.affine_algebraic_groups|Affine Algebraic Groups]]
- [[node:linear_algebraic_groups.morphisms_and_closed_subgroups|Morphisms and Closed Subgroups]]
