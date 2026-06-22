---
id: reductive_structure.maximal_tori_are_conjugate
title: Maximal Tori Are Conjugate
kind: theorem
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.maximal_tori
- reductive_structure.borel_subgroups_conjugacy_and_parabolics
- reductive_structure.connected_solvable_group_structure
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.4"
    format: section
    note: "Theorem 6.4.1: conjugacy of maximal tori in connected algebraic groups."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is conjugacy by rational points asserted over arbitrary fields?"
  verdict: "No. The node states geometric conjugacy over an algebraically closed field."
tags:
- springer
- maximal-torus
- conjugacy
- theorem
- reductive-structure
---

# Maximal Tori Are Conjugate

Let \(G\) be a connected linear algebraic group over an algebraically closed
field. Any two maximal tori of \(G\) are conjugate by an element of \(G\).

*Proof.*  
Every torus is contained in a Borel subgroup: let the torus act on the
complete variety of Borel subgroups, or equivalently on a suitable quotient
\(G/B\), and use the fixed-point theorem to find a Borel subgroup containing
it. Thus two maximal tori \(T_1,T_2\) lie in Borel subgroups \(B_1,B_2\).
Conjugacy of Borel subgroups lets us assume \(B_1=B_2=B\).

Inside the connected solvable group \(B\), maximal tori are conjugate by
elements of \(R_u(B)\). Therefore \(T_1\) and \(T_2\) are conjugate in \(G\).
