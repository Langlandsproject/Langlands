---
id: buildings.facets_in_bruhat_tits_buildings
title: Facets in Bruhat-Tits Buildings
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Buildings
topics:
- AlgebraicGroups.Buildings
uses:
- buildings.bruhat_tits_buildings
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are facets in Bruhat-Tits buildings defined uniformly across types, including vertices, alcoves, and intermediate dimensions?"
  verdict: "Yes. A facet is a relative-interior of a simplex in the building; vertex / edge / chamber / etc. all share the same definition modulo dimension."
tags:
- facets
- buildings-and-parahorics
---

# Facets in Bruhat-Tits Buildings

A **facet** in a Bruhat-Tits building is a (relatively open) simplex
of the underlying simplicial complex. Facets correspond bijectively to
conjugacy classes of parahoric subgroups in \(G(F)\) and are the
geometric organisation of the local representation theory.

## Definition

For a Bruhat-Tits building \(\mathcal{B}(G, F)\):

A **facet** is the relative interior of a simplex of \(\mathcal{B}(G, F)\).
Facets are classified by dimension:

- **Vertices**: 0-dim facets (corners of alcoves).
- **Edges**: 1-dim facets.
- **Faces of intermediate dim**: \(k\)-dim facets for \(0 \le k < r\),
  where \(r = \dim \mathcal{B}\).
- **Alcoves** (chambers): top-dimensional facets, \(r\)-dim.

## Classification

The set of facets in \(\mathcal{B}(G, F)\), modulo \(G(F)\)-action,
is in bijection with the subsets \(I \subseteq S_{\mathrm{aff}}\) of
the simple reflections of the affine Weyl group:
\[
\{G(F)\text{-orbits of facets}\} \;\cong\; \{\text{subsets } I \subsetneq S_{\mathrm{aff}}\}.
\]

For each \(I\), the corresponding facet's stabiliser in \(G(F)\) is a
**standard parahoric subgroup** \(P_I\); see
[[node:buildings.parahoric_subgroups|parahoric subgroups]].

## Facet types

| Facet | Subset \(I \subseteq S_{\mathrm{aff}}\) | Stabiliser \(P_I\) |
|---|---|---|
| Alcove (chamber) | \(I = \emptyset\) | Iwahori \(I\) |
| Vertex \(v\) | \(I = S_{\mathrm{aff}} \setminus \{s_v\}\) | maximal compact \(K_v\) |
| Hyperspecial vertex | \(I\) maximally large, "all but one" | hyperspecial \(K_v\) |
| General facet | other \(I\) | intermediate parahoric |

## Vertices and parahoric stabilisers

Each vertex \(v \in \mathcal{B}(G, F)\) has a stabiliser
\(\mathrm{Stab}_{G(F)}(v)\). The connected component (in the Bruhat-
Tits sense) is the **parahoric** \(\mathcal{P}_v\); the full stabiliser
\(K_v\) may be slightly larger (differs by a finite quotient).

For **hyperspecial vertices**: \(\mathcal{P}_v = K_v\) is a maximal
compact subgroup naturally isomorphic to \(G(\mathcal{O}_F)\) for a
smooth reductive \(\mathcal{O}_F\)-model of \(G\); requires \(G\) to
be unramified.

## Examples

### \(\mathrm{SL}_2(\mathbb{Q}_p)\) tree

\(\mathcal{B}(\mathrm{SL}_2, \mathbb{Q}_p)\) is the \((p+1)\)-regular
tree:

- **Vertices**: 2 conjugacy classes (one for each hyperspecial class).
- **Edges** = alcoves: 1 conjugacy class.
- The two vertex classes give two conjugate copies of
  \(\mathrm{SL}_2(\mathbb{Z}_p)\) — corresponding to the two hyperspecial
  vertices in the apartment.

### \(\mathrm{SL}_n(F)\)

Vertices = homothety classes of lattices in \(F^n\); facets =
chains of lattices.

Number of vertex conjugacy classes: \(n\) (corresponding to "type" of
lattice, indexed by determinant valuation mod \(n\)). Only one is
hyperspecial; the others are special but not hyperspecial.

## Operations on facets

- **Star** of a facet \(F\): set of facets containing \(F\) in their
  closure. The star encodes the local structure of the building.
- **Link** of a facet \(F\): boundary of the star, a spherical
  sub-building isomorphic to the spherical building of the residue
  reductive group at \(F\).

The link structure gives the **reduction** of representation theory:
representations of \(G(F)\) at depth determined by \(F\) reduce to
representations of the residue-field reductive group via the link.

## Galois descent for non-split groups

For \(G\) non-split: facets of \(\mathcal{B}(G, F)\) are obtained as
\(\mathrm{Gal}(K/F)\)-fixed sub-facets of \(\mathcal{B}(G_K, K)\) (\(K\)
the splitting field). Some absolute facets may not descend; the rest
parametrise the \(G(F)\)-conjugacy classes.

## Role in Langlands

- **Parahoric / Iwahori structure**: facets ↔ parahoric subgroups ↔
  reduction-mod-\(p\) reductive groups.
- **Bushnell-Kutzko types**: defined on facets of the building, with
  the choice of facet controlling the depth.
- **Local Langlands at depth zero**: representations of \(G(F)\) with
  invariants under a parahoric pro-unipotent radical reduce to
  representations of the residue-field reductive group.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (1972,
  1984).
- Tits, *Reductive groups over local fields* (Proc.\ AMS Symp.\ 1979).
- Yu, *Bruhat-Tits theory: a new approach* (preprint, 2002).

## Prerequisite Topics

- [[node:buildings.bruhat_tits_buildings|Bruhat-Tits Buildings]]
