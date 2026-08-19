---
id: affine_group_schemes.group_scheme_homomorphism
title: Homomorphism of Affine Group Schemes
kind: definition
status: admitted
primary_topic: AlgebraicGroups.AffineGroupSchemes
topics:
- AlgebraicGroups.AffineGroupSchemes
uses:
- affine_group_schemes.affine_group_scheme_definition
- affine_group_schemes.coordinate_hopf_algebra_of_group_scheme
source:
  spans:
  - artifact: sga3
    locator: "Expose I"
    note: "Morphisms of group schemes as group-object morphisms; the coordinate-ring translation."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition given as group-object morphisms over an arbitrary base, with unit and inversion compatibility derived rather than assumed?"
  verdict: "Yes. Only compatibility with multiplication is required; preservation of unit and inversion is derived pointwise, and the base is an arbitrary commutative ring."
tags:
- group-scheme
- homomorphism
- affine-group-schemes
---

# Homomorphism of Affine Group Schemes

Let \(G, H\) be affine group schemes over a commutative ring \(R\). A
**homomorphism** \(f : G \to H\) is a morphism of \(R\)-schemes
compatible with the multiplication morphisms:
\[
f \circ m_G \;=\; m_H \circ (f \times f),
\]
i.e. a morphism of group objects in the category of \(R\)-schemes.

**Unit and inversion come for free.** Compatibility with the unit and
inversion morphisms need not be imposed: for every \(R\)-algebra
\(S\), the map \(f(S) : G(S) \to H(S)\) is a map of groups
commuting with multiplication, and a multiplication-preserving map of
groups automatically preserves the identity and inverses; by the
functor-of-points characterization this holds at the scheme level.

**Coordinate-ring translation (the bridge).** For \(G =
\operatorname{Spec} A\) and \(H = \operatorname{Spec} B\) with their
coordinate Hopf algebras, homomorphisms \(G \to H\) correspond
contravariantly to \(R\)-**bialgebra** homomorphisms \(B \to A\):
compatibility with multiplication translates to compatibility with
comultiplication, the counit condition is automatic (it is the unit
compatibility), and compatibility with the antipode is automatic for
bialgebra maps between Hopf algebras. This bridge decomposes as the
composite of two identifications, each recorded separately:

1. group-object morphisms correspond to group-object morphisms in the
   opposite category of algebras
   ([[node:affine_group_schemes.hopf_spec_fully_faithful]]);
2. group-object morphisms in the opposite category of algebras
   correspond to bialgebra homomorphisms of the coordinate Hopf
   algebras — the morphism half of the dictionary between
   [[node:affine_group_schemes.coordinate_hopf_algebra_of_group_scheme|coordinate Hopf algebras]]
   and group objects.

Every use of "characters are Hopf-algebra maps" in this knowledge
base passes through this bridge; see
[[node:tori.characters_as_group_like_elements]] and
[[node:tori.convolution_is_pointwise_multiplication]].
