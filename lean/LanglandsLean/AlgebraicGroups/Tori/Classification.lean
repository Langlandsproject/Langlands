import LanglandsLean.AlgebraicGroups.Tori.Torus
import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.RepresentationTheory.Rep.Basic

/-!
# The classification of tori as an equivalence of categories (G0.C M6)

The head theorem of plan G0.C: for a finite Galois extension `E/k`
with `Γ = Gal(E/k)`, the character-lattice functor is a (contravariant)
equivalence

\[ \{\text{tori over } k \text{ split by } E\}^{\mathrm{op}}
   \;\simeq\; \{\Gamma\text{-lattices}\} . \]

Carriers (design decision D-c, revised): tori are presented
algebra-first (D-a) as the opposite of the full subcategory of
`CommHopfAlgCat k` on the torus algebras; `Γ`-lattices are the full
subcategory of `Rep ℤ Γ` on finite free `ℤ`-modules.

* `TorusAlgCat k E` — coordinate algebras of tori split by `E`.
* `TorusCat k E := (TorusAlgCat k E)ᵒᵖ` — the category of tori.
* `LatticeCat Γ` — `Γ`-lattices.
* `charLatticeFunctor` — `A ↦ X^*(Spec A)` with its Galois action;
  covariant on algebras = contravariant on tori.
* `toriClassification : (TorusCat k E)ᵒᵖ ≌ LatticeCat Γ` — **the
  classification theorem** `tori.f_tori_galois_module_classification`
  at the fixed finite level (the continuous `Gal(k_s/k)` statement
  is KB-level by design decision D-b).

## Statement-first status

The categories and the functor are definitions (data); the
`Full`/`Faithful`/`EssSurj` instances are the three working theorems
(M6 proof pass, consuming `forms.hopf_descent` M3 and the M5
lattice computations) and are `sorry` here. `toriClassification`
itself is then genuine data via `Functor.asEquivalence`.
-/

open CategoryTheory
open scoped TensorProduct

namespace Langlands.Tori

universe u

variable (k E : Type u) [Field k] [Field E] [Algebra k E]

/-! ### The category of tori -/

/-- The torus algebras among commutative `k`-Hopf algebras. -/
def torusAlgebraProp : ObjectProperty (CommHopfAlgCat.{u} k) :=
  fun A => IsTorusAlgebra k E A

/-- **The category of coordinate algebras of tori split by `E`**:
the full subcategory of commutative `k`-Hopf algebras on the torus
algebras.

Blueprint: tori.f_tori_galois_module_classification
-/
abbrev TorusAlgCat := (torusAlgebraProp k E).FullSubcategory

/-- **The category of tori over `k` split by `E`**: opposite to the
category of their coordinate algebras (`Spec` is contravariant).

Blueprint: tori.f_tori_galois_module_classification
-/
abbrev TorusCat := (TorusAlgCat k E)ᵒᵖ

/-! ### The category of Galois lattices -/

variable (Γ : Type u) [Group Γ]

/-- The lattices among representations: finite free `ℤ`-modules. -/
def latticeProp : ObjectProperty (Rep.{u} ℤ Γ) :=
  fun V => Module.Free ℤ V ∧ Module.Finite ℤ V

/-- **The category of `Γ`-lattices**: finite free `ℤ`-modules with
`Γ`-action, as the full subcategory of `Rep ℤ Γ`.

Blueprint: tori.f_tori_galois_module_classification
-/
abbrev LatticeCat := (latticeProp Γ).FullSubcategory

variable {Γ}

/-! ### The character-lattice functor -/

section CharRep
variable (A : Type u) [CommRing A] [HopfAlgebra k A]

/-- The character lattice with its Galois action, as an object of
`Rep ℤ Gal(E/k)`.

Blueprint: tori.f_tori_galois_module_classification
-/
noncomputable def charLatticeRep : Rep.{u} ℤ (E ≃ₐ[k] E) :=
  Rep.of (charRep k E A)

end CharRep

/-- **The character-lattice functor** `A ↦ X^*(Spec A)`: covariant
on coordinate algebras, i.e. contravariant on tori. Functoriality
fields are the M6 proof pass.

Blueprint: tori.f_tori_galois_module_classification
-/
noncomputable def charLatticeFunctor :
    TorusAlgCat k E ⥤ LatticeCat (E ≃ₐ[k] E) where
  obj A :=
    haveI : IsTorusAlgebra k E A.obj := A.property
    ⟨charLatticeRep k E A.obj,
      charLattice_free k E A.obj,
      charLattice_finite k E A.obj⟩
  map {A B} f :=
    ⟨Rep.ofHom
      { toLinearMap := (charLatticeMap k E f.hom.hom).toIntLinearMap
        isIntertwining' := fun γ => by
          ext x
          exact charLatticeMap_galAct k E f.hom.hom γ x }⟩
  map_id A := by
    sorry -- proof: M6 (charLatticeMap of the identity)
  map_comp f g := by
    sorry -- proof: M6 (charLatticeMap of a composition)

section Equivalence

variable [FiniteDimensional k E] [IsGalois k E]

/-- Faithfulness: a Hopf map is determined by its action on
characters (statement; proof: M6, from
`existsUnique_bialgHom_of_equivariant`).

Blueprint: tori.f_tori_galois_module_classification
-/
instance charLatticeFunctor_faithful : (charLatticeFunctor k E).Faithful where
  map_injective := by
    sorry

/-- Fullness: every equivariant lattice map is induced by a Hopf map
(statement; proof: M6, from `existsUnique_bialgHom_of_equivariant`).

Blueprint: tori.f_tori_galois_module_classification
-/
instance charLatticeFunctor_full : (charLatticeFunctor k E).Full where
  map_surjective := by
    sorry

/-- Essential surjectivity: every `Γ`-lattice is the character
lattice of a torus — the twisted form (statement; proof: M6, from
`tori.twisted_form_of_lattice` = M3 + M4).

Blueprint: tori.f_tori_galois_module_classification
-/
instance charLatticeFunctor_essSurj : (charLatticeFunctor k E).EssSurj where
  mem_essImage := by
    sorry

instance : (charLatticeFunctor k E).IsEquivalence where

variable {A B : Type u} [CommRing A] [HopfAlgebra k A] [CommRing B] [HopfAlgebra k B] in
/-- **The hom-level classification** (full faithfulness, working
form): for tori split by `E`, every Galois-equivariant homomorphism
of character lattices is induced by a unique Hopf-algebra
homomorphism (statement; proof: M6 via `forms.hopf_descent` and
Cartier duality over `E`).

Blueprint: tori.classification_hom_level
-/
theorem existsUnique_bialgHom_of_equivariant
    [IsTorusAlgebra k E A] [IsTorusAlgebra k E B]
    (g : CharLattice E (E ⊗[k] A) →+ CharLattice E (E ⊗[k] B))
    (hg : ∀ γ x, g (charRep k E A γ x) = charRep k E B γ (g x)) :
    ∃! f : A →ₐc[k] B, charLatticeMap k E f = g := by
  sorry

/-- Essential surjectivity, unbundled (KB:
`tori.twisted_form_of_lattice`): every finite free `ℤ`-module with
Galois action arises, up to isomorphism of representations, as the
character lattice of a torus split by `E` (statement; proof: M6).

Blueprint: tori.twisted_form_of_lattice
-/
theorem exists_charLatticeRep_iso
    (V : Rep.{u} ℤ (E ≃ₐ[k] E))
    (hfree : Module.Free ℤ V) (hfin : Module.Finite ℤ V) :
    ∃ T : TorusAlgCat k E,
      Nonempty ((charLatticeFunctor k E).obj T ≅ ⟨V, hfree, hfin⟩) := by
  sorry

/-- **The classification of tori** (finite Galois level): the
character lattice is a contravariant equivalence from tori split by
`E` to `Gal(E/k)`-lattices. This is the head statement of
`tori.f_tori_galois_module_classification`; its content is the three
instances above (full, faithful, essentially surjective).

Blueprint: tori.f_tori_galois_module_classification
-/
noncomputable def toriClassification :
    (TorusCat k E)ᵒᵖ ≌ LatticeCat (E ≃ₐ[k] E) :=
  (opOpEquivalence (TorusAlgCat k E)).trans
    (charLatticeFunctor k E).asEquivalence

end Equivalence

end Langlands.Tori
