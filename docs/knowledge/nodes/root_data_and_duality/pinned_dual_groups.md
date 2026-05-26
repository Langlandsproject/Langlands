---
id: root_data_and_duality.pinned_dual_groups
title: Pinned Dual Groups
kind: topic
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.dual_reductive_groups
- root_data_and_duality.pinnings
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the pinned dual group treated as a canonical structure compatible with both the duality and the Galois action?"
  verdict: "Yes. A pinning of ĝ G is the natural target for the Galois action on the based root datum, making the L-group construction canonical."
tags:
- pinned-dual-groups
- root-data-and-duality
---

# Pinned Dual Groups

The **pinned dual group** \((\hat G, \hat T, \hat B, \{X_{\alpha^\vee}\})\)
is the dual group equipped with a chosen Borel, maximal torus, and
simple-coroot vectors. The pinning is the canonical data making the
Galois action on the dual root datum lift to an action on \(\hat G\),
so that the L-group \({}^L G = \hat G \rtimes \Gamma\) is well-defined.

## Definition

For a connected reductive group \(G\) over a field \(k\), a **pinned
dual group** consists of:

- A connected reductive group \(\hat G\) over \(\mathbb{C}\) with the
  dual root datum of \(G\);
- A maximal torus \(\hat T \subseteq \hat G\);
- A Borel subgroup \(\hat B \supseteq \hat T\);
- For each simple coroot \(\alpha^\vee \in \Delta^\vee\) (= simple root
  of the dual), a chosen non-zero element
  \(X_{\alpha^\vee} \in \hat{\mathfrak{g}}_{\alpha^\vee}\).

This pinning is the dual of a pinning of \(G\): the role of simple
roots in \(G\) is played by simple coroots in \(\hat G\).

## Functoriality

The pinned dual is **functorial** with respect to pinned isomorphisms:
if \((G, T, B, \{X_\alpha\}) \cong (G', T', B', \{X'_\alpha\})\), then
\((\hat G, \hat T, \hat B, \{X_{\alpha^\vee}\}) \cong (\hat G', \hat T', \hat B', \{X'_{\alpha^\vee}\})\)
canonically.

For a pinning-preserving outer automorphism \(\sigma : G \to G\)
(\(\sigma \in \mathrm{Out}(G)\)), the dual \(\hat \sigma : \hat G \to \hat G\)
preserves the dual pinning.

## Why the pinning matters

Without a pinning, the dual group \(\hat G\) is well-defined up to
**non-canonical** isomorphism — multiple isomorphisms differ by inner
automorphisms. This causes problems when:

- Defining the Galois action on \(\hat G\): different choices of
  \(\hat G\) give different Galois actions.
- Composing L-morphisms: the composition of pinned-preserving maps is
  canonical.
- Defining the L-group: \({}^L G = \hat G \rtimes \Gamma\) needs a
  canonical \(\Gamma\)-action.

The pinning rigidifies \(\hat G\) so all these constructions are
**canonical** (not just up to inner conjugacy).

## Galois action on pinned dual

For \(G\) defined over \(k\) (not necessarily split): the Galois
action on the based root datum of \(G_{\bar k}\) dualises to an action
on the based root datum of \(\hat G\). This lifts (via the rigidity
of pinned groups) to a Galois action on the pinned dual:
\[
\rho_G : \Gamma \;\longrightarrow\; \mathrm{Aut}^{\mathrm{pin}}(\hat G).
\]

For quasi-split \(G\): the action factors through \(\mathrm{Out}(\hat G)\)
(diagram automorphisms).

For inner forms of a quasi-split \(G\): the action on the pinned
dual is the same as for the quasi-split form.

## Examples

### \(\mathrm{GL}_n\) (split)

Pinned dual: \(\hat G = \mathrm{GL}_n(\mathbb{C})\),
\(\hat T\) = diagonal, \(\hat B\) = upper-triangular,
\(\{X_{\alpha^\vee}\} = \{E_{i, i+1}\}\). Galois action trivial.

### \(\mathrm{U}(n)\) (unitary, quasi-split)

Pinned dual: \(\hat G = \mathrm{GL}_n(\mathbb{C})\) with non-trivial
Galois action by the "transpose-inverse" diagram automorphism.
\[
{}^L \mathrm{U}(n) \;=\; \mathrm{GL}_n(\mathbb{C}) \rtimes \mathrm{Gal}(K/F),
\]
where the non-trivial Galois element acts by the outer automorphism.

### \({}^3 D_4\), the triality form

Pinned dual: \(\hat G = \mathrm{Spin}_8(\mathbb{C})\) with \(S_3\)
action by triality. \({}^L({}^3 D_4) = \mathrm{Spin}_8 \rtimes S_3\)
(via the cubic Galois group).

## The L-group with pinning

\[
{}^L G \;:=\; \hat G(\mathbb{C}) \;\rtimes\; \Gamma,
\]
where the semi-direct product uses the Galois action \(\rho_G\) on
the pinned dual.

The pinning is essential: without it, the semi-direct product would
depend on a non-canonical choice of inner automorphism, and the L-group
would only be well-defined up to inner conjugacy.

## Relation with quasi-split forms

A connected reductive group \(G\) over \(k\) is **quasi-split** iff
its pinned dual has a \(\Gamma\)-fixed pinning (equivalently, the
Galois action on the pinning lifts trivially).

Every group has a quasi-split inner form (unique up to inner-form
twist), so the pinned dual of \(G\) coincides with that of its quasi-
split form, with the same Galois action.

## Mathlib

Not formalised.

## References

- Borel, *Automorphic L-functions* (Corvallis 1979).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984), §1.
- Conrad, *Reductive group schemes* (Notes, 2014), §7.

## Prerequisite Topics

- [[node:root_data_and_duality.dual_reductive_groups|Dual Reductive Groups]]
- [[node:root_data_and_duality.pinnings|Pinnings]]
