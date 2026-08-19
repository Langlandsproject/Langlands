---
id: affine_group_schemes.group_algebra_scheme
title: The Diagonalizable Group Scheme D(M)
kind: definition
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
- AlgebraicGroups.Tori
uses:
- affine_group_schemes.multiplicative_group_scheme
- affine_group_schemes.coordinate_hopf_algebra_of_group_scheme
- foundations.hopf_algebras
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.DiagGroup
  declarations:
  - Langlands.Tori.diagGroupOver
  - Langlands.Tori.DiagGroup
  - Langlands.Tori.diagGroupPointsEquiv
source:
  spans:
  - artifact: sga3
    locator: "Expose VIII"
    note: "Diagonalizable group schemes D(M) = Spec of the group algebra."
verification:
  definition: accepted
  proof: not_applicable
  alignment: pending
generality:
  reviewed: true
  prompt: "Is D(M) defined over an arbitrary commutative base ring for an arbitrary abelian group, with both the spectral and functor-of-points descriptions?"
  verdict: "Yes. The base is any commutative ring, the group any abelian group; both descriptions are given and their equivalence stated."
tags:
- diagonalizable
- group-scheme
- affine-group-schemes
---

# The Diagonalizable Group Scheme D(M)

Let \(R\) be a commutative ring and \(M\) an abelian group. The
**diagonalizable group scheme** \(D(M)\) over \(R\) admits two
equivalent descriptions.

**As a spectrum (construction).**
\[
D(M) \;=\; \operatorname{Spec} R[M],
\]
the spectrum of the group algebra, whose Hopf structure is group-like
on the canonical basis: \(\Delta(e^m) = e^m \otimes e^m\),
\(\varepsilon(e^m) = 1\), \(S(e^m) = e^{-m}\).

**By its points (characterization).** For any \(R\)-scheme \(T\),
\[
D(M)(T) \;=\; \operatorname{Hom}_{\mathrm{grp}}\bigl(M,\,
\Gamma(T, \mathcal{O}_T)^{\times}\bigr),
\]
the group of characters of \(M\) valued in units of the coordinate
ring, with pointwise multiplication. The equivalence with the
spectral description is the chain
\[
\operatorname{Hom}_{R}(T, \operatorname{Spec} R[M])
\;\cong\; \operatorname{Hom}_{R\text{-alg}}(R[M], \Gamma(T))
\;\cong\; \operatorname{Hom}_{\mathrm{mon}}(M, \Gamma(T))
\;\cong\; \operatorname{Hom}_{\mathrm{grp}}(M, \Gamma(T)^{\times}),
\]
using affineness, the universal property of the group algebra, and the
fact that a monoid homomorphism from a group lands in the units.

The points description is the one to *read*: it determines \(D(M)\)
up to canonical isomorphism and exhibits the group law with no
reference to the Hopf plumbing.

Basic examples: \(D(\mathbb{Z}) = \mathbb{G}_m\)
([[node:affine_group_schemes.multiplicative_group_scheme]]),
\(D(\mathbb{Z}/n) = \mu_n\)
([[node:affine_group_schemes.roots_of_unity_group_scheme]]),
\(D(\mathbb{Z}^n) = \mathbb{G}_m^n\)
([[node:tori.split_torus|the split torus]]).

A group scheme is called **diagonalizable** if it is isomorphic to
some \(D(M)\); that property, and the anti-equivalence \(M \mapsto
D(M)\), are recorded at
[[node:reductive_groups.diagonalizable_groups]] and
[[node:reductive_groups.diagonalizable_groups_antiequivalence]].
