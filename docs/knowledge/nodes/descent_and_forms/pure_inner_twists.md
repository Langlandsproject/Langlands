---
id: descent_and_forms.pure_inner_twists
title: Pure Inner Twists
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.inner_forms
- descent_and_forms.nonabelian_h1
- descent_and_forms.cocycles_and_twisting
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are pure inner twists treated as the Vogan-style refinement of inner forms, valid over arbitrary fields?"
  verdict: "Yes. A pure inner twist is a 1-cocycle in G itself (rather than G_ad); the construction works over any field, with applications to local Langlands across inner forms."
tags:
- pure-inner-twists
- descent-and-forms
---

# Pure Inner Twists

A **pure inner twist** of a connected reductive group is an inner twist
together with a chosen cocycle in \(G\) itself (rather than just
\(G_{\mathrm{ad}}\)). The "pure" refinement (due to Vogan) keeps track
of the **\(Z(G)\)-part** of the cocycle, making the L-packet
parametrisation cleaner.

## Definition

Let \(G\) be a connected reductive group over a field \(k\). A **pure
inner twist** of \(G\) is a pair \((G^*, c)\) where:

- \(c \in Z^1(k, G)\) is a 1-cocycle valued in \(G\) (not just
  \(G_{\mathrm{ad}}\));
- \(G^* = G^c\) is the inner-twisted form of \(G\) by the image of
  \(c\) in \(G_{\mathrm{ad}}\).

Two pure inner twists are equivalent if their cocycles are cohomologous
in \(Z^1(k, G)\).

## Vs.\ ordinary inner twists

| Object | Cocycle in | Equivalence | Classifies |
|---|---|---|---|
| Inner form | \(Z^1(k, G_{\mathrm{ad}})\) | cohomology in \(G_{\mathrm{ad}}\) | inner forms of \(G\) |
| Pure inner twist | \(Z^1(k, G)\) | cohomology in \(G\) | inner forms + central character refinement |

The natural map
\[
H^1(k, G) \;\to\; H^1(k, G_{\mathrm{ad}})
\]
sends pure inner twists to ordinary inner forms; the fibres are
torsors under the central character data of \(Z(G)\).

## Long exact sequence

The exact sequence \(1 \to Z(G) \to G \to G_{\mathrm{ad}} \to 1\)
induces:
\[
H^1(k, Z(G)) \;\to\; H^1(k, G) \;\to\; H^1(k, G_{\mathrm{ad}}) \;\to\; H^2(k, Z(G)).
\]

So:
- The map \(H^1(k, G) \to H^1(k, G_{\mathrm{ad}})\) has fibres
  parametrised by \(H^1(k, Z(G))\).
- The image is the kernel of the boundary
  \(H^1(k, G_{\mathrm{ad}}) \to H^2(k, Z(G))\); only inner forms
  whose central character data "lifts" come from pure inner twists.

## Vogan's L-packet refinement

**Vogan's bijection (1993, refined by Kaletha).** For an L-parameter
\(\varphi : W_F \to {}^L G\), the L-packet \(\Pi_\varphi\) (across all
inner forms of \(G\)) is in bijection with irreducible representations
of the **enhanced \(S_\varphi\)-group**:
\[
S_\varphi^+ \;:=\; \pi_0(Z_{\hat G}(\varphi)) / \text{centre},
\]
where the parametrisation is **canonical** when one uses **pure inner
twists** (rather than just inner forms).

This is the basis of the modern formulation of local Langlands across
inner forms.

## Example: Real \(\mathrm{SL}_2\)

For \(G = \mathrm{SL}_2 / \mathbb{R}\):
- \(Z(G) = \{\pm 1\}\);
- \(H^1(\mathbb{R}, Z(G)) = \{\pm 1\}\);
- \(H^1(\mathbb{R}, G) = \{\pm 1\}\) (split form \(\mathrm{SL}_2(\mathbb{R})\)
  and compact form \(\mathrm{SU}(2)\));
- \(H^1(\mathbb{R}, G_{\mathrm{ad}}) = \{\pm 1\}\) (split form
  \(\mathrm{PGL}_2(\mathbb{R})\) and compact form \(\mathrm{PSU}(2)\)).

Pure inner twists: 4 classes (split or compact \(\times\) trivial or
non-trivial central character lift), with the trivial lift recovering
the standard inner-form classification.

## Limitations of pure inner twists

Pure inner twists work cleanly when \(G\) has appropriate central
extensions — specifically when the long exact sequence cleanly
parametrises the fibres of \(H^1(k, G) \to H^1(k, G_{\mathrm{ad}})\).

For more general settings (e.g.\ non-quasi-split inner forms with
"big" central character data), the **rigid inner twist** formalism of
Kaletha (using a Galois gerbe) is needed; see
[[node:descent_and_forms.rigid_inner_twists|rigid inner twists]].

## Role in Langlands

- **Local Langlands across inner forms**: pure inner twists give
  Vogan's parametrisation of L-packets.
- **Endoscopic transfer**: the transfer between inner forms is
  cleanest with pure inner twists.
- **Adjoint vs.\ pure groups**: distinguishing the central data
  matters for genuine vs.\ non-genuine representations of
  metaplectic covers.

## References

- Vogan, *The local Langlands conjecture* (in: Representation Theory
  of Groups and Algebras, AMS 1993).
- Kottwitz, *Stable trace formula: elliptic singular terms* (Math.\ Ann.\
  1986).
- Kaletha, *Genericity and contragredience in the local Langlands
  correspondence* (Algebra Number Theory 2013).

## Prerequisite Topics

- [[node:descent_and_forms.inner_forms|Inner Forms]]
- [[node:descent_and_forms.nonabelian_h1|Nonabelian H1]]
- [[node:descent_and_forms.cocycles_and_twisting|Cocycles and Twisting]]
