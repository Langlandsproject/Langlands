import Mathlib.Algebra.Lie.Matrix
import Mathlib.Algebra.Lie.Nilpotent
import Mathlib.GroupTheory.Coxeter.Basic
import Mathlib.GroupTheory.Coxeter.Inversion
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# AI4Math short-project validation probes

These declarations validate the representative scope of student issues #46--#49. They are
research probes, not public `LanglandsLean` API.
-/

open scoped Matrix

namespace AI4MathShortProjects

section Coxeter

variable {B W : Type*} [Group W] {M : CoxeterMatrix B}
variable (cs : CoxeterSystem M W)

def standardParabolic (I : Set B) : Subgroup W :=
  Subgroup.closure (cs.simple '' I)

theorem standardParabolic_mono {I J : Set B} (h : I ⊆ J) :
    standardParabolic cs I ≤ standardParabolic cs J := by
  exact (Subgroup.closure_le (standardParabolic cs J)).2
    (Set.Subset.trans (Set.image_mono h) Subgroup.subset_closure)

theorem standardParabolic_empty : standardParabolic cs (∅ : Set B) = ⊥ := by
  simp [standardParabolic]

theorem standardParabolic_univ : standardParabolic cs (Set.univ : Set B) = ⊤ := by
  simpa [standardParabolic] using cs.subgroup_closure_range_simple

theorem simple_mem_standardParabolic {I : Set B} {i : B} (hi : i ∈ I) :
    cs.simple i ∈ standardParabolic cs I := by
  exact Subgroup.subset_closure ⟨i, hi, rfl⟩

def rightInversionsOfWord (ω : List B) [DecidableEq W] : Finset W :=
  (cs.rightInvSeq ω).toFinset

def leftInversionsOfWord (ω : List B) [DecidableEq W] : Finset W :=
  (cs.leftInvSeq ω).toFinset

theorem card_rightInversionsOfWord {ω : List B} [DecidableEq W]
    (hω : cs.IsReduced ω) :
    (rightInversionsOfWord cs ω).card = ω.length := by
  rw [rightInversionsOfWord,
    List.toFinset_card_of_nodup (CoxeterSystem.IsReduced.nodup_rightInvSeq cs hω)]
  exact cs.length_rightInvSeq ω

theorem card_leftInversionsOfWord {ω : List B} [DecidableEq W]
    (hω : cs.IsReduced ω) :
    (leftInversionsOfWord cs ω).card = ω.length := by
  rw [leftInversionsOfWord,
    List.toFinset_card_of_nodup (CoxeterSystem.IsReduced.nodup_leftInvSeq cs hω)]
  exact cs.length_leftInvSeq ω

theorem isRightInversion_of_mem_finset {ω : List B} [DecidableEq W]
    (hω : cs.IsReduced ω) {t : W} (ht : t ∈ rightInversionsOfWord cs ω) :
    cs.IsRightInversion (cs.wordProd ω) t := by
  exact cs.isRightInversion_of_mem_rightInvSeq hω (by simpa [rightInversionsOfWord] using ht)

theorem isLeftInversion_of_mem_finset {ω : List B} [DecidableEq W]
    (hω : cs.IsReduced ω) {t : W} (ht : t ∈ leftInversionsOfWord cs ω) :
    cs.IsLeftInversion (cs.wordProd ω) t := by
  exact cs.isLeftInversion_of_mem_leftInvSeq hω (by simpa [leftInversionsOfWord] using ht)

inductive IsContextualBraidMove (M : CoxeterMatrix B) : List B → List B → Prop
  | mk (u v : List B) (i j : B) :
      IsContextualBraidMove M
        (u ++ CoxeterSystem.braidWord M i j ++ v)
        (u ++ CoxeterSystem.braidWord M j i ++ v)

theorem IsContextualBraidMove.wordProd_eq {ω ω' : List B}
    (h : IsContextualBraidMove (M := M) ω ω') :
    cs.wordProd ω = cs.wordProd ω' := by
  cases h with
  | mk u v i j =>
      simp only [cs.wordProd_append]
      rw [cs.wordProd_braidWord_eq]

def BraidEquivalent (M : CoxeterMatrix B) : List B → List B → Prop :=
  Relation.EqvGen (IsContextualBraidMove M)

theorem BraidEquivalent.wordProd_eq {ω ω' : List B}
    (h : BraidEquivalent M ω ω') :
    cs.wordProd ω = cs.wordProd ω' := by
  induction h with
  | rel _ _ h => exact IsContextualBraidMove.wordProd_eq cs h
  | refl _ => rfl
  | symm _ _ _ ih => exact ih.symm
  | trans _ _ _ _ _ ih₁ ih₂ => exact ih₁.trans ih₂

end Coxeter

section Nilpotent

variable {K : Type*} [CommRing K]

namespace StandardSL2

def e : Matrix (Fin 2) (Fin 2) K := !![0, 1; 0, 0]
def h : Matrix (Fin 2) (Fin 2) K := !![1, 0; 0, -1]
def f : Matrix (Fin 2) (Fin 2) K := !![0, 0; 1, 0]

theorem lie_h_e : ⁅h (K := K), e (K := K)⁆ = (2 : K) • e (K := K) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ring.lie_def, e, h]
  ring

theorem lie_h_f : ⁅h (K := K), f (K := K)⁆ = -(2 : K) • f (K := K) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ring.lie_def, f, h]
  ring

theorem lie_e_f : ⁅e (K := K), f (K := K)⁆ = h (K := K) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Ring.lie_def, e, f, h]

theorem e_nilpotent : IsNilpotent (e (K := K) : Matrix (Fin 2) (Fin 2) K) := by
  refine ⟨2, ?_⟩
  ext i j
  fin_cases i <;> fin_cases j <;> simp [e, Matrix.mul_apply, pow_two]

theorem f_nilpotent : IsNilpotent (f (K := K) : Matrix (Fin 2) (Fin 2) K) := by
  refine ⟨2, ?_⟩
  ext i j
  fin_cases i <;> fin_cases j <;> simp [f, Matrix.mul_apply, pow_two]

theorem ad_e_nilpotent :
    IsNilpotent (LieAlgebra.ad K (Matrix (Fin 2) (Fin 2) K) (e (K := K))) :=
  LieAlgebra.ad_nilpotent_of_nilpotent K e_nilpotent

end StandardSL2

end Nilpotent

end AI4MathShortProjects
