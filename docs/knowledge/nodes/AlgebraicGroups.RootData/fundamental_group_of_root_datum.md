---
id: root_data.fundamental_group_of_root_datum
title: Fundamental Group of a Root Datum
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is this combinatorial fundamental group defined uniformly for any root datum, recovering the algebraic fundamental group of the associated split reductive group?"
  verdict: "Yes. The construction π_1 = X / Z·Φ^∨ depends only on the root datum and recovers the algebraic fundamental group of the split connected reductive group with that root datum."
tags:
- fundamental-group
- root-datum
- root-data-and-duality
---

# Fundamental Group of a Root Datum

The **fundamental group** \(\pi_1(\Psi)\) of a root datum
\(\Psi = (X, \Phi, X^\vee, \Phi^\vee)\) is the quotient of the
cocharacter lattice by the coroot lattice. Combinatorially, it
classifies the "isogeny gap" between simply-connected and adjoint
forms; geometrically, it agrees with the algebraic fundamental group
of the associated reductive group.

## Definition

For a root datum \(\Psi = (X, \Phi, X^\vee, \Phi^\vee)\) with coroot
lattice \(Q^\vee = \mathbb{Z}\Phi^\vee \subseteq X^\vee\):

\[
\pi_1(\Psi) \;:=\; X^\vee \big/ Q^\vee.
\]

Dually, the **weight lattice** is
\[
P^\vee \;:=\; \{x \in X^\vee \otimes \mathbb{Q} : \langle \alpha, x \rangle \in \mathbb{Z} \text{ for all } \alpha \in \Phi\},
\]
and one has the inclusions
\[
Q^\vee \;\subseteq\; X^\vee \;\subseteq\; P^\vee
\]
(when \(\Phi\) spans \(X \otimes \mathbb{Q}\), i.e.\ in the semisimple
case). The full fundamental group of the root system is
\(P^\vee / Q^\vee\); the "lattice gap" \(P^\vee / X^\vee\) is the
**centre** of the associated group.

## Isogeny structure

For an irreducible root system \(\Phi\), the lattice gap \(P^\vee / Q^\vee\)
is a finite abelian group, and any intermediate lattice
\(Q^\vee \subseteq X^\vee \subseteq P^\vee\) gives a different
isogeny form of the same group:

| Type | \(P^\vee / Q^\vee\) | Forms |
|---|---|---|
| \(A_{n-1}\) | \(\mathbb{Z}/n\) | \(\mathrm{SL}_n\) (sc, \(X^\vee = Q^\vee\)) and \(\mathrm{PGL}_n\) (ad, \(X^\vee = P^\vee\)), plus intermediate quotients |
| \(B_n\) | \(\mathbb{Z}/2\) | \(\mathrm{Spin}_{2n+1}\) and \(\mathrm{SO}_{2n+1}\) |
| \(C_n\) | \(\mathbb{Z}/2\) | \(\mathrm{Sp}_{2n}\) and \(\mathrm{PSp}_{2n}\) |
| \(D_n\), \(n\) odd | \(\mathbb{Z}/4\) | \(\mathrm{Spin}_{2n}\), \(\mathrm{SO}_{2n}\), \(\mathrm{HSpin}_{2n}\), adjoint |
| \(D_n\), \(n\) even | \(\mathbb{Z}/2 \times \mathbb{Z}/2\) | similar |
| \(E_6\) | \(\mathbb{Z}/3\) | sc and adjoint |
| \(E_7\) | \(\mathbb{Z}/2\) | sc and adjoint |
| \(E_8\), \(F_4\), \(G_2\) | \(1\) | sc = ad (unique form) |

## Relation to the algebraic fundamental group

For a connected reductive group \(G\) with root datum \(\Psi\):
\[
\pi_1(G) \;=\; \pi_1(\Psi) \;=\; X_*(T) / \mathbb{Z}\Phi^\vee.
\]
The combinatorial \(\pi_1\) agrees with the algebraic fundamental
group ([[node:kottwitz.algebraic_fundamental_group|see node]]),
which for complex groups also agrees with the topological
fundamental group of \(G(\mathbb{C})\).

## Examples

### \(\mathrm{GL}_n\)

Root datum has \(X^\vee = \mathbb{Z}^n\),
\(Q^\vee = \{(a_1, \dots, a_n) : \sum a_i = 0\}\), so
\(\pi_1 = \mathbb{Z}\) (via the sum). Topologically,
\(\mathrm{GL}_n(\mathbb{C})\) deformation-retracts to \(\mathrm{U}(n)\),
which has \(\pi_1 = \mathbb{Z}\).

### \(\mathrm{SL}_n\)

\(X^\vee = Q^\vee\), so \(\pi_1 = 0\). \(\mathrm{SL}_n(\mathbb{C})\)
is simply connected.

### \(\mathrm{PGL}_n\)

\(X^\vee = P^\vee\) (maximally large), and \(P^\vee / Q^\vee = \mathbb{Z}/n\).
\(\pi_1^{\mathrm{top}}(\mathrm{PGL}_n(\mathbb{C})) = \mathbb{Z}/n\).

### \(\mathrm{SO}_{2n+1}\) (\(B_n\))

\(\pi_1 = \mathbb{Z}/2\); the universal cover is the spin group
\(\mathrm{Spin}_{2n+1}\).

## Duality

Under root-datum duality, the lattice gap swaps:
\[
\pi_1(\Psi) \;=\; X^\vee / Q^\vee \;\xleftrightarrow{\text{dual}}\; X / Q \;=\; Z(\hat\Psi).
\]
This is the **Kottwitz duality**:
\[
\pi_1(G) \;=\; X^*(Z(\hat G)),
\]
which makes the centre of the dual group into the Pontryagin dual of
the fundamental group.

## Mathlib

`Mathlib.LinearAlgebra.RootSystem.*` partially formalises the lattice
chains \(Q \subseteq X \subseteq P\); the explicit quotients giving
\(\pi_1\) for classical types are accessible.

## References

- Springer, *Linear Algebraic Groups* (1998), §7.
- Milne, *Reductive Groups* (notes), §17.
- Bourbaki, *Groupes et Algèbres de Lie* VI (1968), tableaux.

## Prerequisite Topics

- [[node:root_data.root_data|Root Data]]
