import LanglandsLean.AlgebraicGeometry.HopfConvolution
import LanglandsLean.AlgebraicGeometry.HopfObjectBridge

/-!
# Group structure on `A →ₐ[R] B` for Hopf `A` and commutative `B`

For an `R`-Hopf algebra `A` and a commutative `R`-algebra `B`, the set
of `R`-algebra homomorphisms `A →ₐ[R] B` carries a canonical group
structure under convolution.

- Multiplication: `convAlg f g` (from `HopfConvolution`).
- Identity: `(Algebra.ofId R B).comp (Bialgebra.counitAlgHom R A)`.
- Inverse: `algHomCompAntipode` (from `HopfObjectBridge`).

## Blueprint

`linear_algebraic_groups.algebra_homs_form_group_under_convolution`

## GitHub issue

Phase B-Y3: <https://github.com/Langlandsproject/Langlands/issues/16>

## Status

The data fields (`Mul`, `One`, `Inv`) are shipped using the components
from the prerequisites. The group axioms reduce to Hopf algebra
identities (`HopfAlgebra.mul_antipode_*_comul`, the counit/coassoc
axioms) via Sweedler manipulation. They are `sorry` here, each tagged
with the specific Mathlib lemma needed for closure.
-/

open Langlands.AlgebraicGeometry.HopfConvolution
open Langlands.AlgebraicGeometry.HopfAntipode

namespace Langlands.AlgebraicGeometry.AlgHomGroup

variable {R : Type*} [CommRing R]
variable {A : Type*} [Ring A] [HopfAlgebra R A]
variable {B : Type*} [CommRing B] [Algebra R B]

/-- The convolution identity for `A →ₐ[R] B`: the composition of the
counit `ε : A →ₐ[R] R` with the structure map `R →ₐ[R] B`. -/
noncomputable def convOneAlg : A →ₐ[R] B :=
  (Algebra.ofId R B).comp (Bialgebra.counitAlgHom R A)

@[simp]
lemma convOneAlg_apply (a : A) :
    (convOneAlg (R := R) (A := A) (B := B)) a =
      algebraMap R B (CoalgebraStruct.counit a) := rfl

/-- Multiplication on `A →ₐ[R] B`: convolution from `HopfConvolution`. -/
noncomputable instance : Mul (A →ₐ[R] B) where
  mul := convAlg

/-- Identity element on `A →ₐ[R] B`: `Algebra.ofId R B ∘ counitAlgHom`. -/
noncomputable instance : One (A →ₐ[R] B) where
  one := convOneAlg

/-- Inverse on `A →ₐ[R] B`: composition with the antipode. -/
noncomputable instance : Inv (A →ₐ[R] B) where
  inv := algHomCompAntipode

@[simp]
lemma mul_def (f g : A →ₐ[R] B) : f * g = convAlg f g := rfl

@[simp]
lemma one_def : (1 : A →ₐ[R] B) = convOneAlg := rfl

@[simp]
lemma inv_def (f : A →ₐ[R] B) : f⁻¹ = algHomCompAntipode f := rfl

/-- The convolution group structure on `A →ₐ[R] B`. -/
noncomputable instance : Group (A →ₐ[R] B) where
  mul_assoc f g h := by
    -- Associativity of convolution comes from coassociativity of Δ
    -- and associativity of B's multiplication.
    sorry -- TODO(#16): Sweedler proof using Coalgebra.coassoc.
  one_mul f := by
    -- (ε ∘ η_B) * f = f via counit axiom: ∑ ε(a_(1)) f(a_(2)) = f(a).
    sorry -- TODO(#16): Coalgebra.lTensor_counit_comul.
  mul_one f := by
    -- f * (ε ∘ η_B) = f via the other counit axiom.
    sorry -- TODO(#16): Coalgebra.rTensor_counit_comul.
  inv_mul_cancel f := by
    -- (f ∘ S) * f = ε ∘ η_B via HopfAlgebra.mul_antipode_rTensor_comul.
    sorry -- TODO(#16): HopfAlgebra antipode axiom.

end Langlands.AlgebraicGeometry.AlgHomGroup
