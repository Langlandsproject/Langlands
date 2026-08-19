import LanglandsLean.AlgebraicGeometry.HopfSpec
import LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.RingTheory.FiniteType

/-!
# Diagonalizable group schemes `D(M) = Spec R[M]`

For a commutative ring `R` and an additive commutative group `M`, the
**diagonalizable group scheme** attached to `M` is

\[
D(M) \;=\; \operatorname{Spec} R[M],
\]

the spectrum of the group algebra `AddMonoidAlgebra R M`, with the
group-like Hopf structure: `Δ(e^m) = e^m ⊗ e^m`, `ε(e^m) = 1`,
`S(e^m) = e^{-m}` (Mathlib's `AddMonoidAlgebra.instHopfAlgebra`).

This is the machinery node of the tori program: `G_m = D(ℤ)`
(`Examples/Gm.lean`), `μ_n = D(ℤ/n)` (`Examples/MuN.lean`), and split
tori are `D(ℤ^n)` (`Tori/SplitTorus.lean`). The functor `M ↦ D(M)` is
the split half of the anti-equivalence between diagonalizable groups
and finitely generated abelian groups.

## Main declarations

* `diagonalizable R M` — `Spec R[M]` as an object of `Over (Spec R)`.
* `diagonalizable.instGrpObj` — its group-object structure via
  `hopfSpecGrpObj`.
* `Diagonalizable R M` — the underlying scheme, with
  `IsAffineGroupScheme` always and `IsAlgebraicGroup` when `M` is
  finitely generated.

## Knowledge base

`tori.algebraic_tori` topic; machinery for
`tori.multiplicative_type_characterization` and (knowledge-base side)
the diagonalizable-group nodes.
-/

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.Tori

universe u

variable (R : CommRingCat.{u}) (M : Type u) [AddCommGroup M]

/-- The group algebra `R[M]` of an additive commutative group `M`,
the coordinate ring of the diagonalizable group scheme `D(M)`. Its
Hopf structure is Mathlib's group-like one on `AddMonoidAlgebra`. -/
noncomputable abbrev diagonalizable.hopfAlg : Type u :=
  AddMonoidAlgebra R M

/-- The diagonalizable group scheme `D(M) = Spec R[M]` over `Spec R`,
as an object of `Over (Spec R)`.

Blueprint: reductive_structure.diagonalizable_groups
-/
noncomputable def diagonalizable : Over (Scheme.Spec.obj (op R)) :=
  specObjOver R (diagonalizable.hopfAlg R M)

/-- The group-object structure on `D(M)`, inherited from the
group-like Hopf structure on `R[M]` via the Yoneda construction. -/
noncomputable instance diagonalizable.instGrpObj :
    GrpObj (diagonalizable R M) :=
  hopfSpecGrpObj R (diagonalizable.hopfAlg R M)

/-- The underlying scheme of `D(M)`.

Blueprint: reductive_structure.diagonalizable_groups
-/
noncomputable abbrev Diagonalizable : Scheme.{u} := (diagonalizable R M).left

/-- `D(M)` is canonically a scheme over `Spec R`. -/
noncomputable instance : (Diagonalizable R M).Over (Scheme.Spec.obj (op R)) :=
  ⟨(diagonalizable R M).hom⟩

/-- The `GrpObj` on `Scheme.asOver (Diagonalizable R M) (Spec R)`. -/
noncomputable instance :
    GrpObj (Scheme.asOver (Diagonalizable R M) (Scheme.Spec.obj (op R))) :=
  diagonalizable.instGrpObj R M

/-- The structure morphism of `D(M)` is affine (it is `Spec.map` of a
ring homomorphism). -/
noncomputable instance :
    IsAffineHom ((Diagonalizable R M) ↘ Scheme.Spec.obj (op R)) := by
  show IsAffineHom (Scheme.Spec.map _)
  infer_instance

/-- `D(M)` is an affine group scheme over `Spec R`, for every `M`. -/
noncomputable instance :
    IsAffineGroupScheme (Diagonalizable R M) (Scheme.Spec.obj (op R)) :=
  inferInstance

/-- For finitely generated `M`, the group algebra `R[M]` is a finitely
generated `R`-algebra, so the structure morphism of `D(M)` is locally
of finite type. -/
noncomputable instance [AddMonoid.FG M] :
    LocallyOfFiniteType ((Diagonalizable R M) ↘ Scheme.Spec.obj (op R)) := by
  show LocallyOfFiniteType (Spec.map _)
  rw [HasRingHomProperty.Spec_iff (P := @LocallyOfFiniteType)]
  show RingHom.FiniteType (algebraMap R (AddMonoidAlgebra R M))
  rw [RingHom.finiteType_algebraMap]
  exact AddMonoidAlgebra.finiteType_of_fg R M

/-- For finitely generated `M`, `D(M)` is an algebraic group over
`Spec R`. -/
noncomputable instance [AddMonoid.FG M] :
    IsAlgebraicGroup (Diagonalizable R M) (Scheme.Spec.obj (op R)) :=
  inferInstance

end Langlands.Tori
