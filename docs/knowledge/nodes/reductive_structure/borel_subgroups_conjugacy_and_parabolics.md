---
id: reductive_structure.borel_subgroups_conjugacy_and_parabolics
title: Borel Subgroups Are Conjugate and Control Parabolics
kind: theorem
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.borel_subgroups
- reductive_structure.parabolic_subgroups
- reductive_structure.borel_fixed_point_theorem
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.2"
    format: section
    note: "Theorem 6.2.7: conjugacy of Borel subgroups and characterization of parabolics."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the statement for connected linear algebraic groups over an algebraically closed field?"
  verdict: "Yes. Over nonclosed fields, rational conjugacy and rational parabolics require additional descent data."
tags:
- springer
- borel
- parabolic
- conjugacy
- theorem
- reductive-structure
---

# Borel Subgroups Are Conjugate and Control Parabolics

Let \(G\) be a connected linear algebraic group over an algebraically closed
field.

Every Borel subgroup of \(G\) is parabolic, any two Borel subgroups are
conjugate by an element of \(G\), and a closed subgroup \(P\subseteq G\) is
parabolic if and only if it contains a Borel subgroup.

*Proof.*  
Let \(B\) be a Borel subgroup. The quotient \(G/B\) is complete by the
standard projective embedding attached to a maximal connected solvable
subgroup, hence \(B\) is parabolic.

If \(B_1\) and \(B_2\) are Borel subgroups, let \(B_1\) act on the complete
variety \(G/B_2\) by left translation. The Borel fixed point theorem gives
a fixed coset \(gB_2\), which means \(B_1\subseteq gB_2g^{-1}\). Maximality
among connected solvable subgroups forces equality, so the two Borel
subgroups are conjugate.

If \(P\) is parabolic, then \(G/P\) is complete. A Borel subgroup \(B\)
acting on \(G/P\) fixes some point, so \(B\) is contained in a conjugate of
\(P\); after conjugating, \(P\) contains a Borel. Conversely, any closed
subgroup containing a Borel has quotient dominated by the complete variety
\(G/B\), hence is parabolic.
