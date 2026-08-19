import Mathlib.RingTheory.HopfAlgebra.GroupLike
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.RingTheory.Bialgebra.TensorProduct
import Mathlib.RepresentationTheory.Basic

/-!
# The character lattice and its Galois action (plan G0.C M5)

* `CharLattice R A` — **the character lattice** `X^*(Spec A)` of a
  Hopf algebra: the group-like elements of `A` (the characters, via
  the bridge `tori.characters_as_group_like_elements`; the primitive
  form of a character is a group-scheme homomorphism,
  `SchemeCharacterGroup`), written **additively** — the knowledge
  base's `X^*` is a lattice: a `ℤ`-module with `ℤ`-valued pairings.
  This is the one place where the multiplicative group of characters
  is identified with its additive avatar; no other statement carries
  an `Additive`/`Multiplicative` wrapper for it.
* `galAlgAut`, `charGalAct`, `charRep` — for a torus presented over
  `k` and split by `E`: the semilinear Galois action `γ ⊗ 1` on the
  base change, its action on characters, and the resulting
  `ℤ`-linear representation of `Gal(E/k)` on `X^*(T_E)` — the Galois
  module of the classification
  (`tori.f_tori_galois_module_classification`).
* `charLatticeMap` — functoriality: a Hopf map `A → B` induces a
  lattice map `X^*(Spec A) → X^*(Spec B)` (contravariantly on tori),
  Galois-equivariantly (`charLatticeMap_galAct`).

The key lemma is `isGroupLikeElem_galAlgAut`: the Galois action
preserves group-likes. Its proof works through `sqBaseChange`, the
identification `(E⊗A) ⊗[E] (E⊗A) ≅ E ⊗ (A⊗A)` under which the
base-change comultiplication becomes `1 ⊗ Δ_A` and the diagonal
semilinear action becomes `γ ⊗ 1` — no semilinear tensor machinery.
-/

open scoped TensorProduct
open Bialgebra Coalgebra HopfAlgebra

namespace Langlands.Tori

universe u

/-! ### The character lattice of a Hopf algebra -/

variable (R : Type u) [CommRing R]

/-- **The character lattice** `X^*(Spec A)`: the group-like elements
of `A` — the characters `Spec A → 𝔾ₘ`, by
`tori.characters_as_group_like_elements` — as an additive group. The
knowledge base's character lattice is additive (`ℤ`-module, integral
pairings); the multiplicative group of characters is its `.toMul`.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CharLattice (A : Type u) [CommRing A] [HopfAlgebra R A] : Type u :=
  Additive (GroupLike R A)

/-- Transport of group-like elements along a bialgebra isomorphism
(Mathlib gap: no `GroupLike.congr`). -/
noncomputable def groupLikeCongr {R A₁ A₂ : Type*} [CommSemiring R]
    [CommSemiring A₁] [Bialgebra R A₁] [CommSemiring A₂] [Bialgebra R A₂]
    (e : A₁ ≃ₐc[R] A₂) : GroupLike R A₁ ≃* GroupLike R A₂ where
  toFun x := ⟨e x.val, x.2.map (e : A₁ →ₐc[R] A₂)⟩
  invFun y := ⟨e.symm y.val, y.2.map (e.symm : A₂ →ₐc[R] A₁)⟩
  left_inv x := by ext; simp
  right_inv y := by ext; simp
  map_mul' x y := by ext; simp

/-! ### The Galois action on the base change -/

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

/-- The base-change identification of the tensor square:
`(E ⊗ A) ⊗[E] (E ⊗ A) ≅ E ⊗ (A ⊗ A)`. Through it, the base-change
comultiplication becomes `1 ⊗ Δ_A` and the diagonal Galois action
becomes `γ ⊗ 1` — the device that makes the semilinear tensor-square
action expressible without semilinear tensor machinery. -/
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
compatibility of the comultiplication with the Galois action,
expressed through `sqBaseChange`. -/
theorem isGroupLikeElem_galAlgAut (γ : E ≃ₐ[k] E) (x : GroupLike E (E ⊗[k] A)) :
    IsGroupLikeElem E (galAlgAut k E A γ x.val) where
  counit_eq_one := by
    rw [counit_galAlgAut, x.2.counit_eq_one, map_one]
  comul_eq_tmul_self := by
    apply (sqBaseChange k E A).injective
    rw [sqBaseChange_comul, baseChangeComul_galAlgAut, ← sqBaseChange_comul,
      x.2.comul_eq_tmul_self, sqBaseChange_galAlgAut_tmul]

/-- The Galois action on characters, multiplicative avatar:
`γ · χ = (γ ⊗ 1) χ` on the group-like elements.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def charGalAct :
    (E ≃ₐ[k] E) →* Monoid.End (GroupLike E (E ⊗[k] A)) where
  toFun γ :=
    { toFun := fun x =>
        ⟨galAlgAut k E A γ x.val, isGroupLikeElem_galAlgAut k E A γ x⟩
      map_one' := by
        ext
        exact map_one (galAlgAut k E A γ)
      map_mul' := fun x y => by
        ext
        exact map_mul (galAlgAut k E A γ) x.val y.val }
  map_one' := by
    ext x
    exact galAlgAut_one k E A x.val
  map_mul' := fun γ δ => by
    ext x
    exact galAlgAut_mul k E A γ δ x.val

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
/-- The lattice map induced on character lattices by a Hopf-algebra
homomorphism (contravariantly on tori: `Spec B → Spec A` induces
`X^*(Spec A) → X^*(Spec B)`): group-likes map along the base change
`1 ⊗ f`.

Blueprint: tori.classification_hom_level
-/
noncomputable def charLatticeMap (f : A →ₐc[k] B) :
    CharLattice E (E ⊗[k] A) →+ CharLattice E (E ⊗[k] B) :=
  MonoidHom.toAdditive
    { toFun := fun x =>
        ⟨Bialgebra.TensorProduct.map (BialgHom.id E E) f x.val,
          x.2.map (Bialgebra.TensorProduct.map (BialgHom.id E E) f)⟩
      map_one' := by
        ext
        exact map_one (Bialgebra.TensorProduct.map (BialgHom.id E E) f)
      map_mul' := fun x y => by
        ext
        exact map_mul (Bialgebra.TensorProduct.map (BialgHom.id E E) f)
          x.val y.val }

variable {A B} in
/-- The induced lattice map is Galois-equivariant:
`(γ ⊗ 1) ∘ (1 ⊗ f) = (1 ⊗ f) ∘ (γ ⊗ 1)`.

Blueprint: tori.classification_hom_level
-/
theorem charLatticeMap_galAct (f : A →ₐc[k] B) (γ : E ≃ₐ[k] E)
    (x : CharLattice E (E ⊗[k] A)) :
    charLatticeMap k E f (charRep k E A γ x) =
      charRep k E B γ (charLatticeMap k E f x) := by
  show Additive.ofMul (⟨_, _⟩ : GroupLike E (E ⊗[k] B)) = Additive.ofMul ⟨_, _⟩
  congr 1
  ext
  exact baseChangeMap_galAlgAut k E f γ x.toMul.val

end Langlands.Tori
