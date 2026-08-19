---
id: reductive_groups.derived_group_center_adjoint_sc_cover
title: Derived Group, Center, Adjoint Group, and Simply Connected Cover
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ReductiveGroups
topics:
- AlgebraicGroups.ReductiveGroups
uses:
- reductive_groups.reductive_groups
- reductive_groups.central_isogenies
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are these four canonical subgroups/quotients of a reductive group defined functorially and uniformly across types?"
  verdict: "Yes. The derived subgroup, the centre, the adjoint quotient, and the simply connected cover are all functorial constructions that fit into the canonical exact sequence 1 → Z(G^sc) → G^sc → G_der → 1."
tags:
- derived-group
- center
- adjoint-group
- simply-connected-cover
- reductive-structure
---

# Derived Group, Center, Adjoint Group, and Simply Connected Cover

A connected reductive group \(G\) carries four canonical subgroups /
quotients that organise its isogeny structure:

| Object | Notation | Role |
|---|---|---|
| **Derived subgroup** | \(G_{\mathrm{der}} = [G, G]\) | maximal semisimple subgroup |
| **Centre** | \(Z(G)\) | maximal subgroup of multiplicative type |
| **Adjoint quotient** | \(G_{\mathrm{ad}} = G / Z(G)\) | trivial-centre form |
| **Simply connected cover** | \(G^{\mathrm{sc}}\) of \(G_{\mathrm{der}}\) | trivial-π_1 form |

## The basic exact sequences

For any connected reductive \(G\):

\[
1 \;\longrightarrow\; Z(G)^\circ \;\longrightarrow\; G \;\longrightarrow\; G/Z(G)^\circ \;\longrightarrow\; 1
\]

\[
G \;=\; Z(G)^\circ \cdot G_{\mathrm{der}}, \qquad Z(G)^\circ \cap G_{\mathrm{der}} \subseteq Z(G_{\mathrm{der}})
\]

with \(Z(G)^\circ\) a connected torus.

For the derived (semisimple) part:
\[
1 \;\longrightarrow\; Z(G^{\mathrm{sc}}) \;\longrightarrow\; G^{\mathrm{sc}} \;\stackrel{\pi}{\longrightarrow}\; G_{\mathrm{der}} \;\longrightarrow\; 1,
\]
with \(Z(G^{\mathrm{sc}})\) finite of multiplicative type.

And:
\[
1 \;\longrightarrow\; Z(G_{\mathrm{der}}) \;\longrightarrow\; G_{\mathrm{der}} \;\longrightarrow\; G_{\mathrm{ad}} \;\longrightarrow\; 1.
\]

## Derived subgroup \(G_{\mathrm{der}}\)

\(G_{\mathrm{der}} = [G, G]\) is the closed normal subgroup generated
by commutators. For connected reductive \(G\): \(G_{\mathrm{der}}\)
is connected semisimple, with the same root datum as \(G\) modulo
the abelianisation lattice.

Examples:
- \(\mathrm{GL}_n\): \(G_{\mathrm{der}} = \mathrm{SL}_n\).
- \(\mathrm{Sp}_{2n}\): \(G_{\mathrm{der}} = \mathrm{Sp}_{2n}\) (already
  semisimple, perfect).
- \(\mathrm{GSp}_{2n}\) (general symplectic):
  \(G_{\mathrm{der}} = \mathrm{Sp}_{2n}\).

## Centre \(Z(G)\)

The centre \(Z(G)\) is the kernel of the adjoint representation
\(\mathrm{Ad} : G \to \mathrm{GL}(\mathfrak{g})\). It is a group of
multiplicative type (a closed subgroup of an algebraic torus).

The **connected centre** \(Z(G)^\circ\) is a torus (the "central
torus"). The component group \(Z(G)/Z(G)^\circ\) is finite.

Examples:
- \(Z(\mathrm{GL}_n) = \mathbb{G}_m\) (scalar matrices); connected.
- \(Z(\mathrm{SL}_n) = \mu_n\); finite, not connected unless \(n = 1\).
- \(Z(\mathrm{Sp}_{2n}) = \mu_2\); finite.
- \(Z(\mathrm{Spin}_{2n+1}) = \mu_2\); finite.
- \(Z(E_8) = 1\); trivial.

## Adjoint group \(G_{\mathrm{ad}}\)

\(G_{\mathrm{ad}} := G / Z(G)\), the **adjoint form**:
- \(Z(G_{\mathrm{ad}}) = 1\) (trivial centre);
- \(\pi_1(G_{\mathrm{ad}})\) is the dual of \(Z(G^{\mathrm{sc}})\);
- The root datum of \(G_{\mathrm{ad}}\) has \(X^* = \mathbb{Z}\Phi\)
  (root lattice).

Examples:
- \(\mathrm{PGL}_n = \mathrm{GL}_n / \mathbb{G}_m = \mathrm{SL}_n / \mu_n\).
- \(\mathrm{PSp}_{2n} = \mathrm{Sp}_{2n} / \mu_2\).
- \(\mathrm{PSO}_n = \mathrm{SO}_n / Z(\mathrm{SO}_n)\).

## Simply connected cover \(G^{\mathrm{sc}}\)

For a semisimple \(G\), the **simply connected cover** is the unique
isogeny \(G^{\mathrm{sc}} \to G\) with \(G^{\mathrm{sc}}\) simply
connected (\(\pi_1 = 0\)). The kernel is a finite central subgroup,
isomorphic to \(\pi_1(G)\) (under Pontryagin duality with
\(Z(G^{\mathrm{sc}})\)).

For a reductive group: define \(G^{\mathrm{sc}}\) as the simply
connected cover of \(G_{\mathrm{der}}\); but **\(G^{\mathrm{sc}}\) does
NOT cover \(G\) directly** — only \(G_{\mathrm{der}}\). There's a
canonical homomorphism \(G^{\mathrm{sc}} \to G\), but it need not be
surjective onto \(G\).

Examples:
- \((\mathrm{PGL}_n)^{\mathrm{sc}} = \mathrm{SL}_n\).
- \((\mathrm{SO}_n)^{\mathrm{sc}} = \mathrm{Spin}_n\).
- \((\mathrm{PSp}_{2n})^{\mathrm{sc}} = \mathrm{Sp}_{2n}\).

## Z-extensions and pullbacks

For working with non-simply-connected \(G\), one often uses a
**\(z\)-extension**:
\[
1 \;\to\; Z \;\to\; G' \;\to\; G \;\to\; 1
\]
with \(Z\) an induced torus and \(G'^{\mathrm{der}}\) simply connected.
The existence is a theorem of Langlands and is essential for the
Kottwitz formalism of stable conjugacy and rigid inner forms.

## Lattice description

For a split reductive \(G\) with root datum \((X, \Phi, X^\vee, \Phi^\vee)\):

| Object | \(X\) | \(X^\vee\) |
|---|---|---|
| \(G\) | \(X\) | \(X^\vee\) |
| \(G_{\mathrm{der}}\) | \(X / X^{W \cdot \Phi^\perp}\) | \(\mathbb{Z}\Phi^\vee \subseteq X^\vee\) |
| \(G_{\mathrm{ad}}\) | \(\mathbb{Z}\Phi\) | \(P^\vee\) (weight lattice) |
| \(G^{\mathrm{sc}}\) | \(P\) (weight lattice) | \(\mathbb{Z}\Phi^\vee\) |

The isogeny chain \(G^{\mathrm{sc}} \to G_{\mathrm{der}} \to G_{\mathrm{ad}}\)
corresponds dually to the lattice inclusions
\(\mathbb{Z}\Phi^\vee \subseteq X^\vee_{\mathrm{der}} \subseteq P^\vee\).

## Role in Langlands

- **L-group construction**: the dual group \(\hat G\) swaps simply-
  connected and adjoint properties; \(\hat{G^{\mathrm{sc}}} = \hat G^{\mathrm{ad}}\).
- **Rigid inner forms (Kaletha)**: defined using \(z\)-extensions to
  rigidify non-simply-connected cohomological subtleties.
- **Hasse principle**: simply connected groups satisfy the Hasse
  principle (Chernousov, Kneser); adjoint groups generally don't.
- **Stable conjugacy**: defined relative to a \(z\)-extension; lifts
  cleanly to the simply-connected cover.

## References

- Borel, *Linear Algebraic Groups* (1991), §14.
- Conrad, *Reductive group schemes* (Notes, 2014), §6.
- Milne, *Reductive Groups* (notes), §19–21.

## Prerequisite Topics

- [[node:reductive_groups.reductive_groups|Reductive Groups]]
- [[node:reductive_groups.central_isogenies|Central Isogenies]]
