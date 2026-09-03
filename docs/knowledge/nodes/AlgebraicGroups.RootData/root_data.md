---
id: root_data.root_data
title: Root Data
kind: definition
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- tori.character_and_cocharacter_lattices
- root_data.root_pairing
- root_data.root_systems
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the root datum defined through Mathlib's integer RootPairing interface without incorrectly requiring the roots to span the character lattice integrally?"
  verdict: "Yes. RootDatum is a RootPairing over the integers; finite generation, finiteness of the root index, and reducedness are explicit mixins. Semisimplicity is rational spanning, not RootPairing.IsRootSystem over the integers."
tags:
- root-data
- root-pairing
- character-lattice
- mathlib-aligned
- root-data-and-duality
---

# Root Data

A root datum keeps the character and cocharacter lattices separate. The
project follows Mathlib's convention: a root datum is an integer-valued root
pairing, with the usual finiteness assumptions supplied independently.

## Definition

Let \(X\) and \(X^\vee\) be abelian groups. In Mathlib,

$$
RootDatum\ \iota\ X\ X^\vee
  := RootPairing\ \iota\ \mathbb Z\ X\ X^\vee.
$$

Unpacked, an element \(P:RootDatum\ \iota\ X\ X^\vee\) contains:

- a perfect bilinear pairing

  $$
  \langle-,-\rangle:X\times X^\vee\longrightarrow\mathbb Z;
  $$

- injections \(i\mapsto\alpha_i\) into \(X\) and
  \(i\mapsto\alpha_i^\vee\) into \(X^\vee\);
- the normalization
  \(\langle\alpha_i,\alpha_i^\vee\rangle=2\);
- permutations \(r_i\) of the common index type \(\iota\) satisfying

  $$
  \alpha_{r_i(j)}
    =\alpha_j-\langle\alpha_j,\alpha_i^\vee\rangle\alpha_i,
  $$

  and

  $$
  \alpha_{r_i(j)}^\vee
    =\alpha_j^\vee-\langle\alpha_i,\alpha_j^\vee\rangle\alpha_i^\vee.
  $$

The images \(\Phi=\{\alpha_i\}\subseteq X\) and
\(\Phi^\vee=\{\alpha_i^\vee\}\subseteq X^\vee\) are the roots and coroots.
Using a common index type makes the root--coroot bijection and its
compatibility with reflections part of the data.

## Finite reductive root data

For the root datum of a connected reductive group, one additionally assumes:

- \(X\) and \(X^\vee\) are finitely generated; perfect pairing then gives
  finite-rank free abelian groups;
- the indexing type \(\iota\) is finite;
- \(P.IsReduced\).

These are mixins around \(RootDatum\), not fields duplicated inside the
abbreviation.

No spanning condition is imposed on \(\Phi\) inside \(X\). This is essential:
the quotient direction records the central torus, and even for a semisimple
group the root lattice may have finite index in the character lattice.

## Semisimple and toral cases

The datum is **semisimple** when the roots span after rationalization:

$$
\operatorname{span}_{\mathbb Q}(\Phi)
  =X\otimes_{\mathbb Z}\mathbb Q.
$$

It is **toral** when \(\iota\) is empty. A general reductive root datum may
contain both a semisimple part and a central torus part.

One should not express semisimplicity by placing \(P.IsRootSystem\) directly
on the integer root datum: that would require the roots to span \(X\) over
\(\mathbb Z\), which is stronger than rational spanning and depends on the
isogeny form.

## Root datum of a reductive group

For a split connected reductive group \(G\) with split maximal torus \(T\),

$$
X=X^*(T),\qquad X^\vee=X_*(T),
$$

with the evaluation pairing. The roots are the nonzero weights of \(T\) on
\(\operatorname{Lie}(G)\), and the coroots are the associated one-parameter
subgroups. This construction is treated separately in
[[node:root_data.root_datum_from_reductive_group|Root Datum of a
Reductive Group]].

## Duality

The dual root datum exchanges the two lattices and the two injections:

$$
(X,\Phi,X^\vee,\Phi^\vee)^\vee
  =(X^\vee,\Phi^\vee,X,\Phi).
$$

This is the combinatorial operation underlying Langlands duality.

## References

- N. Bourbaki, *Groupes et algebres de Lie*, Chapters IV--VI.
- B. Conrad, *Reductive Group Schemes*, Appendix B.
- Mathlib, *LinearAlgebra.RootSystem.Defs* and
  *LinearAlgebra.RootSystem.Reduced*. The isomorphism between root data
  and split reductive groups (the Chevalley--Tits classification) is not
  yet an equivalence of categories in Mathlib.

## Prerequisites

- [[node:root_data.root_pairing|Root Pairings]]
- [[node:root_data.root_systems|Root Systems]]
- [[node:tori.character_and_cocharacter_lattices|Character and Cocharacter Lattices]]
