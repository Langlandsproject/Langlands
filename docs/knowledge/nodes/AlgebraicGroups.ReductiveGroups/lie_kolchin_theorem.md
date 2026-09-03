---
id: reductive_groups.lie_kolchin_theorem
title: Lie-Kolchin Theorem
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
- reductive_groups.borel_fixed_point_theorem
- reductive_groups.solvable_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.3"
    format: section
    note: "Theorem 6.3.1: triangularization of connected solvable linear algebraic groups."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does connectedness matter?"
  verdict: "Yes. A finite nonabelian subgroup may fail to preserve a complete flag; the theorem is for connected solvable algebraic subgroups."
tags:
- springer
- lie-kolchin
- solvable-group
- triangularization
- theorem
- reductive-structure
---

# Lie-Kolchin Theorem

Let \(G\) be a connected solvable closed subgroup of
\(\operatorname{GL}(V)\) over an algebraically closed field. Then \(G\)
preserves a complete flag in \(V\). Equivalently, after choosing a suitable
basis of \(V\), the group \(G\) is contained in the upper triangular
subgroup.

*Proof.*  
The group \(G\) acts on the complete variety \(\mathbb{P}(V)\). By the Borel
fixed point theorem, \(G\) fixes a point of \(\mathbb{P}(V)\), hence
preserves a line \(V_1\subset V\). The induced action on \(V/V_1\) is again
through a connected solvable algebraic group. Applying induction on
\(\dim V\) produces a complete stable flag. A basis adapted to this flag
puts every element of \(G\) in upper triangular form.
