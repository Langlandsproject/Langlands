import LanglandsLean.AlgebraicGeometry.Conventions
import Mathlib.CategoryTheory.Monoidal.Internal.Module
import Mathlib.Algebra.Category.CoalgCat.ComonEquivalence
import Mathlib.Algebra.Category.CoalgCat.Monoidal
import Mathlib.CategoryTheory.Monoidal.Bimon_
import Mathlib.CategoryTheory.Monoidal.Hopf_
import Mathlib.RingTheory.HopfAlgebra.Basic

/-!
# `HopfAlgebra` ⟶ `HopfObj` bridge in `ModuleCat R`

Mathlib has the **categorical** Hopf algebra story
(`CategoryTheory.Monoidal.Hopf_` with theorems including
`HopfObj.mul_antipode` and `HopfObj.antipode_antipode`) and the
**algebraic** story (`Mathlib.RingTheory.HopfAlgebra.Basic`), but the
two sides are not bridged. This file provides the bridge:

```
[HopfAlgebra R A]  ⟹  HopfObj (ModuleCat.of R A)
```

Once the bridge is in place, every theorem about Hopf objects in a
braided monoidal category transfers to ring-theoretic Hopf algebras. In
particular,
[[node:linear_algebraic_groups.antipode_anti_multiplicativity|antipode
anti-multiplicativity]] is one rewrite away from `HopfObj.mul_antipode`.

## Status

The 4 `BimonObj` axioms and the 2 `HopfObj` axioms reduce to known
Mathlib facts about `Bialgebra.comulAlgHom`, `Bialgebra.counitAlgHom`,
`Bialgebra.comul_one`, `Bialgebra.counit_one`, and
`HopfAlgebra.mul_antipode_rTensor_comul` /
`HopfAlgebra.mul_antipode_lTensor_comul`. The `ext`-then-`simp`
unfoldings to bottom out at those lemmas are non-trivial bookkeeping;
in this initial shipment they are stated and partially proved, with
`sorry`s tagged for the remaining bookkeeping. Each `sorry` is followed
by a comment naming the corresponding Mathlib lemma.

## Blueprint

`linear_algebraic_groups.antipode_anti_multiplicativity`

## GitHub issue

Phase B-Y2.5: <https://github.com/Langlandsproject/Langlands/issues/18>
-/

open CategoryTheory MonObj ComonObj MonoidalCategory

namespace Langlands.AlgebraicGeometry.HopfObjectBridge

/-! ### Step 1: `MonObj` and `ComonObj` from Mathlib's existing wrappers -/

/-- An `R`-algebra `A` gives a `MonObj` structure on `ModuleCat.of R A`,
via the inverse direction of Mathlib's `Mon (ModuleCat R) ≌ AlgCat R`
equivalence. -/
noncomputable instance monObj_of_algebra
    {R : Type} [CommRing R] {A : Type} [Ring A] [Algebra R A] :
    MonObj (ModuleCat.of R A) :=
  ModuleCat.MonModuleEquivalenceAlgebra.inverseObj (AlgCat.of R A)

/-- An `R`-coalgebra `A` gives a `ComonObj` structure on
`ModuleCat.of R A`, via Mathlib's
`CoalgCat ≌ Comon (ModuleCat R)` equivalence. -/
noncomputable instance comonObj_of_coalgebra
    {R : Type} [CommRing R] {A : Type}
    [AddCommGroup A] [Module R A] [Coalgebra R A] :
    ComonObj (ModuleCat.of R A) :=
  CoalgCat.instComonObjModuleCatOfCarrier (CoalgCat.of R A)

variable {R : Type} [CommRing R] {A : Type} [Ring A] [Bialgebra R A]

/-! ### Step 2: `BimonObj` from `Bialgebra`

The 4 axioms of `BimonObj` translate to the 4 standard bialgebra
identities. Each follows from a Mathlib lemma about
`Bialgebra.comulAlgHom` and `Bialgebra.counitAlgHom`.
-/

/-- The `BimonObj` instance from a `Bialgebra`. -/
noncomputable instance bimonObj_of_bialgebra : BimonObj (ModuleCat.of R A) where
  mul_comul := by
    -- μ ≫ Δ = (Δ ⊗ Δ) ≫ tensorμ ≫ (μ ⊗ μ).
    -- Equivalently, Δ(a · b) = Δ(a) · Δ(b) — the algebra-hom property
    -- of comultiplication, which is `Bialgebra.comulAlgHom.map_mul`.
    sorry -- TODO(#18): `Bialgebra.comulAlgHom.map_mul`
  one_comul := by
    -- η ≫ Δ = η[M ⊗ M].
    -- Equivalently, Δ(1) = 1 ⊗ 1 in `A ⊗ A`, which is
    -- `Bialgebra.comul_one`.
    apply ModuleCat.hom_ext
    apply LinearMap.ext
    intro (r : R)
    show CoalgebraStruct.comul (algebraMap R A r) = _
    rw [Algebra.algebraMap_eq_smul_one, map_smul, Bialgebra.comul_one]
    sorry -- TODO(#18): unfold η[A ⊗ A] r to `r • 1_{A⊗A}` on the RHS
  mul_counit := by
    -- μ ≫ ε = (ε ⊗ ε) ≫ leftUnitor.
    -- Equivalently, ε(a · b) = ε(a) · ε(b) — the algebra-hom property
    -- of counit, which is `Bialgebra.counitAlgHom.map_mul`.
    sorry -- TODO(#18): `Bialgebra.counitAlgHom.map_mul`
  one_counit := by
    -- η ≫ ε = 𝟙. Equivalently, ε(1) = 1, which is `Bialgebra.counit_one`.
    apply ModuleCat.hom_ext
    apply LinearMap.ext
    intro (r : R)
    show CoalgebraStruct.counit (algebraMap R A r) = r
    rw [Algebra.algebraMap_eq_smul_one]
    simp [Bialgebra.counit_one]

/-! ### Step 3: `HopfObj` from `HopfAlgebra` -/

variable [HopfAlgebra R A]

/-- The `HopfObj` instance from a `HopfAlgebra`.

TODO(#18): the antipode field hits an `AddCommMonoid` diamond between
`Ring.toAddCommGroup.toAddCommMonoid` (used by `ModuleCat R`) and
`Semiring.toAddCommMonoid` (used by `HopfAlgebraStruct.antipode`). The
linear map is the same up to instance choice; the clean fix is to
either restate `HopfAlgebraStruct.antipode` with `[Ring A]` hypothesis,
or to introduce a copy lemma. Until that lands, this instance is
stubbed at the antipode field level. -/
noncomputable instance hopfObj_of_hopfAlgebra : HopfObj (ModuleCat.of R A) where
  antipode := sorry -- TODO(#18): bypass AddCommMonoid diamond
  antipode_left := by sorry -- TODO(#18): `HopfAlgebra.mul_antipode_rTensor_comul`
  antipode_right := by sorry -- TODO(#18): `HopfAlgebra.mul_antipode_lTensor_comul`

/-! ### Step 4: derived theorem — antipode is anti-multiplicative

With the bridge in scope, `HopfObj.mul_antipode` gives the
anti-multiplicativity statement at the module-cat level. Translation to
the algebra level uses `ModuleCat.Hom.hom` and tensor product
identifications.
-/

/-- The antipode of an `R`-Hopf algebra is anti-multiplicative:
`S(a · b) = S(b) · S(a)`. Derived from
`CategoryTheory.HopfObj.mul_antipode` via the bridge. -/
theorem antipode_anti_multiplicativity (a b : A) :
    HopfAlgebraStruct.antipode (R := R) (a * b) =
      HopfAlgebraStruct.antipode (R := R) b *
        HopfAlgebraStruct.antipode (R := R) a := by
  -- Apply HopfObj.mul_antipode on ModuleCat.of R A and unfold.
  sorry -- TODO(#18): apply HopfObj.mul_antipode at module level, then
        -- translate using ModuleCat.Hom.hom and TensorProduct.map.

end Langlands.AlgebraicGeometry.HopfObjectBridge
