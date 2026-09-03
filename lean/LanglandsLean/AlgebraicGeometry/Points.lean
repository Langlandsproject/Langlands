import LanglandsLean.AlgebraicGeometry.IsAlgebraicGroup
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp

/-!
# Points functor for an affine group scheme over a field

For an affine group scheme `G` over `Spec k` and a `k`-algebra `R`, this
file defines `Langlands.AlgebraicGeometry.points k G R`, the set of
`Spec k`-morphisms `Spec R → G`, and equips it with a group structure via
Mathlib's `Hom.group` on Cartesian-monoidal categories.

## Main declarations

* `Langlands.AlgebraicGeometry.specOver k R` — `Spec R` viewed as an
  `Over (Spec k)` object, via the canonical `k → R` algebra map.
* `Langlands.AlgebraicGeometry.points k G R` — the `R`-points of `G` as
  a `Type`.
* `Langlands.AlgebraicGeometry.points.map` — functoriality in `R`.

The `Group` instance on `points` is inherited from `Hom.group`
(`Mathlib.CategoryTheory.Monoidal.Cartesian.Grp_`) once
`CategoryTheory.MonObj` is opened or the instance attribute is unscoped.

## GitHub issue

Phase A4: <https://github.com/Langlandsproject/Langlands/issues/4>.
-/

open AlgebraicGeometry CategoryTheory Scheme

universe u

namespace Langlands.AlgebraicGeometry

/-- `Spec R` viewed as an `Over (Spec k)` object via the `k`-algebra
structure of `R`. -/
noncomputable def specOver (k R : Type u) [Field k] [CommRing R] [Algebra k R] :
    Over (Spec (CommRingCat.of k)) :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k R)))

/-- The `R`-points of an affine group scheme `G` over `Spec k`.

This is the set of `Spec k`-morphisms `Spec R → G`, i.e. morphisms in
`Over (Spec k)` from `specOver k R` to `Scheme.asOver G (Spec k)`. It
inherits a `Group` instance from Mathlib's `Hom.group` once
`CategoryTheory.MonObj` is opened.

Declared as `abbrev` so that typeclass inference unfolds it and finds the
`Group` instance automatically. -/
abbrev points (k : Type u) [Field k]
    (G : Scheme.{u}) [G.Over (Spec (CommRingCat.of k))]
    [GrpObj (Scheme.asOver G (Spec (CommRingCat.of k)))]
    (R : Type u) [CommRing R] [Algebra k R] : Type u :=
  specOver k R ⟶ Scheme.asOver G (Spec (CommRingCat.of k))

open scoped CategoryTheory.MonObj

/-- The `R`-points of `G` form a group, via Mathlib's `Hom.group`. -/
noncomputable instance points.instGroup (k : Type u) [Field k]
    (G : Scheme.{u}) [G.Over (Spec (CommRingCat.of k))]
    [GrpObj (Scheme.asOver G (Spec (CommRingCat.of k)))]
    (R : Type u) [CommRing R] [Algebra k R] :
    Group (points k G R) :=
  inferInstance

/-- The over-morphism `specOver k R' ⟶ specOver k R` induced by a
`k`-algebra homomorphism `f : R →ₐ[k] R'`. (Note the reversal: `Spec`
is contravariant on rings.) -/
noncomputable def specOverHom (k : Type u) [Field k]
    {R R' : Type u} [CommRing R] [Algebra k R] [CommRing R'] [Algebra k R']
    (f : R →ₐ[k] R') : specOver k R' ⟶ specOver k R := by
  refine Over.homMk (Spec.map (CommRingCat.ofHom f.toRingHom)) ?_
  show Spec.map (CommRingCat.ofHom f.toRingHom) ≫
        Spec.map (CommRingCat.ofHom (algebraMap k R)) =
      Spec.map (CommRingCat.ofHom (algebraMap k R'))
  rw [← Spec.map_comp, ← CommRingCat.ofHom_comp]
  congr 2
  exact RingHom.ext fun x => f.commutes x

/-- Functoriality in `R`: a `k`-algebra homomorphism `R →ₐ[k] R'` induces
a function `points k G R → points k G R'` by precomposing with
`specOverHom k f`. -/
noncomputable def points.map (k : Type u) [Field k]
    (G : Scheme.{u}) [G.Over (Spec (CommRingCat.of k))]
    [GrpObj (Scheme.asOver G (Spec (CommRingCat.of k)))]
    {R R' : Type u} [CommRing R] [Algebra k R] [CommRing R'] [Algebra k R']
    (f : R →ₐ[k] R') : points k G R → points k G R' :=
  fun p => specOverHom k f ≫ p

/-- `points.map` of an algebra homomorphism preserves the group structure.

Statement form; the formal proof packages `Hom(-, G)` as a functor of
monoid objects valued in Cartesian-monoidal categories, and follows from
`Hom.group` (`Mathlib.CategoryTheory.Monoidal.Cartesian.Grp_`) being
natural in the first argument. The missing Mathlib machinery is
`Hom.group`'s naturality lemma in the source variable. -/
theorem points.map_is_group_hom (k : Type u) [Field k]
    (G : Scheme.{u}) [G.Over (Spec (CommRingCat.of k))]
    [GrpObj (Scheme.asOver G (Spec (CommRingCat.of k)))]
    {R R' : Type u} [CommRing R] [Algebra k R] [CommRing R'] [Algebra k R']
    (f : R →ₐ[k] R') (p q : points k G R) :
    points.map k G f (p * q) = points.map k G f p * points.map k G f q := by
  -- p * q = lift p q ≫ μ (definition of Hom.group's mul).
  -- points.map f p = specOverHom k f ≫ p.
  -- Want: specOverHom k f ≫ (lift p q ≫ μ) =
  --       lift (specOverHom k f ≫ p) (specOverHom k f ≫ q) ≫ μ.
  -- This is comp_lift + associativity.
  show specOverHom k f ≫ (CartesianMonoidalCategory.lift p q ≫ MonObj.mul) =
    CartesianMonoidalCategory.lift (specOverHom k f ≫ p)
      (specOverHom k f ≫ q) ≫ MonObj.mul
  rw [← Category.assoc, CartesianMonoidalCategory.comp_lift]

end Langlands.AlgebraicGeometry
