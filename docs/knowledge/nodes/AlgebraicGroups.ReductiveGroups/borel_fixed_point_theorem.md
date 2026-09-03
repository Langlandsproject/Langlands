---
id: reductive_groups.borel_fixed_point_theorem
title: Borel Fixed Point Theorem
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
uses:
- linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
- linear_algebraic_groups.orbits_are_locally_closed
- reductive_groups.solvable_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.2"
    format: section
    note: "Theorem 6.2.6: fixed point theorem for connected solvable groups."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is completeness of the variety essential?"
  verdict: "Yes. The theorem is for actions of connected solvable algebraic groups on complete varieties."
tags:
- springer
- borel
- fixed-point
- solvable-group
- theorem
- reductive-structure
---

# Borel Fixed Point Theorem

Let \(B\) be a connected solvable linear algebraic group acting regularly on
a nonempty complete variety \(X\) over an algebraically closed field. Then
\(B\) has a fixed point in \(X\).

*Proof.*  
Choose a closed \(B\)-orbit \(Y\subseteq X\), which exists because orbit
closures in a complete variety contain closed orbits. Replacing \(X\) by
\(Y\), assume \(B\) acts transitively. Since \(B\) is solvable, it has a
normal connected subgroup \(N\) such that \(B/N\) is either one-dimensional
unipotent or one-dimensional toral after passing through a composition
series.

By induction on \(\dim B\), the subgroup \(N\) has a fixed point on the
complete variety \(Y\) or the action descends to the quotient group
\(B/N\). A one-dimensional connected solvable algebraic group acting on a
complete variety has a fixed point: for \(\mathbb{G}_a\), orbit closures are
rational complete curves with a point at infinity fixed by the action; for
\(\mathbb{G}_m\), the closure of a nonclosed orbit has endpoints fixed by
\(\mathbb{G}_m\). Hence \(B\) fixes a point.
