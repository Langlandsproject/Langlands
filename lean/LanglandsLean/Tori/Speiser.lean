import LanglandsLean.Tori.GaloisDescent
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.LinearIndependent.Basic

/-!
# Speiser's lemma: semilinear Galois descent for vector spaces

Let `E/k` be a finite extension of fields and `V` an `E`-vector space
with a **semilinear** action of `Gal(E/k) = (E ≃ₐ[k] E)`: additive
automorphisms `ρ γ` satisfying `ρ γ (c • v) = γ c • ρ γ v`,
compatible with `1` and multiplication.

**Speiser's lemma** (`span_fixedPoints_eq_top`): the fixed points span
`V` over `E`. This is the surjectivity half of the classical
`E ⊗_k V^Γ ≅ V` (Galois descent for vector spaces); Mathlib has no
semilinear descent, so this file provides it.

Proof (classical averaging):

1. (`span_galEval_eq_top`) The evaluation vectors `(γ c)_γ ∈ (Γ → E)`
   for `c ∈ E` span `Γ → E` over `E`; otherwise a non-zero functional
   yields a relation `∑ a_γ γ = 0` among field embeddings,
   contradicting **Dedekind's independence of characters**
   (`linearIndependent_monoidHom`).
2. The averages `∑_γ ρ γ (c • v)` are fixed. Choosing by step 1 a
   combination of evaluation vectors equal to the indicator of
   `1 ∈ Γ`, the same combination of averages telescopes to `v`.

Only `[FiniteDimensional k E]` is assumed (it makes `Γ` finite);
Galois-ness is not needed for the span statement.

## Knowledge base

`tori.f_tori_galois_module_classification`.
-/

namespace Langlands.Tori

universe u v

variable {k E : Type u} [Field k] [Field E] [Algebra k E] [FiniteDimensional k E]

/-- Dedekind's independence of characters, specialized: the elements
of `Gal(E/k)`, as functions `E → E`, are linearly independent over
`E`. Blueprint: descent_and_forms.galois_descent_for_vector_spaces
-/
theorem linearIndependent_algEquiv :
    LinearIndependent E (fun γ : E ≃ₐ[k] E => (γ : E → E)) := by
  refine (linearIndependent_monoidHom E E).comp
    (fun γ : E ≃ₐ[k] E => (γ : E →* E)) ?_
  intro γ δ h
  ext x
  exact DFunLike.congr_fun h x

set_option maxHeartbeats 800000 in
/-- **Step 1**: the evaluation vectors `(γ c)_γ`, `c ∈ E`, span the
function space `Gal(E/k) → E` over `E`. Blueprint: descent_and_forms.galois_descent_for_vector_spaces
-/
theorem span_galEval_eq_top :
    Submodule.span E
      (Set.range fun c : E => fun γ : E ≃ₐ[k] E => γ c) = ⊤ := by
  classical
  set S : Submodule E ((E ≃ₐ[k] E) → E) :=
    Submodule.span E (Set.range fun c : E => fun γ : E ≃ₐ[k] E => γ c)
    with hS
  by_contra h
  have hlt : S < ⊤ := lt_top_iff_ne_top.mpr h
  have hproj : Module.Projective E (((E ≃ₐ[k] E) → E) ⧸ S) := inferInstance
  obtain ⟨f, hf0, hfmap⟩ :=
    Submodule.exists_dual_map_eq_bot_of_lt_top hlt hproj
  -- The coordinates of the functional `f`.
  set a : (E ≃ₐ[k] E) → E := fun γ => f (Pi.single γ 1) with ha
  -- Any functional on a finite product is the pairing with its
  -- coordinates.
  have hf_eval : ∀ x : (E ≃ₐ[k] E) → E,
      f x = ∑ γ : E ≃ₐ[k] E, x γ * a γ := by
    intro x
    conv_lhs => rw [← Finset.univ_sum_single x, map_sum]
    refine Finset.sum_congr rfl fun γ _ => ?_
    have : Pi.single γ (x γ) = x γ • Pi.single γ (1 : E) := by
      rw [← Pi.single_smul, smul_eq_mul, mul_one]
    rw [this, map_smul, smul_eq_mul, ha]
  -- `f` kills the evaluation vectors.
  have hkill : ∀ c : E, ∑ γ : E ≃ₐ[k] E, γ c * a γ = 0 := by
    intro c
    have hmem : (fun γ : E ≃ₐ[k] E => γ c) ∈ S := by
      rw [hS]
      exact Submodule.subset_span ⟨c, rfl⟩
    have h0 : f (fun γ : E ≃ₐ[k] E => γ c) = 0 := by
      have := Submodule.mem_map_of_mem (f := f) hmem
      rw [hfmap, Submodule.mem_bot] at this
      exact this
    rw [hf_eval] at h0
    exact h0
  -- Hence a linear relation among the characters; Dedekind forces
  -- all coordinates to vanish.
  have hrel : ∑ γ : E ≃ₐ[k] E, a γ • (γ : E → E) = 0 := by
    funext c
    have := hkill c
    simpa [Finset.sum_apply, mul_comm] using this
  have hzero : ∀ γ : E ≃ₐ[k] E, a γ = 0 := fun γ =>
    linearIndependent_iff'.mp linearIndependent_algEquiv Finset.univ a hrel γ
      (Finset.mem_univ γ)
  -- So `f = 0`, contradiction.
  refine hf0 (LinearMap.ext fun x => ?_)
  rw [hf_eval x]
  simp [hzero]

section Semilinear

variable {V : Type v} [AddCommGroup V] [Module E V]
variable (ρ : (E ≃ₐ[k] E) → V ≃+ V)

/-- **Speiser's lemma**: for a semilinear action of `Gal(E/k)` on an
`E`-vector space `V`, the fixed points span `V` over `E`. Blueprint: descent_and_forms.galois_descent_for_vector_spaces
-/
theorem span_fixedPoints_eq_top
    (hone : ∀ v, ρ 1 v = v)
    (hmul : ∀ γ δ v, ρ (γ * δ) v = ρ γ (ρ δ v))
    (hsemi : ∀ γ (c : E) v, ρ γ (c • v) = γ c • ρ γ v) :
    Submodule.span E {v : V | ∀ γ, ρ γ v = v} = ⊤ := by
  classical
  rw [eq_top_iff]
  rintro v -
  -- The averaged vectors are fixed.
  have havg : ∀ c : E, (∑ γ : E ≃ₐ[k] E, ρ γ (c • v)) ∈
      {w : V | ∀ γ, ρ γ w = w} := by
    intro c δ
    rw [map_sum]
    refine (Fintype.sum_equiv (Equiv.mulLeft δ)
      (fun γ => ρ δ (ρ γ (c • v))) (fun γ => ρ γ (c • v))
      fun γ => ?_).symm ▸ ?_
    · rw [Equiv.coe_mulLeft, hmul]
    · exact Finset.sum_congr rfl fun γ _ => rfl
  -- A combination of evaluation vectors equal to the indicator of `1`.
  have h1 : (Pi.single (1 : E ≃ₐ[k] E) (1 : E)) ∈
      Submodule.span E (Set.range fun c : E => fun γ : E ≃ₐ[k] E => γ c) := by
    rw [span_galEval_eq_top]; trivial
  obtain ⟨l, hl⟩ := Finsupp.mem_span_range_iff_exists_finsupp.mp h1
  -- The coefficient identity, coordinatewise.
  have hcoeff : ∀ γ : E ≃ₐ[k] E,
      (l.sum fun c b => b * γ c) = if γ = 1 then 1 else 0 := by
    intro γ
    have h := congrFun hl γ
    simp only [Finsupp.sum, Finset.sum_apply, Pi.smul_apply, smul_eq_mul,
      Pi.single_apply] at h ⊢
    exact h
  -- Assemble: the same combination of averages telescopes to `v`.
  have hv : (l.sum fun c b => b • ∑ γ : E ≃ₐ[k] E, ρ γ (c • v)) = v := by
    rw [Finsupp.sum]
    have step : ∀ c ∈ l.support,
        (l c • ∑ γ : E ≃ₐ[k] E, ρ γ (c • v)) =
          ∑ γ : E ≃ₐ[k] E, (l c * γ c) • ρ γ v := by
      intro c _
      rw [Finset.smul_sum]
      refine Finset.sum_congr rfl fun γ _ => ?_
      rw [hsemi, smul_smul]
    rw [Finset.sum_congr rfl step, Finset.sum_comm]
    have swap : ∀ γ : E ≃ₐ[k] E,
        (∑ c ∈ l.support, (l c * γ c) • ρ γ v) =
          (l.sum fun c b => b * γ c) • ρ γ v := by
      intro γ
      rw [Finsupp.sum, Finset.sum_smul]
    rw [Finset.sum_congr rfl fun γ _ => swap γ]
    rw [Finset.sum_congr rfl fun γ _ => by rw [hcoeff γ, ite_smul, one_smul, zero_smul]]
    rw [Finset.sum_ite_eq' Finset.univ (1 : E ≃ₐ[k] E) fun γ => ρ γ v]
    simp [hone]
  -- Conclude membership in the span.
  rw [← hv, Finsupp.sum]
  exact Submodule.sum_mem _ fun c _ =>
    Submodule.smul_mem _ _ (Submodule.subset_span (havg c))

end Semilinear

section Application

variable (k E : Type u) [Field k] [Field E] [Algebra k E]
variable (M : Type u) [AddCommGroup M]
variable (σ : (E ≃ₐ[k] E) →* Multiplicative (AddAut M))

/-- The semilinear automorphisms of `E[M]` are semilinear over
`E`-scalars: `γ • (c · f) = γ(c) · (γ • f)`. -/
lemma semilinearAut_smul (γ : E ≃ₐ[k] E) (c : E) (f : AddMonoidAlgebra E M) :
    semilinearAut k E M σ γ (c • f) = γ c • semilinearAut k E M σ γ f := by
  induction f using AddMonoidAlgebra.induction_linear with
  | zero => simp
  | add f g hf hg => simp [smul_add, hf, hg]
  | single m a =>
    rw [AddMonoidAlgebra.smul_single', semilinearAut_single, semilinearAut_single,
      AddMonoidAlgebra.smul_single', map_mul]

/-- **Galois descent for the twisted group algebra** (the form
property, surjectivity half): the fixed points of the semilinear
action span `E[M]` over `E`. This discharges the statement recorded
in `Tori/GaloisDescent.lean`. Blueprint: tori.f_tori_galois_module_classification
-/
theorem twistedGroupAlgebra_span_top [FiniteDimensional k E] :
    Submodule.span E
      ((twistedGroupAlgebra k E M σ : Set (AddMonoidAlgebra E M))) = ⊤ := by
  have hset : ((twistedGroupAlgebra k E M σ : Set (AddMonoidAlgebra E M))) =
      {f : AddMonoidAlgebra E M |
        ∀ γ : E ≃ₐ[k] E, (semilinearAut k E M σ γ).toAddEquiv f = f} := rfl
  rw [hset]
  refine span_fixedPoints_eq_top
    (fun γ => (semilinearAut k E M σ γ).toAddEquiv) ?_ ?_ ?_
  · intro f
    exact DFunLike.congr_fun (map_one (semilinearHom k E M σ)) f
  · intro γ δ f
    exact DFunLike.congr_fun (map_mul (semilinearHom k E M σ) γ δ) f
  · intro γ c f
    exact semilinearAut_smul k E M σ γ c f

end Application

end Langlands.Tori
