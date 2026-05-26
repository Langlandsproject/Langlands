---
id: root_data_and_duality.central_isogenies_and_duality
title: Central Isogenies and Duality
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- reductive_structure.central_isogenies
- root_data_and_duality.root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the behaviour of central isogenies under root-datum duality treated explicitly, including the reversal of direction?"
  verdict: "Yes. A central isogeny G → G' dualises to a central isogeny ĝ G' → ĝ G; the kernels are Pontryagin-dual finite groups."
tags:
- central-isogenies
- duality
- root-data-and-duality
---

# Central Isogenies and Duality

A central isogeny between reductive groups dualises under Langlands
duality to an isogeny in the **opposite direction**. The kernels are
Pontryagin-dual finite abelian groups. This swap is the source of many
"adjoint vs.\ simply-connected" inversions in the Langlands programme.

## Statement

For a central isogeny \(\phi : G \to G'\) of connected reductive groups
with finite central kernel \(K = \ker \phi\), the dual isogeny is
\[
\hat \phi : \hat{G'} \;\longrightarrow\; \hat G,
\]
with kernel \(\hat K = \mathrm{Hom}(K, \mathbb{C}^\times)\) (the
Pontryagin dual of \(K\)).

The direction of the arrow reverses: \(G\) being a "covering" of
\(G'\) corresponds to \(\hat G\) being "covered" by \(\hat{G'}\).

## Examples

### \(\mathrm{SL}_n \to \mathrm{PGL}_n\)

Central isogeny with kernel \(K = \mu_n\). Dualises to:
\[
\widehat{\mathrm{PGL}_n} = \mathrm{SL}_n \;\to\; \mathrm{PGL}_n = \widehat{\mathrm{SL}_n},
\]
again an isogeny with kernel \(\mu_n\) (= dual of \(\mu_n\)).

So \(\mathrm{SL}_n \to \mathrm{PGL}_n\) is **self-dual** as an
isogeny (modulo swapping which side is "covering").

### \(\mathrm{Spin}_{2n+1} \to \mathrm{SO}_{2n+1}\)

Kernel \(\mu_2\). Dualises to:
\[
\widehat{\mathrm{SO}_{2n+1}} = \mathrm{Sp}_{2n} \;\to\; \mathrm{PSp}_{2n} = \widehat{\mathrm{Spin}_{2n+1}},
\]
with kernel \(\mu_2\).

So spin double-cover dualises to symplectic-to-projective-symplectic
double cover.

### \(\mathrm{Spin}_{2n} \to \mathrm{SO}_{2n}\)

For \(n\) odd: kernel \(\mu_4\), dualises to a similar size-4 isogeny.

For \(n\) even: kernel \(\mathbb{Z}/2 \times \mathbb{Z}/2\), with three
"intermediate" forms — the kernel is its own Pontryagin dual.

## Lattice description

In terms of root data: a central isogeny
\(\phi : (X, \Phi, X^\vee, \Phi^\vee) \to (X', \Phi, X'^\vee, \Phi^\vee)\)
corresponds to:

- An inclusion of character lattices \(X' \subseteq X\) with the same
  roots;
- Dually, an inclusion of cocharacter lattices
  \(X^\vee \subseteq X'^\vee\) with the same coroots;
- Kernel \(K = D(X/X')\) = Cartier dual of the quotient lattice.

Under root-datum duality, \((X, X^\vee) \leftrightarrow (X^\vee, X)\),
so the lattice inclusions swap direction:

- Original: \(X' \subseteq X\) (the \(G \to G'\) direction);
- Dual: \(\hat{X'^\vee} \subseteq \hat X^\vee\), i.e.\
  \(X^\vee \subseteq X'^\vee\) (the \(\hat{G'} \to \hat G\) direction).

## Composition

The composition of central isogenies dualises as expected (with
arrows reversed):
\[
G_1 \to G_2 \to G_3 \quad \rightsquigarrow \quad \hat G_3 \to \hat G_2 \to \hat G_1.
\]

The kernel of the composition is an extension of the dual kernels.

## Isogeny class duality

Within an isogeny class of semisimple groups with fixed root system
\(\Phi\):

\[
G^{\mathrm{sc}} \;\longrightarrow\; \cdots \;\longrightarrow\; G^{\mathrm{ad}}
\]

dualises to:

\[
\widehat{G^{\mathrm{ad}}} = (\hat G)^{\mathrm{sc}} \;\longrightarrow\; \cdots \;\longrightarrow\; (\hat G)^{\mathrm{ad}} = \widehat{G^{\mathrm{sc}}}.
\]

So the sc / adjoint extremes swap. The intermediate forms (= lattices
between \(\mathbb{Z}\Phi^\vee\) and \(P^\vee\)) are in self-dual
correspondence with the intermediate dual forms.

## Role in Langlands

- **Central isogeny invariance of L-packets**: Functoriality is
  compatible with central isogenies: composing with an isogeny
  \(G^{\mathrm{sc}} \to G\) refines the L-packet structure.
- **Strong vs.\ weak functoriality**: defined relative to the isogeny
  class of the source/target groups.
- **Kottwitz formalism**: uses \(z\)-extensions to handle the
  difference between \(G\) and \(G^{\mathrm{sc}}\) cleanly.

## References

- Borel, *Automorphic L-functions* (Corvallis 1979), §2.
- Springer, *Linear Algebraic Groups* (1998), §16.
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke 1984).

## Prerequisite Topics

- [[node:reductive_structure.central_isogenies|Central Isogenies]]
- [[node:root_data_and_duality.root_data|Root Data]]
