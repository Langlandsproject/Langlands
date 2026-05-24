import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Coalgebra.Hom
import Mathlib.RingTheory.Coalgebra.Convolution
import Mathlib.RingTheory.Bialgebra.TensorProduct
import Mathlib.RingTheory.TensorProduct.Maps

open scoped TensorProduct

/-!
# Antipode multiplicativity for commutative Hopf algebras

For a commutative `R`-Hopf algebra `A`, the antipode satisfies
`S(a · b) = S(a) · S(b)` (and equivalently `S(a · b) = S(b) · S(a)`).
This file is restricted to **commutative** `A`, which is exactly what
affine group schemes need.

## Strategy

The standard proof uses uniqueness of two-sided inverses in the
convolution semiring `WithConv (A ⊗[R] A →ₗ[R] A)`. The multiplication
`μ : A ⊗ A → A` has:
- a right inverse `S ∘ μ` in the convolution semiring, by the bialgebra
  axiom on the comultiplication (`comul(ab) = comul(a) · comul(b)`,
  Mathlib's `Bialgebra.comul_mul`) plus the antipode axiom on `A`;
- a left inverse `μ ∘ (S ⊗ S)` in the convolution semiring, using
  commutativity of `A` to commute the antipode-axiom calculation past
  the tensor split.

By `left_inv_eq_right_inv`, `S ∘ μ = μ ∘ (S ⊗ S)`, and applying both
sides at `a ⊗ b` gives `S(ab) = S(a) · S(b)`.

## Blueprint

`linear_algebraic_groups.antipode_anti_multiplicativity` (the
commutative version corresponds to the simpler formula).

## GitHub issue

Phase B-Y2.5: <https://github.com/Langlandsproject/Langlands/issues/18>

## Status

`antipode_mul_of_commutative` packaged via `mulCoalgHom` (μ as a
coalgebra hom) with a single Sweedler step deferred.
`antipode_anti_multiplicativity` for commutative A is derived as a
trivial corollary (uses `mul_comm` in A).
-/

namespace Langlands.AlgebraicGeometry.HopfAntipode

variable {R : Type*} [CommRing R]
variable {A : Type*} [CommRing A] [HopfAlgebra R A]

/-- The multiplication `μ : A ⊗[R] A → A` of a commutative bialgebra `A`
viewed as a coalgebra hom. The two coalgebra-hom axioms are:
`counit_A ∘ μ = counit_{A⊗A}` and
`(μ ⊗ μ) ∘ comul_{A⊗A} = comul_A ∘ μ`.
Both are consequences of the bialgebra axioms (counit and comul are
algebra homomorphisms). -/
noncomputable def mulCoalgHom : A ⊗[R] A →ₗc[R] A where
  __ := LinearMap.mul' R A
  counit_comp := by
    ext a b
    simp [LinearMap.mul'_apply, Bialgebra.counit_mul, mul_comm]
  map_comp_comul := by
    -- (mul' ⊗ mul') ∘ comul_{A⊗A} = comul ∘ mul'.
    -- Reduces (by ext+simp) to `Bialgebra.comul_mul` on pure tensors,
    -- combined with `LinearMap.mul'_tensor` which factors `mul' R (A⊗A)`.
    ext a b
    have h := Bialgebra.comul_mul (R := R) (A := A) a b
    -- Generalize Δa, Δb to arbitrary tensors then induct.
    show (TensorProduct.map (LinearMap.mul' R A) (LinearMap.mul' R A))
        ((TensorProduct.AlgebraTensorModule.tensorTensorTensorComm R R R R A A A A)
          (CoalgebraStruct.comul a ⊗ₜ[R] CoalgebraStruct.comul b)) =
      CoalgebraStruct.comul (a * b)
    rw [h]
    -- Now: map (mul' R A, mul' R A) (twist (Δa ⊗ Δb)) = Δa * Δb,
    -- with Δa = comul a, Δb = comul b. By LinearMap.mul'_tensor for A ⊗ A:
    -- mul' R (A⊗A) (Δa ⊗ Δb) = (map ∘ twist) (Δa ⊗ Δb), so the LHS equals
    -- mul' R (A⊗A) (Δa ⊗ Δb) = Δa * Δb.
    generalize CoalgebraStruct.comul (R := R) (A := A) a = Δa
    generalize CoalgebraStruct.comul (R := R) (A := A) b = Δb
    induction Δa with
    | zero => simp
    | tmul x y =>
      induction Δb with
      | zero => simp
      | tmul x' y' => simp [Algebra.TensorProduct.tmul_mul_tmul]
      | add p q hp hq =>
        simp only [TensorProduct.tmul_add, map_add, mul_add]
        rw [hp, hq]
    | add p q hp hq =>
      simp only [TensorProduct.add_tmul, map_add, add_mul]
      rw [hp, hq]

/-- The antipode of `A`, packaged as element of `WithConv (A →ₗ[R] A)`. -/
noncomputable abbrev convAntipode : WithConv (A →ₗ[R] A) :=
  WithConv.toConv (HopfAlgebraStruct.antipode (R := R))

/-- The identity on `A`, packaged as element of `WithConv (A →ₗ[R] A)`. -/
noncomputable abbrev convId : WithConv (A →ₗ[R] A) :=
  WithConv.toConv (LinearMap.id : A →ₗ[R] A)

/-- The antipode axiom expressed in `WithConv`: `id_A * S = 1` in
`WithConv (A →ₗ[R] A)`. This is `HopfAlgebra.mul_antipode_lTensor_comul`
repackaged. -/
lemma convId_mul_convAntipode : convId (R := R) (A := A) * convAntipode = 1 := by
  apply WithConv.toConv_injective
  ext a
  show LinearMap.mul' R A ((TensorProduct.map (LinearMap.id : A →ₗ[R] A)
        (HopfAlgebraStruct.antipode R)) (CoalgebraStruct.comul a)) =
      (algebraMap R A) (CoalgebraStruct.counit a)
  rw [← LinearMap.lTensor_def A (HopfAlgebraStruct.antipode (R := R) (A := A))]
  exact HopfAlgebra.mul_antipode_lTensor_comul_apply a

/-- The antipode axiom in the other order: `S * id_A = 1` in
`WithConv (A →ₗ[R] A)`. -/
lemma convAntipode_mul_convId : convAntipode (R := R) (A := A) * convId = 1 := by
  apply WithConv.toConv_injective
  ext a
  show LinearMap.mul' R A ((TensorProduct.map (HopfAlgebraStruct.antipode R)
        (LinearMap.id : A →ₗ[R] A)) (CoalgebraStruct.comul a)) =
      (algebraMap R A) (CoalgebraStruct.counit a)
  rw [← LinearMap.rTensor_def A (HopfAlgebraStruct.antipode (R := R) (A := A))]
  exact HopfAlgebra.mul_antipode_rTensor_comul_apply a

/-- `S ∘ μ` is a right convolution inverse of `μ` in
`WithConv (A ⊗[R] A →ₗ[R] A)`. Derived from `id * S = 1` in
`WithConv (A →ₗ[R] A)` by pre-composing with the coalg-hom `mulCoalgHom`. -/
lemma convMul_mul_convCompAntipode :
    WithConv.toConv (LinearMap.mul' R A) *
      WithConv.toConv (HopfAlgebraStruct.antipode (R := R) ∘ₗ LinearMap.mul' R A) =
        1 := by
  have h := LinearMap.convMul_comp_coalgHom_distrib
    (R := R) (C := A) (A := A) (B := A ⊗[R] A)
    convId convAntipode mulCoalgHom
  rw [convId_mul_convAntipode] at h
  -- h : (1).ofConv ∘ mulCoalgHom.toLinearMap = (toConv (id ∘ μ) * toConv (S ∘ μ)).ofConv
  apply WithConv.ofConv_injective
  show ((WithConv.toConv (LinearMap.mul' R A)) *
      (WithConv.toConv (HopfAlgebraStruct.antipode (R := R) ∘ₗ
        LinearMap.mul' R A))).ofConv = (1 : WithConv (A ⊗[R] A →ₗ[R] A)).ofConv
  -- Rewrite RHS using mulCoalgHom.counit_comp.
  have hcounit : (1 : WithConv (A ⊗[R] A →ₗ[R] A)).ofConv =
      ((1 : WithConv (A →ₗ[R] A)).ofConv).comp
        (mulCoalgHom (R := R) (A := A)).toLinearMap := by
    show (Algebra.linearMap R A ∘ₗ CoalgebraStruct.counit) =
      (Algebra.linearMap R A ∘ₗ CoalgebraStruct.counit) ∘ₗ
        (mulCoalgHom (R := R) (A := A)).toLinearMap
    rw [LinearMap.comp_assoc]
    congr 1
    exact (mulCoalgHom (R := R) (A := A)).counit_comp.symm
  rw [hcounit, h]
  rfl

/-- `S ∘ μ` is also a *left* convolution inverse of `μ` in
`WithConv (A ⊗[R] A →ₗ[R] A)`. Same derivation as the right-inverse
case, with the WithConv factors swapped: `S * id = 1`. -/
lemma convCompAntipode_mul_convMul :
    WithConv.toConv (HopfAlgebraStruct.antipode (R := R) ∘ₗ LinearMap.mul' R A) *
      WithConv.toConv (LinearMap.mul' R A) = 1 := by
  have h := LinearMap.convMul_comp_coalgHom_distrib
    (R := R) (C := A) (A := A) (B := A ⊗[R] A)
    convAntipode convId mulCoalgHom
  rw [convAntipode_mul_convId] at h
  apply WithConv.ofConv_injective
  show ((WithConv.toConv (HopfAlgebraStruct.antipode (R := R) ∘ₗ
        LinearMap.mul' R A)) *
      (WithConv.toConv (LinearMap.mul' R A))).ofConv =
      (1 : WithConv (A ⊗[R] A →ₗ[R] A)).ofConv
  have hcounit : (1 : WithConv (A ⊗[R] A →ₗ[R] A)).ofConv =
      ((1 : WithConv (A →ₗ[R] A)).ofConv).comp
        (mulCoalgHom (R := R) (A := A)).toLinearMap := by
    show (Algebra.linearMap R A ∘ₗ CoalgebraStruct.counit) =
      (Algebra.linearMap R A ∘ₗ CoalgebraStruct.counit) ∘ₗ
        (mulCoalgHom (R := R) (A := A)).toLinearMap
    rw [LinearMap.comp_assoc]
    congr 1
    exact (mulCoalgHom (R := R) (A := A)).counit_comp.symm
  rw [hcounit, h]
  rfl

/-- **Key bilinear identity** (uses commutativity of `A`):
for any `c₁, c₂ : A ⊗[R] A`,

  `mul'_A ((map μ (μ ∘ (S ⊗ S)) ∘ twist) (c₁ ⊗ c₂))`
    = `mul'_A ((lTensor A S) c₁) · mul'_A ((lTensor A S) c₂)`.

This factors the four-factor product `x · x' · S(y) · S(y')` (for
pure tensors `c₁ = x ⊗ y`, `c₂ = x' ⊗ y'`) into
`(x · S(y)) · (x' · S(y'))` by `mul_comm` in `A`. -/
lemma mul_map_twist_eq_lTensor_smul_lTensor (c₁ c₂ : A ⊗[R] A) :
    LinearMap.mul' R A
      ((TensorProduct.map (LinearMap.mul' R A)
        ((LinearMap.mul' R A) ∘ₗ TensorProduct.map
          (HopfAlgebraStruct.antipode (R := R))
          (HopfAlgebraStruct.antipode (R := R))))
        ((TensorProduct.AlgebraTensorModule.tensorTensorTensorComm R R R R A A A A)
          (c₁ ⊗ₜ c₂))) =
      LinearMap.mul' R A
        ((LinearMap.lTensor A (HopfAlgebraStruct.antipode (R := R))) c₁) *
      LinearMap.mul' R A
        ((LinearMap.lTensor A (HopfAlgebraStruct.antipode (R := R))) c₂) := by
  induction c₁ with
  | zero => simp
  | tmul x y =>
    induction c₂ with
    | zero => simp
    | tmul x' y' =>
      -- Pure tensor case: both sides reduce to
      -- (x · x') · (S(y) · S(y')) and (x · S(y)) · (x' · S(y')) respectively.
      -- Equal by `mul_comm` in commutative A.
      simp [TensorProduct.AlgebraTensorModule.tensorTensorTensorComm_tmul,
        TensorProduct.map_tmul, LinearMap.mul'_apply,
        LinearMap.lTensor_tmul]
      ring
    | add p q hp hq =>
      simp only [TensorProduct.tmul_add, map_add, mul_add]
      rw [hp, hq]
  | add p q hp hq =>
    simp only [TensorProduct.add_tmul, map_add, add_mul]
    rw [hp, hq]

/-- `μ ∘ (S ⊗ S)` is a right convolution inverse of `μ` in
`WithConv (A ⊗[R] A →ₗ[R] A)`. Proved by direct Sweedler computation
on `a ⊗ b`: the bilinear identity above factors `(μ * (μ ∘ (S ⊗ S))) (a ⊗ b)`
into `(∑ a₁ S(a₂)) · (∑ b₁ S(b₂))`, then the antipode axiom on each
factor gives `ε(a) · ε(b) = ε_{A⊗A}(a ⊗ b)`. -/
lemma convMul_mul_convMulCompSSTensor :
    WithConv.toConv (LinearMap.mul' R A) *
      WithConv.toConv ((LinearMap.mul' R A) ∘ₗ
        TensorProduct.map (HopfAlgebraStruct.antipode (R := R))
          (HopfAlgebraStruct.antipode (R := R))) = 1 := by
  apply WithConv.toConv_injective
  ext a b
  -- Goal: (μ * (μ ∘ (S⊗S))) (a ⊗ b) = algebraMap (counit_{A⊗A} (a ⊗ b))
  show LinearMap.mul' R A
    ((TensorProduct.map (LinearMap.mul' R A) ((LinearMap.mul' R A) ∘ₗ
        TensorProduct.map (HopfAlgebraStruct.antipode (R := R))
          (HopfAlgebraStruct.antipode (R := R))))
      (CoalgebraStruct.comul (a ⊗ₜ[R] b))) =
    (algebraMap R A) (CoalgebraStruct.counit (a ⊗ₜ[R] b))
  -- Unfold the tensor-product comul, then apply the bilinear identity (uses commutativity).
  rw [TensorProduct.comul_tmul, mul_map_twist_eq_lTensor_smul_lTensor]
  -- LHS: mul'(lTensor S (comul a)) · mul'(lTensor S (comul b))
  --   = algebraMap(counit a) · algebraMap(counit b)   [antipode axiom × 2]
  rw [show (LinearMap.lTensor A (HopfAlgebraStruct.antipode (R := R))) =
      TensorProduct.map LinearMap.id (HopfAlgebraStruct.antipode (R := R)) from
    LinearMap.lTensor_def A _]
  rw [show TensorProduct.map (LinearMap.id : A →ₗ[R] A)
        (HopfAlgebraStruct.antipode (R := R)) =
      LinearMap.lTensor A (HopfAlgebraStruct.antipode (R := R)) from
    (LinearMap.lTensor_def A _).symm]
  rw [HopfAlgebra.mul_antipode_lTensor_comul_apply,
      HopfAlgebra.mul_antipode_lTensor_comul_apply]
  -- RHS: algebraMap (counit_{A⊗A}(a ⊗ b)) = algebraMap (counit a · counit b)
  -- Both sides are algebraMap(counit a) · algebraMap(counit b).
  rw [TensorProduct.counit_tmul]
  simp [mul_comm]

/-- The antipode of a commutative `R`-Hopf algebra is multiplicative:
`S(a · b) = S(a) · S(b)`.

This is the commutative-source analog of
`CategoryTheory.HopfObj.mul_antipode` (Mathlib). The proof shape goes
through the convolution semiring `WithConv (A ⊗[R] A →ₗ[R] A)`:
- `S ∘ μ` is a *two-sided* convolution inverse of `μ`
  (`convMul_mul_convCompAntipode` and `convCompAntipode_mul_convMul`).
- `μ ∘ (S ⊗ S)` is also a right inverse (`convMul_mul_convMulCompSSTensor`).
By `left_inv_eq_right_inv`, the two-sided inverse equals the right inverse,
so `S ∘ μ = μ ∘ (S ⊗ S)`. Applying at `a ⊗ b` gives the desired equation. -/
theorem antipode_mul_of_commutative (a b : A) :
    HopfAlgebraStruct.antipode (R := R) (a * b) =
      HopfAlgebraStruct.antipode (R := R) a *
        HopfAlgebraStruct.antipode (R := R) b := by
  have hEq : WithConv.toConv (HopfAlgebraStruct.antipode (R := R) ∘ₗ
        LinearMap.mul' R A) =
      WithConv.toConv (LinearMap.mul' R A ∘ₗ
        TensorProduct.map (HopfAlgebraStruct.antipode (R := R))
          (HopfAlgebraStruct.antipode (R := R))) :=
    left_inv_eq_right_inv convCompAntipode_mul_convMul
      convMul_mul_convMulCompSSTensor
  have hApp := congrArg (·.ofConv (a ⊗ₜ b)) hEq
  simpa [LinearMap.mul'_apply] using hApp

/-- The antipode is anti-multiplicative: `S(a · b) = S(b) · S(a)`. For a
commutative `A` this is the same as `antipode_mul_of_commutative` up to
`mul_comm`. -/
theorem antipode_anti_multiplicativity (a b : A) :
    HopfAlgebraStruct.antipode (R := R) (a * b) =
      HopfAlgebraStruct.antipode (R := R) b *
        HopfAlgebraStruct.antipode (R := R) a := by
  rw [antipode_mul_of_commutative, mul_comm]

end Langlands.AlgebraicGeometry.HopfAntipode

/-! ### `f ∘ S` is an algebra hom when the source is a commutative Hopf algebra and target is commutative -/

namespace Langlands.AlgebraicGeometry.HopfAntipode

variable {R : Type*} [CommRing R]
variable {A : Type*} [CommRing A] [HopfAlgebra R A]
variable {B : Type*} [CommRing B] [Algebra R B]

/-- For a commutative `R`-Hopf algebra `A`, a commutative `R`-algebra
`B`, and an `R`-algebra hom `f : A →ₐ[R] B`, the composition `f ∘ S`
(where `S` is the antipode of `A`) is again an `R`-algebra hom from
`A` to `B`. -/
noncomputable def algHomCompAntipode (f : A →ₐ[R] B) : A →ₐ[R] B where
  toFun a := f (HopfAlgebraStruct.antipode (R := R) a)
  map_one' := by
    show f (HopfAlgebraStruct.antipode (R := R) 1) = 1
    rw [HopfAlgebra.antipode_one, map_one]
  map_mul' a b := by
    show f (HopfAlgebraStruct.antipode (R := R) (a * b)) =
      f (HopfAlgebraStruct.antipode (R := R) a) *
        f (HopfAlgebraStruct.antipode (R := R) b)
    rw [antipode_mul_of_commutative, map_mul]
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
