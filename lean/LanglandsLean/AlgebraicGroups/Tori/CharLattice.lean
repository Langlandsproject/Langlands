import LanglandsLean.AlgebraicGroups.Tori.CharacterGroup
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.RepresentationTheory.Basic

/-!
# The character lattice and its Galois action (plan G0.C M5)

Textbook definitions transcribed (conventions §6, transcription
procedure):

* **X^*(T) := Hom(T, 𝔾ₘ)** — `CharLattice R A` is the character
  group `CharacterGroup R A` (homomorphisms of algebraic groups
  `Spec A → 𝔾ₘ`, the repo's faithful form) **written additively**,
  as the literature writes the character lattice. This `Additive`
  is the single point where the multiplicative character group is
  identified with the lattice notation.
* **γ · χ := γ_{𝔾ₘ} ∘ χ ∘ γ_T⁻¹** — the Galois action on characters
  is conjugation (`conjChar`); on coordinate rings, `γ · χ =
  (γ ⊗ 1) ∘ χ ∘ γ_*⁻¹` with `γ_*` the coefficientwise action on
  `O(𝔾ₘ) = E[ℤ]`. `charRep` packages it as the `ℤ`-linear
  representation of `Gal(E/k)` — the Galois module of
  `tori.f_tori_galois_module_classification`.
* **X^*(f) := (χ ↦ χ ∘ f)** — functoriality is composition
  (`charLatticeMap`), Galois-equivariantly.

Group-like elements appear **only** in the proof-machinery section
at the end (the avatar of `tori.characters_as_group_like_elements`):
`sqBaseChange` turns the semilinear tensor-square action into
`γ ⊗ 1`, giving `isGroupLikeElem_galAlgAut` — the engine behind the
Hopf-compatibility proofs of the conjugation action. No definition
mentions them.
-/

open scoped TensorProduct
open Bialgebra Coalgebra HopfAlgebra WithConv

namespace Langlands.Tori

universe u v

/-! ### The character lattice -/

variable (R : Type u) [CommRing R] [IsDomain R]

/-- **The character lattice** `X^*(Spec A) := Hom(Spec A, 𝔾ₘ)`: the
character group (`CharacterGroup`, the faithful Hom-form), written
additively as in the literature — `X^*` is a lattice with `ℤ`-valued
pairings.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CharLattice (A : Type v) [CommSemiring A] [Bialgebra R A] : Type _ :=
  Additive (CharacterGroup R A)

/-! ### The Galois action: conjugation -/

variable (k E : Type u) [Field k] [Field E] [Algebra k E]
variable (A B : Type u) [CommRing A] [HopfAlgebra k A] [CommRing B] [HopfAlgebra k B]

/-- The semilinear Galois action on the base change: `γ ⊗ 1` as a
`k`-algebra automorphism of `E ⊗[k] A`. -/
noncomputable def galAlgAut (γ : E ≃ₐ[k] E) : (E ⊗[k] A) ≃ₐ[k] (E ⊗[k] A) :=
  Algebra.TensorProduct.congr γ (AlgEquiv.refl : A ≃ₐ[k] A)

@[simp]
lemma galAlgAut_tmul (γ : E ≃ₐ[k] E) (e : E) (a : A) :
    galAlgAut k E A γ (e ⊗ₜ a) = γ e ⊗ₜ a := rfl

lemma galAlgAut_one (x : E ⊗[k] A) : galAlgAut k E A 1 x = x := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | tmul e a => simp
  | add u v hu hv => simp [hu, hv]

lemma galAlgAut_mul (γ δ : E ≃ₐ[k] E) (x : E ⊗[k] A) :
    galAlgAut k E A (γ * δ) x = galAlgAut k E A γ (galAlgAut k E A δ x) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | tmul e a => simp
  | add u v hu hv => simp [hu, hv]

/-- The coefficientwise Galois action fixes the character basis of
`O(𝔾ₘ)`. -/
lemma mapAlgEquiv_single (γ : E ≃ₐ[k] E) (n : ℤ) (a : E) :
    AddMonoidAlgebra.mapAlgEquiv k ℤ γ (AddMonoidAlgebra.single n a) =
      AddMonoidAlgebra.single n (γ a) :=
  AddMonoidAlgebra.mapRingHom_single _ _ _

/-- The coefficientwise Galois action fixes the character basis of
`O(𝔾ₘ)`. -/
lemma mapAlgEquiv_single_one (γ : E ≃ₐ[k] E) (n : ℤ) :
    AddMonoidAlgebra.mapAlgEquiv k ℤ γ
        (AddMonoidAlgebra.single n (1 : E)) =
      AddMonoidAlgebra.single n (1 : E) := by
  rw [mapAlgEquiv_single, map_one]

section ProofMachinery
/-! ### Proof machinery: the group-like avatar

The identification of characters with group-like elements
(`tori.characters_as_group_like_elements`) is a bridge, not a
definition; this section holds the avatar-side lemmas that power the
Hopf-compatibility proofs below. `sqBaseChange` expresses the
diagonal semilinear action on the tensor square as `γ ⊗ 1` on
`E ⊗ (A ⊗ A)`, with no semilinear tensor machinery. -/

/-- Transport of group-like elements along a bialgebra
isomorphism. -/
noncomputable def groupLikeCongr {R A₁ A₂ : Type*} [CommSemiring R]
    [CommSemiring A₁] [Bialgebra R A₁] [CommSemiring A₂] [Bialgebra R A₂]
    (e : A₁ ≃ₐc[R] A₂) : GroupLike R A₁ ≃* GroupLike R A₂ where
  toFun x := ⟨e x.val, x.2.map (e : A₁ →ₐc[R] A₂)⟩
  invFun y := ⟨e.symm y.val, y.2.map (e.symm : A₂ →ₐc[R] A₁)⟩
  left_inv x := by ext; simp
  right_inv y := by ext; simp
  map_mul' x y := by ext; simp

/-- The base-change identification of the tensor square:
`(E ⊗ A) ⊗[E] (E ⊗ A) ≅ E ⊗ (A ⊗ A)`. -/
noncomputable def sqBaseChange :
    ((E ⊗[k] A) ⊗[E] (E ⊗[k] A)) ≃ₗ[E] E ⊗[k] (A ⊗[k] A) :=
  (TensorProduct.AlgebraTensorModule.tensorTensorTensorComm k E k E E E A A).symm.trans
    (TensorProduct.AlgebraTensorModule.congr (TensorProduct.lid E E)
      (LinearEquiv.refl k (A ⊗[k] A)))

/-- Under `sqBaseChange`, the comultiplication of `E ⊗ A` is the base
change `1 ⊗ Δ_A` of the comultiplication of `A`. -/
lemma sqBaseChange_comul (x : E ⊗[k] A) :
    sqBaseChange k E A (Coalgebra.comul (R := E) x) =
      TensorProduct.AlgebraTensorModule.map (LinearMap.id : E →ₗ[E] E)
        (Coalgebra.comul (R := k) (A := A)) x := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | tmul e a =>
    rw [TensorProduct.comul_tmul, CommSemiring.comul_apply,
      TensorProduct.AlgebraTensorModule.map_tmul]
    generalize Coalgebra.comul (R := k) a = w
    induction w using TensorProduct.induction_on with
    | zero => simp
    | tmul a₁ a₂ => simp [sqBaseChange]
    | add w₁ w₂ h₁ h₂ => simp only [TensorProduct.tmul_add, map_add, h₁, h₂]
  | add u v hu hv => simp [hu, hv]

/-- Under `sqBaseChange`, the diagonal Galois action on the tensor
square corresponds to `γ ⊗ 1` on `E ⊗ (A ⊗ A)`. -/
lemma sqBaseChange_galAlgAut_tmul (γ : E ≃ₐ[k] E) (u v : E ⊗[k] A) :
    sqBaseChange k E A (galAlgAut k E A γ u ⊗ₜ galAlgAut k E A γ v) =
      galAlgAut k E (A ⊗[k] A) γ (sqBaseChange k E A (u ⊗ₜ v)) := by
  induction u using TensorProduct.induction_on with
  | zero => simp
  | tmul e a =>
    induction v using TensorProduct.induction_on with
    | zero => simp [TensorProduct.tmul_zero]
    | tmul e' a' => simp [sqBaseChange, smul_eq_mul, map_mul]
    | add v₁ v₂ h₁ h₂ => simp only [TensorProduct.tmul_add, map_add, h₁, h₂]
  | add u₁ u₂ h₁ h₂ => simp only [TensorProduct.add_tmul, map_add, h₁, h₂]

/-- The base change `1 ⊗ Δ_A` commutes with `γ ⊗ 1`. -/
lemma baseChangeComul_galAlgAut (γ : E ≃ₐ[k] E) (v : E ⊗[k] A) :
    TensorProduct.AlgebraTensorModule.map (LinearMap.id : E →ₗ[E] E)
        (Coalgebra.comul (R := k) (A := A)) (galAlgAut k E A γ v) =
      galAlgAut k E (A ⊗[k] A) γ
        (TensorProduct.AlgebraTensorModule.map (LinearMap.id : E →ₗ[E] E)
          (Coalgebra.comul (R := k) (A := A)) v) := by
  induction v using TensorProduct.induction_on with
  | zero => simp
  | tmul e a => simp
  | add u v hu hv => simp [hu, hv]

/-- The counit of `E ⊗ A` intertwines `γ ⊗ 1` with `γ`. -/
lemma counit_galAlgAut (γ : E ≃ₐ[k] E) (v : E ⊗[k] A) :
    Coalgebra.counit (R := E) (galAlgAut k E A γ v) =
      γ (Coalgebra.counit (R := E) v) := by
  induction v using TensorProduct.induction_on with
  | zero => simp
  | tmul e a => simp [map_smul]
  | add u v hu hv => simp [hu, hv]

/-- `γ ⊗ 1` preserves group-like elements: the semilinear
compatibility of the comultiplication with the Galois action. -/
theorem isGroupLikeElem_galAlgAut (γ : E ≃ₐ[k] E) {x : E ⊗[k] A}
    (hx : IsGroupLikeElem E x) :
    IsGroupLikeElem E (galAlgAut k E A γ x) where
  counit_eq_one := by
    rw [counit_galAlgAut, hx.counit_eq_one, map_one]
  comul_eq_tmul_self := by
    apply (sqBaseChange k E A).injective
    rw [sqBaseChange_comul, baseChangeComul_galAlgAut, ← sqBaseChange_comul,
      hx.comul_eq_tmul_self, sqBaseChange_galAlgAut_tmul]

end ProofMachinery

/-- The underlying algebra map of the conjugated character
`(γ ⊗ 1) ∘ χ ∘ γ_*⁻¹`. -/
noncomputable def conjCharAlgHom (γ : E ≃ₐ[k] E)
    (χ : AddMonoidAlgebra E ℤ →ₐc[E] E ⊗[k] A) :
    AddMonoidAlgebra E ℤ →ₐ[E] E ⊗[k] A where
  toRingHom :=
    ((galAlgAut k E A γ).toAlgHom.toRingHom.comp
      χ.toAlgHom.toRingHom).comp
      (AddMonoidAlgebra.mapAlgEquiv k ℤ γ.symm).toAlgHom.toRingHom
  commutes' := fun e => by
    have h0 : ∀ c : E, algebraMap E (AddMonoidAlgebra E ℤ) c =
        AddMonoidAlgebra.single 0 c := fun c => by
      simp [AddMonoidAlgebra.coe_algebraMap]
    show galAlgAut k E A γ
        (χ (AddMonoidAlgebra.mapAlgEquiv k ℤ γ.symm
          (algebraMap E (AddMonoidAlgebra E ℤ) e))) =
      algebraMap E (E ⊗[k] A) e
    rw [h0 e, mapAlgEquiv_single k E γ.symm 0 e, ← h0 (γ.symm e),
      AlgHomClass.commutes χ, Algebra.TensorProduct.algebraMap_apply]
    simp

@[simp]
lemma conjCharAlgHom_single_one (γ : E ≃ₐ[k] E)
    (χ : AddMonoidAlgebra E ℤ →ₐc[E] E ⊗[k] A) (n : ℤ) :
    conjCharAlgHom k E A γ χ (AddMonoidAlgebra.single n 1) =
      galAlgAut k E A γ (χ (AddMonoidAlgebra.single n 1)) := by
  show galAlgAut k E A γ (χ (AddMonoidAlgebra.mapAlgEquiv k ℤ γ.symm
    (AddMonoidAlgebra.single n 1))) = _
  rw [mapAlgEquiv_single_one]

/-- **The Galois action on characters** is conjugation:
`γ · χ = γ_{𝔾ₘ} ∘ χ ∘ γ_T⁻¹`, on coordinate rings
`(γ ⊗ 1) ∘ χ ∘ γ_*⁻¹`. The Hopf-compatibility fields are proved by
the group-like avatar machinery. -/
noncomputable def conjChar (γ : E ≃ₐ[k] E)
    (χ : AddMonoidAlgebra E ℤ →ₐc[E] E ⊗[k] A) :
    AddMonoidAlgebra E ℤ →ₐc[E] E ⊗[k] A :=
  BialgHom.ofAlgHom (conjCharAlgHom k E A γ χ)
    (by
      refine AddMonoidAlgebra.algHom_ext (fun n => ?_) (Subsingleton.elim _ _)
      show Coalgebra.counit (R := E)
          (conjCharAlgHom k E A γ χ (AddMonoidAlgebra.single n 1)) =
        Bialgebra.counitAlgHom E (AddMonoidAlgebra E ℤ)
          (AddMonoidAlgebra.single n 1)
      rw [conjCharAlgHom_single_one, counit_galAlgAut]
      have h1 : Coalgebra.counit (R := E)
          (χ (AddMonoidAlgebra.single n (1 : E))) =
          Coalgebra.counit (R := E) (AddMonoidAlgebra.single n (1 : E)) :=
        congr($(CoalgHomClass.counit_comp χ) (AddMonoidAlgebra.single n 1))
      rw [h1, (AddMonoidAlgebra.isGroupLikeElem_single_one n).counit_eq_one,
        map_one]
      exact ((AddMonoidAlgebra.isGroupLikeElem_single_one
        (R := E) (n : ℤ)).counit_eq_one).symm)
    (by
      refine AddMonoidAlgebra.algHom_ext (fun n => ?_) (Subsingleton.elim _ _)
      have hgl : IsGroupLikeElem E
          (conjCharAlgHom k E A γ χ (AddMonoidAlgebra.single n (1 : E))) := by
        rw [conjCharAlgHom_single_one]
        exact isGroupLikeElem_galAlgAut k E A γ
          ((AddMonoidAlgebra.isGroupLikeElem_single_one n).map χ)
      show Algebra.TensorProduct.map (conjCharAlgHom k E A γ χ)
          (conjCharAlgHom k E A γ χ)
          (Bialgebra.comulAlgHom E (AddMonoidAlgebra E ℤ)
            (AddMonoidAlgebra.single n 1)) =
        Bialgebra.comulAlgHom E (E ⊗[k] A)
          (conjCharAlgHom k E A γ χ (AddMonoidAlgebra.single n 1))
      rw [show Bialgebra.comulAlgHom E (AddMonoidAlgebra E ℤ)
          (AddMonoidAlgebra.single n (1 : E)) =
          Coalgebra.comul (AddMonoidAlgebra.single n (1 : E)) from rfl]
      rw [(AddMonoidAlgebra.isGroupLikeElem_single_one (R := E)
        (n : ℤ)).comul_eq_tmul_self]
      rw [Algebra.TensorProduct.map_tmul]
      rw [show ∀ y, Bialgebra.comulAlgHom E (E ⊗[k] A) y =
          Coalgebra.comul y from fun _ => rfl]
      exact hgl.comul_eq_tmul_self.symm)

@[simp]
lemma conjChar_single_one (γ : E ≃ₐ[k] E)
    (χ : AddMonoidAlgebra E ℤ →ₐc[E] E ⊗[k] A) (n : ℤ) :
    conjChar k E A γ χ (AddMonoidAlgebra.single n 1) =
      galAlgAut k E A γ (χ (AddMonoidAlgebra.single n 1)) :=
  conjCharAlgHom_single_one k E A γ χ n

/-- Two characters agreeing on the character basis of `O(𝔾ₘ)` are
equal. -/
lemma charBialgHom_ext {χ ψ : AddMonoidAlgebra E ℤ →ₐc[E] E ⊗[k] A}
    (h : ∀ n : ℤ, χ (AddMonoidAlgebra.single n 1) =
      ψ (AddMonoidAlgebra.single n 1)) : χ = ψ := by
  have := AddMonoidAlgebra.algHom_ext (φ₁ := χ.toAlgHom) (φ₂ := ψ.toAlgHom)
    h (Subsingleton.elim _ _)
  exact BialgHom.ext fun x => DFunLike.congr_fun this x

/-- **The Galois action on the character group**, multiplicative
form: `γ · χ = γ_{𝔾ₘ} ∘ χ ∘ γ_T⁻¹`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def charGalAct :
    (E ≃ₐ[k] E) →* Monoid.End (CharacterGroup E (E ⊗[k] A)) where
  toFun γ :=
    { toFun := fun χ => toConv (conjChar k E A γ χ.ofConv)
      map_one' := by
        refine WithConv.ofConv_injective (charBialgHom_ext k E A fun n => ?_)
        rw [conjChar_single_one, BialgHom.convOne_apply,
          (AddMonoidAlgebra.isGroupLikeElem_single_one
            (R := E) (n : ℤ)).counit_eq_one]
        simp
      map_mul' := fun χ ψ => by
        refine WithConv.ofConv_injective (charBialgHom_ext k E A fun n => ?_)
        rw [conjChar_single_one,
          convMul_apply_of_isGroupLikeElem _ _
            (AddMonoidAlgebra.isGroupLikeElem_single_one n),
          convMul_apply_of_isGroupLikeElem _ _
            (AddMonoidAlgebra.isGroupLikeElem_single_one n),
          map_mul, conjChar_single_one, conjChar_single_one] }
  map_one' := by
    ext χ m
    show conjChar k E A 1 χ.ofConv (AddMonoidAlgebra.single m 1) =
      χ.ofConv (AddMonoidAlgebra.single m 1)
    rw [conjChar_single_one, galAlgAut_one]
  map_mul' := fun γ δ => by
    ext χ m
    show conjChar k E A (γ * δ) χ.ofConv (AddMonoidAlgebra.single m 1) =
      conjChar k E A γ (conjChar k E A δ χ.ofConv) (AddMonoidAlgebra.single m 1)
    rw [conjChar_single_one, conjChar_single_one, conjChar_single_one,
      galAlgAut_mul]

/-- **The character lattice as a Galois module**: the `ℤ`-linear
representation of `Gal(E/k)` on `X^*(T_E)` — the complete invariant
of the classification.

Blueprint: tori.f_tori_galois_module_classification
-/
noncomputable def charRep :
    Representation ℤ (E ≃ₐ[k] E) (CharLattice E (E ⊗[k] A)) where
  toFun γ := (MonoidHom.toAdditive (charGalAct k E A γ)).toIntLinearMap
  map_one' := by
    refine LinearMap.ext fun x => ?_
    show Additive.ofMul ((charGalAct k E A 1) x.toMul) = x
    rw [map_one (charGalAct k E A)]
    rfl
  map_mul' := fun γ δ => by
    refine LinearMap.ext fun x => ?_
    show Additive.ofMul ((charGalAct k E A (γ * δ)) x.toMul) = _
    rw [map_mul (charGalAct k E A)]
    rfl

/-! ### Functoriality -/

variable {A B} in
/-- Element form of the equivariance: `(1 ⊗ f)` commutes with
`(γ ⊗ 1)` on the base change. -/
lemma baseChangeMap_galAlgAut (f : A →ₐc[k] B) (γ : E ≃ₐ[k] E)
    (v : E ⊗[k] A) :
    Bialgebra.TensorProduct.map (BialgHom.id E E) f (galAlgAut k E A γ v) =
      galAlgAut k E B γ (Bialgebra.TensorProduct.map (BialgHom.id E E) f v) := by
  induction v using TensorProduct.induction_on with
  | zero => simp
  | tmul e a => simp [Bialgebra.TensorProduct.map_tmul]
  | add u v hu hv => simp [hu, hv]

variable {A B} in
/-- **Functoriality of the character lattice**: a Hopf-algebra map
`f : A → B` induces `X^*(f) : X^*(Spec A) → X^*(Spec B)`,
`χ ↦ (1 ⊗ f) ∘ χ` — composition, contravariantly on tori.

Blueprint: tori.classification_hom_level
-/
noncomputable def charLatticeMap (f : A →ₐc[k] B) :
    CharLattice E (E ⊗[k] A) →+ CharLattice E (E ⊗[k] B) :=
  MonoidHom.toAdditive
    { toFun := fun χ => toConv
        ((Bialgebra.TensorProduct.map (BialgHom.id E E) f).comp χ.ofConv)
      map_one' := by
        refine WithConv.ofConv_injective (charBialgHom_ext k E B fun n => ?_)
        show Bialgebra.TensorProduct.map (BialgHom.id E E) f
            ((1 : CharacterGroup E (E ⊗[k] A)).ofConv
              (AddMonoidAlgebra.single n 1)) = _
        rw [BialgHom.convOne_apply, BialgHom.convOne_apply]
        exact AlgHomClass.commutes _ _
      map_mul' := fun χ ψ => by
        refine WithConv.ofConv_injective (charBialgHom_ext k E B fun n => ?_)
        show Bialgebra.TensorProduct.map (BialgHom.id E E) f
            ((χ * ψ).ofConv (AddMonoidAlgebra.single n 1)) = _
        rw [convMul_apply_of_isGroupLikeElem _ _
            (AddMonoidAlgebra.isGroupLikeElem_single_one n),
          convMul_apply_of_isGroupLikeElem _ _
            (AddMonoidAlgebra.isGroupLikeElem_single_one n),
          map_mul]
        rfl }

variable {A B} in
/-- The induced lattice map is Galois-equivariant:
`X^*(f)(γ · χ) = γ · X^*(f)(χ)`.

Blueprint: tori.classification_hom_level
-/
theorem charLatticeMap_galAct (f : A →ₐc[k] B) (γ : E ≃ₐ[k] E)
    (x : CharLattice E (E ⊗[k] A)) :
    charLatticeMap k E f (charRep k E A γ x) =
      charRep k E B γ (charLatticeMap k E f x) := by
  refine congrArg Additive.ofMul
    (WithConv.ofConv_injective (charBialgHom_ext k E B fun n => ?_))
  show Bialgebra.TensorProduct.map (BialgHom.id E E) f
      (conjChar k E A γ x.toMul.ofConv (AddMonoidAlgebra.single n 1)) =
    conjChar k E B γ _ (AddMonoidAlgebra.single n 1)
  rw [conjChar_single_one, conjChar_single_one, baseChangeMap_galAlgAut]
  rfl

end Langlands.Tori
