---
id: buildings_and_parahorics.parahoric_group_schemes
title: Parahoric Group Schemes
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- buildings_and_parahorics.parahoric_subgroups
- buildings_and_parahorics.smooth_affine_group_schemes_over_valuation_rings
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are parahoric group schemes defined uniformly as smooth affine O_F-group schemes with generic fibre G?"
  verdict: "Yes. For each facet F of the Bruhat-Tits building of G/F, there is a canonical smooth affine O_F-model G_F whose O_F-points are the parahoric subgroup."
tags:
- parahoric-group-schemes
- buildings-and-parahorics
---

# Parahoric Group Schemes

A **parahoric group scheme** \(\mathcal{G}_F\) is a smooth affine
\(\mathcal{O}_F\)-group scheme whose generic fibre is the reductive
group \(G\) and whose \(\mathcal{O}_F\)-points form a parahoric
subgroup of \(G(F)\). They give the **scheme-theoretic** counterpart of
the topological parahoric subgroups.

## Definition

Let \(G\) be a connected reductive group over a non-archimedean local
field \(F\) with valuation ring \(\mathcal{O}_F\). For each facet
\(\mathcal{F} \subseteq \mathcal{B}(G, F)\) of the Bruhat-Tits
building, the **parahoric group scheme** \(\mathcal{G}_\mathcal{F}\)
is the unique smooth affine \(\mathcal{O}_F\)-group scheme such that:

- \(\mathcal{G}_\mathcal{F} \otimes_{\mathcal{O}_F} F \cong G\) (generic
  fibre is \(G\));
- \(\mathcal{G}_\mathcal{F}(\mathcal{O}_F) = \mathcal{P}_\mathcal{F}\)
  (parahoric subgroup).

Existence and uniqueness: Bruhat-Tits.

## Structure

The special fibre \(\bar{\mathcal{G}}_\mathcal{F} := \mathcal{G}_\mathcal{F} \otimes \mathbb{F}_q\)
is a connected smooth affine algebraic group over \(\mathbb{F}_q\)
with:

- **Reductive quotient** \(\bar{\mathcal{G}}_\mathcal{F}^{\mathrm{red}}\):
  a connected reductive \(\mathbb{F}_q\)-group, determined by the
  combinatorics of the facet (= "type" of \(\mathcal{F}\)).
- **Unipotent radical** \(R_u(\bar{\mathcal{G}}_\mathcal{F})\): the
  reduction modulo the pro-unipotent radical of the parahoric.

## Examples

### \(\mathrm{GL}_n\), hyperspecial vertex

\(\mathcal{G}_v = \mathrm{GL}_{n, \mathcal{O}_F}\) (the standard
\(\mathcal{O}_F\)-model); generic fibre = \(\mathrm{GL}_{n, F}\),
special fibre = \(\mathrm{GL}_{n, \mathbb{F}_q}\) (reductive).

### \(\mathrm{GL}_n\), Iwahori

For the Iwahori \(I\): \(\mathcal{G}_I\) has special fibre the **Iwahori
group scheme** — block upper-triangular over \(\mathbb{F}_q\) modulo
the strict block upper-triangular unipotent radical. Reductive
quotient is \(\mathbb{G}_m^n\) (the standard torus mod \(\pi\)).

### \(\mathrm{SL}_n\), general parahoric

For a composition \(n = n_1 + \cdots + n_k\) of \(n\) giving a
parahoric \(P\): special fibre has reductive quotient
\(\mathrm{SL}_{n_1} \times \cdots \times \mathrm{SL}_{n_k}\)
(modulo central twist).

## Construction (Bruhat-Tits)

The parahoric group scheme is constructed via:

1. Glue affine charts indexed by root subgroups + Cartan.
2. Each chart is \(\mathcal{O}_F\)-affine, smooth.
3. Together they form a smooth \(\mathcal{O}_F\)-group scheme with
   generic fibre \(G\).

This is the "smooth model" of \(G\) at the facet \(\mathcal{F}\).

## Functoriality

For \(\mathcal{F} \subseteq \mathcal{F}'\) (\(\mathcal{F}'\) in the
closure of \(\mathcal{F}\)): there is a canonical morphism
\(\mathcal{G}_\mathcal{F} \to \mathcal{G}_{\mathcal{F}'}\) (since the
parahoric \(\mathcal{P}_\mathcal{F}\) contains
\(\mathcal{P}_{\mathcal{F}'}\)).

These morphisms make the collection \(\{\mathcal{G}_\mathcal{F}\}\)
into a "facet-indexed system" of smooth group schemes — a key
algebro-geometric object.

## Lattice models for \(\mathrm{GL}_n\) and \(\mathrm{SL}_n\)

For classical groups: parahoric group schemes have explicit
descriptions as automorphism schemes of lattice chains:
\[
\mathrm{GL}_n: \;\;\mathcal{G}_{\text{chain}} \;=\; \mathrm{Aut}(\Lambda_0 \supseteq \Lambda_1 \supseteq \cdots \supseteq \pi \Lambda_0),
\]
where \(\Lambda_i\) is a chain of lattices in \(F^n\) compatible with
the chosen facet.

## Smooth models and integral structure

Parahoric group schemes are the prototypical examples of:
- **Smooth integral models** of reductive groups (in the sense of
  Bruhat-Tits / Conrad-Gabber-Prasad).
- **Néron models** in the additive case (Néron blowing up).

These are the natural integral structures for studying mod-\(p\)
phenomena (reduction of Shimura varieties, integral models of
automorphic forms).

## Role in Langlands

- **Local models of Shimura varieties**: the parahoric group scheme
  appears as the local structure at each prime; Rapoport-Zink local
  models are based on parahoric structure.
- **Mod \(p\) representation theory**: the special fibre's
  representation theory governs depth-zero supercuspidal
  parametrisation.
- **Integral / smooth Eisenstein series**: rely on smooth integral
  models at each prime.

## Mathlib

Not formalised; depends on \(p\)-adic infrastructure.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (1972,
  1984).
- Tits, *Reductive groups over local fields* (Proc.\ AMS Symp.\ 1979).
- Pappas–Rapoport, *Local models in the ramified case I, II, III*
  (Compositio 2003-2009).
- Pappas–Zhu, *Local models of Shimura varieties and a conjecture of
  Kottwitz* (Invent.\ Math.\ 2013).

## Prerequisite Topics

- [[node:buildings_and_parahorics.parahoric_subgroups|Parahoric Subgroups]]
- [[node:buildings_and_parahorics.smooth_affine_group_schemes_over_valuation_rings|Smooth Affine Group Schemes over Valuation Rings]]
