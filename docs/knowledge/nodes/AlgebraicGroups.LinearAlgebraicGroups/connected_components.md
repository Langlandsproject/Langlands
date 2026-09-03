---
id: linear_algebraic_groups.connected_components
title: Connected Components
kind: topic
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are connected components treated as scheme-theoretic, distinguishing the identity component from the component group?"
  verdict: "Yes. The identity component is a closed normal subgroup; the component group is finite étale; both are well-defined for any algebraic group over a base."
tags:
- connected-components
- identity-component
- linear-algebraic-groups
---

# Connected Components

For an algebraic group \(G\) over a field \(k\), the underlying scheme
decomposes into connected components, and these inherit a strong group
structure: the component containing the identity is a closed normal
subgroup.

## The identity component \(G^\circ\)

The **identity component** of \(G\), denoted \(G^\circ\) or \(G^0\), is
the connected component of the identity \(e \in G\). It is:

- a closed subscheme of \(G\);
- a closed **normal** subgroup of \(G\) (since conjugation is
  continuous and fixes the identity, it permutes connected components
  and fixes \(G^\circ\));
- a connected algebraic group in its own right;
- of finite index in \(G\) when \(G\) is of finite type
  (\(G/G^\circ\) is finite étale).

## The component group \(\pi_0(G)\)

The quotient

\[
\pi_0(G) \;=\; G \,/\, G^\circ
\]

is a **finite étale group scheme** over \(k\), called the **group of
connected components** of \(G\). It fits in the short exact sequence

\[
1 \to G^\circ \to G \to \pi_0(G) \to 1.
\]

For \(k\) algebraically closed, \(\pi_0(G)\) is an étale group scheme,
i.e. just an abstract finite group. Over a non-algebraically-closed
field, \(\pi_0(G)\) carries a Galois action recording the descent data.

## Examples

- \(\mathbb{G}_a, \mathbb{G}_m, \operatorname{GL}_n, \operatorname{SL}_n\):
  connected (\(\pi_0 = 1\)).
- \(\mu_n\) for \(n\) coprime to \(\operatorname{char}(k)\): étale,
  \(\pi_0(\mu_n) = \mu_n\), \(G^\circ = 1\).
- \(\mu_p\) over \(\mathbb{F}_p\): connected (it is the kernel of
  Frobenius on \(\mathbb{G}_m\)) but not reduced — a non-trivial
  infinitesimal group.
- **Orthogonal group** \(\mathrm{O}_n\): has two components,
  \(\mathrm{O}_n^\circ = \mathrm{SO}_n\) and the determinant-\(-1\)
  coset; \(\pi_0(\mathrm{O}_n) = \mathbb{Z}/2\).
- **Normaliser of a torus** \(N_G(T)\): \(N_G(T)^\circ = T\), and
  \(\pi_0(N_G(T)) = W(G, T)\), the Weyl group.

## Connected vs. geometrically connected

\(G\) is **connected** if its underlying scheme is connected (as a
topological space). \(G\) is **geometrically connected** if
\(G_{\bar{k}}\) is connected for \(\bar{k}\) an algebraic closure.
These can differ: for a non-perfect field, an irreducible scheme can
split into components after base change to \(\bar{k}\) (Galois descent
of components).

The Langlands roadmap uses **geometric** connectedness throughout
(connected geometric fibres over the base).

## Reduced vs. smooth components

In characteristic \(p\), an algebraic group can have **non-reduced**
identity component (e.g. \(\mu_p\), \(\alpha_p\)). In characteristic
zero (or for **smooth** algebraic groups in general), the identity
component is automatically reduced and smooth.

The **reduction** \(G^\circ_{\mathrm{red}}\) is a subgroup of
\(G^\circ\), and equals \(G^\circ\) iff \(G^\circ\) is reduced. Even in
positive characteristic, \(G^\circ_{\mathrm{red}}\) is a closed subgroup
(over a perfect base field; in general one must base change first).

## Prerequisite Topics

- [[node:linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras|Smoothness, Tangent Spaces, and Lie Algebras]]
