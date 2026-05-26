---
id: bd_covers.splittings_over_integral_and_parahoric_subgroups
title: Splittings over Integral and Parahoric Subgroups
kind: topic
status: admitted
primary_topic: bd_covers
topics:
- bd_covers
uses:
- bd_covers.local_and_global_metaplectic_covers
- buildings_and_parahorics.parahoric_subgroups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are splittings of metaplectic covers over integral and parahoric subgroups treated uniformly, with the existence and uniqueness conditions stated?"
  verdict: "Yes. Metaplectic covers split canonically over hyperspecial parahorics in the unramified case; for general parahorics the splitting is a finer datum depending on the BD class."
tags:
- splittings
- parahoric-subgroups
- bd-covers
---

# Splittings over Integral and Parahoric Subgroups

A metaplectic cover \(\overline G \to G(F)\) of a reductive group over
a local field often **splits** when restricted to integral / parahoric
subgroups. These splittings are the key technical input for organising
the representation theory of metaplectic groups via parahoric
representations.

## Setup

Let \(F\) be a non-archimedean local field, \(G/F\) a connected reductive
group, and
\[
1 \;\to\; \mu_n \;\to\; \overline G \;\to\; G(F) \;\to\; 1
\]
a metaplectic cover specialised from a Brylinski-Deligne extension.

A **splitting** of the cover over a subgroup \(H \subseteq G(F)\) is a
group homomorphism
\[
s : H \;\hookrightarrow\; \overline G
\]
such that \(\overline G \to G(F)\) composed with \(s\) is the identity
on \(H\).

## Splittings over hyperspecial parahorics

**Theorem (Brylinski-Deligne; Moore).** Let \(K = G(\mathcal{O}_F)\) be
a hyperspecial maximal compact subgroup (exists iff \(G\) is unramified
at \(F\)). The metaplectic cover \(\overline G \to G(F)\) splits over
\(K\) **canonically** (up to inner automorphism by \(\mu_n\)).

In particular: the genuine representations of \(\overline G\) with
non-trivial central character can have \(K\)-invariant vectors, and
the \(K\)-spherical representations of \(\overline G\) are organised
via Satake-style transforms compatible with the splitting.

## Splittings over general parahorics

For a general parahoric \(P \subseteq G(F)\):

- The metaplectic cover may or may not split over \(P\), depending on
  the BD class and the parahoric type.
- Hyperspecial \(\subseteq\) special vertices typically have splittings.
- Iwahori subgroups often have **partial splittings** with cohomological
  obstructions.

The set of splittings over \(P\) (when non-empty) is a torsor under
characters \(\mathrm{Hom}(P/[P, P], \mu_n)\).

## Pro-unipotent radical

The pro-unipotent radical \(P^+ \subseteq P\) (= kernel of reduction)
is a pro-\(p\) group. For \(p \nmid n\) (e.g.\ \(p \ne 2\) for the
\(\mu_2\)-cover): the cover splits canonically over \(P^+\) (since
\(H^2(P^+, \mu_n) = 0\)).

So the cover descends to a cover of the **reductive quotient**
\(\bar{P}^{\mathrm{red}}(\mathbb{F}_q)\), which is a finite reductive
group. Studying covers of finite reductive groups (much simpler!) gives
the "depth-zero" piece of metaplectic representation theory.

## Global splittings

For a global metaplectic cover \(\overline{G(\mathbb{A}_F)}\): the
product formula ensures the cover splits over the diagonal \(G(F)\)
(see [[node:bd_covers.local_and_global_metaplectic_covers|local and global metaplectic covers]]).

In addition, the cover splits over the **global integral subgroup**
\(K_S := \prod_{v \notin S} G(\mathcal{O}_v)\) for a finite "bad"
set \(S\) of places, with splittings at each \(v \notin S\) determined
by the local hyperspecial splitting.

## Examples

### \(\overline{\mathrm{SL}_2(\mathbb{Q}_p)}^{(2)}\) for \(p\) odd

The double cover splits over \(\mathrm{SL}_2(\mathbb{Z}_p)\)
canonically. Genuine \(\mathrm{SL}_2(\mathbb{Z}_p)\)-spherical
representations of \(\overline{\mathrm{SL}_2(\mathbb{Q}_p)}^{(2)}\) are
parametrised by characters of the diagonal torus (after passage
through the splitting).

### Iwahori splitting for \(\overline{\mathrm{SL}_2}\)

The Iwahori \(I \subseteq \mathrm{SL}_2(\mathbb{Q}_p)\) admits a
canonical splitting iff \(p\) is odd. For \(p = 2\), \(\mathrm{Sp}_{2n}(\mathbb{Q}_2)\)
doesn't split over the Iwahori — the cohomological obstruction is the
Hilbert symbol \((2, \cdot)_2\).

### Brylinski-Deligne global splitting

For a global BD extension, the local-global splitting structure is
governed by:
- Local Hilbert symbols at each place;
- The global reciprocity (= product formula).

The compatibility of local splittings (when they exist) is what makes
**global automorphic forms on \(\overline G\)** well-defined.

## Role in Langlands

- **Local Langlands at depth zero**: parahoric splittings reduce
  metaplectic depth-zero theory to finite-reductive-group covers.
- **Spherical Hecke algebras**: defined for the genuine
  \(K\)-spherical representations via the canonical splitting at
  hyperspecial vertices.
- **Eisenstein series on covers**: require local splittings at almost
  all places + compatible global section.
- **\(p\)-integral structure**: splittings are essential for any
  arithmetic / integral version of automorphic theory on covers.

## References

- Moore, *Group extensions of p-adic and adelic linear groups* (Publ.\
  IHES 1968).
- Matsumoto, *Sur les sous-groupes arithmétiques des groupes
  semi-simples déployés* (Ann.\ Sci.\ ENS 1969).
- Brylinski–Deligne, *Central extensions of reductive groups by
  \(\mathbf{K}_2\)* (Publ.\ IHES 2001).
- Weissman, *Metaplectic tori over local fields* (Pac.\ J.\ Math.\
  2009).

## Prerequisite Topics

- [[node:bd_covers.local_and_global_metaplectic_covers|Local and Global Metaplectic Covers]]
- [[node:buildings_and_parahorics.parahoric_subgroups|Parahoric Subgroups]]
