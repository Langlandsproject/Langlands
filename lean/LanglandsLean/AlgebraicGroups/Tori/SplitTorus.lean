import LanglandsLean.AlgebraicGroups.Tori.DiagGroup

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

* `splitTorusOver R n` — `D(ℤ^n)` as an object of `Over (Spec R)`, with
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
inherits every instance of `diagGroupOver` — group object, affine
group scheme, algebraic group.

Blueprint: tori.split_torus
-/
noncomputable abbrev splitTorusOver : Over (Scheme.Spec.obj (op R)) :=
  diagGroupOver R (ULift.{u} (Fin n → ℤ))

/-- The underlying scheme of the rank-`n` split torus.

Blueprint: tori.split_torus
-/
noncomputable abbrev SplitTorus : Scheme.{u} := (splitTorusOver R n).left

/- Instance availability (GrpObj, IsAffineGroupScheme, IsAlgebraicGroup)
is inherited from `diagGroupOver` since `splitTorusOver` is an
`abbrev`; downstream uses exercise it. -/

end Langlands.Tori
