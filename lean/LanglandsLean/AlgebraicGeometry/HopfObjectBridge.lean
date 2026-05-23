import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Coalgebra.Convolution
import Mathlib.RingTheory.Bialgebra.TensorProduct

/-!
# Antipode anti-multiplicativity

For an `R`-Hopf algebra `A`, the antipode satisfies `S(a · b) = S(b) · S(a)`.

The standard proof uses uniqueness of two-sided inverses in the
convolution algebra `End_R(A ⊗ A, A)`: both `S ∘ μ` (right inverse) and
`μ ∘ (S ⊗ S) ∘ τ` (left inverse) of `μ : A ⊗ A → A` agree. The
categorical version is `CategoryTheory.HopfObj.mul_antipode` in
`Mathlib.CategoryTheory.Monoidal.Hopf_`.

## Blueprint

`linear_algebraic_groups.antipode_anti_multiplicativity`

## GitHub issue

Phase B-Y2.5: <https://github.com/Langlandsproject/Langlands/issues/18>

## Status

The theorem is stated and the proof sketch identifies the two
convolution inverses; the actual sub-proofs (each verifying that one of
the candidates IS a convolution inverse of `μ`) require Sweedler
manipulation and are non-trivial bookkeeping. They are `sorry` here.
Downstream files build on this theorem; closing the two sorrys closes
the whole chain.
-/

namespace Langlands.AlgebraicGeometry.HopfAntipode

variable {R : Type*} [CommRing R]
variable {A : Type*} [Ring A] [HopfAlgebra R A]

/-- The antipode of an `R`-Hopf algebra is anti-multiplicative:
`S(a · b) = S(b) · S(a)`.

This is the algebra-level translation of
`CategoryTheory.HopfObj.mul_antipode` (Mathlib). The proof goes through
the convolution algebra `End_R(A ⊗ A, A) ≃ WithConv (A ⊗ A →ₗ[R] A)`:
both `S ∘ μ` and `μ ∘ (S ⊗ S) ∘ τ` are convolution inverses of `μ`, so
they agree by `left_inv_eq_right_inv`. -/
theorem antipode_anti_multiplicativity (a b : A) :
    HopfAlgebraStruct.antipode (R := R) (a * b) =
      HopfAlgebraStruct.antipode (R := R) b *
        HopfAlgebraStruct.antipode (R := R) a := by
  -- Sketch: apply `left_inv_eq_right_inv` (Mathlib) on the convolution
  -- ring `WithConv (A ⊗ A →ₗ[R] A)`, with `a := mul' R A`.
  --
  -- Left inverse: `μ ∘ (S ⊗ S) ∘ τ` convolved with `μ` gives the
  -- convolution identity `algebraMap ∘ counit_{A⊗A}`.
  --
  -- Right inverse: `μ` convolved with `S ∘ μ` gives the same identity.
  --
  -- Each verification uses `HopfAlgebra.mul_antipode_*Tensor_comul`
  -- and the tensor-product comultiplication on `A ⊗ A`.
  sorry

/-- The antipode of a commutative Hopf algebra is multiplicative:
`S(a · b) = S(a) · S(b)`. -/
theorem antipode_mul_of_commutative {A : Type*} [CommRing A] [HopfAlgebra R A]
    (a b : A) :
    HopfAlgebraStruct.antipode (R := R) (a * b) =
      HopfAlgebraStruct.antipode (R := R) a *
        HopfAlgebraStruct.antipode (R := R) b := by
  rw [antipode_anti_multiplicativity, mul_comm]

end Langlands.AlgebraicGeometry.HopfAntipode

/-! ### `f ∘ S` is an algebra hom when the target is commutative -/

namespace Langlands.AlgebraicGeometry.HopfAntipode

variable {R : Type*} [CommRing R]
variable {A : Type*} [Ring A] [HopfAlgebra R A]
variable {B : Type*} [CommRing B] [Algebra R B]

/-- For an `R`-Hopf algebra `A`, a commutative `R`-algebra `B`, and an
`R`-algebra hom `f : A →ₐ[R] B`, the composition `f ∘ S` (where `S` is
the antipode of `A`) is again an `R`-algebra hom from `A` to `B`. -/
noncomputable def algHomCompAntipode (f : A →ₐ[R] B) : A →ₐ[R] B where
  toFun a := f (HopfAlgebraStruct.antipode (R := R) a)
  map_one' := by
    show f (HopfAlgebraStruct.antipode (R := R) 1) = 1
    rw [HopfAlgebra.antipode_one, map_one]
  map_mul' a b := by
    show f (HopfAlgebraStruct.antipode (R := R) (a * b)) =
      f (HopfAlgebraStruct.antipode (R := R) a) *
        f (HopfAlgebraStruct.antipode (R := R) b)
    rw [antipode_anti_multiplicativity, map_mul, mul_comm]
  map_zero' := by
    show f (HopfAlgebraStruct.antipode (R := R) 0) = 0
    rw [map_zero, map_zero]
  map_add' a b := by
    show f (HopfAlgebraStruct.antipode (R := R) (a + b)) =
      f (HopfAlgebraStruct.antipode (R := R) a) +
        f (HopfAlgebraStruct.antipode (R := R) b)
    rw [map_add, map_add]
  commutes' r := by
    show f (HopfAlgebraStruct.antipode (R := R) (algebraMap R A r)) = algebraMap R B r
    rw [Algebra.algebraMap_eq_smul_one (R := R) (A := A), map_smul,
        HopfAlgebra.antipode_one, map_smul, map_one,
        ← Algebra.algebraMap_eq_smul_one (R := R) (A := B)]

@[simp]
lemma algHomCompAntipode_apply (f : A →ₐ[R] B) (a : A) :
    algHomCompAntipode f a = f (HopfAlgebraStruct.antipode (R := R) a) := rfl

end Langlands.AlgebraicGeometry.HopfAntipode
