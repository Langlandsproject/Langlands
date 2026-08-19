import LanglandsLean.AlgebraicGroups.Tori.Diagonalizable

/-!
# Split tori `D(ℤ^n) = Spec R[x_1^{±1}, …, x_n^{±1}]`

The **split torus of rank `n`** over `Spec R` is the diagonalizable
group scheme of the free abelian group `ℤ^n`:

\[
\mathbb{G}_{m}^{\,n} \;=\; D(\mathbb{Z}^n) \;=\;
\operatorname{Spec} R[\mathbb{Z}^n],
\]

whose coordinate ring is the Laurent polynomial ring in `n`
variables. For `n = 1` this recovers `G_m` (`Examples/Gm.lean`,
where the coordinate ring is presented as `LaurentPolynomial R`).

In the knowledge base, a torus over a field is a form of a split
torus (`tori.torus_definition`), and `tori.split_torus` is the case
where no Galois twisting occurs. Étale descent for forms is not yet
available in Mathlib, so the Lean development takes the split torus
as its primitive scheme-level object; the general torus enters
lattice-first (a Galois lattice, with `D` applied after base change),
as recorded in the G0 roadmap.

## Main declarations

* `splitTorus R n` — `D(ℤ^n)` as an object of `Over (Spec R)`, with
  its group-object structure and `IsAlgebraicGroup` instance inherited
  from `Tori/Diagonalizable.lean`.
* `SplitTorus R n` — the underlying scheme.

## Knowledge base

`tori.split_torus`.
-/

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.Tori

universe u w

variable (R : CommRingCat.{u}) (n : ℕ)

/-- The free abelian group `ℤ^n`, the (co)character lattice of the
rank-`n` split torus. -/
abbrev freeLattice : Type := Fin n → ℤ

/-- `ULift` preserves finite generation of additive monoids: transfer
along the surjective hom `ULift.addEquiv.symm`. Mathlib has the pi and
`ℤ` instances but not this one; it is what lets the rank-`n` lattice
`ℤ^n : Type 0` feed the universe-polymorphic `diagonalizable`. -/
instance {M : Type*} [AddMonoid M] [AddMonoid.FG M] :
    AddMonoid.FG (ULift.{w} M) :=
  AddMonoid.fg_of_surjective
    (AddEquiv.ulift.symm : M ≃+ ULift M).toAddMonoidHom
    (AddEquiv.ulift.symm : M ≃+ ULift M).surjective

/-- The split torus of rank `n` over `Spec R`, as the diagonalizable
group scheme of the free abelian group `ℤ^n`. Being an `abbrev`, it
inherits every instance of `diagonalizable` — group object, affine
group scheme, algebraic group.

Blueprint: tori.split_torus
-/
noncomputable abbrev splitTorus : Over (Scheme.Spec.obj (op R)) :=
  diagonalizable R (ULift.{u} (freeLattice n))

/-- The underlying scheme of the rank-`n` split torus.

Blueprint: tori.split_torus
-/
noncomputable abbrev SplitTorus : Scheme.{u} := (splitTorus R n).left

section SmokeTests

/-- The split torus is a group object. -/
noncomputable example : GrpObj (splitTorus R n) := inferInstance

/-- The split torus is an affine group scheme over `Spec R`. -/
noncomputable example :
    IsAffineGroupScheme (SplitTorus R n) (Scheme.Spec.obj (op R)) :=
  inferInstance

/-- `ℤ^n` is finitely generated, so the split torus is an algebraic
group over `Spec R`. -/
noncomputable example :
    IsAlgebraicGroup (SplitTorus R n) (Scheme.Spec.obj (op R)) :=
  inferInstance

end SmokeTests

end Langlands.Tori
