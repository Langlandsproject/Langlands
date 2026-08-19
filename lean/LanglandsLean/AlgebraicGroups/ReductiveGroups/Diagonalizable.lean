import LanglandsLean.AlgebraicGroups.Tori.CharacterGroup
import Mathlib.RingTheory.Bialgebra.MonoidAlgebra

/-!
# Diagonalizable groups: Cartier duality and the diagonalizability predicate

The Lean home of the knowledge-base node
`reductive_groups.diagonalizable_groups_antiequivalence` (topic
`AlgebraicGroups.ReductiveGroups`), per the file-placement rule
(conventions §4): a file hosts the definitions of exactly one node
cluster within one topic.

* `diagCharEquiv`, `diagHomEquiv`, `diag_bialgEquiv_iff_addEquiv` —
  Cartier duality for split diagonalizable groups `D(M)`: characters
  are the lattice, Hopf maps are lattice maps, isomorphism classes
  are lattice classes.
* `charLift` — the canonical evaluation of characters
  `R[X(A)] → A`, `e^χ ↦ χ(t)`: the character decomposition of a
  coordinate ring.
* `IsDiagonalizableAlgebra` — `Spec A` is diagonalizable iff the
  canonical evaluation is an isomorphism (`A ≅ R[X(A)]`), the
  canonical-witness form of "`A` is a group algebra".

Consumers: tori are the special case with free finite character
lattice (`Tori/Torus.lean`).
-/

open Bialgebra Coalgebra HopfAlgebra WithConv
open Langlands.Tori

namespace Langlands.ReductiveGroups


variable (R : Type*) [CommRing R]

section Cartier

variable [IsDomain R]
variable (M N : Type*) [AddCommGroup M] [AddCommGroup N]

/-- **Cartier duality, object level** (split case): the character
group of `D(M)` is exactly the lattice `M`. The character attached to
`m : M` is the Hopf map `R[ℤ] → R[M]` induced by `1 ↦ m` on
exponents; the identification of lattice addition with convolution is
Mathlib's `mapDomainBialgHomAddEquiv`.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence, tori.character_and_cocharacter_lattices, tori.f_tori_galois_module_classification
-/
noncomputable def diagCharEquiv :
    Multiplicative M ≃* WithConv (LaurentPolynomial R →ₐc[R] AddMonoidAlgebra R M) :=
  AddEquiv.toMultiplicativeLeft
    ((zmultiplesAddEquiv M).trans
      (AddMonoidAlgebra.mapDomainBialgHomAddEquiv (R := R)))

/-- **Cartier duality, hom level**: Hopf-algebra homomorphisms
`R[M] → R[N]` correspond to lattice homomorphisms `M → N` — full
faithfulness of `D` on the split category.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
noncomputable def diagHomEquiv :
    (M →+ N) ≃ (AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N) :=
  AddMonoidAlgebra.mapDomainBialgHomEquiv

/-- **Split classification theorem** (isomorphism level of Cartier
duality): two split diagonalizable groups are isomorphic over a
domain iff their lattices are.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
-/
theorem diag_bialgEquiv_iff_addEquiv :
    Nonempty (AddMonoidAlgebra R M ≃ₐc[R] AddMonoidAlgebra R N) ↔
      Nonempty (M ≃+ N) := by
  constructor
  · rintro ⟨φ⟩
    refine ⟨AddMonoidHom.toAddEquiv
      (AddMonoidAlgebra.mapDomainOfBialgHom
        (φ : AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N))
      (AddMonoidAlgebra.mapDomainOfBialgHom
        (φ.symm : AddMonoidAlgebra R N →ₐc[R] AddMonoidAlgebra R M))
      ?_ ?_⟩
    · ext m
      refine AddMonoidAlgebra.single_left_injective (r := (1 : R))
        one_ne_zero ?_
      simp [AddMonoidAlgebra.single_mapDomainOfBialgHom]
    · ext n
      refine AddMonoidAlgebra.single_left_injective (r := (1 : R))
        one_ne_zero ?_
      simp [AddMonoidAlgebra.single_mapDomainOfBialgHom]
  · rintro ⟨e⟩
    exact ⟨AddMonoidAlgebra.domCongrBialgEquiv R R e⟩

/-! ### Examples -/

section Examples

/-- Characters of `𝔾ₘ = D(ℤ)`: the lattice `ℤ`. -/
noncomputable example : Multiplicative ℤ ≃* WithConv (LaurentPolynomial R →ₐc[R] LaurentPolynomial R) :=
  diagCharEquiv R ℤ

/-- Endomorphisms of `𝔾ₘ` as a group scheme: `ℤ`, acting by
`t ↦ tⁿ`. -/
noncomputable example :
    (ℤ →+ ℤ) ≃ (LaurentPolynomial R →ₐc[R] LaurentPolynomial R) :=
  diagHomEquiv R ℤ ℤ

end Examples

end Cartier

section Diagonalizable

variable (A : Type*) [CommRing A] [HopfAlgebra R A]

/-- **The canonical evaluation of characters** `R[X(A)] → A`,
`e^χ ↦ χ` — the character decomposition of the coordinate ring
(`k[D] = k[X(D)]`). Characters appear here in their working carrier,
the group-like elements (`tori.characters_as_group_like_elements`;
the definition of a character is `CharacterGroup`).

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
noncomputable def charLift :
    MonoidAlgebra R (GroupLike R A) →ₐc[R] A :=
  BialgHom.ofAlgHom
    (MonoidAlgebra.lift R A (GroupLike R A) (GroupLike.valMonoidHom R A))
    (by
      ext g
      simp)
    (by
      ext g
      simp)

/-- **Diagonalizable coordinate algebra**: the canonical evaluation
`R[X(A)] → A` is bijective — the character decomposition
`A ≅ R[X(A)]` holds. This is the canonical-witness form of
"`A ≅ R[M]` for some abelian group `M`" (take `M = X(A)`).

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
class IsDiagonalizableAlgebra : Prop where
  bijective_charLift : Function.Bijective (charLift R A)

end Diagonalizable

end Langlands.ReductiveGroups
