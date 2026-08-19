---
id: reductive_structure.reductive_group_radical_and_derived_group
title: Radical and Derived Group of a Reductive Group
kind: theorem
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.reductive_groups
- tori.algebraic_tori
- reductive_structure.semisimple_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 8.1"
    format: section
    note: "Proposition 8.1.6: radical, center, and derived subgroup of a reductive group."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does this record the standard almost direct product structure of connected reductive groups?"
  verdict: "Yes. The radical is the connected center, the derived group is semisimple, and their product is the whole group up to finite central intersection."
tags:
- springer
- reductive-group
- radical
- derived-group
- semisimple
- theorem
- reductive-structure
---

# Radical and Derived Group of a Reductive Group

Let \(G\) be a connected reductive group over an algebraically closed field.
Then the radical \(R(G)\) is a torus and equals the connected center
\(Z(G)^\circ\). The derived group \(G_{\mathrm{der}}=[G,G]\) is semisimple,
and multiplication induces an isogeny
\[
Z(G)^\circ \times G_{\mathrm{der}} \longrightarrow G.
\]
Equivalently,
\[
G=Z(G)^\circ\cdot G_{\mathrm{der}},
\]
with finite central intersection.

*Proof.*  
The radical is connected, solvable, and normal. Its unipotent radical would
be a connected normal unipotent subgroup of \(G\), so reductivity forces that
unipotent radical to be trivial. A connected solvable group with trivial
unipotent radical is a torus, and a normal torus in a connected group is
central; hence \(R(G)=Z(G)^\circ\).

The quotient \(G/Z(G)^\circ\) has trivial radical, so it is semisimple. The
image of \(G_{\mathrm{der}}\) in this quotient is all of it because the
quotient has no nontrivial torus quotient. Thus
Z(G)^\circ G_{\mathrm{der}}=G. The intersection is a subgroup of the center
of the semisimple group \(G_{\mathrm{der}}\), hence finite.
