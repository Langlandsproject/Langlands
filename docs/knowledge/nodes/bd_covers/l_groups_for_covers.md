---
id: bd_covers.l_groups_for_covers
title: L-Groups for Covers
kind: topic
status: admitted
primary_topic: bd_covers
topics:
- bd_covers
uses:
- bd_covers.dual_groups_for_covers
- root_data_and_duality.l_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the L-group for covering groups defined uniformly across BD covers, with the Galois action handled correctly?"
  verdict: "Yes. The L-group of a BD cover is ĝ G^cover ⋊ W_F, with ĝ G^cover constructed from the rescaled root datum and W_F acting through pinned automorphisms determined by the BD data."
tags:
- l-groups
- covers
- bd-covers
---

# L-Groups for Covers

The **L-group of a Brylinski-Deligne cover** is the receptacle of
L-parameters for the metaplectic representation theory of the cover.
Built from the dual group of the cover plus a Galois action, it
extends the classical L-group construction to all BD covers.

## Setup

Let \(G\) be a connected reductive group over a local field \(F\), and
let \(\tilde G\) be a Brylinski-Deligne extension of \(G\) by
\(\mathbf{K}_2\) classified by data \((Q, \mathcal{E}, \phi)\). Pick
a continuous character \(\chi : \mu_n \to \mathbb{C}^\times\) to specialise
the BD extension to a finite-degree cover:
\[
1 \;\to\; \mu_n \;\to\; \overline G \;\to\; G(F) \;\to\; 1.
\]

## Dual group of the cover

The dual group \(\hat{\overline G}\) is constructed from the rescaled
root datum (rescaling cocharacters and coroots according to \(Q\) modulo
\(n\)); see
[[node:bd_covers.dual_groups_for_covers|dual groups for covers]].

\(\hat{\overline G}\) is a connected reductive complex group, possibly
**different** from \(\hat G\) — the rescaling can change Dynkin type.

## L-group construction

The **L-group of the cover** is the semi-direct product:
\[
{}^L \overline G \;:=\; \hat{\overline G}(\mathbb{C}) \;\rtimes\; W_F,
\]
where:
- \(W_F\) is the Weil group of \(F\);
- The action of \(W_F\) on \(\hat{\overline G}\) is the natural one
  coming from the Galois action on the rescaled root datum.

For the trivial cover (\(n = 1\)): \({}^L \overline G = {}^L G\) (the
classical L-group).

For metaplectic covers (\(n \ge 2\)): \({}^L \overline G\) can be
significantly different from \({}^L G\).

## Examples

### Metaplectic double cover of \(\mathrm{SL}_2\)

For \(\overline{\mathrm{SL}_2}\) (the genuine double cover):
\[
\hat{\overline{\mathrm{SL}_2}} \;=\; \mathrm{SL}_2(\mathbb{C}).
\]
(Effectively swaps the dual: \(\widehat{\mathrm{SL}_2} = \mathrm{PGL}_2\)
classically, but for the metaplectic cover the dual is \(\mathrm{SL}_2\).)

L-parameters for \(\overline{\mathrm{SL}_2}\): continuous maps
\(W_F \to \mathrm{SL}_2(\mathbb{C}) \rtimes W_F\) — these correspond
to 2-dimensional Galois representations of even determinant.

### Kazhdan-Patterson cover of \(\mathrm{GL}_r\)

For the \(n\)-fold metaplectic cover \(\overline{\mathrm{GL}_r}^{(n)}\):
\[
\hat{\overline{\mathrm{GL}_r}^{(n)}} \;=\; \mathrm{GL}_r(\mathbb{C})
\]
when \(\gcd(n, r) = 1\); otherwise a more subtle rescaled group.

### \(\overline{G}_2\) and exceptional covers

For the metaplectic cover of \(G_2\): the dual is again \(G_2\) (self-
dual under reflection-coroot duality), but with a non-trivial central
extension structure on the L-group reflecting the K_2 data.

## L-parameters for covers

An **L-parameter for \(\overline G\)** is a continuous homomorphism
\[
\varphi : W_F \times \mathrm{SL}_2(\mathbb{C}) \;\to\; {}^L \overline G
\]
satisfying:

- Commuting with projection to \(W_F\);
- Semisimple image of \(\varphi|_{W_F}\);
- Algebraic restriction to \(\mathrm{SL}_2(\mathbb{C})\).

Up to \(\hat{\overline G}\)-conjugacy.

## Genuine vs.\ non-genuine

Representations \(\pi\) of \(\overline G\) split into:

- **Non-genuine**: \(\mu_n\) acts trivially; these are representations
  of \(G(F)\) lifted to \(\overline G\). They factor through the
  classical L-group.
- **Genuine**: \(\mu_n\) acts by \(\chi\) (the chosen non-trivial
  character). These are the "honest" covering representations, with
  L-parameters into the genuine part of \({}^L \overline G\).

The L-parameter formalism distinguishes these via the central
character of the L-parameter restricted to the centre of \(\hat{\overline G}\).

## Functoriality

L-morphisms \({}^L \overline H \to {}^L \overline G\) between covers
encode the functoriality phenomena specific to the metaplectic
setting:

- **Shimura correspondence**: \({}^L \overline{\mathrm{SL}_2} \to {}^L \mathrm{PGL}_2\)
  for half-integral weight modular forms.
- **Kazhdan-Patterson lifts**: \({}^L \overline{\mathrm{GL}_r}^{(n)} \to {}^L \mathrm{GL}_r\).
- **Theta correspondence**: \({}^L \overline{\mathrm{Sp}_{2n}} \times {}^L \mathrm{O}_m \to \ldots\)
  expressing the Howe duality at the L-group level.

## L-functions for covers

For an L-parameter \(\varphi\) and a finite-dimensional representation
\(r\) of \({}^L \overline G\):
\[
L(s, \pi, r) \;:=\; L(s, r \circ \varphi)
\]
generalises the classical L-function to covers.

## Role in modern Langlands

- **Metaplectic Langlands**: organises automorphic forms on covering
  groups.
- **Special L-values**: many special L-values are best expressed via
  Eisenstein series on covers; the dual-group recipe determines the
  natural L-functions to evaluate.
- **Theta correspondence and theta lifts**: rigorous framework for
  Howe's dual pair theory.

## References

- Weissman, *Metaplectic tori over local fields* (Pac.\ J.\ Math.\
  2009).
- Gan–Gao, *The Langlands-Weissman program for Brylinski-Deligne
  extensions* (Asterisque 2018).
- Gan–Gao–Weissman, *L-Groups and the Langlands Program for Covering
  Groups* (Asterisque 2018).

## Prerequisite Topics

- [[node:bd_covers.dual_groups_for_covers|Dual Groups for Covers]]
- [[node:root_data_and_duality.l_groups|L-Groups]]
