---
id: root_data_and_duality.f_split_chevalley_isomorphism_theorem
title: Chevalley Isomorphism Theorem for F-Split Groups
kind: theorem
status: admitted
primary_topic: descent_and_forms
topics:
- root_data_and_duality
- reductive_structure
uses:
- root_data_and_duality.chevalley_isomorphism_theorem
- root_data_and_duality.indexed_root_datum_of_f_reductive_group
- root_data_and_duality.pinnings
- root_data_and_duality.classification_of_split_reductive_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 16.3"
    format: section
    note: "Theorem 16.3.2: isomorphism theorem for F-split connected reductive groups."
verification:
  statement: accepted
  proof: gap
generality:
  reviewed: true
  prompt: "Does this theorem assert the isomorphism is defined over F?"
  verdict: "Yes. The theorem is the F-rational version for split groups with chosen F-split maximal tori and Borel subgroups."
tags:
- springer
- chevalley
- f-split
- isomorphism-theorem
- theorem
- root-data-and-duality
---

# Chevalley Isomorphism Theorem for F-Split Groups

Let \(G\) and \(G'\) be connected reductive groups split over \(F\). Choose
\(F\)-split maximal tori and Borel subgroups
\[
T\subseteq B\subseteq G,\qquad T'\subseteq B'\subseteq G'.
\]
An isomorphism of based root data
\[
\Psi(G',B',T')\xrightarrow{\sim}\Psi(G,B,T)
\]
is induced by an \(F\)-isomorphism
\[
\varphi:G\xrightarrow{\sim}G'
\]
with \(\varphi(T)=T'\) and \(\varphi(B)=B'\).

If \(\varphi'\) is another such \(F\)-isomorphism inducing the same based
root-datum isomorphism, then
\[
\varphi'(g)=\varphi(tgt^{-1})
\]
for some \(t\in T\) such that \(\alpha(t)\in F^\times\) for all simple roots
\(\alpha\).

*Proof strategy.*  
Choose \(F\)-defined parametrizations of the root subgroups for \(G\) and
\(G'\). The absolute Chevalley isomorphism theorem gives an isomorphism over
an algebraic closure matching the maximal tori, Borels, and root subgroup
parametrizations.

Because all root subgroup data are \(F\)-defined in the split case, this
isomorphism is \(F\)-defined on the big Bruhat cell and on all its Weyl
translates. These open \(F\)-subvarieties cover \(G\), so the isomorphism is
defined over \(F\). The uniqueness statement is the usual pinning ambiguity:
two isomorphisms differ by conjugation by an element of \(T\), and
\(F\)-rationality is equivalent to the simple-root values lying in
\(F^\times\).
