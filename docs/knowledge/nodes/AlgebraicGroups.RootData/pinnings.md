---
id: root_data.pinnings
title: Pinnings
kind: topic
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.based_root_data
- root_data.roots_coroots_and_root_subgroups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are pinnings defined uniformly for split reductive groups in any characteristic, with the rigidification statement?"
  verdict: "Yes. A pinning consists of a Borel, maximal torus, and root vectors for the simple roots; pinned isomorphisms are unique once based-root-datum isomorphism is fixed."
tags:
- pinnings
- root-data-and-duality
---

# Pinnings

A **pinning** of a split connected reductive group rigidifies its
internal data so that the only remaining automorphisms are diagram
automorphisms. This is the technical device that makes the
classification of split reductive groups by based root data **unique**
(not just up to isomorphism).

## Definition

A **pinning** of a split connected reductive group \(G\) over \(k\) is
a triple
\[
(T, B, \{X_\alpha\}_{\alpha \in \Delta})
\]
where:

- \(T \subseteq G\) is a split maximal torus;
- \(B \supseteq T\) is a Borel subgroup containing \(T\) (with
  corresponding set of simple roots \(\Delta\));
- For each simple root \(\alpha \in \Delta\), \(X_\alpha\) is a chosen
  non-zero element of the 1-dimensional root space
  \(\mathfrak{g}_\alpha\) (or equivalently, a chosen isomorphism
  \(\mathbb{G}_a \xrightarrow{\sim} U_\alpha\)).

The triple \((G, T, B, \{X_\alpha\})\) is a **pinned reductive group**.

## Pinned isomorphisms

A morphism of pinned groups is a homomorphism \(f : (G, T, B, \{X_\alpha\}) \to (G', T', B', \{X'_{\alpha'}\})\)
such that:

- \(f(T) \subseteq T'\);
- \(f(B) \subseteq B'\);
- \(f(X_\alpha) = X'_{\alpha'}\) under the induced map of simple roots.

A pinned isomorphism is determined by the underlying map of based
root data.

## Rigidification theorem

**Theorem.** Let \((G, T, B, \{X_\alpha\})\) be a pinned split connected
reductive group. Then:
\[
\mathrm{Aut}^{\mathrm{pin}}(G) \;=\; \mathrm{Aut}(\text{based root datum}) \;=\; \mathrm{Out}(G),
\]
the diagram automorphism group of \(G\).

Without pinning, \(\mathrm{Aut}(G) = G_{\mathrm{ad}}(k) \rtimes \mathrm{Out}(G)\)
with the inner automorphisms forming a large piece. Pinning eliminates
the inner factor.

## Diagram automorphisms

\(\mathrm{Out}(G)\) is the automorphism group of the Dynkin diagram
of \(G\):

| Type | \(\mathrm{Out}\) |
|---|---|
| \(A_n\), \(n \ge 2\) | \(\mathbb{Z}/2\) |
| \(B_n\), \(C_n\) | trivial |
| \(D_n\), \(n \ge 5\) | \(\mathbb{Z}/2\) |
| \(D_4\) | \(S_3\) (triality) |
| \(E_6\) | \(\mathbb{Z}/2\) |
| \(E_7\), \(E_8\) | trivial |
| \(F_4\), \(G_2\) | trivial |
| \(A_1\) | trivial |

These are exactly the symmetries of the Dynkin diagrams.

## Twisted forms and pinnings

For a quasi-split form \(G\) of a split group \(G_0\): the Galois
action on \(G_{\bar k}\) preserves a pinning of \(G_{\bar k}\), and
the Galois action factors through \(\mathrm{Out}(G_{\bar k})\).

This is why pinnings are central to the classification of forms:
quasi-split forms are exactly the Galois twists by **pinned**
cocycles.

## Examples

### \(\mathrm{SL}_n\)

A pinning consists of:

- Diagonal maximal torus \(T\);
- Upper-triangular Borel \(B\);
- For each \(\alpha_i = \varepsilon_i - \varepsilon_{i+1}\), the root
  vector \(X_{\alpha_i} = E_{i, i+1}\) (the elementary matrix).

\(\mathrm{Out}(\mathrm{SL}_n) = \mathbb{Z}/2\) acts by
"transpose-inverse," exchanging \(E_{i, i+1}\) with \(-E_{n-i, n-i+1}\)
in pinned form.

### \(D_4\) and triality

\(\mathrm{Out}(D_4) = S_3\) acts on the three "outer legs" of the
Dynkin diagram. A pinning of \(\mathrm{Spin}_8\) makes this action
explicit: \(S_3\) permutes the three minuscule representations of
\(\mathrm{Spin}_8\) (the vector representation, and two half-spin
representations).

### \(G_2\) and \(F_4\)

No non-trivial pinned automorphisms (Dynkin diagrams have no
symmetries).

## Pinned automorphisms of Galois type

For \(G\) over \(k\) with separable closure \(\bar k\), the Galois
group \(\Gamma = \mathrm{Gal}(\bar k / k)\) acts on
\(\mathrm{Out}(G_{\bar k})\). A **Galois-invariant pinning** is a
pinning of \(G_{\bar k}\) preserved by \(\Gamma\); equivalently, \(G\)
is **quasi-split** over \(k\) (admits a Borel defined over \(k\)).

The classification of quasi-split forms reduces to:
\[
\{\text{quasi-split forms of } G_0\} / \cong \;\cong\; \mathrm{Hom}(\Gamma, \mathrm{Out}(G_0))/\sim.
\]

## Pinned Chevalley basis

The pinned Lie algebra has a **Chevalley basis** \(\{X_\alpha, X_{-\alpha}, H_\alpha\}_{\alpha \in \Phi^+}\)
with integer structure constants, where \(X_\alpha\) for \(\alpha\)
positive non-simple are determined by iterated brackets from the
simple root vectors.

This is the key technical device making Chevalley's construction of
\(G_{\mathbb{Z}}\) work uniformly.

## Role in Langlands

- **L-group definition**: requires a pinning of the dual group
  \(\hat G\) to make the Galois action canonical. The L-group is
  \({}^L G = \hat G \rtimes_{\rho_G} \Gamma\) with \(\rho_G\) acting
  by pinned automorphisms.
- **Pinned dual** \(\hat G\): the dual group with a chosen pinning,
  often denoted \(\hat G^*\) or similar.
- **Endoscopy and stable conjugacy**: pinnings are used to align
  reductive groups across inner forms.

## References

- Demazure–Grothendieck, *SGA 3, vol.\ III* (1970): definitive
  source on pinnings and the Chevalley-Demazure existence theorem.
- Conrad, *Reductive group schemes* (Notes, 2014), §6.
- Borel, *Linear Algebraic Groups* (1991), §14.

## Prerequisite Topics

- [[node:root_data.based_root_data|Based Root Data]]
- [[node:root_data.roots_coroots_and_root_subgroups|Roots, Coroots, and Root Subgroups]]
