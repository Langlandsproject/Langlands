---
id: reductive_structure.maximal_f_split_tori_are_conjugate
title: Maximal F-Split Tori Are G(F)-Conjugate
kind: theorem
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
- descent_and_forms
uses:
- reductive_structure.maximal_f_tori_exist
- reductive_structure.f_tori_galois_module_classification
- reductive_structure.f_split_solvable_fixed_point_theorem
- reductive_structure.parabolic_subgroups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 15.2"
    format: section
    note: "Theorem 15.2.6: conjugacy over F of maximal F-split tori."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is conjugacy asserted by an F-rational point of G?"
  verdict: "Yes. The conclusion is conjugacy under G(F), not just over an algebraic closure."
tags:
- springer
- f-split-torus
- conjugacy
- theorem
- reductive-structure
---

# Maximal F-Split Tori Are G(F)-Conjugate

Let \(G\) be a connected linear algebraic group over \(F\). Any two maximal
\(F\)-split \(F\)-subtori of \(G\) are conjugate by an element of \(G(F)\).

*Proof.*  
If \(G\) has a proper pseudo-parabolic \(F\)-subgroup \(P\), the
\(F\)-rational fixed point theorem for \(G/P\) shows that each maximal
\(F\)-split torus is \(G(F)\)-conjugate into \(P\). The result then follows by
induction inside \(P\).

If no proper pseudo-parabolic \(F\)-subgroup exists, Springer's criterion
forces all \(F\)-split subtori to lie in the solvable \(F\)-radical. The
conjugacy statement is then the corresponding conjugacy theorem for maximal
\(F\)-split tori in connected solvable groups, where the unipotent radical
acts transitively on the choices. This completes the induction.
