---
id: buildings_and_parahorics.parahoric_subgroups
title: Parahoric Subgroups
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- buildings_and_parahorics.facets_in_bruhat_tits_buildings
- buildings_and_parahorics.reductive_groups_over_local_fields
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are parahoric subgroups defined uniformly via the Bruhat-Tits formalism for any reductive group over a local field?"
  verdict: "Yes. Parahorics are defined as the connected stabilisers of facets in the Bruhat-Tits building; the Iwahori, hyperspecial, and special subgroups are particular cases."
tags:
- parahoric-subgroups
- buildings-and-parahorics
---

# Parahoric Subgroups

A **parahoric subgroup** of a reductive group \(G\) over a local
field \(F\) is a compact open subgroup of \(G(F)\) attached to a facet
(simplex) of the Bruhat-Tits building. Parahorics interpolate between
the Iwahori subgroup (stabiliser of a chamber) and the hyperspecial
maximal compact subgroup (stabiliser of an "optimal" vertex), and
they index the natural categorification of Hecke algebra theory.

## Definition

Let \(G\) be a connected reductive group over a non-archimedean local
field \(F\) with valuation ring \(\mathcal{O}_F\) and residue field
\(\mathbb{F}_q\). Let \(\mathcal{B}(G, F)\) be the Bruhat-Tits
building.

For a facet \(F \subseteq \mathcal{B}(G, F)\) (a non-empty open
simplex), the **parahoric subgroup** \(\mathcal{P}_F\) is the
**connected component of the identity** in the stabiliser
\(\mathrm{Stab}_{G(F)}(F)\) (in the category of group schemes via
the Bruhat-Tits smooth model).

Equivalently: \(\mathcal{P}_F = G_F(\mathcal{O}_F)\) where \(G_F\) is
a specific smooth affine \(\mathcal{O}_F\)-group scheme with generic
fibre \(G\) (the **parahoric group scheme** of \(F\)).

## Types of parahorics

| Facet type | Parahoric type | Special features |
|---|---|---|
| Chamber (alcove) | **Iwahori** subgroup \(I\) | smallest parahoric; pro-\(p\) Iwahori is its maximal pro-\(p\) subgroup |
| Vertex (optimal) | **Hyperspecial** | \(\cong G(\mathcal{O}_F)\) for a smooth reductive model \(G/\mathcal{O}_F\); exists iff \(G\) is unramified |
| Vertex (general) | **Special** | maximal compact at that vertex; reductive quotient is "as large as possible" |
| General facet | **Standard parahoric** | between Iwahori and hyperspecial |

For \(G = \mathrm{SL}_2(\mathbb{Q}_p)\):
- Iwahori \(I\) = matrices that are upper-triangular mod \(p\);
- Hyperspecial \(K_0 = \mathrm{SL}_2(\mathbb{Z}_p)\).

There are two conjugacy classes of hyperspecial vertices in the tree;
each fixes a different end-class.

## Reductive quotient

Each parahoric \(\mathcal{P}_F\) is a smooth affine group scheme over
\(\mathcal{O}_F\). Its **special fibre** \(\bar{\mathcal{P}}_F\) (over
\(\mathbb{F}_q\)) is a connected smooth affine group; its
**reductive quotient** is
\[
\bar{\mathcal{P}}_F^{\mathrm{red}} \;:=\; \bar{\mathcal{P}}_F \big/ R_u(\bar{\mathcal{P}}_F),
\]
a connected reductive group over \(\mathbb{F}_q\).

The **reduction map**
\[
\mathcal{P}_F \;\twoheadrightarrow\; \bar{\mathcal{P}}_F^{\mathrm{red}}(\mathbb{F}_q)
\]
is the key tool for transferring representation theory of \(G(F)\) to
representation theory of finite reductive groups.

### Example: \(G = \mathrm{GL}_n\), hyperspecial vertex

\(\mathcal{P}_v = \mathrm{GL}_n(\mathcal{O}_F)\), with reductive
quotient \(\mathrm{GL}_n(\mathbb{F}_q)\).

### Example: Iwahori \(I \subseteq \mathrm{GL}_n(F)\)

\(I\) = matrices in \(\mathrm{GL}_n(\mathcal{O}_F)\) that are upper-
triangular mod \(\pi\). Its reductive quotient is the diagonal torus
\((\mathbb{F}_q^\times)^n\).

### Example: Standard parahoric in \(\mathrm{GL}_n\)

For a composition \(n = n_1 + \cdots + n_k\), the corresponding
standard parahoric \(P\) consists of block upper-triangular matrices
(mod \(\pi\)) with block sizes \(n_1, \ldots, n_k\). Reductive quotient
is \(\mathrm{GL}_{n_1}(\mathbb{F}_q) \times \cdots \times \mathrm{GL}_{n_k}(\mathbb{F}_q)\).

## The pro-unipotent radical

The kernel \(\mathcal{P}_F^+\) of the reduction map is the
**pro-unipotent radical**:
\[
\mathcal{P}_F^+ \;=\; \ker(\mathcal{P}_F \twoheadrightarrow \bar{\mathcal{P}}_F^{\mathrm{red}}(\mathbb{F}_q)),
\]
a pro-\(p\) (where \(p\) = residue characteristic) normal subgroup.
It is the \(p\)-adic analogue of the unipotent radical of a finite
reductive parabolic.

## Bruhat decomposition relative to parahoric

For an Iwahori \(I\):
\[
G(F) \;=\; \bigsqcup_{\tilde w \in \tilde W} I \tilde w I.
\]

For a general parahoric \(\mathcal{P}\) with Weyl subgroup
\(W_{\mathcal{P}} \subseteq \tilde W\):
\[
G(F) \;=\; \bigsqcup_{w \in W_{\mathcal{P}} \backslash \tilde W / W_{\mathcal{P}}} \mathcal{P} w \mathcal{P}.
\]

## Role in representations

- **Depth zero representations**: irreducible reps of \(G(F)\) that
  have an invariant vector under some pro-unipotent radical
  \(\mathcal{P}_F^+\). Their classification reduces to
  representations of finite reductive groups
  \(\bar{\mathcal{P}}_F^{\mathrm{red}}(\mathbb{F}_q)\)
  (Moy-Prasad).
- **Types of Bushnell-Kutzko**: each Bernstein component of
  \(\mathrm{Rep}(G(F))\) contains a "type"
  \((\mathcal{P}, \rho)\) with \(\mathcal{P}\) parahoric and \(\rho\)
  a representation; for \(\mathrm{GL}_n\) this gives the complete
  parameterisation of supercuspidals.
- **Hecke algebras**: \(\mathcal{H}(\mathcal{P} \backslash G(F) / \mathcal{P})\)
  is a convolution algebra; for \(\mathcal{P} = I\), the Iwahori-Hecke
  algebra; for \(\mathcal{P}\) maximal compact, the spherical Hecke
  algebra (= Satake transform = \(\mathrm{Rep}(\hat G)\)).
- **Affine flag variety**: \(G(F) / \mathcal{P}\) is the **partial
  affine flag variety**; the case \(\mathcal{P} = I\) gives the full
  affine flag variety, the case \(\mathcal{P}\) hyperspecial gives the
  affine Grassmannian.

## Moy-Prasad filtration

For \(x \in \mathcal{B}(G, F)\) and \(r \ge 0\), Moy and Prasad
defined a filtration \(\mathcal{P}_{x,r}\) by **depth**:
\[
\mathcal{P}_{x,0} \;\supseteq\; \mathcal{P}_{x, 0^+} \;\supseteq\; \mathcal{P}_{x, r} \;\supseteq\; \cdots
\]
with successive quotients direct sums of finite-dimensional
representations of finite reductive groups. The depth-zero subgroup
recovers the parahoric; positive-depth quotients support **types** for
positive-depth representations.

## Mathlib

Not formalised. Even the basic Iwahori subgroup \(\mathrm{SL}_2(\mathbb{Z}_p)\)
mod \(p\) would require local-field infrastructure beyond what is
currently available.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (Publ.\
  IHES 1972, 1984).
- Tits, *Reductive groups over local fields* (Corvallis 1979).
- Moy–Prasad, *Unrefined minimal K-types for p-adic groups* (Inv.\
  Math.\ 1994) and *Jacquet functors and unrefined minimal K-types*
  (Comment.\ Math.\ Helv.\ 1996).
- Bushnell–Kutzko, *The Admissible Dual of GL(N) via Compact Open
  Subgroups* (Annals 1993).
- Yu, *Smooth models associated to concave functions in Bruhat-Tits
  theory* (in: *Autour des schémas en groupes*, 2015).

## Prerequisite Topics

- [[node:buildings_and_parahorics.facets_in_bruhat_tits_buildings|Facets in Bruhat-Tits Buildings]]
- [[node:buildings_and_parahorics.reductive_groups_over_local_fields|Reductive Groups over Local Fields]]
