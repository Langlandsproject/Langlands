import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.RingTheory.Coalgebra.Convolution
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Bialgebra.Basic
import Mathlib.RingTheory.TensorProduct.Maps

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

/-! ### Convolution as an algebra homomorphism

When `B` is a commutative `R`-algebra, the convolution of two algebra
homs `f, g : A →ₐ[R] B` is again an algebra hom. The cleanest way to
express this in Lean is to construct the convolution as a composition
of three algebra homomorphisms — the comultiplication
`Bialgebra.comulAlgHom`, the tensor product algebra hom
`Algebra.TensorProduct.map f g`, and the commutative-target
multiplication `Algebra.TensorProduct.lmul'` — which is automatically
an algebra hom.

Blueprint node:
`linear_algebraic_groups.convolution_of_algebra_homs_is_algebra_hom`.
GitHub issue: #15.
-/

namespace Langlands.AlgebraicGeometry.HopfConvolution

variable {R : Type*} [CommSemiring R]
variable {A : Type*} [Semiring A] [Bialgebra R A]

variable {B : Type*} [CommSemiring B] [Algebra R B] in
/-- Convolution of two algebra homomorphisms `f, g : A →ₐ[R] B`,
packaged as an algebra homomorphism `A →ₐ[R] B`. The result is the
composition

```
   A  --Δ-->  A ⊗ A  --(f ⊗ g)-->  B ⊗ B  --m_B-->  B,
```

each factor of which is an algebra homomorphism (the comultiplication
is an algebra hom by the bialgebra axiom; `Algebra.TensorProduct.map f
g` is an algebra hom because `f, g` are; the multiplication
`Algebra.TensorProduct.lmul'` of a commutative algebra is an algebra
hom). -/
noncomputable def convAlg {B : Type*} [CommSemiring B] [Algebra R B]
    (f g : A →ₐ[R] B) : A →ₐ[R] B :=
  (Algebra.TensorProduct.lmul' R).comp
    ((Algebra.TensorProduct.map f g).comp (Bialgebra.comulAlgHom R A))

/-- The underlying linear map of `convAlg f g` agrees with the
`convLinear f g` definition. -/
theorem convAlg_toLinearMap {B : Type*} [CommSemiring B] [Algebra R B]
    (f g : A →ₐ[R] B) :
    (convAlg f g).toLinearMap = convLinear f g := by
  ext a
  rw [convLinear]
  simp [convAlg, Function.comp_apply]
  rfl

/-- Pointwise: `convAlg f g a = convLinear f g a`. -/
theorem convAlg_apply {B : Type*} [CommSemiring B] [Algebra R B]
    (f g : A →ₐ[R] B) (a : A) : convAlg f g a = convLinear f g a := by
  rw [← convAlg_toLinearMap]; rfl

end Langlands.AlgebraicGeometry.HopfConvolution
