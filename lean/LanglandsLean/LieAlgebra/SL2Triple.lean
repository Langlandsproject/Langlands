import Mathlib.Algebra.Lie.Matrix
import Mathlib.Algebra.Lie.Nilpotent
import Mathlib.Algebra.Lie.AdjointAction.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic

namespace LanglandsLean
namespace StandardMatrixSL2

open scoped Matrix

abbrev Mat2 (K : Type*) := Matrix (Fin 2) (Fin 2) K

variable (K : Type*) [CommRing K]

attribute [local instance 100] LieRing.ofAssociativeRing

def e : Mat2 K := !![0, 1; 0, 0]

def h : Mat2 K := !![1, 0; 0, -1]

def f : Mat2 K := !![0, 0; 1, 0]

structure SL2Triple (e h f : Mat2 K) : Prop where
  h_e : ⁅h, e⁆ = (2 : K) • e
  h_f : ⁅h, f⁆ = (-2 : K) • f
  e_f : ⁅e, f⁆ = h

theorem standard_isSL2Triple : SL2Triple K (e K) (h K) (f K) := by
  constructor <;>
    ext i j <;>
    fin_cases i <;>
    fin_cases j <;>
    simp [e, h, f, LieRing.of_associative_ring_bracket] <;>
    ring

theorem e_sq : e K * e K = 0 := by
  ext i j
  fin_cases i <;>
    fin_cases j <;>
    simp [e, Matrix.mul_apply, Fin.sum_univ_two]

theorem f_sq : f K * f K = 0 := by
  ext i j
  fin_cases i <;>
    fin_cases j <;>
    simp [f, Matrix.mul_apply, Fin.sum_univ_two]

theorem e_isNilpotent : IsNilpotent (e K) := by
  refine ⟨2, ?_⟩
  simpa [pow_two] using e_sq K

theorem f_isNilpotent : IsNilpotent (f K) := by
  refine ⟨2, ?_⟩
  simpa [pow_two] using f_sq K

theorem ad_e_isNilpotent :
    IsNilpotent (LieAlgebra.ad K (Mat2 K) (e K)) :=
  LieAlgebra.ad_nilpotent_of_nilpotent (R := K) (e_isNilpotent K)

end StandardMatrixSL2
end LanglandsLean
