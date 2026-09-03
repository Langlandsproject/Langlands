---
id: reductive_groups.parabolic_f_subgroups_levi_decomposition
title: Levi Decomposition for Parabolic F-Subgroups
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
- AlgebraicGroups.Forms
uses:
- reductive_groups.levi_decomposition_of_parabolics
- reductive_groups.maximal_f_split_tori_are_conjugate
- reductive_groups.reductive_groups
- forms.f_subgroup_field_of_definition
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 16.1"
    format: section
    note: "Proposition 16.1.1: F-defined unipotent radical and Levi subgroups of parabolic F-subgroups."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the Levi factor exist over F rather than only after extending scalars?"
  verdict: "Yes. For a parabolic F-subgroup of a connected reductive F-group, Springer proves existence over F and uniqueness up to Ru(P)(F)-conjugacy."
tags:
- springer
- parabolic
- levi-decomposition
- f-group
- theorem
- reductive-structure
---

# Levi Decomposition for Parabolic F-Subgroups

Let \(G\) be a connected reductive \(F\)-group and let \(P\subseteq G\) be a
parabolic \(F\)-subgroup. Then:

1. The unipotent radical \(R_u(P)\) is defined over \(F\) and is \(F\)-split.
2. \(P\) has Levi subgroups defined over \(F\).
3. Any two \(F\)-defined Levi subgroups of \(P\) are conjugate by a unique
   element of \(R_u(P)(F)\).
4. \(P\) contains a maximal \(F\)-split \(F\)-subtorus of \(G\).

*Proof.*  
A parabolic \(F\)-subgroup of a reductive group is of the form \(P(\lambda)\)
for an \(F\)-defined cocharacter \(\lambda:\mathbb{G}_m\to G\). The group
\[
Z_G(\lambda)=C_G(\operatorname{im}\lambda)
\]
is a connected reductive \(F\)-subgroup, while the contracting subgroup
\[
U(\lambda)=\{g:\lim_{t\to 0}\lambda(t)g\lambda(t)^{-1}=e\}
\]
is connected unipotent and \(F\)-split. The product map
\[
Z_G(\lambda)\ltimes U(\lambda)\to P(\lambda)
\]
is an isomorphism of varieties and groups, so \(U(\lambda)=R_u(P)\) and
\(Z_G(\lambda)\) is an \(F\)-Levi subgroup.

If \(L\) is another \(F\)-defined Levi subgroup, it is the centralizer of an
\(F\)-defined torus in \(P\). Geometric Levi conjugacy gives a unique element
of \(R_u(P)\) carrying \(Z_G(\lambda)\) to \(L\). The transporter is
\(F\)-defined and consists of one point, hence that point lies in
\(R_u(P)(F)\). The maximal \(F\)-split torus statement follows by choosing a
minimal parabolic \(F\)-subgroup inside \(P\) and applying the conjugacy of
maximal \(F\)-split tori.
