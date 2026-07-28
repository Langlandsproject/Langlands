---
id: root_data_and_duality.isogeny_types_from_root_datum
title: Isogeny Types from the Root Datum
kind: definition
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
- reductive_structure
uses:
- root_data_and_duality.root_data
- root_data_and_duality.root_datum_from_reductive_group
- root_data_and_duality.fundamental_group_of_root_datum
- root_data_and_duality.central_isogenies_and_duality
- reductive_structure.central_isogenies
- reductive_structure.derived_group_center_adjoint_sc_cover
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 9.1"
    format: section
    note: "Isogenies and the lattice X between root and weight lattices."
  - artifact: borel-linear-algebraic-groups
    locator: "Chapter 5"
    format: section
    note: "Simply connected and adjoint forms."
  - artifact: sga3
    locator: "Exposé XXII"
    format: section
    note: "Root data and isogeny types in the SGA3 setting."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the lattice X between root lattice Q and weight lattice P the complete invariant of the isogeny type for semisimple groups?"
  verdict: "Yes. For a semisimple root datum, specifying X with Q ⊆ X ⊆ P is equivalent to specifying the connected component group of the center; SC (X=P), adj (X=Q), with finitely many intermediate forms."
tags:
- isogeny-type
- simply-connected
- adjoint
- root-datum
- weight-lattice
- root-lattice
- root-data-and-duality
---

# Isogeny Types from the Root Datum

For a **semisimple** connected reductive group, the root datum
\((X, \Phi, X^\vee, \Phi^\vee)\) determines the **isogeny type** via
the position of the character lattice \(X\) between the root lattice
and the weight lattice.

## Root lattice, weight lattice, and the lattice \(X\)

Let \(\Phi\) be a root system in a real vector space \(V\).

- **Root lattice**: \(Q = \mathbb{Z}\Phi \subseteq V^*\) — the \(\mathbb{Z}\)-span
  of the roots.
- **Weight lattice**: \(P = \{\lambda \in V^* : \langle \lambda, \alpha^\vee \rangle
  \in \mathbb{Z} \text{ for all } \alpha \in \Phi\}\) — the lattice dual to
  \(\mathbb{Z}\Phi^\vee\).
- One always has \(Q \subseteq P\), and the quotient \(P/Q\) is a finite
  abelian group called the **fundamental group** of the root system.

For a connected semisimple group \(G\) with maximal torus \(T\), the
character lattice \(X = X^*(T)\) satisfies
\[
Q \;\subseteq\; X \;\subseteq\; P.
\]

## The isogeny classification

The choice of \(X\) (with \(Q \subseteq X \subseteq P\)) completely
determines the isogeny type of \(G\):

| Choice of \(X\) | Name | Center |
|---|---|---|
| \(X = P\) (weight lattice) | **Simply connected** (SC) | \(Z(G) \cong \mathrm{Hom}(P/Q, \mathbb{G}_m)\) (largest) |
| \(Q \subsetneq X \subsetneq P\) | **Intermediate** | finite group between SC and adj |
| \(X = Q\) (root lattice) | **Adjoint** (ad) | \(Z(G)\) trivial |

The simply connected form has the largest center and is the universal
cover; the adjoint form has trivial center and is the quotient of any
semisimple group by its center.

**Theorem (Chevalley).** For each choice of a sublattice
\(X\) with \(Q \subseteq X \subseteq P\), the corresponding root datum
\((X, \Phi, X^\vee, \Phi^\vee)\) is realized by a unique (up to
isomorphism) connected semisimple group.

## Central isogenies between forms

Any two forms with the same root system \(\Phi\) are related by
**central isogenies**: if \(X \subseteq X'\), there is a central
isogeny
\[
G_{X'} \longrightarrow G_X,
\]
with kernel \(\mathrm{Hom}(X'/X, \mathbb{G}_m)\). In particular:
\[
G_{\mathrm{SC}} \longrightarrow G \longrightarrow G_{\mathrm{ad}}
\]
for any intermediate form \(G\).

## Cocharacter lattice \(X^\vee\) and dual picture

Dually, the cocharacter lattice \(X^\vee = X_*(T)\) satisfies
\[
Q^\vee \;\subseteq\; X^\vee \;\subseteq\; P^\vee
\]
where \(P^\vee\) is the coweight lattice. The dual form of the isogeny
classification exchanges SC and ad:

| \(G\) | \(\hat G\) |
|---|---|
| SC | ad |
| ad | SC |
| intermediate \((X, X^\vee)\) | intermediate \((X'^\vee, X')\) with \(X' \cdot X^\vee \subseteq \mathbb{Z}\) |

This duality is central to the **Langlands dual** construction.

## Examples

| Root system | \(P/Q\) | Forms |
|---|---|---|
| \(A_{n-1}\) | \(\mathbb{Z}/n\) | \(\mathrm{SL}_n\), \(\mathrm{GL}_n\), \(\mathrm{PGL}_n\), and \(n/d\) intermediate forms for each \(d \mid n\) |
| \(B_n\) | \(\mathbb{Z}/2\) | \(\mathrm{Spin}_{2n+1}\) (SC), \(\mathrm{SO}_{2n+1}\) (ad) |
| \(C_n\) | \(\mathbb{Z}/2\) | \(\mathrm{Sp}_{2n}\) (SC), \(\mathrm{PSp}_{2n}\) (ad) |
| \(D_n\) (\(n\) even) | \(\mathbb{Z}/2 \times \mathbb{Z}/2\) | \(\mathrm{Spin}_{2n}\), \(\mathrm{SO}_{2n}\), \(\mathrm{HSpin}_{2n}\), \(\mathrm{PSO}_{2n}\) |
| \(E_8, F_4, G_2\) | trivial | only one form (SC = adj) |

## Role in representation theory

- **Representations of \(G\)**: Algebraic representations of \(G\) have
  weights in \(X\). Thus the SC form \(G_P\) has the most representations
  (all dominant integral weights); the adjoint form \(G_Q\) has only those
  with weights in \(Q\).
- **Automorphic forms**: Automorphic forms for \(G_P\) and \(G_Q\) are related
  but not the same. The choice of isogeny type affects the Langlands group
  and L-functions.
- **Langlands dual**: The dual group \(\hat G\) uses the dual root datum,
  swapping SC and ad.
