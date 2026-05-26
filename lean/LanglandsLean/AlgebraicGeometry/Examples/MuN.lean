import LanglandsLean.AlgebraicGeometry.HopfSpec
import LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.RingTheory.FiniteType

/-!
# The roots of unity group scheme `μ_n`

For a commutative ring `R` and `n : ℕ`, the group scheme of
\(n\)-th roots of unity is

\[
\mu_{n,R} \;=\; \operatorname{Spec}\bigl(R[T]/(T^n - 1)\bigr)
       \;\cong\; \operatorname{Spec}\bigl(R[\mathbb{Z}/n]\bigr),
\]

where the second equality identifies the quotient \(R[T]/(T^n - 1)\) with
the additive monoid algebra of the cyclic group \(\mathbb{Z}/n\) via
\(T^k \mapsto \mathrm{single}\, k\, 1\). The Hopf structure is the
group-like one inherited from `MonoidAlgebra.instHopfAlgebra` (via
`to_additive`): comultiplication `Δ(single k 1) = single k 1 ⊗ single k 1`,
counit `ε(single k 1) = 1`, antipode `S(single k 1) = single (-k) 1`.

For `n = 0`, `ZMod 0 = ℤ` so `μ_0 = G_m` (no constraint). For `n > 0`,
`ZMod n` is finite of order `n` and `μ_n` is finite étale.

## Main declarations

* `muN R n` — `Spec (R[ZMod n])` as a scheme over `Spec R`.
* `muN.instGrpObj R n` — the group-object structure from the additive
  monoid algebra's Hopf structure.
* `MuN R n` — the underlying scheme; comes with `IsAlgebraicGroup`
  instance (for `n > 0`).

## Blueprint

A node `linear_algebraic_groups.roots_of_unity_group_scheme` can be
added; this construction is on the `basic_examples` track.

## GitHub issue

Phase D-Y: <https://github.com/Langlandsproject/Langlands/issues/24>.
-/

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.AlgebraicGeometry.Examples

universe u

variable (R : CommRingCat.{u}) (n : ℕ)

/-- The Hopf algebra `R[ZMod n] = AddMonoidAlgebra R (ZMod n)`, the
coordinate ring of `μ_n`. Mathlib gives the Hopf instance via the
`to_additive` analog of `MonoidAlgebra.instHopfAlgebra`. -/
noncomputable abbrev muN.hopfAlg : Type u :=
  AddMonoidAlgebra R (ZMod n)

/-- The roots-of-unity group scheme `μ_{n,R} = Spec R[ZMod n]` over
`Spec R`, viewed as an object of `Over (Spec R)`. -/
noncomputable def muN : Over (Scheme.Spec.obj (op R)) :=
  specObjOver R (muN.hopfAlg R n)

/-- The group-object structure on `muN R n`, from the additive
monoid-algebra Hopf structure. -/
noncomputable instance muN.instGrpObj :
    GrpObj (muN R n) :=
  hopfSpecGrpObj R (muN.hopfAlg R n)

/-- The underlying scheme of `muN R n`. -/
noncomputable abbrev MuN : Scheme.{u} := (muN R n).left

/-- `MuN R n` is canonically a scheme over `Spec R`. -/
noncomputable instance : (MuN R n).Over (Scheme.Spec.obj (op R)) :=
  ⟨(muN R n).hom⟩

/-- The `GrpObj` on `Scheme.asOver (MuN R n) (Spec R)`. -/
noncomputable instance :
    GrpObj (Scheme.asOver (MuN R n) (Scheme.Spec.obj (op R))) :=
  muN.instGrpObj R n

/-- The structure morphism is affine (it's `Spec.map` of a ring hom). -/
noncomputable instance : IsAffineHom ((MuN R n) ↘ Scheme.Spec.obj (op R)) := by
  show IsAffineHom (Scheme.Spec.map _)
  infer_instance

/-- `MuN R n` is an affine group scheme. -/
noncomputable instance :
    IsAffineGroupScheme (MuN R n) (Scheme.Spec.obj (op R)) :=
  inferInstance

/-- For finite `n`, `R[ZMod n]` is finitely generated as an `R`-algebra
(by the finite set of basis elements `single k 1` for `k : ZMod n`).
Hence the structure morphism is locally of finite type. -/
noncomputable instance [Finite (ZMod n)] :
    LocallyOfFiniteType ((MuN R n) ↘ Scheme.Spec.obj (op R)) := by
  show LocallyOfFiniteType (Spec.map _)
  rw [HasRingHomProperty.Spec_iff (P := @LocallyOfFiniteType)]
  show RingHom.FiniteType (algebraMap R (AddMonoidAlgebra R (ZMod n)))
  rw [RingHom.finiteType_algebraMap]
  -- ZMod n is finite ⇒ FG as an additive monoid ⇒ R[ZMod n] is FG as R-algebra
  haveI : AddMonoid.FG (ZMod n) := AddMonoid.fg_of_finite
  exact AddMonoidAlgebra.finiteType_of_fg R (ZMod n)

/-- For finite `n`, `MuN R n` is an **algebraic group** over `Spec R`. -/
noncomputable instance [Finite (ZMod n)] :
    IsAlgebraicGroup (MuN R n) (Scheme.Spec.obj (op R)) :=
  inferInstance

/-! ### Concrete `μ_n` instances for small `n`

For each fixed positive integer, `ZMod n` is `Finite`, so the
`IsAlgebraicGroup` instance fires automatically. -/

/-- `μ_2 R = {±1}` over `Spec R`. -/
noncomputable example :
    IsAlgebraicGroup (MuN R 2) (Scheme.Spec.obj (op R)) := inferInstance

/-- `μ_3 R = {1, ω, ω²}` (cube roots of unity) over `Spec R`. -/
noncomputable example :
    IsAlgebraicGroup (MuN R 3) (Scheme.Spec.obj (op R)) := inferInstance

end Langlands.AlgebraicGeometry.Examples
