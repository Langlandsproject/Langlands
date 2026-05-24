import LanglandsLean.AlgebraicGeometry.AlgHomPointsPresheaf
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.CommAlgCat.Monoidal
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp_

/-!
# Functor-level `hopfSpec` via `yonedaGrpObj`

For a commutative ring `R`, this file constructs the functor

```
hopfSpec : Grp ((CommAlgCat R)ᵒᵖ) ⥤ Grp (Over (Spec R))
```

bypassing the (independently substantial) `Grp ((CommAlgCat R)ᵒᵖ) ↔ HopfAlgebra R`
bridge. The strategy uses Mathlib's `yonedaGrpObj` to package the
categorical group-object data of `A : Grp ((CommAlgCat R)ᵒᵖ)` as a
presheaf of groups, which we then transport along the Spec ⊣ Γ adjunction
to obtain a `GrpObj` on `algSpec.obj A.X` via `GrpObj.ofRepresentableBy`.

## Blueprint

`linear_algebraic_groups.hopf_spec_functor` Yoneda construction (object +
functor parts).

## GitHub issue

Phase B-Y5: <https://github.com/Langlandsproject/Langlands/issues/21>
-/

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open scoped CategoryTheory.MonObj

namespace Langlands.AlgebraicGeometry.HopfSpecFunctor

universe u

variable (R : CommRingCat.{u})

/-- The contravariant functor `(Over (Spec R))ᵒᵖ ⥤ CommAlgCat R` sending
`op T` (for `T : Over (Spec R)`) to `Γ(T.left, ⊤)` as a commutative
`R`-algebra (with `R`-algebra structure from `T.hom : T.left ⟶ Spec R`).

This is the "global sections of an over-scheme as an `R`-algebra"
functor; together with `algSpec` it implements the Spec ⊣ Γ adjunction
restricted to over `Spec R`. -/
noncomputable def gammaOver : (Over (Scheme.Spec.obj (op R)))ᵒᵖ ⥤ CommAlgCat R where
  obj T :=
    letI : Algebra R (Γ(T.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T.unop
    CommAlgCat.of R (Γ(T.unop.left, ⊤) : CommRingCat)
  map {T T'} g :=
    letI : Algebra R (Γ(T.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T.unop
    letI : Algebra R (Γ(T'.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T'.unop
    -- g : T ⟶ T' in op-cat = g.unop : T'.unop ⟶ T.unop in Over.
    -- gammaAlgHom of g.unop : Γ(T.unop.left) →ₐ Γ(T'.unop.left).
    CommAlgCat.ofHom (AlgHomPointsPresheaf.gammaAlgHom R g.unop)
  map_id T := by
    letI : Algebra R (Γ(T.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T.unop
    apply CommAlgCat.hom_ext
    apply AlgHom.ext
    intro x
    change ((𝟙 T.unop : T.unop ⟶ T.unop).left.appTop).hom x = x
    simp
  map_comp {T T' T''} g h := by
    letI : Algebra R (Γ(T.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T.unop
    letI : Algebra R (Γ(T'.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T'.unop
    letI : Algebra R (Γ(T''.unop.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T''.unop
    apply CommAlgCat.hom_ext
    apply AlgHom.ext
    intro x
    -- (g ≫ h).unop = h.unop ≫ g.unop (op-cat composition reverses).
    change ((h.unop ≫ g.unop).left.appTop).hom x =
      h.unop.left.appTop.hom (g.unop.left.appTop.hom x)
    show (h.unop.left ≫ g.unop.left).appTop.hom x = _
    rw [Scheme.Hom.comp_appTop]
    rfl

/-! ### Points presheaf from a `Grp` object

For `A : Grp ((CommAlgCat R)ᵒᵖ)`, the presheaf

\[
F_A : (\mathsf{Over}(\operatorname{Spec} R))^{\mathrm{op}} \to \mathsf{Grp}
\]

assigns each \(T\) the group of `(CommAlgCat R)ᵒᵖ`-morphisms
\(\operatorname{op} \Gamma(T, \mathcal{O}_T) \to A.X\), with group
structure pulled back from `A`'s `GrpObj` via Yoneda. Concretely,
\(F_A(T)\) is the underlying set of `R`-algebra homs
\(A.X.\mathrm{unop} \to \Gamma(T, \mathcal{O}_T)\), with the group
structure from the categorical group-object data of \(A\). -/
noncomputable def pointsPresheafGrp (A : Grp ((CommAlgCat R)ᵒᵖ)) :
    (Over (Scheme.Spec.obj (op R)))ᵒᵖ ⥤ GrpCat.{u} :=
  -- Use Mathlib's `yonedaGrpObj A.X : ((CommAlgCat R)ᵒᵖ)ᵒᵖ ⥤ GrpCat`,
  -- precomposed with `(gammaOver R).rightOp.op` translating the source.
  -- gammaOver : (Over Spec R)ᵒᵖ ⥤ CommAlgCat R
  --   rightOp : (CommAlgCat R)ᵒᵖ ⥤ Over Spec R (other direction of functor)
  -- ... actually we need a different compositional path.
  -- Simpler: define obj/map by hand using the Hom.group instance.
  { obj := fun T => GrpCat.of (op ((gammaOver R).obj T) ⟶ A.X)
    map := fun {T T'} g => GrpCat.ofHom <|
      ((yonedaGrpObj A.X).map ((gammaOver R).map g).op.op).hom
    map_id := fun T => by
      ext f
      change ((gammaOver R).map (𝟙 T)).op ≫ f = f
      rw [(gammaOver R).map_id]
      simp
    map_comp := fun {T T' T''} g h => by
      ext f
      change ((gammaOver R).map (g ≫ h)).op ≫ f =
        ((gammaOver R).map h).op ≫ ((gammaOver R).map g).op ≫ f
      rw [(gammaOver R).map_comp, op_comp, Category.assoc] }

/-! ### Representability witness for the categorical points presheaf -/

/-- For any object `B : CommAlgCat R`, the Spec/Γ adjunction over
`Spec R` gives a natural bijection
`Hom_{Over(Spec R)}(T, algSpec.obj (op B)) ≃ B ⟶ gammaOver T`
in `CommAlgCat R`, equivalently
`op (gammaOver T) ⟶ op B` in `(CommAlgCat R)ᵒᵖ`. -/
noncomputable def homOverEquiv {A : (CommAlgCat R)ᵒᵖ}
    (T : Over (Scheme.Spec.obj (op R))) :
    (T ⟶ algSpec.obj A) ≃ (op ((gammaOver R).obj (op T)) ⟶ A) where
  toFun f :=
    -- f : T ⟶ algSpec.obj A in Over(Spec R)
    -- Reduce to f.left : T.left → algSpec.obj A.left and compose with ΓSpec iso.
    -- f.left.appTop : Γ(algSpec.obj A.left) → Γ(T.left). Compose with
    -- (ΓSpecIso A.unop).inv : A.unop → Γ(Spec A.unop) to get A.unop → Γ(T.left).
    op (CommAlgCat.ofHom
      { __ := ((Scheme.ΓSpecIso (CommRingCat.of A.unop)).inv ≫ f.left.appTop).hom
        commutes' := by
          intro r
          -- Need: ((ΓSpecIso _).inv ≫ f.left.appTop).hom (algebraMap R A.unop r)
          --     = (gammaAlgebra-structure-map-on-Γ(T.left)) r
          letI : Algebra R (Γ(T.left, ⊤) : CommRingCat) :=
            AlgHomPointsPresheaf.gammaAlgebra R T
          -- Same proof as homOverToAlgHom in AlgHomPointsPresheaf.
          have hw : f.left ≫ (algSpec R |>.obj A).hom = T.hom := Over.w f
          have happ : (algSpec R |>.obj A).hom.appTop ≫ f.left.appTop =
              T.hom.appTop := by
            rw [← Scheme.Hom.comp_appTop, hw]
          have hnat : (Scheme.ΓSpecIso R).inv ≫
              (algSpec R |>.obj A).hom.appTop =
                CommRingCat.ofHom (algebraMap R A.unop) ≫
                  (Scheme.ΓSpecIso (CommRingCat.of A.unop)).inv := by
            -- algSpec.obj A.hom = Spec.map (...).
            sorry
          sorry })
  invFun g :=
    -- g : op gammaOver T ⟶ A in (CommAlgCat R)ᵒᵖ = A.unop ⟶ gammaOver T in CommAlgCat R
    -- = R-algebra hom A.unop → Γ(T.left). Convert to ring hom, apply Spec/Γ adjunction.
    letI : Algebra R (Γ(T.left, ⊤) : CommRingCat) :=
      AlgHomPointsPresheaf.gammaAlgebra R T
    Over.homMk
      (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A.unop))
        (op (CommRingCat.ofHom g.unop.hom.toRingHom)))
      (by sorry)
  left_inv := by sorry
  right_inv := by sorry

end Langlands.AlgebraicGeometry.HopfSpecFunctor
