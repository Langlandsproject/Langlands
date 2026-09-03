---
id: buildings.affine_root_systems
title: Affine Root Systems
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Buildings
topics:
- AlgebraicGroups.Buildings
uses:
- root_data.root_systems
- buildings.valued_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are affine root systems treated uniformly, including reduced and non-reduced types?"
  verdict: "Yes. The affine root system is intrinsic to a reductive group and a local field; reduced types come from split groups, non-reduced (BC-types) from ramified non-split groups."
tags:
- affine-root-systems
- buildings-and-parahorics
---

# Affine Root Systems

An **affine root system** is the set of affine roots
\(\Psi = \{\alpha + n\}\) on a Euclidean space, arising from a
reductive group over a local field. They classify the hyperplane
arrangement of a Bruhat-Tits apartment and give the affine
Coxeter group of the affine Weyl group.

## Definition

An **affine root system** in a Euclidean space \(\mathbb{A} = V\) is a
set \(\Psi\) of **affine linear functionals** \(\psi : \mathbb{A} \to \mathbb{R}\)
of the form \(\psi(x) = \alpha(x) + c\) for \(\alpha\) in the "vector
part" \(\Phi\) (an ordinary root system on \(V^*\)) and \(c \in \mathbb{R}\),
satisfying:

(AR1) \(\Psi\) is closed under affine reflections \(s_\psi\) (which
preserve hyperplanes \(\psi^{-1}(0)\)).

(AR2) The set of constants \(\{c : \alpha + c \in \Psi\}\) for each
\(\alpha\) forms a discrete sub-additive group of \(\mathbb{R}\).

(AR3) The vector part \(\Phi = \{\alpha : \exists c, \alpha + c \in \Psi\}\)
is a finite root system.

## Construction from reductive groups

For \(G\) a connected reductive group over a non-archimedean local
field \(F\) with maximal \(F\)-split torus \(S\) and apartment
\(\mathbb{A} = X_*(S) \otimes \mathbb{R}\):

The affine root system \(\Psi(G, S, F)\) consists of the affine roots
\(\alpha + n\) (or fractional translates, in ramified cases) coming
from:

- The root subgroups \(U_\alpha \subseteq G(F)\) for relative roots
  \(\alpha \in \Phi(G, S)\);
- The Moy-Prasad filtrations of \(U_\alpha\) by depth.

## Reduced vs.\ non-reduced

- **Reduced**: each "ray" \(\{\alpha + c : c \in \mathbb{R}\}\) gives
  one affine root (up to translation); the affine root system is
  \(\tilde X_n\) for some classical type.
- **Non-reduced**: some rays carry both \(\alpha\) and \(2\alpha\)
  contributions (e.g.\ for ramified \(\mathrm{SU}_n\)); the affine
  root system is of "twisted" or \(BC\)-type.

Non-reduced affine root systems classify ramified non-split groups,
which is essential for general local Langlands.

## Classification

**Affine Dynkin diagrams** (Kac labels):

| Type | Affine Dynkin | Description |
|---|---|---|
| \(\tilde A_n\) | cycle of \(n+1\) vertices | from \(\mathrm{SL}_{n+1}\) |
| \(\tilde B_n, \tilde C_n, \tilde D_n\) | classical extended diagrams | from \(\mathrm{Spin}, \mathrm{Sp}, \mathrm{SO}\) |
| \(\tilde E_6, \tilde E_7, \tilde E_8\) | exceptional extended | from \(E_6, E_7, E_8\) |
| \(\tilde F_4, \tilde G_2\) | exceptional extended | from \(F_4, G_2\) |
| \(\tilde{BC}_n\), \(\tilde{C}_n^\vee\), etc.\ | twisted affine | from ramified non-split groups |

## Affine Weyl group

The reflections \(s_\psi\) for \(\psi \in \Psi\) generate the
**affine Weyl group** \(W_{\mathrm{aff}}\):
\[
W_{\mathrm{aff}} \;=\; W \;\ltimes\; \mathbb{Z}\Phi^\vee,
\]
which is the Coxeter group of the affine Dynkin diagram.

## Alcoves and walls

For a reduced affine root system: the **alcoves** (= chambers of
\(W_{\mathrm{aff}}\) acting on \(\mathbb{A}\)) are the connected
components of the complement of \(\bigcup_\psi \psi^{-1}(0)\). They
form the top simplices of the Bruhat-Tits apartment.

## Examples

### \(\tilde A_1\)

\(\Psi = \{\pm\alpha + n : n \in \mathbb{Z}\}\); the affine roots are
"single rays at integer translates." Walls at \(\frac{1}{2}\mathbb{Z}\);
alcoves = \([n, n+\frac{1}{2}]\). Affine Weyl group = \(D_\infty\).

### \(\tilde A_n\)

\(\Psi\) consists of the affine roots \(e_i - e_j + n\) for \(i \ne j\),
\(n \in \mathbb{Z}\). Alcoves are simplices in the triangular lattice.

### \(\tilde{BC}_n\)

For ramified non-split groups: includes "half-integer" affine roots
\(\frac{1}{2}\alpha + n\) in addition to the integer ones.

## Role in Langlands

- **Affine Hecke algebra**: defined relative to the affine Weyl group;
  controls the representation theory of \(G(F)\) at the Iwahori
  block.
- **Macdonald polynomials**: defined via affine root systems;
  generalise Hall-Littlewood and Jack polynomials.
- **Cherednik DAHA**: double affine Hecke algebra, with quantum
  affine Weyl group; foundational for geometric Langlands at the
  affine level.

## Mathlib

Partial infrastructure via `Mathlib.LinearAlgebra.RootSystem.*`;
affine root systems specifically not formalised.

## References

- Macdonald, *Affine root systems and Dedekind's η-function*
  (Inventiones 1972).
- Macdonald, *Affine Hecke Algebras and Orthogonal Polynomials*
  (2003).
- Bruhat–Tits, *Groupes réductifs sur un corps local I, II*.

## Prerequisite Topics

- [[node:root_data.root_systems|Root Systems]]
- [[node:buildings.valued_root_data|Valued Root Data]]
