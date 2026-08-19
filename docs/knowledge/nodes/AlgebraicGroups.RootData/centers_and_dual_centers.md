---
id: root_data.centers_and_dual_centers
title: Centers and Dual Centers
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.fundamental_group_of_root_datum
- root_data.dual_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the duality between the centre of G and the algebraic fundamental group of ĝ G treated as a precise identity (not just a parallel)?"
  verdict: "Yes. The identification Z(ĝ G) = Pontryagin-dual of π_1(G) is an explicit theorem (Kottwitz), proven via root-datum duality."
tags:
- centers
- duality
- root-data-and-duality
---

# Centers and Dual Centers

Under root-datum duality, the centre of \(G\) and the fundamental
group of the dual side swap roles. This **Kottwitz duality** of finite
abelian groups is the foundation of L-parameter central characters
and of the parametrisation of L-packets.

## Centres

For a connected reductive group \(G\) with root datum
\((X, \Phi, X^\vee, \Phi^\vee)\):
\[
Z(G) \;=\; \ker\Big(\prod_{\alpha \in \Phi} \alpha : T \to \mathbb{G}_m^{\#\Phi}\Big) \;=\; \mathrm{D}(X / \mathbb{Z}\Phi),
\]

where \(\mathrm{D}\) is the Cartier dual (a finite group of
multiplicative type from the abelian group \(X/\mathbb{Z}\Phi\)).

Equivalently: \(Z(G) = T \cap \ker(\mathrm{ad})\), with character
group
\[
X^*(Z(G)) \;=\; X / \mathbb{Z}\Phi.
\]

This is the **abelianisation lattice** of \(X\) by the root lattice.

## Fundamental group

The **algebraic fundamental group** of \(G\) (= the fundamental group
of the root datum \(\Psi\)) is
\[
\pi_1(G) \;=\; X^\vee / \mathbb{Z}\Phi^\vee.
\]

(See [[node:root_data.fundamental_group_of_root_datum|fundamental group of a root datum]].)

## Duality identity

**Theorem (Kottwitz).** For any connected reductive group \(G\):
\[
Z(\hat G) \;=\; \mathrm{Hom}(\pi_1(G), \mathbb{C}^\times),
\]
the Pontryagin dual of the finite abelian group \(\pi_1(G)\).

In terms of lattices:
\[
X^*(Z(\hat G)) \;=\; X_*(G) / \mathbb{Z}\Phi^\vee \;=\; \pi_1(G).
\]

Dually:
\[
X^*(Z(G)) \;=\; X^*(G) / \mathbb{Z}\Phi \;=\; \pi_1(\hat G).
\]

## Examples

| \(G\) | \(Z(G)\) | \(\pi_1(G)\) | \(Z(\hat G)\) | \(\hat G\) |
|---|---|---|---|---|
| \(\mathbb{G}_m\) | \(\mathbb{G}_m\) | \(\mathbb{Z}\) | \(\mathbb{C}^\times\) | \(\mathbb{G}_m\) |
| \(\mathrm{GL}_n\) | \(\mathbb{G}_m\) | \(\mathbb{Z}\) | \(\mathbb{C}^\times\) | \(\mathrm{GL}_n\) |
| \(\mathrm{SL}_n\) | \(\mu_n\) | \(0\) | \(1\) | \(\mathrm{PGL}_n\) |
| \(\mathrm{PGL}_n\) | \(1\) | \(\mathbb{Z}/n\) | \(\mu_n\) | \(\mathrm{SL}_n\) |
| \(\mathrm{Sp}_{2n}\) | \(\mu_2\) | \(0\) | \(1\) | \(\mathrm{SO}_{2n+1}\) |
| \(\mathrm{SO}_{2n+1}\) | \(1\) | \(\mathbb{Z}/2\) | \(\mu_2\) | \(\mathrm{Sp}_{2n}\) |
| \(\mathrm{SO}_{2n}\) | \(\mu_2\) | \(\mathbb{Z}/2\) | \(\mu_2\) | \(\mathrm{SO}_{2n}\) |
| \(\mathrm{Spin}_{2n+1}\) | \(\mu_2\) | \(0\) | \(1\) | \(\mathrm{PSp}_{2n}\) |
| \(E_6\) sc | \(\mu_3\) | \(0\) | \(1\) | \(E_6\) adj |
| \(E_8\) | \(1\) | \(0\) | \(1\) | \(E_8\) |

The swap pattern is consistent: the column \(Z(G)\) matches the column
\(Z(\hat G)\) of the dual entry (under the natural Pontryagin
duality).

## Central characters of representations

A representation of \(G\) has a **central character** valued in the
character group \(X^*(Z(G))\). Under local Langlands, this central
character corresponds to an L-parameter component in:
\[
\mathrm{Hom}(Z(\hat G), \mathbb{C}^\times) \;=\; \pi_1(G)^{\mathrm{dual}},
\]
giving a fundamental compatibility between representation-side and
parameter-side data.

For the local Langlands correspondence:
\[
\Pi(G(F)) \;\to\; \Phi(W_F \to {}^L G), \qquad \pi \mapsto \varphi_\pi
\]
sends the central character \(\omega_\pi : Z(G)(F) \to \mathbb{C}^\times\)
to the "central character" of \(\varphi_\pi\) (its value on \(W_F^{\mathrm{ab}}\)
restricted via \(Z(\hat G) \subseteq \hat G\)).

## Twisted version with Galois action

For non-split \(G\) with Galois action on the root datum: the centre
becomes a Galois module, and:
\[
H^1(F, Z(G)) \;\cong\; \pi_0(Z(\hat G)^{W_F}) \;\cong\; \mathrm{Irr}(S_\varphi),
\]
where \(S_\varphi\) is the component group of an L-parameter
\(\varphi\). This is the **Kottwitz-Shelstad component group**, which
labels L-packet members.

## Mathlib

`Mathlib.LinearAlgebra.RootSystem.*` provides infrastructure for the
lattice gap \(\mathbb{Z}\Phi \subseteq X \subseteq P\); the explicit
identification with centres/fundamental groups requires algebraic
group infrastructure.

## References

- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984), §1.
- Borel, *Automorphic L-functions* (Corvallis 1979), §2.
- Springer, *Linear Algebraic Groups* (1998), §7.

## Prerequisite Topics

- [[node:root_data.fundamental_group_of_root_datum|Fundamental Group of a Root Datum]]
- [[node:root_data.dual_root_data|Dual Root Data]]
