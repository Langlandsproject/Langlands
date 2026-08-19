import LanglandsLean.AlgebraicGeometry.AlgHomGroup
import Mathlib.AlgebraicGeometry.GammaSpecAdjunction
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Over
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp_

/-!
# Group-valued points presheaf of a Hopf algebra

For a commutative `R`-Hopf algebra `A` and a scheme `T` over `Spec R`,
the set of `R`-algebra homomorphisms `A →ₐ[R] Γ(T, ⊤)` carries the
convolution group structure (from `AlgHomGroup.instGroup`).  Bundling
this into a presheaf

```
pointsPresheaf A : (Over (Spec R))ᵒᵖ ⥤ GrpCat
```

is the **Step 2** of the Yoneda construction of `hopfSpec`: combined
with representability (Step 3), `GrpObj.ofRepresentableBy` then yields
the group object structure on `Spec A` (Step 4).

## Knowledge base

`affine_group_schemes.hopf_spec_grpobj_via_yoneda` (Step 1).

## GitHub issue

Phase B-Y4: <https://github.com/Langlandsproject/Langlands/issues/17>
(the Yoneda chain closes the `hopfSpec` sorry).
-/

open AlgebraicGeometry CategoryTheory Opposite TopologicalSpace
open Langlands.AlgebraicGeometry.AlgHomGroup

namespace Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

universe u

variable (R : CommRingCat.{u})
variable (A : Type u) [CommRing A] [HopfAlgebra R A]

/-- For `T` a scheme over `Spec R`, the structure morphism
`T.hom : T.left ⟶ Spec R` induces a ring map `R ⟶ Γ(T.left, ⊤)` by
`Γ ∘ Spec`-adjunction (concretely, by composing the inverse of the
`ΓSpec` iso with the application on global sections). -/
noncomputable def overGammaMap (T : Over (Scheme.Spec.obj (op R))) :
    R ⟶ CommRingCat.of (Γ(T.left, ⊤)) :=
  (Scheme.ΓSpecIso R).inv ≫ T.hom.appTop

/-- `T : Over (Spec R)` makes `Γ(T.left, ⊤)` into an `R`-algebra via
`overGammaMap`. -/
noncomputable def gammaAlgebra (T : Over (Scheme.Spec.obj (op R))) :
    Algebra R (Γ(T.left, ⊤)) :=
  (overGammaMap R T).hom.toAlgebra

/-- The object component of the points presheaf: send a scheme `T` over
`Spec R` to the convolution group `A →ₐ[R] Γ(T.left, ⊤)`. -/
noncomputable def pointsObj (T : Over (Scheme.Spec.obj (op R))) : GrpCat.{u} :=
  letI : Algebra R (Γ(T.left, ⊤)) := gammaAlgebra R T
  letI : Group (A →ₐ[R] Γ(T.left, ⊤)) :=
    Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
  GrpCat.of (A →ₐ[R] Γ(T.left, ⊤))

/-! ### Functoriality of the points presheaf

The presheaf assignment `T ↦ A →ₐ[R] Γ(T.left, ⊤)` extends to a
contravariant functor on `Over (Spec R)`: a morphism `g : T' ⟶ T` in
`Over (Spec R)` is sent to the post-composition map sending `f : A → Γ(T.left)`
to `g.left.appTop ∘ f : A → Γ(T'.left)`.

The fact that `g.left.appTop` is an `R`-algebra hom (with respect to
the `gammaAlgebra` structures) follows from `g.w : g.left ≫ T.hom = T'.hom`,
which translates under `Γ` to compatibility of the structure maps.
-/

/-- The ring map `Γ(T.left) → Γ(T'.left)` induced by a morphism
`g : T' ⟶ T` of schemes over `Spec R`, packaged as an `R`-algebra hom
with respect to the `gammaAlgebra` structures. -/
noncomputable def gammaAlgHom {T T' : Over (Scheme.Spec.obj (op R))}
    (g : T' ⟶ T) :
    letI := gammaAlgebra R T
    letI := gammaAlgebra R T'
    Γ(T.left, ⊤) →ₐ[R] Γ(T'.left, ⊤) :=
  letI := gammaAlgebra R T
  letI := gammaAlgebra R T'
  { __ := g.left.appTop.hom
    commutes' := by
      intro r
      -- algebraMap R Γ(T.left) r = (overGammaMap R T).hom r
      -- algebraMap R Γ(T'.left) r = (overGammaMap R T').hom r
      -- g.w : g.left ≫ T.hom = T'.hom, applied to .appTop:
      --   T.hom.appTop ≫ g.left.appTop = T'.hom.appTop.
      change (g.left.appTop.hom) ((overGammaMap R T).hom r) =
        (overGammaMap R T').hom r
      have hw : g.left ≫ T.hom = T'.hom := Over.w g
      have happ : T.hom.appTop ≫ g.left.appTop = T'.hom.appTop := by
        rw [← Scheme.Hom.comp_appTop, hw]
      have hcomp : (Scheme.ΓSpecIso R).inv ≫ T.hom.appTop ≫ g.left.appTop =
          (Scheme.ΓSpecIso R).inv ≫ T'.hom.appTop := by
        rw [happ]
      have := congrArg (fun (h : R ⟶ _) => h.hom r) hcomp
      simp only [CommRingCat.comp_apply, overGammaMap] at this ⊢
      convert this using 1 }

/-- Post-composition by an `R`-algebra hom on the target distributes
over convolution. Concretely: for `h : B →ₐ[R] B'` (B, B' commutative)
and `f₁, f₂ : A →ₐ[R] B`, `h.comp (convAlg f₁ f₂) = convAlg (h.comp f₁) (h.comp f₂)`.

Proof: `convAlg = lmul' ∘ map ⊗ ∘ comul`. Post-composing by `h`
preserves the structure because `h` commutes with `lmul'` (as `h`
preserves multiplication) and `Algebra.TensorProduct.map_comp`
factors the tensor map. -/
lemma convAlg_postcomp {B B' : Type u} [CommRing B] [Algebra R B]
    [CommRing B'] [Algebra R B'] (h : B →ₐ[R] B') (f₁ f₂ : A →ₐ[R] B) :
    h.comp (Langlands.AlgebraicGeometry.HopfConvolution.convAlg f₁ f₂) =
      Langlands.AlgebraicGeometry.HopfConvolution.convAlg
        (h.comp f₁) (h.comp f₂) := by
  apply AlgHom.ext
  intro a
  simp only [Langlands.AlgebraicGeometry.HopfConvolution.convAlg,
    AlgHom.comp_apply]
  -- After unfolding, both sides reduce to a tensor-product calculation
  -- which is handled by Algebra.TensorProduct.map_comp.
  rw [show (Algebra.TensorProduct.map (h.comp f₁) (h.comp f₂) :
      _ →ₐ[R] _) =
      (Algebra.TensorProduct.map h h).comp
        (Algebra.TensorProduct.map f₁ f₂) by
    apply AlgHom.ext
    intro x
    induction x with
    | zero => simp
    | tmul x y => simp [Algebra.TensorProduct.map_tmul]
    | add x y hx hy => simp [hx, hy]]
  -- Now `h ∘ lmul' ∘ map = lmul' ∘ map h h ∘ map = ...`
  -- via the fact that h commutes with lmul' on a commutative target.
  have hcomm : h.comp (Algebra.TensorProduct.lmul' (R := R) (S := B)) =
      (Algebra.TensorProduct.lmul' (R := R) (S := B')).comp
        (Algebra.TensorProduct.map h h) := by
    apply AlgHom.ext
    intro x
    induction x with
    | zero => simp
    | tmul x y => simp [Algebra.TensorProduct.lmul'_apply_tmul, map_mul]
    | add x y hx hy =>
        simp only [AlgHom.comp_apply, map_add] at hx hy ⊢
        rw [hx, hy]
  calc h ((Algebra.TensorProduct.lmul' (R := R))
            ((Algebra.TensorProduct.map f₁ f₂) (CoalgebraStruct.comul a)))
      = ((Algebra.TensorProduct.lmul' (R := R)).comp
            (Algebra.TensorProduct.map h h))
        ((Algebra.TensorProduct.map f₁ f₂) (CoalgebraStruct.comul a)) := by
        rw [← hcomm]; rfl
    _ = (Algebra.TensorProduct.lmul' (R := R))
          (((Algebra.TensorProduct.map h h).comp
              (Algebra.TensorProduct.map f₁ f₂))
              (CoalgebraStruct.comul a)) := by rfl

/-- Post-composition by an `R`-algebra hom on the target preserves the
convolution identity `convOneAlg`. -/
lemma convOneAlg_postcomp {B B' : Type u} [CommRing B] [Algebra R B]
    [CommRing B'] [Algebra R B'] (h : B →ₐ[R] B') :
    h.comp (Langlands.AlgebraicGeometry.AlgHomGroup.convOneAlg
        (R := R) (A := A) (B := B)) =
      Langlands.AlgebraicGeometry.AlgHomGroup.convOneAlg
        (R := R) (A := A) (B := B') := by
  apply AlgHom.ext
  intro a
  simp [Langlands.AlgebraicGeometry.AlgHomGroup.convOneAlg]

/-- Post-composition by an `R`-algebra hom on the target preserves the
antipode-composed AlgHom `algHomCompAntipode`. -/
lemma algHomCompAntipode_postcomp {B B' : Type u} [CommRing B] [Algebra R B]
    [CommRing B'] [Algebra R B'] (h : B →ₐ[R] B') (f : A →ₐ[R] B) :
    h.comp (Langlands.AlgebraicGeometry.HopfAntipode.algHomCompAntipode f) =
      Langlands.AlgebraicGeometry.HopfAntipode.algHomCompAntipode (h.comp f) := by
  apply AlgHom.ext
  intro a
  simp [Langlands.AlgebraicGeometry.HopfAntipode.algHomCompAntipode]

/-- The full points presheaf: `(Over (Spec R))ᵒᵖ ⥤ GrpCat`. Sends
`T : Over (Spec R)` to the convolution group `A →ₐ[R] Γ(T.left, ⊤)`,
and a morphism `g : T' ⟶ T` to post-composition by `gammaAlgHom g`. -/
noncomputable def pointsPresheaf :
    (Over (Scheme.Spec.obj (op R)))ᵒᵖ ⥤ GrpCat.{u} where
  obj T := pointsObj R A T.unop
  map {T T'} g :=
    letI := gammaAlgebra R T.unop
    letI := gammaAlgebra R T'.unop
    letI : Group (A →ₐ[R] Γ(T.unop.left, ⊤)) :=
      Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
    letI : Group (A →ₐ[R] Γ(T'.unop.left, ⊤)) :=
      Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
    GrpCat.ofHom
      { toFun := fun f => (gammaAlgHom R g.unop).comp f
        map_one' := by
          show (gammaAlgHom R g.unop).comp
              (Langlands.AlgebraicGeometry.AlgHomGroup.convOneAlg) =
            Langlands.AlgebraicGeometry.AlgHomGroup.convOneAlg
          exact convOneAlg_postcomp R A (gammaAlgHom R g.unop)
        map_mul' := by
          intro f₁ f₂
          show (gammaAlgHom R g.unop).comp
              (Langlands.AlgebraicGeometry.HopfConvolution.convAlg f₁ f₂) =
            Langlands.AlgebraicGeometry.HopfConvolution.convAlg
              ((gammaAlgHom R g.unop).comp f₁) ((gammaAlgHom R g.unop).comp f₂)
          exact convAlg_postcomp R A (gammaAlgHom R g.unop) f₁ f₂ }
  map_id T := by
    letI := gammaAlgebra R T.unop
    letI : Group (A →ₐ[R] Γ(T.unop.left, ⊤)) :=
      Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
    apply GrpCat.ext
    intro f
    show (gammaAlgHom R (𝟙 T.unop)).comp f = f
    apply AlgHom.ext
    intro a
    show (gammaAlgHom R (𝟙 T.unop)).toRingHom (f a) = f a
    -- gammaAlgHom of identity is the identity (since 𝟙.left.appTop = 𝟙).
    have hid : ((𝟙 T.unop : T.unop ⟶ T.unop).left.appTop).hom =
        RingHom.id _ := by
      apply RingHom.ext
      intro x
      change (𝟙 T.unop : T.unop ⟶ T.unop).left.appTop.hom x = x
      simp
    have : (gammaAlgHom R (𝟙 T.unop)).toRingHom = RingHom.id _ := by
      apply RingHom.ext
      intro x
      change ((𝟙 T.unop : T.unop ⟶ T.unop).left.appTop).hom x = x
      rw [hid]; rfl
    rw [this]; rfl
  map_comp {T T' T''} g h := by
    letI := gammaAlgebra R T.unop
    letI := gammaAlgebra R T'.unop
    letI := gammaAlgebra R T''.unop
    letI : Group (A →ₐ[R] Γ(T.unop.left, ⊤)) :=
      Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
    letI : Group (A →ₐ[R] Γ(T'.unop.left, ⊤)) :=
      Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
    letI : Group (A →ₐ[R] Γ(T''.unop.left, ⊤)) :=
      Langlands.AlgebraicGeometry.AlgHomGroup.instGroup
    apply GrpCat.ext
    intro f
    show (gammaAlgHom R (g ≫ h).unop).comp f =
      (gammaAlgHom R h.unop).comp ((gammaAlgHom R g.unop).comp f)
    apply AlgHom.ext
    intro a
    show (gammaAlgHom R (g ≫ h).unop).toRingHom (f a) =
      (gammaAlgHom R h.unop).toRingHom ((gammaAlgHom R g.unop).toRingHom (f a))
    -- (g ≫ h).unop = h.unop ≫ g.unop in the underlying category, and
    -- the appTop functor reverses composition; gammaAlgHom underlying
    -- is just g.left.appTop, so the composition unfolds correctly.
    have hop : (g ≫ h).unop = h.unop ≫ g.unop := rfl
    have hcomp : ((g ≫ h).unop).left.appTop =
        g.unop.left.appTop ≫ h.unop.left.appTop := by
      rw [hop]; show (h.unop.left ≫ g.unop.left).appTop = _
      rw [Scheme.Hom.comp_appTop]
    -- The underlying ring map of (g ≫ h).unop's gammaAlgHom is g.unop.left.appTop.hom
    show (g ≫ h).unop.left.appTop.hom (f a) =
      h.unop.left.appTop.hom (g.unop.left.appTop.hom (f a))
    rw [hcomp]
    rfl

/-! ### Step 3: Representability witness

`Spec A` viewed as a scheme over `Spec R` via the structure morphism
`algebraMap R A`. The forgetful image of `pointsPresheaf` (i.e.,
`T ↦ A →ₐ[R] Γ(T.left, ⊤)` as a set) is naturally isomorphic to the
Yoneda functor `Hom_{Over(Spec R)}(-, Spec A)`, hence representable by
`specObjOver R A`.

The natural bijection comes from the `Γ ⊣ Spec` adjunction restricted
to morphisms over `Spec R`.
-/

/-- `Spec A` regarded as a scheme over `Spec R` via the structure
morphism `algebraMap R A`. -/
noncomputable def specObjOver : Over (Scheme.Spec.obj (op R)) :=
  Over.mk (Scheme.Spec.map (op (CommRingCat.ofHom (algebraMap R A))))

set_option backward.isDefEq.respectTransparency.types false in
/-- Forward map: a morphism `T ⟶ specObjOver R A` in `Over (Spec R)`
yields an `R`-algebra hom `A →ₐ[R] Γ(T.left, ⊤)` by applying `Γ`
(i.e., `f.left.appTop`) and pre-composing with the `ΓSpec` iso.

Blueprint: affine_group_schemes.spec_representability_via_global_sections
-/
noncomputable def homOverToAlgHom (T : Over (Scheme.Spec.obj (op R)))
    (f : T ⟶ specObjOver R A) :
    letI := gammaAlgebra R T
    A →ₐ[R] Γ(T.left, ⊤) :=
  letI := gammaAlgebra R T
  { __ := ((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫ f.left.appTop).hom
    commutes' := by
      intro r
      -- The R-algebra structure on Γ(T.left) is by overGammaMap R T.
      -- We need to show:
      --   φ (algebraMap R A r) = algebraMap R Γ(T.left) r
      -- where φ = (ΓSpecIso A).inv ≫ f.left.appTop.
      -- Both sides factor through T.hom.appTop and (ΓSpecIso R).inv,
      -- using f.left ≫ specObjOver.hom = T.hom (the Over.w of f).
      change (((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫
          f.left.appTop)).hom (algebraMap R A r) =
        (overGammaMap R T).hom r
      have hw : f.left ≫ (specObjOver R A).hom = T.hom := Over.w f
      -- specObjOver.hom = Spec.map (op (algebraMap R A)).
      -- T.hom.appTop = (f.left ≫ specObjOver.hom).appTop
      --              = specObjOver.hom.appTop ≫ f.left.appTop.
      have happ : (specObjOver R A).hom.appTop ≫ f.left.appTop = T.hom.appTop := by
        rw [← Scheme.Hom.comp_appTop, hw]
      -- Now algebraMap R A factored: (ΓSpecIso R).inv ≫ Spec.map(algebraMap).appTop
      --                            = (ΓSpecIso A).inv ≫ algebraMap (via naturality).
      -- The key naturality: (ΓSpecIso R).inv ≫ Spec.map(g).appTop
      --                   = g ≫ (ΓSpecIso A).inv for g : R ⟶ A.
      -- This is `Scheme.ΓSpecIso_inv_naturality`.
      have hnat : (Scheme.ΓSpecIso R).inv ≫
          (Scheme.Spec.map (op (CommRingCat.ofHom (algebraMap R A)))).appTop =
            CommRingCat.ofHom (algebraMap R A) ≫
              (Scheme.ΓSpecIso (CommRingCat.of A)).inv :=
        (Scheme.ΓSpecIso_inv_naturality (CommRingCat.ofHom (algebraMap R A))).symm
      -- Now compute both sides at r.
      have key : (overGammaMap R T).hom r =
          (((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫
            f.left.appTop).hom) (algebraMap R A r) := by
        -- overGammaMap R T = (ΓSpecIso R).inv ≫ T.hom.appTop
        --   = (ΓSpecIso R).inv ≫ (specObjOver.hom).appTop ≫ f.left.appTop
        --   [by happ]
        --   = (CommRingCat.ofHom (algebraMap R A)) ≫ (ΓSpecIso A).inv ≫ f.left.appTop
        --   [by hnat — note specObjOver.hom = Spec.map (...)]
        change ((Scheme.ΓSpecIso R).inv ≫ T.hom.appTop).hom r = _
        rw [← happ, ← Category.assoc]
        show ((Scheme.ΓSpecIso R).inv ≫
          (Scheme.Spec.map (op (CommRingCat.ofHom (algebraMap R A)))).appTop ≫
            f.left.appTop).hom r = _
        rw [← Category.assoc, hnat, Category.assoc]
        rfl
      exact key.symm }

set_option backward.isDefEq.respectTransparency false in
/-- Backward map: an R-algebra hom `φ : A →ₐ[R] Γ(T.left, ⊤)` yields a
morphism `T ⟶ specObjOver R A` in `Over (Spec R)` via the `Γ ⊣ Spec`
adjunction.

Blueprint: affine_group_schemes.spec_representability_via_global_sections
-/
noncomputable def algHomToHomOver (T : Over (Scheme.Spec.obj (op R)))
    (φ : letI := gammaAlgebra R T; A →ₐ[R] Γ(T.left, ⊤)) :
    T ⟶ specObjOver R A :=
  letI := gammaAlgebra R T
  Over.homMk
    (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A))
      (op (CommRingCat.ofHom φ.toRingHom)))
    (by
      -- Required: f.left ≫ (specObjOver R A).hom = T.hom.
      letI := gammaAlgebra R T
      -- Step 1: the composite of the algebra-structure ring hom with φ
      -- (as ring homs) is the overGammaMap, because φ is an R-algebra hom.
      have hcompose :
          (CommRingCat.ofHom (algebraMap R A) ≫
            CommRingCat.ofHom φ.toRingHom) = overGammaMap R T := by
        ext r
        change φ ((algebraMap (↑R) A) r) = (overGammaMap R T).hom r
        rw [φ.commutes r]
        rfl
      -- Step 2: (homEquiv).symm T.hom = op (overGammaMap R T).
      -- This uses the formula (homEquiv).symm h = F.map h ≫ counit.app Y.
      have hSymm : (ΓSpec.adjunction.homEquiv T.left (op R)).symm T.hom =
          op (overGammaMap R T) := by
        rw [Adjunction.homEquiv_counit, ΓSpec.adjunction_counit_app]
        -- The LHS is now: Γ.rightOp.map T.hom ≫ op (ΓSpecIso R).inv
        --   = op T.hom.appTop ≫ op (ΓSpecIso R).inv
        --   = op ((ΓSpecIso R).inv ≫ T.hom.appTop)
        --   = op (overGammaMap R T)
        rfl
      -- Therefore: homEquiv (op (overGammaMap R T)) = T.hom.
      have hTHom : (ΓSpec.adjunction.homEquiv T.left (op R))
          (op (overGammaMap R T)) = T.hom := by
        have := congrArg (ΓSpec.adjunction.homEquiv T.left (op R)) hSymm
        rw [Equiv.apply_symm_apply] at this
        exact this.symm
      -- Final composition: f.left ≫ specObjOver.hom by adjunction naturality_right.
      show (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A)))
          (op (CommRingCat.ofHom φ.toRingHom)) ≫
          (specObjOver R A).hom = T.hom
      change (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A)))
          (op (CommRingCat.ofHom φ.toRingHom)) ≫
          Scheme.Spec.map (op (CommRingCat.ofHom (algebraMap R A))) = T.hom
      rw [← Adjunction.homEquiv_naturality_right]
      -- (op φ.toRingHom) ≫ (op (algebraMap R A)) = op (algebraMap R A ≫ φ.toRingHom)
      --                                            = op (overGammaMap R T).
      have hop :
          (op (CommRingCat.ofHom φ.toRingHom) ≫
            op (CommRingCat.ofHom (algebraMap R A)) :
            op Γ(T.left, ⊤) ⟶ op R) =
          (op (overGammaMap R T) : op Γ(T.left, ⊤) ⟶ op R) := by
        show op (CommRingCat.ofHom (algebraMap R A) ≫
            CommRingCat.ofHom φ.toRingHom) = op (overGammaMap R T)
        rw [hcompose]
      rw [hop]
      exact hTHom)

set_option backward.isDefEq.respectTransparency false in
/-- The representability witness: the forgetful image of
`pointsPresheaf` is naturally isomorphic to `Hom_{Over Spec R}(-, Spec A)`,
hence representable by `specObjOver R A`.

Blueprint: affine_group_schemes.spec_representability_via_global_sections
-/
noncomputable def specRepresentability :
    (pointsPresheaf R A ⋙ forget GrpCat).RepresentableBy (specObjOver R A) where
  homEquiv {T : Over (Scheme.Spec.obj (op R))} :=
    letI := gammaAlgebra R T
    { toFun := homOverToAlgHom R A T
      invFun := algHomToHomOver R A T
      left_inv := by
        intro f
        -- Roundtrip: algHomToHomOver ∘ homOverToAlgHom on f reduces
        -- to f via the adjunction's (homEquiv).apply_symm_apply on f.left.
        apply Over.OverMorphism.ext
        show ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A))
            (op (CommRingCat.ofHom
              ((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫ f.left.appTop).hom))
            = f.left
        -- This is `(homEquiv).apply_symm_apply f.left`, with the symm
        -- formula unfolded.
        have hSymm :
            (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A))).symm
              f.left =
            op (CommRingCat.ofHom
              ((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫ f.left.appTop).hom) := by
          rw [Adjunction.homEquiv_counit,
            ΓSpec.adjunction_counit_app]
          rfl
        rw [← hSymm, Equiv.apply_symm_apply]
      right_inv := by
        intro φ
        -- Roundtrip: homOverToAlgHom ∘ algHomToHomOver on φ reduces to φ
        -- via (homEquiv).symm_apply_apply on op (φ.toRingHom).
        apply AlgHom.ext
        intro a
        -- Use symm_apply_apply for the adjunction homEquiv.
        have happ :=
          (ΓSpec.adjunction.homEquiv T.left (op (CommRingCat.of A))).symm_apply_apply
            (op (CommRingCat.ofHom φ.toRingHom))
        rw [Adjunction.homEquiv_counit, ΓSpec.adjunction_counit_app] at happ
        -- happ : op (...) ≫ op (ΓSpecIso A).inv = op (CommRingCat.ofHom φ.toRingHom).
        -- Take .unop to get a CommRingCat hom equality.
        have hunop := congrArg Quiver.Hom.unop happ
        -- Apply both sides at a (as functions, via CommRingCat hom coercion).
        have := congrArg (fun (r : CommRingCat.of A ⟶
            CommRingCat.of (Γ(T.left, ⊤) : CommRingCat)) => r.hom a) hunop
        -- The LHS reduces to ((ΓSpecIso A).inv ≫ ...).hom a,
        -- the RHS to (CommRingCat.ofHom φ.toRingHom).hom a = φ a.
        simpa [homOverToAlgHom, algHomToHomOver] using this }
  homEquiv_comp := by
    intro X X' g f
    -- Naturality of the homEquiv: both sides reduce to the AlgHom
    -- with underlying ring hom `(ΓSpecIso A).inv ≫ f.left.appTop ≫ g.left.appTop`.
    letI := gammaAlgebra R X
    letI := gammaAlgebra R X'
    apply AlgHom.ext
    intro a
    show ((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫
        (g ≫ f).left.appTop).hom a =
      ((gammaAlgHom R g).comp
        (homOverToAlgHom R A X' f)) a
    -- Unfold gammaAlgHom and homOverToAlgHom: both sides are
    -- g.left.appTop ((ΓSpecIso A).inv ≫ f.left.appTop applied to a).
    show ((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫
        (g ≫ f).left.appTop).hom a =
      g.left.appTop.hom (((Scheme.ΓSpecIso (CommRingCat.of A)).inv ≫
        f.left.appTop).hom a)
    -- (g ≫ f).left = g.left ≫ f.left in Over; appTop is contravariant.
    have hcomp : (g ≫ f).left.appTop = f.left.appTop ≫ g.left.appTop := by
      show (g.left ≫ f.left).appTop = _
      rw [Scheme.Hom.comp_appTop]
    rw [hcomp]
    rfl

/-! ### Step 4: GrpObj on `specObjOver R A` via Yoneda

Applying `GrpObj.ofRepresentableBy` to the points presheaf and the
representability witness yields the group object structure on
`specObjOver R A : Over (Spec R)`. This is the **object-level**
construction of `hopfSpec`: for each commutative `R`-Hopf algebra `A`,
the affine scheme `Spec A` becomes a group object over `Spec R`.

The functor-level construction `hopfSpec : Grp ((CommAlgCat R)ᵒᵖ) ⥤
Grp (Over (Spec R))` requires an additional bridge from
`GrpObj (A : (CommAlgCat R)ᵒᵖ)` to `HopfAlgebra R A.unop` — this
bridge is itself substantial work and is the remaining gap.
-/

/-- The group object structure on `Spec A` over `Spec R`, constructed
via the Yoneda lemma from the convolution group on
`A →ₐ[R] Γ(T.left, ⊤)`. -/
noncomputable def hopfSpecGrpObj : GrpObj (specObjOver R A) :=
  GrpObj.ofRepresentableBy (specObjOver R A) (pointsPresheaf R A)
    (specRepresentability R A)

/-- `hopfSpecGrpObj` as an instance: `Spec A` of a Hopf algebra is a
group object, canonically. -/
noncomputable instance specObjOver.instGrpObj : GrpObj (specObjOver R A) :=
  hopfSpecGrpObj R A

end Langlands.AlgebraicGeometry.AlgHomPointsPresheaf
