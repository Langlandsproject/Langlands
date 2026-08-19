---
id: tori.torus_definition
title: Algebraic Torus
kind: definition
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.algebraic_tori
- linear_algebraic_groups.linear_algebraic_groups
- affine_group_schemes.multiplicative_group_scheme
- affine_group_schemes.base_change
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 3.2"
    format: section
    note: "Diagonalizable groups and tori."
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Section 2.5, page 86"
    format: book-page
    note: "Working setup for tori over a field with separable closure and Galois group."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition stated over an arbitrary field using the separable closure, without perfectness or characteristic assumptions?"
  verdict: "Yes. The defining isomorphism is required over a separable closure; no hypothesis is placed on the base field."
tags:
- torus
- definition
- AlgebraicGroups.Tori
---

# Algebraic Torus

Let \(k\) be a field and \(k_s\) a separable closure. An **algebraic
torus** over \(k\) is a linear algebraic group \(T\) over \(k\) such
that
\[
T_{k_s} \;\cong\; \mathbb{G}_{m,k_s}^{\,n}
\]
for some \(n \geq 0\). The integer \(n\) is called the **rank** of
\(T\).

Equivalently (see [[node:tori.splitting_field]]) there exists a finite
separable extension \(E/k\) with \(T_E \cong \mathbb{G}_{m,E}^{\,n}\);
the separable closure in the definition is not a genuine infinite
limit.

The character lattice \(X^*(T)\) and cocharacter lattice \(X_*(T)\)
of a torus of rank \(n\) are free \(\mathbb{Z}\)-modules of rank
\(n\) in perfect duality, carrying continuous actions of
\(\Theta = \operatorname{Gal}(k_s/k)\); see
[[node:tori.character_and_cocharacter_lattices]]. They form the
complete invariant of \(T\) by
[[node:tori.f_tori_galois_module_classification]].

A torus is smooth, connected, and commutative. Smoothness and
connectedness hold because both can be checked after base change to
\(k_s\), where \(\mathbb{G}_m^n\) is a smooth connected variety;
commutativity holds because \(T(k_s) \subseteq T(k_s)\) is the group
\((k_s^\times)^n\) under the defining isomorphism and \(T(k_s)\) is
schematically dense in the smooth \(k_s\)-group \(T_{k_s}\).
