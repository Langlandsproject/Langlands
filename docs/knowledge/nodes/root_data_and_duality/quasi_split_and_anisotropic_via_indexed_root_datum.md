---
id: root_data_and_duality.quasi_split_and_anisotropic_via_indexed_root_datum
title: Quasi-Split and Anisotropic Groups via the Indexed Root Datum
kind: theorem
status: admitted
primary_topic: descent_and_forms
topics:
- root_data_and_duality
- reductive_structure
- descent_and_forms
uses:
- root_data_and_duality.indexed_root_datum_of_f_reductive_group
- descent_and_forms.quasi_split_forms
- reductive_structure.parabolic_f_subgroups_levi_decomposition
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 16.2"
    format: section
    note: "Proposition 16.2.2: quasi-split and anisotropic criteria."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does quasi-split mean existence of an F-defined Borel subgroup?"
  verdict: "Yes. Springer identifies quasi-splitness with the existence of a Borel F-subgroup; anisotropy is equivalent to absence of proper parabolic F-subgroups."
tags:
- springer
- quasi-split
- anisotropic
- indexed-root-datum
- theorem
- root-data-and-duality
---

# Quasi-Split and Anisotropic Groups via the Indexed Root Datum

Let \(G\) be a connected reductive \(F\)-group with indexed root datum
\[
{}_{F}\Psi(G)=(X,D,X^\vee,D^\vee,D_0,\Gamma_F).
\]
Then:

1. \(G\) is quasi-split over \(F\) if and only if \(G\) contains a Borel
   subgroup defined over \(F\). Equivalently, \(D_0=\emptyset\).
2. \(G\) is anisotropic over \(F\) if and only if \(G\) has no proper
   parabolic \(F\)-subgroup. Equivalently, \(D_0=D\).

*Proof.*  
Let \(S\) be a maximal \(F\)-split torus and \(T\supseteq S\) a maximal
\(F\)-torus. Quasi-splitness is equivalent to the centralizer \(Z_G(S)\)
being a torus. In that case a cocharacter of \(S\) with centralizer \(T\)
defines a parabolic \(P(\lambda)\) that is solvable, hence a Borel subgroup
defined over \(F\).

Conversely, if \(B\) is an \(F\)-defined Borel subgroup, then \(B=P(\lambda)\)
for an \(F\)-defined cocharacter after conjugating the image of \(\lambda\)
into \(S\). Since \(P(\lambda)\) is solvable, its Levi \(Z_G(\lambda)\) is a
torus, forcing \(Z_G(S)=T\) and \(D_0=\emptyset\).

The anisotropic criterion follows because proper parabolic \(F\)-subgroups
are exactly the rational parabolics detected by noncentral \(F\)-split
cocharacters. Such cocharacters exist precisely when the distinguished subset
does not equal all of \(D\).
