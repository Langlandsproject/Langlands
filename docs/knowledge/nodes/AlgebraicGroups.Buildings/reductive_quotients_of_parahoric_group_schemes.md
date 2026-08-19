---
id: buildings.reductive_quotients_of_parahoric_group_schemes
title: Reductive Quotients of Parahoric Group Schemes
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Buildings
topics:
- AlgebraicGroups.Buildings
uses:
- buildings.parahoric_group_schemes
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are reductive quotients of parahoric group schemes treated uniformly for all reductive groups over local fields?"
  verdict: "Yes. The reductive quotient at each facet is a connected reductive F_q-group determined by the facet's combinatorics; the construction is functorial in the parahoric and explicit via lattice models."
tags:
- reductive-quotients
- parahoric-group-schemes
- buildings-and-parahorics
---

# Reductive Quotients of Parahoric Group Schemes

The **reductive quotient** of a parahoric group scheme is the connected
reductive \(\mathbb{F}_q\)-group obtained by killing the pro-unipotent
radical of the special fibre. It is the natural target of reduction-
mod-\(p\) for representations of \(G(F)\) and the bridge to finite
reductive group theory.

## Definition

Let \(\mathcal{G}_\mathcal{F}\) be the parahoric group scheme attached
to a facet \(\mathcal{F} \subseteq \mathcal{B}(G, F)\), with special
fibre \(\bar{\mathcal{G}}_\mathcal{F}\) over \(\mathbb{F}_q\). The
special fibre is a connected smooth affine \(\mathbb{F}_q\)-group with:

- **Unipotent radical** \(R_u(\bar{\mathcal{G}}_\mathcal{F})\), a
  connected smooth unipotent group;
- **Reductive quotient**
  \[
  \bar{\mathcal{G}}_\mathcal{F}^{\mathrm{red}} \;:=\; \bar{\mathcal{G}}_\mathcal{F} \big/ R_u(\bar{\mathcal{G}}_\mathcal{F}).
  \]

\(\bar{\mathcal{G}}_\mathcal{F}^{\mathrm{red}}\) is a connected reductive
group over \(\mathbb{F}_q\).

## Reduction map

The natural projection
\[
\mathcal{P}_\mathcal{F} \;=\; \mathcal{G}_\mathcal{F}(\mathcal{O}_F) \;\twoheadrightarrow\; \bar{\mathcal{G}}_\mathcal{F}^{\mathrm{red}}(\mathbb{F}_q)
\]
is the **reduction map**. Its kernel is the **pro-unipotent radical**
\(\mathcal{P}_\mathcal{F}^+\) of the parahoric, a pro-\(p\) group.

## Examples

### Hyperspecial vertex

For \(G\) unramified at a hyperspecial \(v\):
\[
\bar{\mathcal{G}}_v^{\mathrm{red}} \;=\; G_{\mathbb{F}_q},
\]
the reductive group "of the same type" as \(G\), now over \(\mathbb{F}_q\).
E.g.\ for \(G = \mathrm{GL}_n\): \(\bar{\mathcal{G}}_v^{\mathrm{red}} = \mathrm{GL}_n(\mathbb{F}_q)\).

### Iwahori

For the Iwahori \(I\) (= alcove stabiliser):
\[
\bar{I}^{\mathrm{red}} \;=\; T_{\mathbb{F}_q},
\]
a maximal torus over \(\mathbb{F}_q\) (the **diagonal torus** for
\(\mathrm{GL}_n\)).

### General parahoric (composition \(n = n_1 + \cdots + n_k\))

\[
\bar{\mathcal{P}}^{\mathrm{red}} \;=\; \mathrm{GL}_{n_1}(\mathbb{F}_q) \times \cdots \times \mathrm{GL}_{n_k}(\mathbb{F}_q),
\]
a Levi-like decomposition.

### Ramified non-split case

For ramified \(\mathrm{SU}_n\): the reductive quotient may be a
**different** reductive group of "lower type" than \(\mathrm{SU}_n\) —
for example a product of \(\mathrm{GL}_a \times \mathrm{Sp}_{2b}\) for
some \(a, b\) depending on the specific facet and the ramification
structure.

## Depth-zero representation theory

**Theorem (Morris / Moy-Prasad).** The set of irreducible smooth
representations of \(G(F)\) at depth zero is in bijection with pairs:
\[
(\mathcal{F}, \pi)
\]
where:
- \(\mathcal{F}\) is a facet of \(\mathcal{B}(G, F)\) modulo \(G(F)\)-action;
- \(\pi\) is an irreducible **cuspidal** representation of
  \(\bar{\mathcal{G}}_\mathcal{F}^{\mathrm{red}}(\mathbb{F}_q)\).

This is the **depth-zero supercuspidal parametrisation** — reducing
representations of \(p\)-adic reductive groups to representations of
finite reductive groups.

## Functoriality

For \(\mathcal{F} \subseteq \mathcal{F}'\) (\(\mathcal{F}'\) in the
closure of \(\mathcal{F}\)): there is a parabolic embedding
\[
\bar{\mathcal{P}}_{\mathcal{F}'}^{\mathrm{red}} \;\hookrightarrow\; \bar{\mathcal{P}}_\mathcal{F}^{\mathrm{red}}
\]
as a Levi factor of a parabolic subgroup. This is the geometric
basis of **parabolic induction** at the level of finite reductive
groups, lifted to depth-zero representations of \(p\)-adic groups.

## Galois descent for non-split groups

For \(G\) non-split: compute the reductive quotient of \(G_K\) at the
corresponding facet over \(K = \widehat{F^{\mathrm{unr}}}\), then take
\(\mathrm{Frob}\)-invariants (a finite group of Lie type).

The result is generally smaller than expected: ramification reduces
the rank of the reductive quotient.

## Role in Langlands

- **Depth-zero supercuspidals**: classified via cuspidal characters
  of the reductive quotient at vertices.
- **Local Langlands at depth zero**: the L-parameters of depth-zero
  representations are constructed via Deligne-Lusztig theory on the
  reductive quotient.
- **Mod \(p\) representations**: the special fibre's representation
  theory in characteristic \(p\) is the key to mod \(p\) local
  Langlands.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (1972,
  1984).
- Moy–Prasad, *Unrefined minimal K-types for p-adic groups* (Inv.\
  Math.\ 1994).
- Morris, *Tamely ramified intertwining algebras* (Invent.\ Math.\
  1993).
- Deligne–Lusztig, *Representations of reductive groups over finite
  fields* (Annals 1976).

## Prerequisite Topics

- [[node:buildings.parahoric_group_schemes|Parahoric Group Schemes]]
