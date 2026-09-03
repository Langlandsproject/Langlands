---
id: linear_algebraic_groups.orbits_are_locally_closed
title: Orbits of Algebraic Group Actions Are Locally Closed
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
- linear_algebraic_groups.closed_image_of_homomorphism
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.3"
    format: section
    note: "Proposition 2.3.3: orbit structure for algebraic group actions."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the theorem apply to any regular action of a linear algebraic group on a variety?"
  verdict: "Yes. No reductivity or smoothness of the action is assumed in the classical algebraically closed finite-type setting."
tags:
- springer
- orbit
- locally-closed
- theorem
- linear-algebraic-groups
---

# Orbits of Algebraic Group Actions Are Locally Closed

Let a linear algebraic group \(G\) act regularly on an algebraic variety
\(X\). For every \(x \in X\), the orbit \(Gx\) is a locally closed
subvariety of \(X\), open in its closure. The boundary
\(\overline{Gx}\setminus Gx\), if nonempty, is a union of orbits of strictly
smaller dimension. In particular, every orbit closure contains at least one
closed orbit.

*Proof.*  
The orbit map \(a_x:G\to X\), \(g\mapsto gx\), has constructible image by
Chevalley's theorem. Let \(Y=\overline{Gx}\). A constructible dense subset of
an irreducible component of \(Y\) contains a nonempty open subset \(U\).
Translates of \(U\) by elements of \(G\) remain in the same orbit and cover
\(Gx\), so \(Gx\) is open in \(Y\).

Since the orbit is open in its closure, any orbit contained in
\(Y\setminus Gx\) has smaller dimension. Repeating the dimension drop in a
Noetherian space reaches a closed orbit.
