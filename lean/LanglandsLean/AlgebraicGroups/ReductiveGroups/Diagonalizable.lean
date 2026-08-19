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
    Multiplicative M ≃* HopfCharacterGroup R (AddMonoidAlgebra R M) :=
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
noncomputable example : Multiplicative ℤ ≃* HopfCharacterGroup R (LaurentPolynomial R) :=
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

/-- **The canonical evaluation of characters**: `R[X(A)] → A`,
`e^χ ↦ χ(t)` — the group algebra of the character group
`X(A) = Hom(Spec A, 𝔾ₘ)` maps into the coordinate ring by evaluating
each character at the coordinate `t` of `𝔾ₘ`. For a diagonalizable
group this is the character decomposition `k[D] = k[X(D)]`.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
noncomputable def charLift :
    MonoidAlgebra R (HopfCharacterGroup R A) →ₐc[R] A :=
  BialgHom.ofAlgHom
    (MonoidAlgebra.lift R A (HopfCharacterGroup R A)
      { toFun := fun χ => χ.ofConv (AddMonoidAlgebra.single 1 1)
        map_one' := by
          rw [BialgHom.convOne_apply,
            (AddMonoidAlgebra.isGroupLikeElem_single_one
              (R := R) (1 : ℤ)).counit_eq_one, map_one]
        map_mul' := fun χ ψ =>
          convMul_apply_of_isGroupLikeElem χ ψ
            (AddMonoidAlgebra.isGroupLikeElem_single_one 1) })
    (by
      refine MonoidAlgebra.algHom_ext (fun χ => ?_) (Subsingleton.elim _ _)
      show Coalgebra.counit (R := R)
          (MonoidAlgebra.lift R A (HopfCharacterGroup R A) _
            (MonoidAlgebra.single χ 1)) =
        Bialgebra.counitAlgHom R (MonoidAlgebra R (HopfCharacterGroup R A))
          (MonoidAlgebra.single χ 1)
      rw [MonoidAlgebra.lift_single, one_smul]
      have h1 : Coalgebra.counit (R := R)
          (χ.ofConv (AddMonoidAlgebra.single (1 : ℤ) (1 : R))) =
          Coalgebra.counit (R := R)
            (AddMonoidAlgebra.single (1 : ℤ) (1 : R)) :=
        congr($(CoalgHomClass.counit_comp χ.ofConv)
          (AddMonoidAlgebra.single (1 : ℤ) (1 : R)))
      show Coalgebra.counit (R := R)
          (χ.ofConv (AddMonoidAlgebra.single (1 : ℤ) (1 : R))) =
        Bialgebra.counitAlgHom R (MonoidAlgebra R (HopfCharacterGroup R A))
          (MonoidAlgebra.single χ 1)
      rw [h1, (AddMonoidAlgebra.isGroupLikeElem_single_one
        (R := R) (1 : ℤ)).counit_eq_one]
      show (1 : R) =
        Coalgebra.counit (R := R) (MonoidAlgebra.single χ (1 : R))
      rw [MonoidAlgebra.counit_single χ (1 : R)]
      exact (CommSemiring.counit_apply (R := R) (1 : R)).symm
      )
    (by
      refine MonoidAlgebra.algHom_ext (fun χ => ?_) (Subsingleton.elim _ _)
      have hgl : IsGroupLikeElem R
          (χ.ofConv (AddMonoidAlgebra.single (1 : ℤ) (1 : R))) :=
        (AddMonoidAlgebra.isGroupLikeElem_single_one 1).map χ.ofConv
      show Algebra.TensorProduct.map _ _
          (Bialgebra.comulAlgHom R (MonoidAlgebra R (HopfCharacterGroup R A))
            (MonoidAlgebra.single χ 1)) =
        Bialgebra.comulAlgHom R A
          (MonoidAlgebra.lift R A (HopfCharacterGroup R A) _
            (MonoidAlgebra.single χ 1))
      rw [show Bialgebra.comulAlgHom R (MonoidAlgebra R (HopfCharacterGroup R A))
          (MonoidAlgebra.single χ (1 : R)) =
          Coalgebra.comul (MonoidAlgebra.single χ (1 : R)) from rfl]
      rw [(MonoidAlgebra.isGroupLikeElem_single_one χ).comul_eq_tmul_self]
      rw [Algebra.TensorProduct.map_tmul, MonoidAlgebra.lift_single, one_smul]
      show χ.ofConv (AddMonoidAlgebra.single (1 : ℤ) (1 : R)) ⊗ₜ[R]
          χ.ofConv (AddMonoidAlgebra.single (1 : ℤ) (1 : R)) =
        Coalgebra.comul (χ.ofConv (AddMonoidAlgebra.single (1 : ℤ) (1 : R)))
      exact hgl.comul_eq_tmul_self.symm
      )

/-- **Diagonalizable coordinate algebra**: the canonical evaluation
`R[X(A)] → A` is bijective — the character decomposition
`A ≅ R[X(A)]` holds, i.e. `A` is the group algebra of its character
group. This is the canonical-witness form of "`A ≅ R[M]` for some
abelian group `M`" (take `M = X(A)`).

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
class IsDiagonalizableAlgebra : Prop where
  bijective_charLift : Function.Bijective (charLift R A)

end Diagonalizable

end Langlands.ReductiveGroups
