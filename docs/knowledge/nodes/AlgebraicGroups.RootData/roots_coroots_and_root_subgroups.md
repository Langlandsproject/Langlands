---
id: root_data.roots_coroots_and_root_subgroups
title: Roots, Coroots, and Root Subgroups
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- reductive_groups.reductive_groups
- reductive_groups.maximal_tori
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are roots, coroots, and root subgroups defined uniformly for arbitrary reductive groups, not just classical types?"
  verdict: "Yes. Each root α of (G, T) gives a unique closed root subgroup U_α isomorphic to G_a; the coroot is the unique 1-parameter subgroup arising from the SL_2-subgroup attached to ±α."
tags:
- roots
- coroots
- root-subgroups
- root-data-and-duality
---

# Roots, Coroots, and Root Subgroups

To a reductive group \(G\) with maximal torus \(T\) one associates:

- a finite set \(\Phi \subseteq X^*(T)\) of **roots**;
- a corresponding set \(\Phi^\vee \subseteq X_*(T)\) of **coroots**;
- for each \(\alpha \in \Phi\), a **root subgroup** \(U_\alpha \subseteq G\)
  isomorphic to \(\mathbb{G}_a\).

These are the building blocks of the entire structure theory of \(G\).

## Roots

Let \(G\) be a connected reductive group over an algebraically closed
field \(k\) with maximal torus \(T\). The torus acts on the Lie
algebra \(\mathfrak{g} = \operatorname{Lie}(G)\) by the adjoint
representation, decomposing it into weight spaces:
\[
\mathfrak{g} \;=\; \mathfrak{t} \;\oplus\; \bigoplus_{\alpha \in \Phi} \mathfrak{g}_\alpha,
\]
where \(\mathfrak{t} = \operatorname{Lie}(T)\) and
\(\mathfrak{g}_\alpha = \{X \in \mathfrak{g} : \mathrm{Ad}(t) X = \alpha(t) X \text{ for all } t \in T\}\)
for non-zero weight \(\alpha \in X^*(T)\).

The **roots** are
\[
\Phi \;=\; \Phi(G, T) \;:=\; \{\alpha \in X^*(T) \setminus \{0\} : \mathfrak{g}_\alpha \ne 0\}.
\]

Properties:
- \(\Phi\) is finite;
- \(\dim \mathfrak{g}_\alpha = 1\) for each \(\alpha \in \Phi\);
- \(\Phi = -\Phi\) (roots come in pairs \(\pm \alpha\));
- \(\Phi\) generates a sublattice of \(X^*(T) \otimes \mathbb{Q}\) — its
  rank is the semisimple rank of \(G\).

## Root subgroups

For each \(\alpha \in \Phi\), there is a unique connected closed
subgroup \(U_\alpha \subseteq G\) with:

- \(U_\alpha\) is isomorphic to \(\mathbb{G}_a\) (as algebraic group);
- \(\operatorname{Lie}(U_\alpha) = \mathfrak{g}_\alpha\);
- \(T\) normalises \(U_\alpha\), acting through \(\alpha\):
  \(t \cdot u_\alpha(x) \cdot t^{-1} = u_\alpha(\alpha(t) \cdot x)\).

The \(U_\alpha\) are the **root subgroups** of \(G\) relative to \(T\).

## Coroots

For each \(\alpha \in \Phi\), the subgroup
\(\langle U_\alpha, U_{-\alpha}, T \rangle\) generates a subgroup
\(G_\alpha\) of \(G\) (the **rank-1 subgroup**) that is isogenous to
\(\mathrm{SL}_2\). The coroot
\[
\alpha^\vee : \mathbb{G}_m \;\longrightarrow\; T
\]
is defined as the unique cocharacter such that:
\[
\alpha^\vee(\mathbb{G}_m) \;=\; G_\alpha \cap T, \qquad \langle \alpha, \alpha^\vee \rangle = 2.
\]

This packages the \(\mathrm{SL}_2\)-data near the \(\alpha\)-axis into
a 1-parameter subgroup of \(T\).

## Commutation relations

For non-proportional roots \(\alpha, \beta \in \Phi\), the
**Steinberg relation** holds:
\[
[u_\alpha(x), u_\beta(y)] \;=\; \prod_{i\alpha + j\beta \in \Phi, \; i, j > 0} u_{i\alpha + j\beta}(c_{i,j}^{\alpha, \beta} x^i y^j),
\]
where the integers \(c_{i,j}^{\alpha, \beta}\) are the **Chevalley
structure constants** (an explicit description in each Dynkin type).

For \(\alpha, -\alpha\):
\[
\langle U_\alpha, U_{-\alpha} \rangle \;\subseteq\; \mathrm{SL}_2\text{-type subgroup}.
\]

## Examples

### \(\mathrm{GL}_n\)

\(T\) = diagonal matrices; \(X^*(T) = \mathbb{Z}\langle \varepsilon_1, \ldots, \varepsilon_n \rangle\);
\(\Phi = \{\varepsilon_i - \varepsilon_j : i \ne j\}\).

For \(\alpha = \varepsilon_i - \varepsilon_j\):
- \(U_\alpha\) = matrices with single non-zero off-diagonal entry at
  position \((i, j)\), i.e.\ \(I + x E_{ij}\) for \(x \in k\).
- \(\alpha^\vee\) = the cocharacter \(t \mapsto \mathrm{diag}(1, \ldots, t, \ldots, t^{-1}, \ldots, 1)\)
  with \(t\) in position \(i\) and \(t^{-1}\) in position \(j\).

### \(\mathrm{Sp}_{4}\) (type \(C_2\))

8 roots: \(\pm \varepsilon_1 \pm \varepsilon_2\), \(\pm 2\varepsilon_1\),
\(\pm 2\varepsilon_2\). Long roots \(\pm 2 \varepsilon_i\) have coroots
\(\alpha^\vee = \varepsilon_i^\vee\) (themselves a basis of \(X_*\)).

## Functoriality

For a morphism \(f : (G, T) \to (G', T')\) of reductive groups
matching maximal tori:
- \(f\) induces a map of character lattices \(X^*(T') \to X^*(T)\);
- \(f\) maps \(U_\alpha\) to \(U'_{f^*(\alpha)}\) (compatibly with
  Steinberg relations).

This makes the root subgroup structure functorial in pairs \((G, T)\).

## Borel subgroups and the choice of positive roots

A choice of Borel subgroup \(B \supseteq T\) determines a system of
**positive roots** \(\Phi^+ \subseteq \Phi\) (those occurring in
\(\operatorname{Lie}(B)\)). The Borel decomposes as:
\[
B \;=\; T \cdot \prod_{\alpha \in \Phi^+} U_\alpha,
\]
with the product taken in any order (the resulting variety is well-
defined, independent of ordering).

The corresponding **opposite Borel** \(B^-\) has the opposite
positivity, and \(U \cdot U^- \cdot T\) is the **big cell**, open
dense in \(G\).

## Role in Langlands

- **Local fields**: parahoric subgroups and Iwahori subgroups are
  defined via the root subgroups (each contributes either trivially
  or as a "level" in the parahoric filtration).
- **Bruhat decomposition** \(G = \sqcup_{w \in W} BwB\): each cell
  involves explicit root subgroup products via the Steinberg
  relations.
- **Galois cohomology of root subgroups**: \(H^1(k, U_\alpha) = 0\)
  (since \(U_\alpha = \mathbb{G}_a\) is "additively trivial"),
  contributing to vanishing in the calculation of \(H^1(k, G)\).

## Mathlib

Root subgroups specifically not formalised. Abstract roots and
coroots via `Mathlib.LinearAlgebra.RootSystem.*`.

## References

- Borel, *Linear Algebraic Groups* (1991), §13.
- Springer, *Linear Algebraic Groups* (1998), §7.
- Steinberg, *Lectures on Chevalley Groups* (1968).
- Carter, *Simple Groups of Lie Type* (1972).

## Prerequisite Topics

- [[node:reductive_groups.reductive_groups|Reductive Groups]]
- [[node:reductive_groups.maximal_tori|Maximal Tori]]
