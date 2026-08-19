---
id: reductive_groups.f_split_solvable_fixed_point_theorem
title: Fixed Point Theorem for F-Split Solvable Groups
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
- AlgebraicGroups.Forms
uses:
- reductive_groups.lie_kolchin_theorem
- reductive_groups.connected_solvable_group_structure
- reductive_groups.borel_fixed_point_theorem
- forms.rational_forms_of_linear_algebraic_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 14.1"
    format: section
    note: "Theorem 14.1.7: F-rational fixed point theorem for connected F-split solvable groups."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the fixed point lie in X(F), not only after base change?"
  verdict: "Yes. The theorem assumes X(F) is nonempty and produces an F-rational fixed point."
tags:
- springer
- f-split
- solvable-group
- fixed-point
- theorem
- reductive-structure
---

# Fixed Point Theorem for F-Split Solvable Groups

Let \(H\) be a connected solvable \(F\)-group that is \(F\)-split. Let \(X\)
be a projective \(F\)-variety with an \(F\)-defined action of \(H\). If
\(X(F)\neq\emptyset\), then there exists a point \(x\in X(F)\) fixed by all
elements of \(H\).

*Proof.*  
Choose an \(F\)-split composition series
\[
\{e\}=H_0\subset H_1\subset \cdots \subset H_n=H
\]
whose successive quotients are \(F\)-isomorphic to \(\mathbb{G}_a\) or
\(\mathbb{G}_m\). Starting from an \(F\)-point \(x_0\in X(F)\), construct
inductively an \(F\)-point \(x_i\) fixed by \(H_i\).

If \(H_i\) already fixes \(x_{i-1}\), set \(x_i=x_{i-1}\). Otherwise the orbit
map of \(H_i/H_{i-1}\) through \(x_{i-1}\) gives an \(F\)-morphism from
\(\mathbb{G}_a\) or \(\mathbb{G}_m\) into \(X\). Since \(X\) is projective,
this morphism extends to \(\mathbb{P}^1\). The point at infinity is
\(F\)-rational and fixed by the quotient action, giving \(x_i\). At the end,
\(x_n\) is fixed by \(H\).
