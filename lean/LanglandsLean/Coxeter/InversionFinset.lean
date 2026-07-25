import Mathlib.GroupTheory.Coxeter.Inversion

/-!
# Reduced-word inversion sequences as finite sets

This module packages the left and right inversion sequences of a Coxeter word
as finite sets. For a reduced word, their cardinalities equal the word length,
and every member is a corresponding inversion of the represented element.

No converse membership statement is made here.

## Blueprint

`root_data_and_duality.reduced_word_inversion_finsets`

## GitHub issue

<https://github.com/Langlandsproject/Langlands/issues/47>
-/

namespace Langlands.Coxeter

variable {B : Type*}
variable {W : Type*} [Group W]
variable {M : CoxeterMatrix B} (cs : CoxeterSystem M W)

/-- The right inversion sequence of a word, packaged as a finite set. -/
def rightInversionsOfWord (ω : List B) [DecidableEq W] : Finset W :=
  (cs.rightInvSeq ω).toFinset

/-- The left inversion sequence of a word, packaged as a finite set. -/
def leftInversionsOfWord (ω : List B) [DecidableEq W] : Finset W :=
  (cs.leftInvSeq ω).toFinset

@[simp]
theorem mem_rightInversionsOfWord [DecidableEq W] {ω : List B} {t : W} :
    t ∈ rightInversionsOfWord cs ω ↔ t ∈ cs.rightInvSeq ω := by
  simp [rightInversionsOfWord]

@[simp]
theorem mem_leftInversionsOfWord [DecidableEq W] {ω : List B} {t : W} :
    t ∈ leftInversionsOfWord cs ω ↔ t ∈ cs.leftInvSeq ω := by
  simp [leftInversionsOfWord]

@[simp]
theorem card_rightInversionsOfWord [DecidableEq W] {ω : List B}
    (hω : cs.IsReduced ω) :
    (rightInversionsOfWord cs ω).card = ω.length := by
  calc
    (rightInversionsOfWord cs ω).card = (cs.rightInvSeq ω).length :=
      List.toFinset_card_of_nodup hω.nodup_rightInvSeq
    _ = ω.length := cs.length_rightInvSeq ω

@[simp]
theorem card_leftInversionsOfWord [DecidableEq W] {ω : List B}
    (hω : cs.IsReduced ω) :
    (leftInversionsOfWord cs ω).card = ω.length := by
  calc
    (leftInversionsOfWord cs ω).card = (cs.leftInvSeq ω).length :=
      List.toFinset_card_of_nodup hω.nodup_leftInvSeq
    _ = ω.length := cs.length_leftInvSeq ω

theorem isRightInversion_of_mem_rightInversionsOfWord [DecidableEq W]
    {ω : List B} (hω : cs.IsReduced ω) {t : W}
    (ht : t ∈ rightInversionsOfWord cs ω) :
    cs.IsRightInversion (cs.wordProd ω) t := by
  exact cs.isRightInversion_of_mem_rightInvSeq hω
    (mem_rightInversionsOfWord cs |>.mp ht)

theorem isLeftInversion_of_mem_leftInversionsOfWord [DecidableEq W]
    {ω : List B} (hω : cs.IsReduced ω) {t : W}
    (ht : t ∈ leftInversionsOfWord cs ω) :
    cs.IsLeftInversion (cs.wordProd ω) t := by
  exact cs.isLeftInversion_of_mem_leftInvSeq hω
    (mem_leftInversionsOfWord cs |>.mp ht)

theorem rightInversionsOfWord_ext [DecidableEq W] {ω ω' : List B}
    (h : ∀ t, t ∈ rightInversionsOfWord cs ω ↔ t ∈ rightInversionsOfWord cs ω') :
    rightInversionsOfWord cs ω = rightInversionsOfWord cs ω' :=
  Finset.ext h

theorem leftInversionsOfWord_ext [DecidableEq W] {ω ω' : List B}
    (h : ∀ t, t ∈ leftInversionsOfWord cs ω ↔ t ∈ leftInversionsOfWord cs ω') :
    leftInversionsOfWord cs ω = leftInversionsOfWord cs ω' :=
  Finset.ext h

/-! ### Finite example -/

example [DecidableEq W] : rightInversionsOfWord cs [] = ∅ := by
  simp [rightInversionsOfWord]

end Langlands.Coxeter
