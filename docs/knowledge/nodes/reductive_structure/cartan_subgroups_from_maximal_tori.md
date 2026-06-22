---
id: reductive_structure.cartan_subgroups_from_maximal_tori
title: Cartan Subgroups from Maximal Tori
kind: theorem
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.maximal_tori_are_conjugate
- reductive_structure.maximal_tori
- reductive_structure.solvable_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.4"
    format: section
    note: "Propositions 6.4.2 and 6.4.7: Cartan subgroups and centralizers of maximal tori."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the theorem use the classical Cartan-subgroup definition for algebraic groups?"
  verdict: "Yes. In a connected linear algebraic group, Cartan subgroups are connected nilpotent self-normalizing subgroups and are realized as connected centralizers of maximal tori."
tags:
- springer
- cartan-subgroup
- maximal-torus
- theorem
- reductive-structure
---

# Cartan Subgroups from Maximal Tori

Let \(G\) be a connected linear algebraic group over an algebraically closed
field, and let \(T\subseteq G\) be a maximal torus. Then
\[
C_G(T)^\circ
\]
is a Cartan subgroup of \(G\). Conversely, every Cartan subgroup of \(G\) is
of this form for a maximal torus \(T\). In particular, Cartan subgroups are
conjugate.

If \(G\) is reductive, then \(C_G(T)=T\) for every maximal torus \(T\).

*Proof.*  
The centralizer \(C_G(T)\) is closed, and its identity component is connected
and nilpotent in the classical algebraic-group sense. Maximality of \(T\)
forces any semisimple part in the centralizer to lie in \(T\), so
\(C_G(T)^\circ\) is the largest connected subgroup whose semisimple part is
controlled by \(T\). This is exactly the Cartan condition.

Conversely, a Cartan subgroup contains a maximal torus, and its defining
self-normalizing nilpotence forces it to coincide with the connected
centralizer of that torus. Since maximal tori are conjugate, the resulting
Cartan subgroups are conjugate. In a reductive group, a nontrivial unipotent
part in \(C_G(T)^\circ\) would define a root-zero unipotent normal direction,
contradicting reductivity; hence the centralizer is the torus itself.
