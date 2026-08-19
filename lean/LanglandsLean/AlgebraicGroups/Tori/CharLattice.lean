import LanglandsLean.AlgebraicGroups.Tori.Torus
import LanglandsLean.AlgebraicGroups.Tori.CharacterGroup
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
# The character lattice of a torus as a Galois module (plan G0.C M5)

For a torus over `k` split by a finite Galois extension `E`, with
coordinate Hopf algebra `A`, this file defines

* `CharLattice k E A` — the character lattice `X^*(T_E)`, in its
  **working form**: the group-like elements of the base change
  `E ⊗[k] A`. The primitive definition of a character is a
  group-scheme homomorphism (`SchemeCharacterGroup`); passing to
  group-likes is licensed by the bridge node
  `tori.characters_as_group_like_elements` (an identification proved
  in the KB, not a redefinition).
* `charGalAct`, `charRep` — the Galois action `γ · χ = (γ ⊗ 1) χ` on
  characters, as a monoid action and as a `ℤ`-linear representation
  of `Gal(E/k)`. This is the Galois-module structure that the
  classification `tori.f_tori_galois_module_classification` says is
  a complete invariant.
* `torusRank`, `torusSplitRank` — rank and split rank
  (`tori.split_rank`). The split rank is defined through the
  `Θ`-invariants of `X^*`; the KB node proves this agrees with the
  cocharacter-side and maximal-split-subtorus definitions.
* `CocharLattice`, `charPairing` — the cocharacter lattice in its
  faithful form (Hopf homomorphisms `O(T_E) → O(𝔾ₘ)`, i.e.
  `CocharacterGroup E (E ⊗[k] A)`) and the perfect pairing
  `X^* × X_* → ℤ`.
* `IsAnisotropicAlgebra` — anisotropy via Galois-fixed cocharacters
  (`tori.anisotropic_torus`, working definition `X_*(T)^Θ = 0`).

## Conversion glossary

* `WithConv` (in `CocharLattice`): the convolution monoid structure
  on Hopf-hom sets; under `Spec` it is pointwise multiplication
  (`tori.convolution_is_pointwise_multiplication`).
* `Additive (CharLattice …)`: characters form a multiplicative
  group; the lattice/`ℤ`-module structure of the KB is its additive
  form. `Multiplicative ℤ` appears inversely in `charPairing` via
  `diagGroupLikeEquiv`.

## Statement-first status

Definitions are complete; every `sorry` is a theorem statement or a
proof obligation inside a definition (group-like membership under
the Galois action, functoriality fields), each tagged with the
milestone that discharges it. No proofs are attempted in this pass.
-/

open scoped TensorProduct
open Bialgebra Coalgebra HopfAlgebra WithConv

namespace Langlands.Tori

universe u

variable (k E : Type u) [Field k] [Field E] [Algebra k E]
variable (A B : Type u) [CommRing A] [HopfAlgebra k A] [CommRing B] [HopfAlgebra k B]

/-! ### The character lattice and its Galois action -/

/-- **The character lattice** `X^*(T_E)` of the torus with coordinate
algebra `A`, in its working form: group-like elements of `E ⊗[k] A`
(bridge: `tori.characters_as_group_like_elements`; the primitive
form is `SchemeCharacterGroup`). A commutative group under
multiplication; its additive form is the KB's lattice.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CharLattice : Type u := GroupLike E (E ⊗[k] A)

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

/-- `γ ⊗ 1` preserves group-like elements (statement; proof: M5 —
the semilinear compatibility of the comultiplication with the
Galois action). -/
theorem isGroupLikeElem_galAlgAut (γ : E ≃ₐ[k] E) (x : CharLattice k E A) :
    IsGroupLikeElem E (galAlgAut k E A γ x.val) := by
  sorry

/-- **The Galois action on characters**: `γ · χ = (γ ⊗ 1) χ`. The
monoid-hom fields are the functoriality of `γ ⊗ 1` (proof: M5).

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def charGalAct :
    (E ≃ₐ[k] E) →* Monoid.End (CharLattice k E A) where
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

/-- The character lattice as a `ℤ`-linear representation of
`Gal(E/k)` — the Galois module `X^*(T)` of the classification.

Blueprint: tori.f_tori_galois_module_classification
-/
noncomputable def charRep :
    Representation ℤ (E ≃ₐ[k] E) (Additive (CharLattice k E A)) where
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

/-- Computation of the character lattice from a splitting
isomorphism: `X^*` of a torus split as `E[M]` is `M` (statement;
proof: M5 — transport `diagGroupLikeEquiv` along the base-change
isomorphism). -/
theorem nonempty_charLattice_mulEquiv (M : Type u) [AddCommGroup M]
    (e : (E ⊗[k] A) ≃ₐc[E] AddMonoidAlgebra E M) :
    Nonempty (CharLattice k E A ≃* Multiplicative M) :=
  ⟨(groupLikeCongr e).trans (diagGroupLikeEquiv E M).symm⟩

/-- The character lattice of a torus is a free `ℤ`-module
(statement; proof: M5 via `nonempty_charLattice_mulEquiv` and
group-like rigidity). -/
theorem charLattice_free (hA : IsTorusAlgebra k E A) :
    Module.Free ℤ (Additive (CharLattice k E A)) := by
  obtain ⟨M, _, _, _, ⟨e⟩⟩ := hA
  obtain ⟨φ⟩ := nonempty_charLattice_mulEquiv k E A M e
  have ψ : Additive (CharLattice k E A) ≃+ M :=
    (MulEquiv.toAdditive φ).trans (AddEquiv.additiveMultiplicative M)
  exact Module.Free.of_equiv' ‹Module.Free ℤ M› ψ.symm.toIntLinearEquiv

/-- The character lattice of a torus is a finite `ℤ`-module
(statement; proof: M5). -/
theorem charLattice_finite (hA : IsTorusAlgebra k E A) :
    Module.Finite ℤ (Additive (CharLattice k E A)) := by
  obtain ⟨M, _, _, _, ⟨e⟩⟩ := hA
  obtain ⟨φ⟩ := nonempty_charLattice_mulEquiv k E A M e
  have ψ : Additive (CharLattice k E A) ≃+ M :=
    (MulEquiv.toAdditive φ).trans (AddEquiv.additiveMultiplicative M)
  exact Module.Finite.equiv ψ.symm.toIntLinearEquiv

/-! ### Rank and split rank -/

/-- **The rank of a torus**: the `ℤ`-rank of its character lattice.

Blueprint: tori.split_rank
-/
noncomputable def torusRank : ℕ :=
  Module.finrank ℤ (Additive (CharLattice k E A))

/-- **The split rank** (`k`-rank) of a torus: the rank of the Galois
invariants of the character lattice. The KB node proves this equals
the rank of the maximal split subtorus and the rank of
`X_*(T)^Θ` (the two formulas agree by the averaging argument over
`ℚ`).

Blueprint: tori.split_rank
-/
noncomputable def torusSplitRank : ℕ :=
  Module.finrank ℤ (charRep k E A).invariants

/-- Split rank is at most rank (statement; proof: M5).

Blueprint: tori.split_rank
-/
theorem torusSplitRank_le_torusRank (hA : IsTorusAlgebra k E A) :
    torusSplitRank k E A ≤ torusRank k E A := by
  have := charLattice_finite k E A hA
  exact Submodule.finrank_le _

/-- A torus is split iff its split rank equals its rank (statement;
proof: M6 — finite-order actions with full-rank invariants are
trivial).

Blueprint: tori.split_rank
-/
theorem torusSplitRank_eq_torusRank_iff
    [FiniteDimensional k E] [IsGalois k E] (hA : IsTorusAlgebra k E A) :
    torusSplitRank k E A = torusRank k E A ↔ IsSplitTorusAlgebra k A := by
  sorry

/-! ### The cocharacter lattice, the pairing, anisotropy -/

/-- **The cocharacter lattice** `X_*(T_E)` in its faithful form:
Hopf-algebra homomorphisms `O(T_E) → O(𝔾ₘ)`, i.e. cocharacters
`𝔾ₘ → T_E`, with the convolution group structure.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CocharLattice : Type u := CocharacterGroup E (E ⊗[k] A)

/-- **The character–cocharacter pairing** `⟨χ, λ⟩`: composing a
cocharacter with a character gives an endomorphism of `𝔾ₘ`, i.e. an
integer — extracted by group-like rigidity (`diagGroupLikeEquiv`):
`λ` maps the group-like `χ` to the group-like `e^{⟨χ,λ⟩}` of
`E[ℤ]`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def charPairing
    (x : CharLattice k E A) (l : CocharLattice k E A) : ℤ :=
  Multiplicative.toAdd <|
    (diagGroupLikeEquiv E ℤ).symm
      ⟨l.ofConv x.val, x.isGroupLikeElem_val.map l.ofConv⟩

/-- Additivity of the pairing in the character (statement;
proof: M5). -/
theorem charPairing_mul_left (x y : CharLattice k E A)
    (l : CocharLattice k E A) :
    charPairing k E A (x * y) l =
      charPairing k E A x l + charPairing k E A y l := by
  sorry

/-- A torus algebra is cocommutative after base change — tori are
commutative group schemes (statement; proof: M5, transport from
`E[M]`). This is what makes the cocharacters a group under
convolution. -/
theorem IsTorusAlgebra.isCocomm (hA : IsTorusAlgebra k E A) :
    Coalgebra.IsCocomm E (E ⊗[k] A) := by
  sorry

/-- Additivity of the pairing in the cocharacter (statement;
proof: M5). The cocommutativity hypothesis makes the convolution
product exist; it holds for every torus algebra
(`IsTorusAlgebra.isCocomm`). -/
theorem charPairing_mul_right [Coalgebra.IsCocomm E (E ⊗[k] A)]
    (x : CharLattice k E A)
    (l m : CocharLattice k E A) :
    charPairing k E A x (l * m) =
      charPairing k E A x l + charPairing k E A x m := by
  sorry

/-- **Perfectness of the pairing**, cocharacter side: every additive
functional on the character lattice is pairing against a unique
cocharacter — `X_*(T) ≅ Hom(X^*(T), ℤ)` (statement; proof: M5).

Blueprint: tori.character_and_cocharacter_lattices
-/
theorem charPairing_perfect (hA : IsTorusAlgebra k E A)
    (f : Additive (CharLattice k E A) →+ ℤ) :
    ∃! l : CocharLattice k E A,
      ∀ x : CharLattice k E A,
        charPairing k E A x l = f (Additive.ofMul x) := by
  sorry

/-- Nondegeneracy of the pairing, character side (statement;
proof: M5). -/
theorem charPairing_left_injective (hA : IsTorusAlgebra k E A)
    {x y : CharLattice k E A}
    (h : ∀ l, charPairing k E A x l = charPairing k E A y l) : x = y := by
  sorry

/-- A cocharacter is **Galois-fixed** if it commutes with the
semilinear Galois actions on source and target: `λ ∘ (γ ⊗ 1) =
γ_* ∘ λ`, where `γ_*` is the coefficientwise action on
`O(𝔾ₘ) = E[ℤ]`. These are the cocharacters defined over `k`. -/
def IsGalFixedCochar (l : CocharLattice k E A) : Prop :=
  ∀ (γ : E ≃ₐ[k] E) (x : E ⊗[k] A),
    l.ofConv (galAlgAut k E A γ x) =
      AddMonoidAlgebra.mapAlgEquiv k ℤ γ (l.ofConv x)

/-- **Anisotropy** (working definition of the KB:
`X_*(T)^Θ = 0`): the only Galois-fixed cocharacter is the trivial
one (the convolution unit `η ∘ ε`, i.e. the constant cocharacter).

Blueprint: tori.anisotropic_torus
-/
def IsAnisotropicAlgebra : Prop :=
  ∀ l : CocharLattice k E A, IsGalFixedCochar k E A l → l = 1

/-- A torus is anisotropic iff its split rank is zero (statement;
proof: M6 — the KB equivalence `X_*(T)^Θ = 0 ↔ X^*(T)^Θ = 0` by the
averaging argument).

Blueprint: tori.split_rank, tori.anisotropic_torus
-/
theorem torusSplitRank_eq_zero_iff
    [FiniteDimensional k E] [IsGalois k E] (hA : IsTorusAlgebra k E A) :
    torusSplitRank k E A = 0 ↔ IsAnisotropicAlgebra k E A := by
  sorry

/-! ### Functoriality: the hom-level classification -/

variable {A B} in
/-- The map induced on character lattices by a Hopf-algebra
homomorphism (contravariantly on tori: `Spec B → Spec A` induces
`X^*(Spec A) → X^*(Spec B)`): group-likes map along the base change
`1 ⊗ f`, a Hopf homomorphism via `Bialgebra.TensorProduct.map`.

Blueprint: tori.classification_hom_level
-/
noncomputable def charLatticeMap (f : A →ₐc[k] B) :
    CharLattice k E A →* CharLattice k E B where
  toFun x :=
    ⟨Bialgebra.TensorProduct.map (BialgHom.id E E) f x.val,
      x.2.map (Bialgebra.TensorProduct.map (BialgHom.id E E) f)⟩
  map_one' := by
    ext
    exact map_one (Bialgebra.TensorProduct.map (BialgHom.id E E) f)
  map_mul' := fun x y => by
    ext
    exact map_mul (Bialgebra.TensorProduct.map (BialgHom.id E E) f)
      x.val y.val

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
/-- The induced lattice map is Galois-equivariant:
`(γ ⊗ 1) ∘ (1 ⊗ f) = (1 ⊗ f) ∘ (γ ⊗ 1)`.

Blueprint: tori.classification_hom_level
-/
theorem charLatticeMap_galAct (f : A →ₐc[k] B) (γ : E ≃ₐ[k] E)
    (x : CharLattice k E A) :
    charLatticeMap k E f (charGalAct k E A γ x) =
      charGalAct k E B γ (charLatticeMap k E f x) := by
  ext
  exact baseChangeMap_galAlgAut k E f γ x.val

/-- **The hom-level classification** (full faithfulness): for tori
split by `E`, every Galois-equivariant homomorphism of character
lattices is induced by a unique Hopf-algebra homomorphism
(statement; proof: M6 via `forms.hopf_descent` and Cartier duality).

Blueprint: tori.classification_hom_level
-/
theorem existsUnique_bialgHom_of_equivariant
    [FiniteDimensional k E] [IsGalois k E]
    (hA : IsTorusAlgebra k E A) (hB : IsTorusAlgebra k E B)
    (g : CharLattice k E A →* CharLattice k E B)
    (hg : ∀ γ x, g (charGalAct k E A γ x) = charGalAct k E B γ (g x)) :
    ∃! f : A →ₐc[k] B, charLatticeMap k E f = g := by
  sorry

end Langlands.Tori
