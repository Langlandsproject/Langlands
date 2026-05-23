import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.RingTheory.Coalgebra.Convolution
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Bialgebra.Basic

/-!
# Convolution of algebra homomorphisms

For `A` an `R`-bialgebra and `B` an `R`-algebra (with compatible
scalar-tower assumptions), the **convolution** of two algebra
homomorphisms `f, g : A →ₐ[R] B` is the `R`-linear map

```
(f * g)(a) = m_B ∘ (f ⊗ g) ∘ Δ(a)
```

This file ships the convolution `convLinear : (A →ₐ[R] B) → (A →ₐ[R] B)
→ A →ₗ[R] B` as a thin wrapper over Mathlib's
`Mathlib.RingTheory.Coalgebra.Convolution` (which provides convolution
at the linear-map level via the `WithConv` wrapper).

The follow-up node
[`convolution_of_algebra_homs_is_algebra_hom`](#15) shows that the
result is again an algebra hom, packaging convolution as an internal
operation on `A →ₐ[R] B`. The further node
[`algebra_homs_form_group_under_convolution`](#16) then equips
`A →ₐ[R] B` with a `Group` instance.

## Blueprint node

`linear_algebraic_groups.algebra_hom_convolution`.

## GitHub issue

Phase B-Y1: <https://github.com/Langlandsproject/Langlands/issues/14>.
-/

namespace Langlands.AlgebraicGeometry.HopfConvolution

variable {R : Type*} [CommSemiring R]
variable {A : Type*} [Semiring A] [Bialgebra R A]
variable {B : Type*} [Semiring B] [Algebra R B]
  [SMulCommClass R B B] [IsScalarTower R B B]

/-- Convolution of two algebra homomorphisms `f, g : A →ₐ[R] B`, viewed
as an `R`-linear map. The next milestone shows the result is again an
algebra homomorphism. -/
noncomputable def convLinear (f g : A →ₐ[R] B) : A →ₗ[R] B :=
  ((WithConv.toConv f.toLinearMap) * (WithConv.toConv g.toLinearMap)).ofConv

/-- Pointwise formula for `convLinear`:
`(f * g)(a) = m_B ((f ⊗ g) (Δ a))`. -/
theorem convLinear_apply (f g : A →ₐ[R] B) (a : A) :
    convLinear f g a =
      LinearMap.mul' R B
        (TensorProduct.map f.toLinearMap g.toLinearMap (CoalgebraStruct.comul a)) := by
  unfold convLinear
  rfl

end Langlands.AlgebraicGeometry.HopfConvolution
