---
id: tori.characters_as_group_like_elements
title: Characters Are Group-Like Elements
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
- AlgebraicGroups.AffineGroupSchemes
uses:
- tori.algebraic_tori
- tori.character_and_cocharacter_lattices
- affine_group_schemes.group_scheme_homomorphism
- affine_group_schemes.group_algebra_scheme
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.CharacterGroup
  declarations:
  - Langlands.Tori.diagGroupLikeEquiv
  - Langlands.Tori.characterGroup_diag_equiv
verification:
  statement: accepted
  proof: accepted
  alignment: pending
generality:
  reviewed: true
  prompt: "Is the identification stated for an arbitrary affine group scheme over an arbitrary base, with the torus case as a specialization?"
  verdict: "Yes. The chain of identifications works for any affine group scheme; the domain hypothesis enters only in the final computation for group algebras."
tags:
- characters
- group-like
- theorem
- tori
---

# Characters Are Group-Like Elements

Let \(G = \operatorname{Spec} A\) be an affine group scheme over
\(R\). The character group
\(X^*(G) = \operatorname{Hom}_{\mathrm{grp}}(G, \mathbb{G}_m)\)
(the definition, see
[[node:tori.character_and_cocharacter_lattices]]) admits the
following **computed description**, in two steps:

1. By the coordinate-ring bridge
   ([[node:affine_group_schemes.group_scheme_homomorphism]]),
   \[
   \operatorname{Hom}_{\mathrm{grp}}(G, \mathbb{G}_m)
   \;\cong\;
   \operatorname{Hom}_{R\text{-bialg}}\bigl(R[\mathbb{Z}],\, A\bigr),
   \]
   since \(O(\mathbb{G}_m) = R[\mathbb{Z}]\)
   ([[node:affine_group_schemes.group_algebra_scheme]]).
2. A bialgebra homomorphism \(\varphi : R[\mathbb{Z}] \to A\) is
   determined by \(u = \varphi(e^{1})\): multiplicativity forces
   \(\varphi(e^{n}) = u^n\), so \(u\) must be invertible, and
   compatibility with comultiplication and counit says exactly that
   \(u\) is **group-like** (\(\Delta u = u \otimes u\),
   \(\varepsilon(u) = 1\)). Conversely every group-like unit defines
   such a homomorphism. Hence
   \[
   X^*(G) \;\cong\; \{\text{group-like units of } A\},
   \]
   and when \(A\) is a Hopf algebra every group-like element is
   automatically a unit (its inverse is its antipode image), so
   \(X^*(G) \cong \mathrm{GroupLike}(A)\).

Under this identification the pointwise product of characters
corresponds to the product of group-like elements
(see [[node:tori.convolution_is_pointwise_multiplication]]).

**Specialization to split tori.** For \(A = R[M]\) over a domain
\(R\), the group-like elements are exactly the basis elements
\(e^m\), so \(X^*(D(M)) \cong M\) — this is the object half of
Cartier duality recorded at
[[node:reductive_groups.diagonalizable_groups_antiequivalence]].

*Proof.*
Step 1 is the bridge node. For step 2: given \(\varphi\), set
\(u = \varphi(e^1)\); then \(\varphi(e^n) = u^n\) for \(n \geq 0\) by
multiplicativity and for \(n < 0\) because \(e^{-1}\) is the inverse
of \(e^1\), forcing \(u \in A^\times\). Compatibility with the
group-like comultiplication of \(R[\mathbb{Z}]\) gives
\(\Delta(u) = u \otimes u\) and \(\varepsilon(u) = 1\). Conversely a
group-like unit \(u\) defines an algebra map \(R[\mathbb{Z}] \to A\),
\(e^n \mapsto u^n\), which is a coalgebra map on the basis, hence a
bialgebra map. The two constructions are mutually inverse. For a Hopf
algebra, \(S(u)\,u = \varepsilon(u) = 1\) shows group-likes are
units.
