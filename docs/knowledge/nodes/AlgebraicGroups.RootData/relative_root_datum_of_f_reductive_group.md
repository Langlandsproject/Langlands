---
id: root_data.relative_root_datum_of_f_reductive_group
title: Relative Root Datum of an F-Reductive Group
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
- AlgebraicGroups.ReductiveGroups
uses:
- reductive_groups.maximal_f_split_tori_are_conjugate
- reductive_groups.reductive_groups
- root_data.root_datum_from_reductive_group
- root_data.galois_action_on_root_data
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 15.3"
    format: section
    note: "Theorem 15.3.8: the relative roots and coroots form a root datum."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the theorem allow non-reduced relative root systems?"
  verdict: "Yes. The relative root system can be non-reduced; the root datum statement uses Springer's relative roots and coroots."
tags:
- springer
- relative-root-datum
- f-reductive-group
- theorem
- root-data-and-duality
---

# Relative Root Datum of an F-Reductive Group

Let \(G\) be a connected reductive \(F\)-group and let \(S\subseteq G\) be a
maximal \(F\)-split \(F\)-torus. Write
\[
{}_{F}X=X^*(S),\qquad {}_{F}X^\vee=X_*(S).
\]
The nonzero weights of \(S\) on \(\operatorname{Lie}(G)\) form the set of
relative roots \({}_{F}R={}_{F}R(G,S)\subseteq {}_{F}X\). With the coroots
defined by the rank-one relative subgroups, the quadruple
\[
({}_{F}X,{}_{F}R,{}_{F}X^\vee,{}_{F}R^\vee)
\]
is a root datum. Its isomorphism class is independent of the choice of
maximal \(F\)-split torus.

The relative root system may be non-reduced: it can happen that both
\(\alpha\) and \(2\alpha\) occur as relative roots.

*Proof.*  
Choose a maximal \(F\)-torus \(T\supseteq S\). The absolute root system
\(R(G,T)\) restricts to characters of \(S\), and the nonzero restrictions are
the relative roots. The centralizer \(Z_G(S)\) accounts exactly for the
absolute roots that restrict trivially.

For each relative root \(\alpha\), the rank-one subgroup obtained from the
centralizer of \((\ker\alpha)^\circ\) contains an element of \(N_G(S)(F)\)
acting on \(X^*(S)\) by the orthogonal reflection attached to \(\alpha\).
These reflections preserve the set of relative roots and the corresponding
coroots. The root-datum axioms follow from the absolute root datum after
projecting the absolute character space onto the relative character space and
using these rank-one reflection representatives. Conjugacy of maximal
\(F\)-split tori gives independence of \(S\).
