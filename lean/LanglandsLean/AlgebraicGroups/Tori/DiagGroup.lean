import LanglandsLean.AlgebraicGeometry.HopfSpec
import LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.RingTheory.FiniteType

/-!
# The diagonalizable group scheme `D(M)`

For a commutative ring `R` and an additive commutative group `M`, the
**diagonalizable group scheme** `D(M)` admits two equivalent
descriptions, and this file provides both:

1. **As a spectrum** (the construction): `D(M) = Spec R[M]`, the
   spectrum of the group algebra with its group-like Hopf structure
   `Δ(e^m) = e^m ⊗ e^m` — this is the *definition*
   (`diagGroupOver`, underlying scheme `DiagGroup`);
2. **By its points** (the characterization to *read*): for any
   `T` over `Spec R`,
   \[ D(M)(T) \;=\; \operatorname{Hom}_{\mathrm{grp}}\bigl(M,\;
      \Gamma(T)^\times\bigr), \]
   "characters of `M` valued in units of the coordinate ring" — this
   is `diagGroupPointsEquiv`, and the group structure of `D(M)` is
   pointwise multiplication of characters under this identification.

If the internal plumbing of (1) is opaque, read (2): it pins the
object up to canonical isomorphism by Yoneda, and every downstream
computation should go through it rather than through the construction.

Special cases already in the library: `𝔾ₘ = D(ℤ)`
(`Examples/Gm.lean`), `μ_n = D(ℤ/n)` (`Examples/MuN.lean`), split
tori `D(ℤⁿ)` (`Tori/SplitTorus.lean`).

Note on the name: `D(M)` is the *object*; the *property* "the group
scheme `G` is diagonalizable" (`∃ M, G ≅ D(M)`) is not yet
formalized and will be a separate `IsDiagonalizable` predicate.
-/

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.Tori

universe u

variable (R : CommRingCat.{u}) (M : Type u) [AddCommGroup M]

/-- The diagonalizable group scheme `D(M) = Spec R[M]` over `Spec R`,
as an object of `Over (Spec R)`; the coordinate ring is the group
algebra `AddMonoidAlgebra R M` with its group-like Hopf structure.
For the readable characterization see `diagGroupPointsEquiv`:
`D(M)(T) = Hom(M, Γ(T)ˣ)`.

Blueprint: affine_group_schemes.group_algebra_scheme
-/
noncomputable def diagGroupOver : Over (Scheme.Spec.obj (op R)) :=
  specObjOver R (AddMonoidAlgebra R M)

/-- The group-object structure on `D(M)`: under
`diagGroupPointsEquiv` it is pointwise multiplication of characters
`M → Γ(T)ˣ`. (Internally: the convolution group on the points
presheaf, transported through representability.) -/
noncomputable instance diagGroupOver.instGrpObj :
    GrpObj (diagGroupOver R M) :=
  hopfSpecGrpObj R (AddMonoidAlgebra R M)

/-- The underlying scheme of `D(M)`.

Blueprint: affine_group_schemes.group_algebra_scheme
-/
noncomputable abbrev DiagGroup : Scheme.{u} := (diagGroupOver R M).left

/-- **The functor of points of `D(M)`** — the definitional
characterization: morphisms `T ⟶ D(M)` over `Spec R` correspond to
group homomorphisms `M → Γ(T)ˣ`, i.e. characters of the lattice
valued in units of the coordinate ring.

Composite of three known identifications:
`(T ⟶ Spec R[M]) ≃ (R[M] →ₐ[R] Γ(T))` (representability of the
points presheaf), `≃ (M →* Γ(T))` (universal property of the group
algebra), `≃ (M →* Γ(T)ˣ)` (a monoid hom from a group lands in the
units).

Blueprint: affine_group_schemes.group_algebra_scheme
-/
noncomputable def diagGroupPointsEquiv (T : Over (Scheme.Spec.obj (op R))) :
    (T ⟶ diagGroupOver R M) ≃
      (Multiplicative M →* (Γ(T.left, ⊤) : CommRingCat)ˣ) :=
  letI := gammaAlgebra R T
  ((specRepresentability R (AddMonoidAlgebra R M)).homEquiv).trans <|
    (AddMonoidAlgebra.lift R (Γ(T.left, ⊤) : CommRingCat) M).symm.trans
      (MonoidHom.toHomUnitsMulEquiv).toEquiv

/-- `D(M)` is canonically a scheme over `Spec R`. -/
noncomputable instance : (DiagGroup R M).Over (Scheme.Spec.obj (op R)) :=
  ⟨(diagGroupOver R M).hom⟩

/-- The `GrpObj` on `Scheme.asOver (DiagGroup R M) (Spec R)`. -/
noncomputable instance :
    GrpObj (Scheme.asOver (DiagGroup R M) (Scheme.Spec.obj (op R))) :=
  diagGroupOver.instGrpObj R M

/-- The structure morphism of `D(M)` is affine (it is `Spec.map` of a
ring homomorphism). -/
noncomputable instance :
    IsAffineHom ((DiagGroup R M) ↘ Scheme.Spec.obj (op R)) := by
  show IsAffineHom (Scheme.Spec.map _)
  infer_instance

/-- `D(M)` is an affine group scheme over `Spec R`, for every `M`. -/
noncomputable instance :
    IsAffineGroupScheme (DiagGroup R M) (Scheme.Spec.obj (op R)) :=
  inferInstance

/-- For finitely generated `M`, the group algebra `R[M]` is a finitely
generated `R`-algebra, so the structure morphism of `D(M)` is locally
of finite type. -/
noncomputable instance [AddMonoid.FG M] :
    LocallyOfFiniteType ((DiagGroup R M) ↘ Scheme.Spec.obj (op R)) := by
  show LocallyOfFiniteType (Spec.map _)
  rw [HasRingHomProperty.Spec_iff (P := @LocallyOfFiniteType)]
  show RingHom.FiniteType (algebraMap R (AddMonoidAlgebra R M))
  rw [RingHom.finiteType_algebraMap]
  exact AddMonoidAlgebra.finiteType_of_fg R M

/-- For finitely generated `M`, `D(M)` is an algebraic group over
`Spec R`. -/
noncomputable instance [AddMonoid.FG M] :
    IsAlgebraicGroup (DiagGroup R M) (Scheme.Spec.obj (op R)) :=
  inferInstance

end Langlands.Tori
