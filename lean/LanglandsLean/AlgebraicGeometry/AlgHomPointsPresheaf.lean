import LanglandsLean.AlgebraicGeometry.AlgHomGroup
import Mathlib.AlgebraicGeometry.GammaSpecAdjunction
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Over
import Mathlib.Algebra.Category.Grp.Basic

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

## Blueprint

`linear_algebraic_groups.hopf_spec_grpobj_via_yoneda` (Step 1).

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

end Langlands.AlgebraicGeometry.AlgHomPointsPresheaf
