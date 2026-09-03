---
id: root_data.rational_bruhat_decomposition
title: Rational Bruhat Decomposition
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
- AlgebraicGroups.ReductiveGroups
uses:
- reductive_groups.parabolic_f_subgroups_levi_decomposition
- root_data.relative_weyl_group_generated_by_reflections
- root_data.bruhat_decomposition
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 16.1"
    format: section
    note: "Theorem 16.1.3: Bruhat lemma for G(F) relative to a minimal parabolic F-subgroup."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is this a decomposition of the abstract group G(F), not just of the variety G?"
  verdict: "Yes. The double cosets are P(F)-double cosets indexed by the relative Weyl group."
tags:
- springer
- bruhat-decomposition
- rational-points
- relative-weyl-group
- theorem
- root-data-and-duality
---

# Rational Bruhat Decomposition

Let \(G\) be a connected reductive \(F\)-group, let \(P\) be a minimal
parabolic \(F\)-subgroup, and let \(S\subseteq P\) be a maximal
\(F\)-split torus. Put
\[
{}_{F}W=N_G(S)(F)/Z_G(S)(F).
\]
For each \(w\in{}_{F}W\), choose a representative \(\dot w\in N_G(S)(F)\).
Then
\[
G(F)=\bigsqcup_{w\in{}_{F}W} P(F)\dot w P(F).
\]

*Proof.*  
For \(g\in G(F)\), the intersection \(P\cap gPg^{-1}\) is an \(F\)-subgroup
and contains a maximal \(F\)-split torus. By \(G(F)\)-conjugacy of maximal
\(F\)-split tori, there exist \(x,y\in P(F)\) such that \(xgy\) normalizes
\(S\). Thus \(g\) lies in a double coset \(P(F)\dot wP(F)\).

For uniqueness, choose a maximal \(F\)-torus \(T\subseteq P\) containing
\(S\), and compare the relative Weyl group with the absolute Weyl group
\(W(G,T)\). If two relative representatives give the same \(P(F)\)-double
coset, the absolute Bruhat decomposition forces them to differ by an element
of the Weyl group of the Levi \(Z_G(S)\). That element acts trivially on
\(S\), so the two elements of \({}_{F}W\) are equal.
