---
id: reductive_groups.connected_solvable_group_structure
title: Structure of Connected Solvable Algebraic Groups
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
uses:
- reductive_groups.solvable_groups
- reductive_groups.unipotent_groups
- tori.algebraic_tori
- reductive_groups.lie_kolchin_theorem
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.3"
    format: section
    note: "Theorems 6.3.3 and 6.3.5: unipotent radical, torus quotient, and maximal tori in solvable groups."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the statement describe the standard torus-unipotent decomposition of connected solvable groups?"
  verdict: "Yes. It records the unipotent radical, torus quotient, maximal tori, and variety-level product decomposition."
tags:
- springer
- solvable-group
- unipotent-radical
- torus
- theorem
- reductive-structure
---

# Structure of Connected Solvable Algebraic Groups

Let \(B\) be a connected solvable linear algebraic group over an
algebraically closed field. Its unipotent radical \(R_u(B)\) is a closed
connected normal unipotent subgroup, the quotient \(B/R_u(B)\) is a torus,
and every maximal torus \(T\subseteq B\) maps isomorphically onto this
quotient.

Moreover, maximal tori of \(B\) are conjugate by elements of \(R_u(B)\), and
for any maximal torus \(T\), multiplication gives an isomorphism of varieties
\[
T\times R_u(B)\xrightarrow{\sim} B.
\]

*Proof.*  
By Lie-Kolchin, embed \(B\) into an upper triangular group. The subgroup
acting trivially on each successive one-dimensional quotient of the standard
flag is unipotent, closed, connected, and normal; it is maximal among
connected normal unipotent subgroups, hence equals \(R_u(B)\).

The quotient by this subgroup acts faithfully and diagonally on the
successive quotients of the flag, so it is diagonalizable. Connectedness
makes it a torus. A maximal torus \(T\) maps onto \(B/R_u(B)\), and its
intersection with \(R_u(B)\) is trivial, so the map is an isomorphism.

The conjugacy of maximal tori inside \(B\) follows by applying the same
triangular form and eliminating off-diagonal entries by conjugation with the
unipotent radical. The product map is bijective with regular inverse induced
by the quotient projection and the chosen torus section, hence is an
isomorphism of varieties.
