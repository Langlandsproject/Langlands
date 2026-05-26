---
id: root_data_and_duality.dual_reductive_groups
title: Dual Reductive Groups
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.dual_root_data
- root_data_and_duality.classification_of_split_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the dual group construction functorial across the entire family of reductive groups, with the Galois twist for non-split forms?"
  verdict: "Yes. The dual group ĝ G is functorially attached to (G, T) via root-datum duality; the Galois action upgrades it to the L-group for non-split G."
tags:
- dual-groups
- root-data-and-duality
---

# Dual Reductive Groups

The **dual reductive group** \(\hat G\) of a connected reductive group
\(G\) is the unique connected complex reductive group whose root
datum is dual to that of \(G\). It is the Langlands dual of \(G\)
without Galois action; see
[[node:root_data_and_duality.l_groups|L-groups]] for the Galois-twisted
version.

## Construction

Let \(G\) be a connected reductive group over a field \(k\), with
root datum \((X^*(T), \Phi, X_*(T), \Phi^\vee)\) for a chosen maximal
torus \(T \subseteq G\).

By the classification of split connected reductive groups (Chevalley-
Demazure), there is a unique split connected reductive group \(\hat G\)
over \(\mathbb{C}\) (or any algebraically closed field of
characteristic 0) with root datum
\[
(X_*(T), \Phi^\vee, X^*(T), \Phi),
\]
the dual root datum.

\(\hat G\) is well-defined up to non-canonical isomorphism (canonical
when a pinning is chosen).

## Examples

| \(G\) | \(\hat G\) | Comments |
|---|---|---|
| \(\mathbb{G}_m\) | \(\mathbb{G}_m\) | self-dual torus |
| \(T\) (torus) | \(\hat T = X^*(T) \otimes \mathbb{G}_m\) | torus duality |
| \(\mathrm{GL}_n\) | \(\mathrm{GL}_n\) | self-dual |
| \(\mathrm{SL}_n\) | \(\mathrm{PGL}_n\) | sc ↔ adj |
| \(\mathrm{PGL}_n\) | \(\mathrm{SL}_n\) | adj ↔ sc |
| \(\mathrm{Sp}_{2n}\) | \(\mathrm{SO}_{2n+1}\) | \(C_n \leftrightarrow B_n\) |
| \(\mathrm{SO}_{2n+1}\) | \(\mathrm{Sp}_{2n}\) | \(B_n \leftrightarrow C_n\) |
| \(\mathrm{SO}_{2n}\) | \(\mathrm{SO}_{2n}\) | \(D_n\) self-dual; sc vs ad swap inside |
| \(G_2\) | \(G_2\) | self-dual; long-short root swap |
| \(F_4\) | \(F_4\) | self-dual; long-short root swap |
| \(E_8\) | \(E_8\) | self-dual |

## Functoriality

The construction \(G \mapsto \hat G\) is **contravariant** on
isogenies and **covariant** at the level of pinned automorphisms:

- An isogeny \(G \to G'\) dualises to a (typically opposite-direction)
  isogeny \(\hat{G'} \to \hat G\).
- An outer automorphism \(\sigma \in \mathrm{Out}(G)\) lifts to
  \(\sigma \in \mathrm{Out}(\hat G)\) (preserving the dual structure).

## Centre and fundamental group swap

Under duality, the centre and the algebraic fundamental group swap:
\[
Z(\hat G) \;\cong\; X^*(\pi_1(G))^\vee, \qquad
\pi_1(\hat G) \;\cong\; X^*(Z(G))^\vee.
\]

Concretely:
- \(\mathrm{SL}_n\): \(Z = \mu_n\), \(\pi_1 = 0\) →
  \(\widehat{\mathrm{SL}_n} = \mathrm{PGL}_n\): \(Z = 1\), \(\pi_1 = \mathbb{Z}/n\).
- \(\mathrm{GL}_n\): \(Z = \mathbb{G}_m\), \(\pi_1 = \mathbb{Z}\) →
  \(\widehat{\mathrm{GL}_n}\): same (\(\mathrm{GL}_n\) self-dual,
  centre dual to fundamental group both \(\mathbb{Z}\)).

## Functorial structure preservation

- **Parabolics**: \(P \subseteq G\) corresponds to "dual parabolics"
  \(\hat P \subseteq \hat G\), giving the Levi-conjugate decomposition:
  Levi \(L\) of \(P\) → Levi \(\hat L\) of \(\hat P\).
- **Cuspidal data**: depth-zero \(L\)-packet \(\sigma\) of \(L(F)\)
  corresponds to L-parameter into \(\hat L\); Langlands quotient
  passes from \(\sigma\) to \(\hat L \hookrightarrow \hat G\).
- **Endoscopic groups** \(H \subseteq G\) (in a derived sense)
  correspond to centralisers of semisimple elements in \(\hat G\).

## Identification of the centre

\[
Z(\hat G) \;=\; \operatorname{Hom}(X_*(T)/Q^\vee, \mathbb{C}^\times) \;=\; \operatorname{Hom}(\pi_1(G), \mathbb{C}^\times).
\]

This is the **dual of \(\pi_1(G)\) as a finite abelian group**, and
is the relevant target for **central characters of L-packets** in the
local Langlands correspondence.

## Geometric Satake equivalence

**Theorem (Mirković-Vilonen, Lusztig, Ginzburg).** There is an
equivalence of monoidal categories:
\[
\mathrm{Perv}_{L^+ G}(\mathrm{Gr}_G) \;\simeq\; \mathrm{Rep}(\hat G),
\]
where \(\mathrm{Gr}_G\) is the affine Grassmannian and \(L^+ G = G(\mathcal{O})\)
acts on it. This gives a **purely geometric** construction of \(\hat G\)
intrinsic to the geometry of \(G\) — not from combinatorial duality
but from the symmetry of perverse sheaves.

## Role in Langlands

- **L-parameters**: continuous homomorphisms
  \(W_F \times \mathrm{SL}_2(\mathbb{C}) \to {}^L G\) up to
  \(\hat G\)-conjugacy parametrise L-packets of irreducible
  representations of \(G(F)\).
- **L-functions**: \(L(s, \pi, r)\) for an L-parameter
  \(\varphi : W_F \to \hat G\) and a finite-dimensional representation
  \(r : \hat G \to \mathrm{GL}_N\).
- **Functoriality**: morphisms \(\hat H \to \hat G\) conjecturally
  induce transfer of automorphic representations.
- **Endoscopy and stable conjugacy**: defined on the dual side via
  semisimple centralisers.

## References

- Borel, *Automorphic L-functions* (Corvallis 1979).
- Mirković–Vilonen, *Geometric Langlands duality and representations
  of algebraic groups over commutative rings* (Annals 2007).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984), §1.

## Prerequisite Topics

- [[node:root_data_and_duality.dual_root_data|Dual Root Data]]
- [[node:root_data_and_duality.classification_of_split_reductive_groups|Classification of Split Reductive Groups]]
