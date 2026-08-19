---
id: linear_algebraic_groups.identity_component_normal_finite_index
title: Identity Component Is Closed Normal of Finite Index
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- affine_group_schemes.algebraic_group_definition
- linear_algebraic_groups.connected_components
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.2"
    format: section
    note: "Proposition 2.2.1: identity component of an algebraic group."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is this the classical finite-type statement for algebraic groups over an algebraically closed field?"
  verdict: "Yes. It is stated for a linear algebraic group in Springer's classical setting; scheme-theoretic refinements over nonclosed bases require separate hypotheses."
tags:
- springer
- connected-component
- theorem
- linear-algebraic-groups
---

# Identity Component Is Closed Normal of Finite Index

Let \(G\) be a linear algebraic group over an algebraically closed field.
The irreducible component containing the identity element \(e\) is a closed
connected normal subgroup, denoted \(G^\circ\). It has finite index in
\(G\), and every closed subgroup of finite index in \(G\) contains
\(G^\circ\).

Equivalently, the quotient \(G/G^\circ\) is a finite group, and
\(G^\circ\) is the smallest closed finite-index subgroup of \(G\).

*Proof.*  
The connected components of a finite-type algebraic variety are finitely
many, closed, and coincide with irreducible components after taking the
component containing a smooth point such as \(e\). Multiplication sends the
product of two connected subsets containing \(e\) into a connected subset
containing \(e\), hence \(G^\circ G^\circ \subseteq G^\circ\); inversion
similarly preserves \(G^\circ\). Thus \(G^\circ\) is a closed subgroup.

For any \(g \in G\), conjugation by \(g\) is an algebraic automorphism of
\(G\) and sends \(e\) to \(e\), so it preserves the identity component.
Therefore \(G^\circ\) is normal. Since \(G\) has only finitely many
connected components, \(G/G^\circ\) is finite. Finally, if \(H \subseteq G\)
is closed of finite index, then \(G/H\) is finite and the image of the
connected set \(G^\circ\) in it is a point; since \(e \in H\), this gives
\(G^\circ \subseteq H\).
