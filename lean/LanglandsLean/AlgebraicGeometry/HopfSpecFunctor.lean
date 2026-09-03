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

`affine_group_schemes.hopf_spec_functor` Yoneda construction (object +
functor parts).

## GitHub issue

Phase B-Y5: <https://github.com/Langlandsproject/Langlands/issues/21>
-/

set_option backward.isDefEq.respectTransparency false

open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open scoped CategoryTheory.MonObj

namespace Langlands.AlgebraicGeometry.HopfSpecFunctor

universe u

variable (R : CommRingCat.{u})

/-- Local copy of `algSpec` (also defined in `HopfSpec.lean`, but we
re-state it here to avoid a circular import). -/
noncomputable def algSpec :
    (CommAlgCat R)ᵒᵖ ⥤ Over (Scheme.Spec.obj (op R)) :=
  (commAlgCatEquivUnder R).op.functor ⋙
  (Over.opEquivOpUnder R).inverse ⋙
  Over.post Scheme.Spec

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

/-! ### Spec/Γ bijection at the categorical level

For any `A : (CommAlgCat R)ᵒᵖ`, the natural bijection

\[
(T \to \operatorname{algSpec}.\operatorname{obj} A) \;\;\simeq\;\;
(\operatorname{op}(\operatorname{gammaOver} T) \to A)
\]

is just the Spec ⊣ Γ adjunction restricted to the slice over `Spec R`.
Same proof technique as `AlgHomPointsPresheaf.algHomToHomOver` /
`homOverToAlgHom`, but generalized to arbitrary `A : (CommAlgCat R)ᵒᵖ`
(no HopfAlgebra hypothesis needed). -/

variable {A : (CommAlgCat R)ᵒᵖ}

/-- The Spec/Γ-adjunction structure morphism of `algSpec.obj A`. -/
private lemma algSpec_obj_hom_eq :
    (algSpec R |>.obj A).hom =
      Scheme.Spec.map (op (CommRingCat.ofHom (algebraMap R A.unop))) := by
  rfl

/-- Forward map: from a morphism `T ⟶ algSpec.obj A` extract the
underlying R-algebra hom via `f.left.appTop` and `(ΓSpecIso A.unop).inv`. -/
noncomputable def homOverGrpToAlgHom (T : Over (Scheme.Spec.obj (op R)))
    (f : T ⟶ algSpec R |>.obj A) : op ((gammaOver R).obj (op T)) ⟶ A :=
  letI : Algebra R (Γ(T.left, ⊤) : CommRingCat) :=
    AlgHomPointsPresheaf.gammaAlgebra R T
  op (CommAlgCat.ofHom
    { __ := ((Scheme.ΓSpecIso (CommRingCat.of A.unop)).inv ≫ f.left.appTop).hom
      commutes' := by
        intro r
        change (((Scheme.ΓSpecIso (CommRingCat.of A.unop)).inv ≫
            f.left.appTop)).hom (algebraMap R A.unop r) =
          (AlgHomPointsPresheaf.overGammaMap R T).hom r
        have hw : f.left ≫ (algSpec R |>.obj A).hom = T.hom := Over.w f
        have happ : (algSpec R |>.obj A).hom.appTop ≫ f.left.appTop =
            T.hom.appTop := by
          rw [← Scheme.Hom.comp_appTop, hw]
        have hnat : (Scheme.ΓSpecIso R).inv ≫
            (Scheme.Spec.map (op (CommRingCat.ofHom
              (algebraMap R A.unop)))).appTop =
              CommRingCat.ofHom (algebraMap R A.unop) ≫
                (Scheme.ΓSpecIso (CommRingCat.of A.unop)).inv :=
          (Scheme.ΓSpecIso_inv_naturality
            (CommRingCat.ofHom (algebraMap R A.unop))).symm
        have key : (AlgHomPointsPresheaf.overGammaMap R T).hom r =
            (((Scheme.ΓSpecIso (CommRingCat.of A.unop)).inv ≫
              f.left.appTop).hom) (algebraMap R A.unop r) := by
          change ((Scheme.ΓSpecIso R).inv ≫ T.hom.appTop).hom r = _
          rw [← happ, ← Category.assoc]
          rw [algSpec_obj_hom_eq]
          show ((Scheme.ΓSpecIso R).inv ≫
            (Scheme.Spec.map (op (CommRingCat.ofHom (algebraMap R A.unop)))).appTop ≫
              f.left.appTop).hom r = _
          rw [← Category.assoc, hnat, Category.assoc]
          rfl
        exact key.symm })

/-- Backward map: from an `R`-algebra hom (encoded categorically) build
a morphism in `Over (Spec R)` via the Spec ⊣ Γ adjunction. -/
noncomputable def algHomToHomOverGrp (T : Over (Scheme.Spec.obj (op R)))
    (g : op ((gammaOver R).obj (op T)) ⟶ A) : T ⟶ algSpec R |>.obj A :=
  letI : Algebra R (Γ(T.left, ⊤) : CommRingCat) :=
    AlgHomPointsPresheaf.gammaAlgebra R T
  Over.homMk
    (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A.unop))
      (op (CommRingCat.ofHom g.unop.hom.toRingHom)))
    (by
      letI := AlgHomPointsPresheaf.gammaAlgebra R T
      have hcompose :
          (CommRingCat.ofHom (algebraMap R A.unop) ≫
            CommRingCat.ofHom g.unop.hom.toRingHom) =
            AlgHomPointsPresheaf.overGammaMap R T := by
        ext r
        change g.unop.hom ((algebraMap (↑R) A.unop) r) =
          (AlgHomPointsPresheaf.overGammaMap R T).hom r
        rw [g.unop.hom.commutes r]
        rfl
      have hSymm :
          (ΓSpec.adjunction.homEquiv T.left (op R)).symm T.hom =
            op (AlgHomPointsPresheaf.overGammaMap R T) := by
        rw [Adjunction.homEquiv_counit, ΓSpec.adjunction_counit_app]
        rfl
      have hTHom : (ΓSpec.adjunction.homEquiv T.left (op R))
          (op (AlgHomPointsPresheaf.overGammaMap R T)) = T.hom := by
        have := congrArg (ΓSpec.adjunction.homEquiv T.left (op R)) hSymm
        rw [Equiv.apply_symm_apply] at this
        exact this.symm
      show (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A.unop)))
          (op (CommRingCat.ofHom g.unop.hom.toRingHom)) ≫
          (algSpec R |>.obj A).hom = T.hom
      rw [algSpec_obj_hom_eq]
      rw [← Adjunction.homEquiv_naturality_right]
      have hop :
          (op (CommRingCat.ofHom g.unop.hom.toRingHom) ≫
            op (CommRingCat.ofHom (algebraMap R A.unop)) :
            op Γ(T.left, ⊤) ⟶ op R) =
          (op (AlgHomPointsPresheaf.overGammaMap R T) :
            op Γ(T.left, ⊤) ⟶ op R) := by
        show op (CommRingCat.ofHom (algebraMap R A.unop) ≫
            CommRingCat.ofHom g.unop.hom.toRingHom) =
          op (AlgHomPointsPresheaf.overGammaMap R T)
        rw [hcompose]
      rw [hop]
      exact hTHom)

/-! ### Representability of the categorical points presheaf -/

/-- The categorical points presheaf `pointsPresheafGrp A` (after
forgetting to Type) is represented by `algSpec.obj A.X`. -/
noncomputable def pointsRepresentabilityGrp (A : Grp ((CommAlgCat R)ᵒᵖ)) :
    (pointsPresheafGrp R A ⋙ forget GrpCat).RepresentableBy
      ((algSpec R).obj A.X) where
  homEquiv {T : Over (Scheme.Spec.obj (op R))} :=
    { toFun := homOverGrpToAlgHom R T
      invFun := algHomToHomOverGrp R T
      left_inv := by
        intro f
        -- Same roundtrip as `specRepresentability.left_inv`:
        -- (homEquiv).apply_symm_apply f.left
        apply Over.OverMorphism.ext
        show ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A.X.unop))
            (op (CommRingCat.ofHom
              ((Scheme.ΓSpecIso (CommRingCat.of A.X.unop)).inv ≫
                f.left.appTop).hom))
            = f.left
        have hSymm :
            (ΓSpec.adjunction.homEquiv T.left
              (op (CommRingCat.of A.X.unop))).symm f.left =
            op (CommRingCat.ofHom
              ((Scheme.ΓSpecIso (CommRingCat.of A.X.unop)).inv ≫
                f.left.appTop).hom) := by
          rw [Adjunction.homEquiv_counit, ΓSpec.adjunction_counit_app]
          rfl
        rw [← hSymm, Equiv.apply_symm_apply]
      right_inv := by
        intro g
        -- Roundtrip: same as `specRepresentability.right_inv`.
        apply Quiver.Hom.unop_inj
        apply CommAlgCat.hom_ext
        apply AlgHom.ext
        intro a
        have happ :=
          (ΓSpec.adjunction.homEquiv T.left
            (op (CommRingCat.of A.X.unop))).symm_apply_apply
            (op (CommRingCat.ofHom g.unop.hom.toRingHom))
        rw [Adjunction.homEquiv_counit, ΓSpec.adjunction_counit_app] at happ
        have hunop := congrArg Quiver.Hom.unop happ
        have := congrArg (fun (r : CommRingCat.of A.X.unop ⟶
            CommRingCat.of (Γ(T.left, ⊤) : CommRingCat)) => r.hom a) hunop
        exact this }
  homEquiv_comp := by
    intro X X' g f
    -- Naturality (same as `specRepresentability.homEquiv_comp`).
    apply Quiver.Hom.unop_inj
    apply CommAlgCat.hom_ext
    apply AlgHom.ext
    intro a
    show ((Scheme.ΓSpecIso (CommRingCat.of A.X.unop)).inv ≫
        (g ≫ f).left.appTop).hom a =
      g.left.appTop.hom (((Scheme.ΓSpecIso (CommRingCat.of A.X.unop)).inv ≫
        f.left.appTop).hom a)
    have hcomp : (g ≫ f).left.appTop = f.left.appTop ≫ g.left.appTop := by
      show (g.left ≫ f.left).appTop = _
      rw [Scheme.Hom.comp_appTop]
    rw [hcomp]
    rfl

/-- Object-level construction: for each `A : Grp ((CommAlgCat R)ᵒᵖ)`,
the affine scheme `algSpec.obj A.X` becomes a group object in
`Over (Spec R)` via Yoneda. -/
noncomputable def hopfSpecGrpObjFromGrp (A : Grp ((CommAlgCat R)ᵒᵖ)) :
    GrpObj ((algSpec R).obj A.X) :=
  GrpObj.ofRepresentableBy ((algSpec R).obj A.X)
    (pointsPresheafGrp R A) (pointsRepresentabilityGrp R A)

/-- The natural transformation of points presheaves induced by a
morphism `f : A → A'` in `Grp ((CommAlgCat R)ᵒᵖ)`: post-compose by
`f.hom : A.X → A'.X` on the right (since the source category is
op-direction). -/
noncomputable def pointsPresheafGrpMap {A A' : Grp ((CommAlgCat R)ᵒᵖ)}
    (f : A ⟶ A') : pointsPresheafGrp R A ⟶ pointsPresheafGrp R A' where
  app T := GrpCat.ofHom <|
    -- For each T, given g : op gammaOver T ⟶ A.X, return g ≫ f.hom.hom.
    -- f.hom : A.toMon ⟶ A'.toMon (Mon morphism, has .hom : A.X ⟶ A'.X).
    { toFun := fun g => g ≫ f.hom.hom
      map_one' := by
        -- (1 ≫ f.hom.hom = 1): 1 = toUnit ≫ MonObj.one in Hom.group.
        -- f.hom : Mon morphism, so MonObj.one ≫ f.hom.hom = MonObj.one.
        show (CartesianMonoidalCategory.toUnit _ ≫ MonObj.one) ≫ f.hom.hom =
          CartesianMonoidalCategory.toUnit _ ≫ MonObj.one
        rw [Category.assoc, IsMonHom.one_hom]
      map_mul' := by
        intro g₁ g₂
        show (CartesianMonoidalCategory.lift g₁ g₂ ≫ MonObj.mul) ≫ f.hom.hom =
          CartesianMonoidalCategory.lift (g₁ ≫ f.hom.hom) (g₂ ≫ f.hom.hom) ≫
            MonObj.mul
        rw [Category.assoc, IsMonHom.mul_hom, ← Category.assoc,
          CartesianMonoidalCategory.lift_map] }
  naturality := by
    intro T T' g
    ext h
    show ((gammaOver R).map g).op ≫ h ≫ f.hom.hom =
      (((gammaOver R).map g).op ≫ h) ≫ f.hom.hom
    rw [Category.assoc]

/-- The functor-level `hopfSpec`: sends a group object in
`(CommAlgCat R)ᵒᵖ` (≃ commutative `R`-Hopf algebra) to the corresponding
affine group scheme over `Spec R`, via the Yoneda construction.

The morphism part transports the natural transformation
`pointsPresheafGrp R A ⟶ pointsPresheafGrp R A'` (induced by `f` via
post-composition) along the representability isos to a `Grp` morphism
on the scheme side, via `yonedaGrpFullyFaithful.preimage`. -/
noncomputable def hopfSpec :
    Grp ((CommAlgCat R)ᵒᵖ) ⥤ Grp (Over (Scheme.Spec.obj (op R))) where
  obj A :=
    { X := (algSpec R).obj A.X
      grp := hopfSpecGrpObjFromGrp R A }
  map {A A'} f :=
    letI : GrpObj ((algSpec R).obj A.X) := hopfSpecGrpObjFromGrp R A
    letI : GrpObj ((algSpec R).obj A'.X) := hopfSpecGrpObjFromGrp R A'
    yonedaGrpFullyFaithful.preimage
      ((yonedaGrpObjIsoOfRepresentableBy ((algSpec R).obj A.X)
          (pointsPresheafGrp R A) (pointsRepresentabilityGrp R A)).hom ≫
        pointsPresheafGrpMap R f ≫
        (yonedaGrpObjIsoOfRepresentableBy ((algSpec R).obj A'.X)
          (pointsPresheafGrp R A') (pointsRepresentabilityGrp R A')).inv)
  map_id A := by
    letI : GrpObj ((algSpec R).obj A.X) := hopfSpecGrpObjFromGrp R A
    apply yonedaGrpFullyFaithful.map_injective
    rw [yonedaGrpFullyFaithful.map_preimage]
    -- LHS: (representability iso .hom) ≫ pointsPresheafGrpMap (𝟙 A) ≫ (... .inv)
    -- The middle map is post-comp by (𝟙 A).hom.hom = 𝟙 A.X = id, so middle is identity.
    -- The .hom ≫ .inv = identity by Iso.hom_inv_id.
    -- RHS: yonedaGrp.map (𝟙 _) = 𝟙 _.
    ext T h
    -- Reduce to: α.homEquiv.symm (α.homEquiv h ≫ 𝟙) = h via Iso composition.
    show GrpCat.Hom.hom (NatTrans.app
      ((yonedaGrpObjIsoOfRepresentableBy ((algSpec R).obj A.X)
          (pointsPresheafGrp R A) (pointsRepresentabilityGrp R A)).hom ≫
        pointsPresheafGrpMap R (𝟙 A) ≫
        (yonedaGrpObjIsoOfRepresentableBy ((algSpec R).obj A.X)
          (pointsPresheafGrp R A) (pointsRepresentabilityGrp R A)).inv) T) h = h
    -- Compute: pointsPresheafGrpMap (𝟙 A) at T, x is x ≫ (𝟙 A).hom.hom = x ≫ 𝟙 = x.
    -- So middle is identity nat trans.
    have hmid : pointsPresheafGrpMap R (𝟙 A) = 𝟙 _ := by
      ext T x
      show x ≫ (𝟙 A : A ⟶ A).hom.hom = x
      have : (𝟙 A : A ⟶ A).hom.hom = 𝟙 A.X := rfl
      rw [this, Category.comp_id]
    rw [hmid, Category.id_comp, Iso.hom_inv_id]
    rfl
  map_comp {A A' A''} f g := by
    letI : GrpObj ((algSpec R).obj A.X) := hopfSpecGrpObjFromGrp R A
    letI : GrpObj ((algSpec R).obj A'.X) := hopfSpecGrpObjFromGrp R A'
    letI : GrpObj ((algSpec R).obj A''.X) := hopfSpecGrpObjFromGrp R A''
    apply yonedaGrpFullyFaithful.map_injective
    rw [Functor.map_comp, yonedaGrpFullyFaithful.map_preimage,
        yonedaGrpFullyFaithful.map_preimage, yonedaGrpFullyFaithful.map_preimage]
    -- Both sides factor through the representability iso. The middle map
    -- (post-composition by hom) composes: (f ≫ g).hom.hom = f.hom.hom ≫ g.hom.hom.
    -- The .inv ≫ .hom in the middle of the RHS cancels.
    have hcomp : pointsPresheafGrpMap R (f ≫ g) =
        pointsPresheafGrpMap R f ≫ pointsPresheafGrpMap R g := by
      ext T x
      show x ≫ (f ≫ g).hom.hom = (x ≫ f.hom.hom) ≫ g.hom.hom
      change x ≫ f.hom.hom ≫ g.hom.hom = _
      rw [Category.assoc]
    rw [hcomp]
    -- Now LHS = iso.hom ≫ (f-comp ≫ g-comp) ≫ iso.inv
    -- RHS = (iso.hom ≫ f-comp ≫ iso'.inv) ≫ (iso'.hom ≫ g-comp ≫ iso''.inv)
    --     = iso.hom ≫ f-comp ≫ (iso'.inv ≫ iso'.hom) ≫ g-comp ≫ iso''.inv
    --     = iso.hom ≫ f-comp ≫ g-comp ≫ iso''.inv  [Iso.inv_hom_id = 𝟙]
    -- So they agree.
    simp only [Category.assoc]
    congr 1
    rw [← Category.assoc (pointsPresheafGrpMap R f), Iso.inv_hom_id_assoc,
        Category.assoc]

end Langlands.AlgebraicGeometry.HopfSpecFunctor
