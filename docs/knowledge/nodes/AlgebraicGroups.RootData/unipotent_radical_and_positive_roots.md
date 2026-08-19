---
id: root_data.unipotent_radical_and_positive_roots
title: Unipotent Radical of a Borel Subgroup and Positive Roots
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
- AlgebraicGroups.ReductiveGroups
uses:
- root_data.roots_coroots_and_root_subgroups
- root_data.root_datum_from_reductive_group
- root_data.based_root_data
- reductive_groups.borel_subgroups
- reductive_groups.levi_subgroups_and_unipotent_radicals
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 8.3"
    format: section
    note: "Borel subgroup as semidirect product T ⋉ U where U is product of positive root subgroups."
  - artifact: borel-linear-algebraic-groups
    locator: "Theorem 13.18"
    format: section
    note: "Structure of Borel subgroups in terms of root subgroups."
verification:
  statement: accepted
  proof: gap
generality:
  reviewed: true
  prompt: "Is the product formula B = T ⋉ U and U = ∏_{α > 0} U_α proved for all connected reductive groups over algebraically closed fields?"
  verdict: "Yes. The order of the product in U is any total ordering compatible with the root ordering; the result is independent of this choice."
tags:
- borel-subgroup
- unipotent-radical
- positive-roots
- root-subgroup
- root-data-and-duality
---

# Unipotent Radical of a Borel Subgroup and Positive Roots

Let \(G\) be a connected reductive group over an algebraically closed field,
\(T \subseteq G\) a maximal torus, and \(B \supseteq T\) a Borel subgroup.
The choice of \(B\) determines a system of **positive roots**
\[
\Phi^+ = \{\alpha \in \Phi : U_\alpha \subseteq B\} \subseteq \Phi(G,T).
\]

## Product decomposition of the unipotent radical

Let \(U = R_u(B)\) be the unipotent radical of \(B\). Then:

**Theorem.** The multiplication map
\[
\prod_{\alpha \in \Phi^+} U_\alpha \longrightarrow U
\]
(in any order compatible with the root ordering, e.g., simple roots last)
is an isomorphism of varieties. In particular,
\[
B = T \ltimes U, \qquad U \cong \mathbb{A}^{|\Phi^+|}
\]
as varieties (not as groups, unless \(\Phi^+\) has a compatible product
structure).

## Borel subgroup from a choice of positive roots

Conversely, a **choice of positive roots** (equivalently, a set of
simple roots \(\Delta \subseteq \Phi^+\)) determines a unique Borel subgroup:
\[
B(\Phi^+) = T \cdot \prod_{\alpha \in \Phi^+} U_\alpha.
\]

This gives a bijection between:

- Systems of positive roots \(\Phi^+ \subseteq \Phi\)
- Borel subgroups containing \(T\)
- Chambers in the apartment \(V = X^*(T) \otimes \mathbb{R}\)
- Elements of \(W \backslash\) (set of Borel subgroups) $\cong W$ (since all
  Borel subgroups are conjugate).

## Parabolic subgroups

For any subset \(I \subseteq \Delta\) of simple roots, the corresponding
**standard parabolic subgroup** \(P_I \supseteq B\) has Levi decomposition
\[
P_I = L_I \ltimes U_I,
\]
where:

- \(L_I = \langle T, U_\alpha : \alpha \in \Phi_I \cup \Phi_{-I} \rangle\)
  is the **Levi subgroup** containing \(T\), with root system
  \(\Phi_I = \Phi \cap \mathbb{Z} I\),
- \(U_I = \prod_{\alpha \in \Phi^+ \setminus \Phi_I} U_\alpha\)
  is the **unipotent radical** of \(P_I\).

**Special cases:**

- \(I = \emptyset\): \(P_\emptyset = B\) (the Borel subgroup itself).
- \(I = \Delta\): \(P_\Delta = G\) (the whole group).
- \(|I| = |\Delta| - 1\): **minimal parabolics** (maximal proper parabolics).

## Positive Weyl chamber

Choosing \(\Phi^+\) is the same as choosing a **Weyl chamber**: the
subset
\[
C(\Phi^+) = \{v \in V : \langle v, \alpha^\vee \rangle > 0 \text{ for all } \alpha \in \Delta\}
\subseteq V = X^*(T)_{\mathbb{R}}.
\]
The Weyl group \(W\) acts simply transitively on the set of Weyl chambers,
so on the set of choices of \(\Phi^+\).

## Relation to Bruhat decomposition

The product structure of \(U\) yields the **Bruhat decomposition**:
\[
G = \bigsqcup_{w \in W} B\, w\, B = \bigsqcup_{w \in W} U\, w\, B.
\]
The **big cell** corresponds to \(w = w_0\) (longest Weyl group element):
\[
U \cdot w_0 \cdot B \subseteq G
\]
is an open dense subset, isomorphic to \(\mathbb{A}^{|\Phi|}\) as a variety.
The big cell is the algebraic-group analogue of Gauss elimination.

## Role in representation theory

- **Highest weight theory**: A representation of \(G\) decomposes under
  \(T\) into weight spaces; the highest weight is the unique weight on
  which \(U\) acts trivially. This is well-defined because \(U = R_u(B)\)
  is the choice of "positive unipotent radical" that selects the highest
  weight.

- **Induced representations / parabolic induction**: Given a Levi
  decomposition \(P = L \ltimes U\), one constructs representations of
  \(G\) by inducing from \(L\) (via the quotient \(P \to L\)).
  This is the algebraic-group version of parabolic induction for
  \(p\)-adic groups.

- **Iwasawa decomposition** (over local fields):
  \(G(F) = K \cdot A^+ \cdot U(F)\) mirrors the root-subgroup
  decomposition.
