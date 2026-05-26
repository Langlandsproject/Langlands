---
id: reductive_structure.central_isogenies
title: Central Isogenies
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are central isogenies defined uniformly for reductive groups, including over arbitrary base fields?"
  verdict: "Yes. A central isogeny is a surjective homomorphism with finite central kernel; isogeny classes of semisimple groups partition into the simply-connected and adjoint forms."
tags:
- central-isogenies
- reductive-structure
---

# Central Isogenies

A **central isogeny** is a surjective homomorphism of connected
algebraic groups with finite **central** kernel. Central isogenies
relate the various forms of a semisimple group within an isogeny class
— the chain
\(G^{\mathrm{sc}} \to G_{\mathrm{der}} \to G_{\mathrm{ad}}\) is the
prototype.

## Definition

Let \(G\) and \(G'\) be connected algebraic groups over a field \(k\).
A homomorphism \(\phi : G \to G'\) is an **isogeny** if it is
surjective with **finite** kernel.

\(\phi\) is **central** if \(\ker \phi \subseteq Z(G)\) — equivalently,
\(\phi\) is étale-locally a quotient by a finite subgroup of multiplicative
type in the centre.

For semisimple \(G\): every isogeny is automatically central (since
finite normal subgroups of a connected semisimple group are central).

## Isogeny classes

Two connected semisimple groups \(G\) and \(G'\) are **isogenous** if
there are isogenies \(G \to G'\) (or via an intermediate group).
Within an isogeny class:

- All groups have the **same root system** \(\Phi\) (not just root
  datum);
- The cocharacter lattices range from \(Q^\vee = \mathbb{Z}\Phi^\vee\)
  (adjoint extreme) to \(P^\vee\) (simply-connected extreme);
- Each intermediate lattice gives a different group, related to its
  neighbours by central isogenies.

For type \(A_{n-1}\): the isogeny class contains
\(\mathrm{SL}_n\) and \(\mathrm{PGL}_n\), with intermediate groups
\(\mathrm{SL}_n / \mu_d\) for each \(d | n\), all connected by
central isogenies.

## Universal cover and adjoint quotient

For a connected semisimple group \(G\) over \(k\) (good
characteristic):

- **Simply connected cover** \(G^{\mathrm{sc}}\): the unique (up to
  isomorphism) simply-connected group with an isogeny
  \(G^{\mathrm{sc}} \to G\); kernel \(= \pi_1(G)\), a finite group of
  multiplicative type.
- **Adjoint quotient** \(G^{\mathrm{ad}} = G/Z(G)\): the quotient by
  the centre; isogeny \(G \to G^{\mathrm{ad}}\) with kernel \(Z(G)\).

The composite \(G^{\mathrm{sc}} \to G^{\mathrm{ad}}\) is the
"longest" isogeny, with kernel \(Z(G^{\mathrm{sc}})\).

## Examples

### \(A_{n-1}\) isogeny class

\[
\mathrm{SL}_n \;\xrightarrow{}\; \mathrm{SL}_n/\mu_d \;\xrightarrow{}\; \cdots \;\xrightarrow{}\; \mathrm{PGL}_n,
\]
with isogeny kernels \(\mu_d\) for divisors \(d | n\).

### \(D_n\) isogeny class (\(n \ge 2\))

\(\mathrm{Spin}_{2n}\) (sc), \(\mathrm{SO}_{2n}\), \(\mathrm{HSpin}_{2n}\)
(half-spin), and \(\mathrm{PSO}_{2n}\) (adjoint). Kernels are subgroups
of \(Z(\mathrm{Spin}_{2n}) = \mathbb{Z}/2 \times \mathbb{Z}/2\)
(for \(n\) even) or \(\mathbb{Z}/4\) (for \(n\) odd).

### \(E_6\) isogeny class

\(E_6^{\mathrm{sc}}\) and \(E_6^{\mathrm{ad}}\), related by isogeny
with kernel \(\mu_3\).

### \(E_8\), \(F_4\), \(G_2\)

Trivial isogeny class (sc = adjoint).

## Functoriality on root data

Under root-datum classification: a central isogeny \(G \to G'\)
corresponds to an **inclusion of cocharacter lattices**
\(X_*(T') \subseteq X_*(T)\) (with the same coroots), or equivalently
to a **surjection of character lattices** \(X^*(T) \twoheadrightarrow X^*(T')\).

Specifically:
- \(X_*(T) / X_*(T')\) is the kernel \(\ker(G \to G')\) (as a
  finite group of multiplicative type).

## Categorical interpretation

The category of connected semisimple groups in an isogeny class with
fixed root system \(\Phi\) is equivalent to the partially ordered
set of intermediate lattices \(\mathbb{Z}\Phi^\vee \subseteq L \subseteq P^\vee\).
Morphisms are central isogenies; the maximal lattice \(P^\vee\) gives
the simply-connected form; the minimal \(\mathbb{Z}\Phi^\vee\) gives
the adjoint form.

## Central isogenies in char \(p\)

In characteristic \(p\) dividing \(|Z(G^{\mathrm{sc}})|\), the
isogeny kernel can become non-smooth (e.g.\ \(\mu_p\) is non-smooth in
char \(p\)). The isogeny is still well-defined as a flat surjection,
but Lie-algebra and tangent-space arguments require care
(**\(p\)-Lie algebra** / Cartier dual framework).

For **bad primes**: the Frobenius isogeny and other "exotic"
isogenies appear in the Springer-Steinberg theory of unipotent
elements.

## Role in Langlands

- **Strong/weak approximation**: simply-connected semisimple groups
  satisfy strong approximation for adelic points; the obstruction for
  general groups comes from the central isogeny.
- **Stable conjugacy**: defined precisely in terms of a
  \(z\)-extension (a covering by a slightly larger group with simply-
  connected derived part).
- **Endoscopy**: the dual side of a central isogeny corresponds to a
  reverse central isogeny on the dual group; functoriality is
  compatible.
- **Sato-Tate groups** for elliptic curves and modular forms: defined
  modulo central isogeny.

## References

- Borel, *Linear Algebraic Groups* (1991), §22.
- Springer, *Linear Algebraic Groups* (1998), §16.
- Milne, *Reductive Groups* (notes), §22.
- Conrad, *Reductive group schemes* (Notes, 2014), §6.

## Prerequisite Topics

- [[node:reductive_structure.reductive_groups|Reductive Groups]]
