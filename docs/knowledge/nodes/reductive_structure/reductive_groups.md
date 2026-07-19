---
id: reductive_structure.reductive_groups
title: Reductive Groups
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.algebraic_tori
- reductive_structure.unipotent_groups
- reductive_structure.solvable_groups
- reductive_structure.levi_subgroups_and_unipotent_radicals
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are reductive groups treated in the modern SGA3 sense over arbitrary base schemes, not just over algebraically closed fields?"
  verdict: "Yes. The definition is given for connected smooth affine group schemes over a field with trivial unipotent radical (geometric); the SGA3 generalisation over schemes is acknowledged with the split-form Chevalley classification."
tags:
- reductive-groups
- reductive-structure
---

# Reductive Groups

A **reductive group** is the central object of the structure theory:
a connected linear algebraic group whose geometric unipotent radical
is trivial. Reductive groups encompass tori, semisimple groups, and
their canonical extensions, and they are the groups appearing on the
"automorphic side" of the Langlands programme.

## Definition

Let \(G\) be a connected smooth affine algebraic group over a field
\(k\), and let \(R(G)\), \(R_u(G)\) denote the **radical**
(= maximal connected solvable normal subgroup) and **unipotent
radical** (= maximal connected unipotent normal subgroup).

\(G\) is **reductive** if the geometric unipotent radical
\(R_u(G_{\bar k}) = 1\). Equivalently, \(G_{\bar k}\) has no nontrivial
connected unipotent normal subgroup.

\(G\) is **semisimple** if \(R(G_{\bar k}) = 1\) — strictly stronger
than reductive.

## Geometric vs.\ algebraic

Over a non-perfect field \(k\) the geometric condition (after base
change to \(\bar k\)) is genuinely stronger than the bare condition
"\(R_u(G) = 1\)". For \(k\) perfect (in particular for char \(0\) or
finite \(k\)), the two coincide.

## Structure theorems

For a connected reductive group \(G\) over an algebraically closed
field \(k\):

- **Radical decomposition.** \(G = Z(G)^\circ \cdot G_{\mathrm{der}}\),
  with \(Z(G)^\circ\) a torus (the **connected centre**) and
  \(G_{\mathrm{der}} = [G, G]\) semisimple. The intersection
  \(Z(G)^\circ \cap G_{\mathrm{der}}\) is a finite group of multiplicative
  type.
- **Borel subgroups exist and are conjugate.**
- **Maximal tori exist and are conjugate.**
- **Levi decomposition of parabolics.** Every parabolic
  \(P \subseteq G\) is a semidirect product \(P = L \ltimes R_u(P)\)
  with \(L\) a reductive Levi.

## Classification

**Theorem (Chevalley, Demazure-Grothendieck).** Split connected
reductive groups over any field \(k\) are classified up to isomorphism
by their [[node:root_data_and_duality.based_root_data|based root datum]].
Over \(\mathbb{Z}\), each based root datum defines a **Chevalley group
scheme**.

Non-split forms are classified by Galois cohomology of the
quasi-split form ([[node:descent_and_forms.forms_of_algebraic_groups|see node]]).

## Examples

- **Tori.** \(\mathbb{G}_m\), \(\mathbb{G}_m^n\), norm tori
  \(R^{(1)}_{K/k}\mathbb{G}_m\), Weil restrictions \(R_{K/k}\mathbb{G}_m\).
- **Classical groups.** \(\mathrm{GL}_n\), \(\mathrm{SL}_n\),
  \(\mathrm{Sp}_{2n}\), \(\mathrm{SO}_n\), \(\mathrm{U}_n\) (unitary
  for a Hermitian form), and their inner forms over global fields.
- **Exceptional groups.** \(G_2, F_4, E_6, E_7, E_8\) in simply
  connected, adjoint, and intermediate isogeny forms; their inner
  forms.
- **Quasi-split forms.** Outer forms determined by the action of
  \(\mathrm{Gal}(\bar k/k)\) on the Dynkin diagram (e.g.\
  \({}^2 A_n\), \({}^3 D_4\), \({}^2 E_6\)).

## Non-examples

- **\(\mathbb{G}_a\)** is connected, smooth, affine, but \(R_u\) =
  itself, hence not reductive.
- The Heisenberg group is unipotent, not reductive.
- A semidirect product of \(\mathbb{G}_m\) and \(\mathbb{G}_a\) (the
  "\(ax + b\)" group) has \(R_u = \mathbb{G}_a\), hence not reductive.

## Role in Langlands

Reductive groups are the natural setting for:

- **Automorphic forms.** For \(G\) reductive over a global field \(F\),
  the automorphic representations of \(G(\mathbb{A}_F)\).
- **Local Langlands.** For \(G\) reductive over a local field \(F\),
  the parametrisation of representations by L-parameters into
  \({}^L G\).
- **Galois representations.** For \(G = \mathrm{GL}_n\), the
  Langlands correspondence with \(n\)-dimensional Galois
  representations.

## Mathlib status

- `Mathlib.AlgebraicGeometry.GroupScheme.*` provides group schemes
  abstractly.
- Reductive groups specifically are **not yet formalised** in Mathlib;
  this project's [[node:affine_group_schemes.affine_algebraic_groups|affine algebraic groups]]
  node provides the starting point.

## References

- Borel, *Linear Algebraic Groups* (2nd ed., 1991).
- Springer, *Linear Algebraic Groups* (2nd ed., 1998).
- Milne, *Reductive Groups* (notes), §17–§25.
- Conrad, *Reductive group schemes* (SGA3 summer school notes, 2014).
- SGA 3, vol. III (Demazure–Grothendieck, 1970).

## Prerequisite Topics

- [[node:reductive_structure.algebraic_tori|Algebraic Tori]]
- [[node:reductive_structure.unipotent_groups|Unipotent Groups]]
- [[node:reductive_structure.solvable_groups|Solvable Groups]]
- [[node:reductive_structure.levi_subgroups_and_unipotent_radicals|Levi Subgroups and Unipotent Radicals]]
