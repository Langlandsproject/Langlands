---
id: bd_covers.dual_groups_for_covers
title: Dual Groups for Covers
kind: topic
status: admitted
primary_topic: bd_covers
topics:
- bd_covers
uses:
- bd_covers.brylinski_deligne_k2_extensions
- root_data_and_duality.dual_root_data
- root_data_and_duality.langlands_dual_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the dual group defined for arbitrary metaplectic / BD covers, with the recipe applicable across reductive types?"
  verdict: "Yes. The construction (rescaling cocharacters / coroots by the Q-form modulo n) is uniform across types; specialisations to SL_n and Sp_n give the classical metaplectic duals."
tags:
- dual-groups
- covers
- bd-covers
---

# Dual Groups for Covers

For a Brylinski-Deligne (BD) central extension of \(G\) by
\(\mathbf{K}_2\), specialised by a character \(\chi : \mu_n \to \mathbb{C}^\times\),
the resulting **metaplectic cover** \(\overline G\) has its own
**dual group** \(\hat{\overline G}\) and **L-group**. The construction
(due to McNamara, Weissman, Gan-Gao-Weissman) extends Langlands
duality to the covering setting.

## Setup

Let \(F\) be a local field with \(\mu_n \subseteq F^\times\), and let
\(G\) be a connected reductive group over \(F\) with split maximal
torus \(T\) (in the split case; the general case is similar via
Galois descent).

A BD extension \(\tilde G \to G\) is classified by
\((Q, \mathcal{E}, \phi)\) where \(Q : X_*(T) \to \mathbb{Z}\) is a
Weyl-invariant quadratic form. A continuous character
\(\chi : K_2(F) \to \mu_n\) gives an arithmetic cover:
\[
1 \;\longrightarrow\; \mu_n \;\longrightarrow\; \overline G \;\longrightarrow\; G(F) \;\longrightarrow\; 1.
\]

## Construction of the dual group

The dual group \(\hat{\overline G}\) is the connected complex reductive
group whose root datum is constructed from that of \(G\) as follows:

### Step 1: Rescale the cocharacter lattice

Let \(B_Q : X_*(T) \times X_*(T) \to \mathbb{Z}\) be the bilinear
form associated to \(Q\): \(B_Q(\lambda, \mu) = Q(\lambda + \mu) - Q(\lambda) - Q(\mu)\).
Define
\[
Y \;:=\; \{\lambda \in X_*(T) : B_Q(\lambda, X_*(T)) \subseteq n\mathbb{Z}\},
\]
the **\(n\)-image-modular lattice** for \(B_Q\).

### Step 2: Rescale the coroots

For each root \(\alpha\) of \(G\) with coroot \(\alpha^\vee\), define
the **modified coroot**
\[
\alpha^{\vee, (n)} \;:=\; n_\alpha \cdot \alpha^\vee, \qquad
n_\alpha \;:=\; \frac{n}{\gcd(n, Q(\alpha^\vee))}.
\]

### Step 3: Assemble the dual root datum

The root datum of \(\hat{\overline G}\) is
\[
(Y, \;\{\alpha^{\vee, (n)}\}_\alpha, \;Y^\vee, \;\{\text{recover dual roots}\}).
\]

This is well-defined (Weyl-invariance of \(Q\) ensures rescaling is
compatible) and yields a connected reductive complex group.

## Examples

### Metaplectic double cover of \(\mathrm{SL}_2\)

\(G = \mathrm{SL}_2\), \(n = 2\), standard \(Q\): \(Q(\alpha^\vee) = 1\).

- Standard root datum: \(X_*(T) = \mathbb{Z}\), \(\alpha^\vee = 2\)
  (in normalisation where \(B_Q = \mathrm{id}\)).
- After rescaling: \(\alpha^{\vee, (2)} = \alpha^\vee = 2\); but
  \(Y = \mathbb{Z}\) still, so the dual root datum is the same shape.
- However the lattices switch: \(\hat{\overline{\mathrm{SL}_2}} = \mathrm{SL}_2(\mathbb{C})\),
  swapping the roles of \(\mathrm{SL}_2\) and \(\mathrm{PGL}_2\) as the
  dual of the cover.

(In effect: the metaplectic double cover of \(\mathrm{SL}_2\) has dual
group \(\mathrm{PGL}_2\), the standard Langlands dual.)

### \(n\)-fold cover of \(\mathrm{GL}_r\) (Kazhdan-Patterson)

The "standard" \(n\)-fold metaplectic cover \(\overline{\mathrm{GL}_r}^{(n)}\)
has dual group depending on the "twist parameter" \(c\):
\[
\hat{\overline{\mathrm{GL}_r}^{(n, c)}} \;=\; \mathrm{GL}_r(\mathbb{C})
\]
when \(\gcd(n, r) = 1\) (no rescaling needed), and a non-trivial
modification otherwise.

### \(n\)-fold cover of \(\mathrm{SL}_n\)

Classical result (Kazhdan-Patterson, Suzuki, Banks-Levy-Sepanski):
the dual is the **dual of a different group**, expressing a
non-trivial \(n\)-modular structure on the dual side.

## L-group for covers

The full L-group of \(\overline G\) is
\[
{}^L \overline G \;=\; \hat{\overline G}(\mathbb{C}) \;\rtimes\; W_F,
\]
with Weil group action induced from the Galois action on the root
datum (twisted by the BD data when relevant).

L-parameters for \(\overline G\) are continuous homomorphisms
\(W_F' \to {}^L \overline G\) up to \(\hat{\overline G}\)-conjugacy.

## Local Langlands for covers

The conjectural local Langlands for covers maps:
\[
\Pi(\overline G(F)) \;\twoheadrightarrow\; \Phi({}^L \overline G),
\]
L-packets parametrised by L-parameters into the cover's L-group.

For genuine representations (those on which \(\mu_n\) acts by \(\chi\)),
the parameters factor through a "covered" component of the dual.

## Functoriality

Functoriality for covers compares L-parameters across different
covers \(\overline G \leftrightarrow \overline H\):

- **Theta correspondence** (\(\mathrm{Sp}_{2n} \times \mathrm{O}_m\)):
  matches L-parameters between the metaplectic group and the
  orthogonal group.
- **Shimura correspondence**: \(\overline{\mathrm{SL}_2}\) ↔ \(\mathrm{PGL}_2\),
  the classical "half-integral weight" theta lift.
- **Kazhdan-Patterson lift**: \(\overline{\mathrm{GL}_r}^{(n)}\) ↔
  \(\mathrm{GL}_r\), generalising Shimura.

## Role in modern Langlands

- **Langlands programme for covers**: provides the conjectural
  framework for automorphic forms on covering groups.
- **Theta correspondence and exceptional theta**: rigorous foundation
  for the Howe dual pair theory.
- **Special L-values**: many special L-values are best understood via
  Eisenstein series on covering groups; the dual group recipe
  determines the natural L-functions.

## References

- Weissman, *Metaplectic tori over local fields* (Pac.\ J.\ Math.\ 2009).
- McNamara, *Principal series representations of metaplectic groups
  over local fields* (Bull.\ AMS 2011).
- Gan–Gao, *The Langlands-Weissman program for Brylinski-Deligne
  extensions* (Asterisque 2018).
- Gan–Gao–Weissman (eds.), *L-Groups and the Langlands Program for
  Covering Groups* (Asterisque 2018).

## Prerequisite Topics

- [[node:bd_covers.brylinski_deligne_k2_extensions|Brylinski-Deligne K2-Extensions]]
- [[node:root_data_and_duality.dual_root_data|Dual Root Data]]
- [[node:root_data_and_duality.langlands_dual_groups|Langlands Dual Groups]]
