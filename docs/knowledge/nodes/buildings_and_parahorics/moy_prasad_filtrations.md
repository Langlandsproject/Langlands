---
id: buildings_and_parahorics.moy_prasad_filtrations
title: Moy-Prasad Filtrations
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- buildings_and_parahorics.parahoric_subgroups
- reductive_structure.reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Moy-Prasad filtrations defined uniformly for all reductive groups over local fields, with their use in parametrising supercuspidal representations?"
  verdict: "Yes. The filtration G(F)_{x, r} at any point x of the building and depth r ≥ 0 is intrinsic and works uniformly; it is the modern tool for parametrising depth-r representations."
tags:
- moy-prasad-filtrations
- buildings-and-parahorics
---

# Moy-Prasad Filtrations

The **Moy-Prasad filtration** is a decreasing sequence of compact open
subgroups \(G(F)_{x, r}\) indexed by a point \(x\) of the Bruhat-Tits
building and a non-negative real \(r\) (the **depth**). It is the
modern tool for parametrising representations of \(p\)-adic reductive
groups by their depth.

## Definition

Let \(G\) be a connected reductive group over a non-archimedean local
field \(F\) with absolute root system \(\Phi\) and Bruhat-Tits building
\(\mathcal{B}(G, F)\). For each point \(x \in \mathcal{B}(G, F)\) and
\(r \in \mathbb{R}_{\ge 0}\), define:

\[
G(F)_{x, r} \;:=\; \langle T(F)_r, \;U_{\alpha, \alpha(x) + r} : \alpha \in \Phi \rangle,
\]

where:
- \(T(F)_r\) = the depth-\(r\) part of a maximal torus of \(G\)
  (typically \(T(F)_r = \{t \in T(\mathcal{O}_F) : t \equiv 1 \pmod {\pi^r}\}\));
- \(U_{\alpha, \alpha(x) + r}\) = the level-\((\alpha(x) + r)\) part of
  the root subgroup \(U_\alpha\) (via the valued root datum filtration).

Key features:
- \(G(F)_{x, 0} = \mathcal{P}_x\), the **parahoric** subgroup
  associated to the facet containing \(x\).
- \(G(F)_{x, 0^+} = \mathcal{P}_x^+\), the pro-unipotent radical of
  \(\mathcal{P}_x\).
- For \(r > s\): \(G(F)_{x, r} \subseteq G(F)_{x, s}\) (decreasing
  filtration).

## Successive quotients

The **graded pieces** \(\mathrm{gr}^r G(F)_x = G(F)_{x, r} / G(F)_{x, r^+}\)
have a clean description:

- For \(r = 0\): \(\mathrm{gr}^0 = \mathcal{P}_x / \mathcal{P}_x^+\) =
  reductive quotient over \(\mathbb{F}_q\).
- For \(r > 0\): \(\mathrm{gr}^r\) is a direct sum of root spaces
  \(\mathfrak{g}_\alpha\) for affine roots \(\psi = \alpha + c\) with
  \(\psi(x) + r \in \Gamma_\alpha\) (discrete, finite-dimensional
  \(\mathbb{F}_q\)-vector space).

## Lie algebra version

There is a parallel **Moy-Prasad Lie algebra filtration**:
\[
\mathfrak{g}(F)_{x, r} \;:=\; \mathfrak{t}(F)_r \;\oplus\; \bigoplus_\alpha \mathfrak{u}_\alpha(F)_{\alpha(x) + r},
\]
with the same properties. The exponential map
\(\exp : \mathfrak{g}(F)_{x, r} \to G(F)_{x, r}\) is a homeomorphism
for \(r > 0\) (in good characteristic).

## Depth of a representation

For a smooth irreducible representation \(\pi\) of \(G(F)\), the
**depth** of \(\pi\) is:
\[
\mathrm{depth}(\pi) \;:=\; \inf\{r \ge 0 : \pi^{G(F)_{x, r^+}} \ne 0 \text{ for some } x\}.
\]

- \(\mathrm{depth}(\pi) = 0\) iff \(\pi\) has invariants under the
  pro-unipotent radical of some parahoric — these are **depth-zero**
  representations.
- General \(\mathrm{depth}(\pi)\) refines the type theory.

## Yu's construction of supercuspidals

**Theorem (Yu, 2001).** For \(G\) a connected reductive group over
\(F\) in good residue characteristic, the **supercuspidal**
representations of \(G(F)\) are exhaustively constructed from:

- A **generic cuspidal datum**: a tuple \((G_0 \subseteq G_1 \subseteq \cdots \subseteq G_d = G, \pi_0, \chi_1, \ldots, \chi_d)\) of nested twisted Levis with depth-zero supercuspidal data;
- A point \(x \in \mathcal{B}(G_0, F)\);
- Compatible characters \(\chi_i\) on intermediate filtration steps.

This is called **Yu's construction** and depends crucially on the
Moy-Prasad filtration.

## Refinements

- **Kim's exhaustion theorem (2007)**: Yu's construction gives **all**
  supercuspidals (in residue characteristic \(\ne 2\); refined to
  more general settings by Fintzen).
- **Fintzen's exhaustion (2021)**: extends to arbitrary residue
  characteristic.
- **Kaletha refinement**: uses **regular supercuspidal**
  parametrisation via embeddings of tori.

## Examples

### Depth-zero supercuspidals of \(\mathrm{GL}_n(F)\)

Inflated from cuspidal representations of \(\mathrm{GL}_n(\mathbb{F}_q)\)
to a maximal compact subgroup of \(\mathrm{GL}_n(F)\), then induced.

Number: equal to the number of cuspidal reps of
\(\mathrm{GL}_n(\mathbb{F}_q)\) = number of \(\mathrm{Gal}(\overline{\mathbb{F}_q}/\mathbb{F}_q)\)-orbits
of irreducible characters of \(\overline{\mathbb{F}_q}^\times\) of size \(n\).

### Positive-depth supercuspidals of \(\mathrm{GL}_2(F)\)

Bushnell-Kutzko's complete classification via "simple types"; in
modern language, these are Yu's data with depth \(> 0\).

## Role in Langlands

- **Bushnell-Kutzko types**: framework for parametrising all
  representations of \(G(F)\) via the parahoric/Moy-Prasad structure.
- **Local Langlands construction**: Kaletha's regular supercuspidal
  L-packets are constructed via Moy-Prasad data + Yu data.
- **Smooth representations of \(p\)-adic groups**: depth is a basic
  invariant; the category of representations decomposes by depth.

## Mathlib

Not formalised; requires extensive \(p\)-adic and reductive-group
infrastructure.

## References

- Moy–Prasad, *Unrefined minimal K-types for p-adic groups* (Inv.\
  Math.\ 1994).
- Moy–Prasad, *Jacquet functors and unrefined minimal K-types*
  (Comment.\ Math.\ Helv.\ 1996).
- Yu, *Construction of tame supercuspidal representations* (J.\ AMS
  2001).
- Kim, *Supercuspidal representations: an exhaustion theorem* (J.\
  AMS 2007).
- Fintzen, *Types for tame p-adic groups* (Annals 2021).

## Prerequisite Topics

- [[node:buildings_and_parahorics.parahoric_subgroups|Parahoric Subgroups]]
- [[node:nilpotent_orbits.lie_algebras_of_reductive_groups|Lie Algebras of Reductive Groups]]
