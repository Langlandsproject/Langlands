import LanglandsLean.AlgebraicGroups.Tori.DiagGroup
import LanglandsLean.AlgebraicGeometry.HopfSpecFunctor
import Mathlib.RingTheory.HopfAlgebra.GroupLike
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.RingTheory.HopfAlgebra.Convolution

/-!
# Character and cocharacter groups; Cartier duality for split tori

## The definitions, faithfully

For an affine group scheme `G = Spec A` over `R`, the knowledge base
(node `tori.character_and_cocharacter_lattices`) defines

* `X^*(G) = Hom_grp(G, 𝔾ₘ)` — characters,
* `X_*(G) = Hom_grp(𝔾ₘ, G)` — cocharacters,

with the group law of pointwise multiplication in `𝔾ₘ`. The faithful
contravariant translation to coordinate Hopf algebras, with
`O(𝔾ₘ) = R[ℤ]`:

* `CharacterGroup R A := WithConv (R[ℤ] →ₐc[R] A)`,
* `CocharacterGroup R A := WithConv (A →ₐc[R] R[ℤ])`,

where `WithConv` is Mathlib's carrier for "this hom-set with the
convolution product" — under `Spec`, convolution *is* pointwise
multiplication of characters. Computed descriptions (group-like
elements, lattice identifications) are **theorems below, never
definitions**.

## Conversion glossary

Every type wrapper in this file and its justification:

* `WithConv X` — the official Mathlib marker for the convolution
  monoid on a hom-set; part of the faithful statement of the group
  law, not an encoding trick.
* `Multiplicative M` — the lattice is additive, characters multiply;
  Mathlib's canonical additive↔multiplicative bridge, used only in
  statements identifying a character group with a lattice.
* `Additive` / `toAdd` / `ofAdd` — inverses of the above, confined to
  proof terms.

The convolution *group* structure (inversion via the antipode of
`𝔾ₘ`) is tracked as plan G0.C M5; the `CommMonoid` instance is
Mathlib's and suffices for every statement in this file.

## Knowledge base

`tori.character_and_cocharacter_lattices`,
`reductive_groups.diagonalizable_groups_antiequivalence`.
-/

open Bialgebra Coalgebra HopfAlgebra WithConv
open AlgebraicGeometry CategoryTheory Opposite
open Langlands.AlgebraicGeometry
open Langlands.AlgebraicGeometry.AlgHomPointsPresheaf

namespace Langlands.Tori

universe u v

variable (R : Type u) [CommRing R]

/-! ### The faithful definitions -/

/-- **The character group** `X^*(Spec A) = Hom_grp(Spec A, 𝔾ₘ)`:
Hopf-algebra homomorphisms `O(𝔾ₘ) = R[ℤ] → A` with the convolution
product — under `Spec`, pointwise multiplication of characters.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CharacterGroup (A : Type v) [CommSemiring A] [Bialgebra R A] : Type _ :=
  WithConv ((AddMonoidAlgebra R ℤ) →ₐc[R] A)

/-- **The cocharacter group** `X_*(Spec A) = Hom_grp(𝔾ₘ, Spec A)`:
Hopf-algebra homomorphisms `A → R[ℤ]` with convolution. The
convolution structure requires `A` cocommutative — faithfully so:
`X_*(G)` is a group precisely because `G` is commutative.

Blueprint: tori.character_and_cocharacter_lattices
-/
abbrev CocharacterGroup (A : Type v) [Semiring A] [Bialgebra R A] : Type _ :=
  WithConv (A →ₐc[R] (AddMonoidAlgebra R ℤ))

variable (M N : Type v) [AddCommGroup M] [AddCommGroup N]

/-- `zmultiplesHom` upgraded to an additive equivalence
`M ≃+ (ℤ →+ M)`, `m ↦ (n ↦ n • m)`. -/
noncomputable def zmultiplesAddEquiv : M ≃+ (ℤ →+ M) :=
  { zmultiplesHom M with
    map_add' := fun x y => by
      ext n
      simp [zsmul_add] }

/-! ### Cartier duality for split tori (T1a), over a domain -/

section Domain

variable [IsDomain R]

/-- **Cartier duality, object level** (split case): the character
group of `D(M)` is exactly the lattice `M`. The character attached to
`m : M` is the Hopf map `R[ℤ] → R[M]` induced by `1 ↦ m` on
exponents; the identification of lattice addition with convolution is
Mathlib's `mapDomainBialgHomAddEquiv`.

Blueprint: tori.character_and_cocharacter_lattices, reductive_groups.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
-/
noncomputable def diagCharEquiv :
    Multiplicative M ≃* CharacterGroup R (AddMonoidAlgebra R M) :=
  AddEquiv.toMultiplicativeLeft
    ((zmultiplesAddEquiv M).trans
      (AddMonoidAlgebra.mapDomainBialgHomAddEquiv (R := R)))

/-- **Cartier duality, hom level**: Hopf-algebra homomorphisms
`R[M] → R[N]` correspond to lattice homomorphisms `M → N` — full
faithfulness of `D` on the split category.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence
-/
noncomputable def diagHomEquiv :
    (M →+ N) ≃ (AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N) :=
  AddMonoidAlgebra.mapDomainBialgHomEquiv

/-- **Cartier duality, cocharacter level**: the cocharacters of
`D(M)` form the dual lattice `Hom(M, ℤ)`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def diagCocharEquiv :
    (M →+ ℤ) ≃ CocharacterGroup R (AddMonoidAlgebra R M) :=
  (AddMonoidAlgebra.mapDomainBialgHomEquiv).trans (WithConv.equiv _).symm

/-- **Split classification theorem** (isomorphism level of Cartier
duality): two split diagonalizable groups are isomorphic over a
domain iff their lattices are.

Blueprint: reductive_groups.diagonalizable_groups_antiequivalence, tori.f_tori_galois_module_classification
-/
theorem diag_bialgEquiv_iff_addEquiv :
    Nonempty (AddMonoidAlgebra R M ≃ₐc[R] AddMonoidAlgebra R N) ↔
      Nonempty (M ≃+ N) := by
  constructor
  · rintro ⟨φ⟩
    refine ⟨AddMonoidHom.toAddEquiv
      (AddMonoidAlgebra.mapDomainOfBialgHom
        (φ : AddMonoidAlgebra R M →ₐc[R] AddMonoidAlgebra R N))
      (AddMonoidAlgebra.mapDomainOfBialgHom
        (φ.symm : AddMonoidAlgebra R N →ₐc[R] AddMonoidAlgebra R M))
      ?_ ?_⟩
    · ext m
      refine AddMonoidAlgebra.single_left_injective (r := (1 : R))
        one_ne_zero ?_
      simp [AddMonoidAlgebra.single_mapDomainOfBialgHom]
    · ext n
      refine AddMonoidAlgebra.single_left_injective (r := (1 : R))
        one_ne_zero ?_
      simp [AddMonoidAlgebra.single_mapDomainOfBialgHom]
  · rintro ⟨e⟩
    exact ⟨AddMonoidAlgebra.domCongrBialgEquiv R R e⟩

/-! ### The computed description: characters as group-like elements

The knowledge base records (as a theorem, not a definition) that
characters of `Spec A` correspond to group-like elements of `A`. For
`A = R[M]` over a domain, the group-like elements are exactly the
lattice, which combined with `diagCharEquiv` is that correspondence
in the split case. The bridge for general `A` is plan G0.C M5. -/

/-- The canonical map from the lattice to the group-like elements of
the group algebra: `m ↦ e^m`. -/
@[simps]
noncomputable def groupLikeSingle [Nontrivial R] :
    Multiplicative M →* GroupLike R (AddMonoidAlgebra R M) where
  toFun m :=
    ⟨AddMonoidAlgebra.single m.toAdd 1,
      AddMonoidAlgebra.isGroupLikeElem_single_one _⟩
  map_one' := by
    ext
    simp [AddMonoidAlgebra.one_def]
  map_mul' a b := by
    ext
    simp [AddMonoidAlgebra.single_mul_single]

/-- **Group-like rigidity** (computed description of the characters,
split case): over a domain, the group-like elements of `R[M]` are
exactly the lattice elements `e^m`.

Blueprint: tori.character_and_cocharacter_lattices, tori.characters_as_group_like_elements
-/
noncomputable def diagGroupLikeEquiv :
    Multiplicative M ≃* GroupLike R (AddMonoidAlgebra R M) :=
  MulEquiv.ofBijective (groupLikeSingle R M) <| by
    constructor
    · intro a b hab
      have h2 : (AddMonoidAlgebra.single a.toAdd 1 : AddMonoidAlgebra R M)
          = AddMonoidAlgebra.single b.toAdd 1 := congrArg GroupLike.val hab
      exact Multiplicative.toAdd.injective
        (AddMonoidAlgebra.single_left_injective one_ne_zero h2)
    · rintro ⟨x, hx⟩
      obtain ⟨m, rfl⟩ :=
        AddMonoidAlgebra.isGroupLikeElem_iff_mem_range_single_one.mp hx
      exact ⟨Multiplicative.ofAdd m, rfl⟩

/-! ### Examples -/

section Examples

/-- Characters of `𝔾ₘ = D(ℤ)`: the lattice `ℤ`. -/
noncomputable example : Multiplicative ℤ ≃* CharacterGroup R (AddMonoidAlgebra R ℤ) :=
  diagCharEquiv R ℤ

/-- Endomorphisms of `𝔾ₘ` as a group scheme: `ℤ`, acting by
`t ↦ tⁿ`. -/
noncomputable example :
    (ℤ →+ ℤ) ≃ (AddMonoidAlgebra R ℤ →ₐc[R] AddMonoidAlgebra R ℤ) :=
  diagHomEquiv R ℤ ℤ

end Examples


/-! ### The scheme-level definition (primary faithful form)

`X^*(G) = Hom_grp(G, 𝔾ₘ)` — homomorphisms of algebraic groups, i.e.
morphisms in the category `Grp (Over (Spec R))` of group objects. The
Hopf-hom presentation above is the first computed form; the bridge
decomposes into two identifications (KB:
`affine_group_schemes.group_scheme_homomorphism`), stated below with
proofs deferred to the M0 proof pass. -/

section SchemeLevel

variable (Rc : CommRingCat.{u})

/-- `𝔾ₘ = Spec R[ℤ]` bundled as a group object of `Over (Spec R)`. -/
noncomputable def gmGrp : Grp (Over (Scheme.Spec.obj (op Rc))) :=
  { X := specObjOver Rc (AddMonoidAlgebra Rc ℤ)
    grp := hopfSpecGrpObj Rc (AddMonoidAlgebra Rc ℤ) }

/-- **The character group, scheme level** — the faithful primary
definition: homomorphisms of algebraic groups `G → 𝔾ₘ`, i.e.
morphisms of group objects over `Spec R`.

Blueprint: tori.character_and_cocharacter_lattices
-/
noncomputable def SchemeCharacterGroup
    (G : Grp (Over (Scheme.Spec.obj (op Rc)))) : Type _ :=
  G ⟶ gmGrp Rc

/-- `D(M)` bundled as a group object. -/
noncomputable def diagGrp (M : Type u) [AddCommGroup M] :
    Grp (Over (Scheme.Spec.obj (op Rc))) :=
  { X := diagGroupOver Rc M
    grp := diagGroupOver.instGrpObj Rc M }

/-- **Bridge, stage 1** (statement; proof: M0 pass): `hopfSpec` is
fully faithful — algebraic-group homs between spectra correspond to
group-object morphisms on the algebra side.

Blueprint: affine_group_schemes.hopf_spec_fully_faithful
-/
theorem hopfSpec_map_bijective
    (A B : Grp ((CommAlgCat Rc)ᵒᵖ)) :
    Function.Bijective
      (fun f : A ⟶ B => (Langlands.AlgebraicGeometry.hopfSpec Rc).map f) := by
  sorry

/-- **Scheme-level Cartier duality for `D(M)`** (statement; proof: M0
pass, via the two bridge stages): algebraic-group homomorphisms
`D(M) → 𝔾ₘ` correspond to lattice elements. The group-law
compatibility (pointwise multiplication ↔ lattice addition) is
stated once hom-groups of commutative group objects are available
(KB: `tori.convolution_is_pointwise_multiplication`).

Blueprint: tori.characters_as_group_like_elements
-/
theorem schemeCharacter_diag_equiv (M : Type u) [AddCommGroup M]
    [IsDomain Rc] :
    Nonempty (SchemeCharacterGroup Rc (diagGrp Rc M) ≃ Multiplicative M) := by
  sorry

end SchemeLevel

end Domain

/-! ### Inversion of characters via the antipode (statements)

The convolution `CommMonoid` on `CharacterGroup` is Mathlib's; the
group law needs inversion by the antipode. Definitions are given
here; the group axioms are the M0 proof pass. -/

section Inversion

variable {R}

/-- The antipode of `O(𝔾ₘ) = R[ℤ]` as a Hopf-algebra homomorphism:
induced by negation on the exponent lattice. -/
noncomputable def gmAntipodeBialgHom :
    (AddMonoidAlgebra R ℤ) →ₐc[R] (AddMonoidAlgebra R ℤ) :=
  AddMonoidAlgebra.mapDomainBialgHom R (AddMonoidHom.mk' Neg.neg neg_add)

/-- Inversion of a character: precompose with the antipode of `𝔾ₘ`.
Under `Spec`, this is `χ ↦ χ⁻¹` pointwise. -/
noncomputable instance (A : Type v) [CommSemiring A] [Bialgebra R A] :
    Inv (CharacterGroup R A) :=
  ⟨fun φ => toConv (φ.ofConv.comp gmAntipodeBialgHom)⟩

/-- The repo's `𝔾ₘ`-antipode agrees with Mathlib's antipode of the
group algebra, as algebra maps. -/
lemma gmAntipodeBialgHom_toAlgHom :
    (gmAntipodeBialgHom (R := R)).toAlgHom =
      HopfAlgebra.antipodeAlgHom R (AddMonoidAlgebra R ℤ) := by
  refine AddMonoidAlgebra.algHom_ext (fun n => ?_) (Subsingleton.elim _ _)
  show AddMonoidAlgebra.mapDomainBialgHom R (AddMonoidHom.mk' Neg.neg neg_add)
      (AddMonoidAlgebra.single n (1 : R)) =
    HopfAlgebra.antipode R (AddMonoidAlgebra.single n (1 : R))
  rw [AddMonoidAlgebra.antipode_single]
  show AddMonoidAlgebra.mapDomain (Neg.neg : ℤ → ℤ)
      (AddMonoidAlgebra.single n (1 : R)) =
    AddMonoidAlgebra.single (-n) (1 : R)
  rw [AddMonoidAlgebra.mapDomain_single]

/-- The group axiom for characters, by injective transfer along
`toAlgHom` into Mathlib's convolution group of algebra
homomorphisms. -/
theorem characterGroup_inv_mul_cancel
    (A : Type v) [CommSemiring A] [Bialgebra R A]
    (φ : CharacterGroup R A) : φ⁻¹ * φ = 1 := by
  have hΨ : Function.Injective
      (fun f : CharacterGroup R A => toConv f.ofConv.toAlgHom) := by
    intro f g h
    have h' : f.ofConv.toAlgHom = g.ofConv.toAlgHom :=
      WithConv.toConv_injective h
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    exact DFunLike.congr_fun h' x
  apply hΨ
  show toConv ((φ⁻¹ * φ).ofConv.toAlgHom) = toConv ((1 : CharacterGroup R A).ofConv.toAlgHom)
  rw [BialgHom.toAlgHom_convMul, BialgHom.toAlgHom_convOne]
  have hinv : toConv ((φ⁻¹ : CharacterGroup R A).ofConv.toAlgHom) =
      (toConv φ.ofConv.toAlgHom)⁻¹ := by
    show toConv ((φ.ofConv.comp gmAntipodeBialgHom).toAlgHom) = _
    have : (φ.ofConv.comp gmAntipodeBialgHom).toAlgHom =
        φ.ofConv.toAlgHom.comp (HopfAlgebra.antipodeAlgHom R _) := by
      rw [← gmAntipodeBialgHom_toAlgHom]; rfl
    rw [this]
    rfl
  rw [hinv, inv_mul_cancel]

/-- **The character group is a group**: convolution product, inverse
by the antipode of `𝔾ₘ` (`characterGroup_inv_mul_cancel` carries the
knowledge-base link). -/
noncomputable instance (A : Type v) [CommSemiring A] [Bialgebra R A] :
    CommGroup (CharacterGroup R A) where
  __ := (inferInstance : CommMonoid (CharacterGroup R A))
  inv := Inv.inv
  inv_mul_cancel := characterGroup_inv_mul_cancel A

/-- Convolution of Hopf-algebra homomorphisms, evaluated at a
group-like element, is pointwise multiplication — the Lean form of
the identification of the convolution product with pointwise
multiplication of characters.

Blueprint: tori.convolution_is_pointwise_multiplication
-/
theorem convMul_apply_of_isGroupLikeElem
    {C A : Type*} [Semiring C] [CommSemiring A] [Bialgebra R C]
    [Bialgebra R A] [Coalgebra.IsCocomm R C]
    (f g : WithConv (C →ₐc[R] A)) {c : C} (hc : IsGroupLikeElem R c) :
    (f * g).ofConv c = f.ofConv c * g.ofConv c := by
  rw [BialgHom.convMul_def]
  show Bialgebra.mulBialgHom R A
      ((Bialgebra.TensorProduct.map f.ofConv g.ofConv) (Coalgebra.comul c)) = _
  rw [hc.comul_eq_tmul_self]
  simp [Bialgebra.TensorProduct.map_tmul]

/-- Composition with a Hopf-algebra isomorphism of coordinate rings
is an isomorphism of character groups — functoriality of `X^*` in
isomorphisms. -/
noncomputable def charGroupCongr {A₁ A₂ : Type v}
    [CommSemiring A₁] [Bialgebra R A₁] [CommSemiring A₂] [Bialgebra R A₂]
    (e : A₁ ≃ₐc[R] A₂) : CharacterGroup R A₁ ≃* CharacterGroup R A₂ where
  toFun χ := toConv ((e : A₁ →ₐc[R] A₂).comp χ.ofConv)
  invFun χ := toConv ((e.symm : A₂ →ₐc[R] A₁).comp χ.ofConv)
  left_inv χ := by
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    simp
  right_inv χ := by
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    simp
  map_mul' χ ψ := by
    refine WithConv.ofConv_injective (BialgHom.ext fun x => ?_)
    sorry -- proof: M5 (post-composition distributes over convolution)

/-- The comultiplication commutes with the antipode on a
cocommutative Hopf algebra (statement; proof: M0 pass — this is the
lemma Mathlib lacks; `counit_antipode` is the counit-side
counterpart). -/
theorem comul_comp_antipode
    (A : Type v) [CommRing A] [HopfAlgebra R A] [Coalgebra.IsCocomm R A] :
    (Coalgebra.comul (R := R) (A := A)) ∘ₗ (HopfAlgebra.antipode R) =
      (TensorProduct.map (HopfAlgebra.antipode R) (HopfAlgebra.antipode R))
        ∘ₗ Coalgebra.comul := by
  sorry

end Inversion

end Langlands.Tori
