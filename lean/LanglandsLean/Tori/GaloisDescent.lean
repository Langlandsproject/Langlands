import LanglandsLean.Tori.CharacterGroup
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.Algebra.Group.End

/-!
# Twisted group algebras: the descent construction for tori

This module builds — in-repo, without waiting for general étale
descent in Mathlib — the construction half of the classification of
tori (knowledge-base node `tori.f_tori_galois_module_classification`):

Given a Galois field extension `E/k` and a lattice `M` with an action
`σ` of `Gal(E/k) = (E ≃ₐ[k] E)` by additive automorphisms, the group
algebra `E[M]` carries the **semilinear** (diagonal) action
\[
\gamma \cdot (a\,e^m) \;=\; \gamma(a)\, e^{\sigma(\gamma) m},
\]
acting on coefficients through the Galois action and on exponents
through `σ`. Its fixed points form a `k`-subalgebra
`twistedGroupAlgebra σ ⊆ E[M]` — the coordinate algebra of the
**twisted form** of the split torus `D(M)`; for `k`-tori this is
exactly the quasi-inverse of `T ↦ X^*(T)`.

Everything in this file and its companion `Tori/Speiser.lean` is
proved (no `sorry`):

* `twistedGroupAlgebra_span_top` (Speiser's lemma / Galois descent):
  the fixed points span `E[M]` over `E`. **Proved** in
  `Tori/Speiser.lean` via the general semilinear descent theorem
  `span_fixedPoints_eq_top` built there (Mathlib has none).
* `twistedGroupAlgebra_trivial` : for the trivial action the
  construction recovers `k[M]` inside `E[M]`.

The `k`-Hopf structure on `twistedGroupAlgebra σ` (comultiplication by
descent of `Δ_E`) is the next construction target; it requires
`twistedGroupAlgebra_span_top` and is deliberately not stated as a
placeholder.

## Knowledge base

`tori.f_tori_galois_module_classification`, `tori.torus_definition`
(the general, non-split torus enters Lean through this construction).
-/

open AddMonoidAlgebra

namespace Langlands.Tori

universe u v

variable (k E : Type u) [Field k] [Field E] [Algebra k E]
variable (M : Type u) [AddCommGroup M]
variable (σ : (E ≃ₐ[k] E) →* Multiplicative (AddAut M))

/-- The exponent-side action: the additive automorphism of the lattice
attached to `γ`. (`AddAut M` is an additive group in Mathlib, so the
action datum `σ` lands in its `Multiplicative` wrapper.) -/
abbrev latticeAut (γ : E ≃ₐ[k] E) : M ≃+ M := Multiplicative.toAdd (σ γ)

@[simp]
lemma latticeAut_one_apply (m : M) : latticeAut k E M σ 1 m = m := by
  simp [latticeAut]

@[simp]
lemma latticeAut_mul_apply (γ δ : E ≃ₐ[k] E) (m : M) :
    latticeAut k E M σ (γ * δ) m =
      latticeAut k E M σ γ (latticeAut k E M σ δ m) := by
  simp [latticeAut, AddAut.add_apply]

/-! ### The semilinear action -/

/-- The semilinear automorphism of the group algebra `E[M]` attached
to `γ ∈ Gal(E/k)`: `γ` on coefficients, `σ γ` on exponents. It is
`k`-linear (not `E`-linear!), which is exactly what "semilinear"
means here. -/
noncomputable def semilinearAut (γ : E ≃ₐ[k] E) :
    AddMonoidAlgebra E M ≃ₐ[k] AddMonoidAlgebra E M :=
  (AddMonoidAlgebra.mapAlgEquiv k M γ).trans
    (AddMonoidAlgebra.domCongr k E (latticeAut k E M σ γ))

@[simp]
lemma semilinearAut_single (γ : E ≃ₐ[k] E) (m : M) (a : E) :
    semilinearAut k E M σ γ (AddMonoidAlgebra.single m a) =
      AddMonoidAlgebra.single (latticeAut k E M σ γ m) (γ a) := by
  simp [semilinearAut]

/-- The semilinear action as a homomorphism
`Gal(E/k) →* Aut_k(E[M])`. -/
noncomputable def semilinearHom :
    (E ≃ₐ[k] E) →* (AddMonoidAlgebra E M ≃ₐ[k] AddMonoidAlgebra E M) where
  toFun := semilinearAut k E M σ
  map_one' := by
    apply AlgEquiv.ext
    intro f
    induction f using AddMonoidAlgebra.induction_linear with
    | zero => simp
    | add f g hf hg => simp [map_add, hf, hg]
    | single m a => simp
  map_mul' γ δ := by
    apply AlgEquiv.ext
    intro f
    induction f using AddMonoidAlgebra.induction_linear with
    | zero => simp
    | add f g hf hg => simp [map_add, hf, hg]
    | single m a => simp

/-! ### The twisted group algebra -/

/-- The **twisted group algebra**: the fixed points of the semilinear
action of `Gal(E/k)` on `E[M]`, as a `k`-subalgebra of `E[M]`. For a
Galois lattice `(M, σ)` this is the coordinate algebra of the twisted
form of the split torus `D(M)` — the general torus of the
knowledge base.

Blueprint: tori.f_tori_galois_module_classification
-/
noncomputable def twistedGroupAlgebra : Subalgebra k (AddMonoidAlgebra E M) where
  carrier := {f | ∀ γ : E ≃ₐ[k] E, semilinearAut k E M σ γ f = f}
  add_mem' hf hg γ := by rw [map_add, hf γ, hg γ]
  mul_mem' hf hg γ := by rw [map_mul, hf γ, hg γ]
  algebraMap_mem' r γ := by
    rw [AlgEquiv.commutes]

lemma mem_twistedGroupAlgebra_iff {f : AddMonoidAlgebra E M} :
    f ∈ twistedGroupAlgebra k E M σ ↔
      ∀ γ : E ≃ₐ[k] E, semilinearAut k E M σ γ f = f :=
  Iff.rfl

/-! ### The descent theorems (stated; proofs are the next milestone) -/

/- Speiser's lemma for the twisted group algebra —
`twistedGroupAlgebra_span_top` — is stated and **proved** in
`Tori/Speiser.lean`, which builds the general semilinear descent
theorem `span_fixedPoints_eq_top` that Mathlib lacks. -/

/-- With the trivial lattice action, the semilinear action reduces to
the coefficient action. -/
lemma semilinearAut_one_smulHom (γ : E ≃ₐ[k] E) (f : AddMonoidAlgebra E M) :
    semilinearAut k E M 1 γ f = AddMonoidAlgebra.mapAlgEquiv k M γ f := by
  have h0 : (latticeAut k E M 1 γ) = AddEquiv.refl M := by
    ext m
    simp [latticeAut]
  rw [semilinearAut, h0, AddMonoidAlgebra.domCongr_refl]
  rfl

/-- For the **trivial** action on the lattice, the twisted group
algebra is the image of `k[M]`: no twisting occurs. -/
theorem twistedGroupAlgebra_trivial [IsGalois k E] [FiniteDimensional k E] :
    twistedGroupAlgebra k E M 1 =
      (AddMonoidAlgebra.mapAlgHom M (Algebra.ofId k E)).range := by
  classical
  ext f
  constructor
  · intro hf
    -- every coefficient is Galois-fixed, hence comes from `k`
    have hcoef : ∀ m : M, f.coeff m ∈ Set.range (algebraMap k E) := by
      intro m
      rw [IsGalois.mem_range_algebraMap_iff_fixed]
      intro γ
      have hγ := hf γ
      rw [semilinearAut_one_smulHom] at hγ
      calc γ (f.coeff m)
          = (AddMonoidAlgebra.mapAlgEquiv k M γ f).coeff m := by simp
        _ = f.coeff m := by rw [hγ]
    -- assemble the preimage coefficientwise
    set h : E → k := Function.invFun (algebraMap k E) with hh
    have hinj : Function.Injective (algebraMap k E) := (algebraMap k E).injective
    have h0 : h 0 = 0 := by
      rw [hh, ← map_zero (algebraMap k E), Function.leftInverse_invFun hinj]
    refine (AlgHom.mem_range _).mpr
      ⟨AddMonoidAlgebra.ofCoeff (f.coeff.mapRange h h0), ?_⟩
    ext m
    rw [AddMonoidAlgebra.coeff_mapAlgHom]
    show Algebra.ofId k E (Finsupp.mapRange h h0 f.coeff m) = f.coeff m
    rw [Finsupp.mapRange_apply, Algebra.ofId_apply]
    exact Function.invFun_eq (hcoef m)
  · rintro ⟨g, rfl⟩ γ
    rw [semilinearAut_one_smulHom]
    ext m
    simp [AddMonoidAlgebra.coeff_mapAlgHom]

end Langlands.Tori
