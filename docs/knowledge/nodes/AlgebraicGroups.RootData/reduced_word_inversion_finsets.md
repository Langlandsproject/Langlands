---
id: root_data.reduced_word_inversion_finsets
title: Reduced-Word Inversion Sequences as Finite Sets
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.coxeter_systems_and_bruhat_order
lean:
  modules:
  - LanglandsLean.Coxeter.InversionFinset
  declarations:
  - Langlands.Coxeter.rightInversionsOfWord
  - Langlands.Coxeter.leftInversionsOfWord
  - Langlands.Coxeter.card_rightInversionsOfWord
  - Langlands.Coxeter.card_leftInversionsOfWord
  - Langlands.Coxeter.isRightInversion_of_mem_rightInversionsOfWord
  - Langlands.Coxeter.isLeftInversion_of_mem_leftInversionsOfWord
verification:
  statement: accepted
  proof: accepted
  alignment: aligned
generality:
  reviewed: true
  prompt: "Does the finite-set construction require a finite Coxeter group?"
  verdict: "No. A finite word gives a finite inversion sequence in any Coxeter system; reducedness gives nodup and hence the cardinality formula."
tags:
- coxeter-system
- reduced-word
- inversion
- finset
- theorem
---

# Reduced-Word Inversion Sequences as Finite Sets

Let \(M\) be a Coxeter matrix on \(B\), let \(W\) be a group, and let
\(cs : \operatorname{CoxeterSystem}(M,W)\). For a word \(\omega\) in the
simple generators, define the right and left finite inversion sets by

\[
R(\omega) = \operatorname{toFinset}(\operatorname{rightInvSeq}_{cs}(\omega)),
\qquad
L(\omega) = \operatorname{toFinset}(\operatorname{leftInvSeq}_{cs}(\omega)).
\]

If \(\omega\) is reduced, then

\[
|R(\omega)| = |\omega|,
\qquad
|L(\omega)| = |\omega|.
\]

Every member of \(R(\omega)\) is a right inversion of the word product of
\(\omega\), and every member of \(L(\omega)\) is a left inversion of that
product.

*Proof.*  
Mathlib proves that the right and left inversion sequences of a reduced word
have no duplicates. Passing either sequence to a finite set therefore
preserves its length. Mathlib also proves that both inversion-sequence lengths
equal the length of the original word, giving the two cardinality formulas.
Finally, finite-set membership unfolds to membership in the corresponding
list, where Mathlib's inversion-sequence membership theorems give the stated
right or left inversion property.  
\(\square\)

This result supplies a finite-set interface to the inversion sequences in
[[node:root_data.coxeter_systems_and_bruhat_order|Coxeter systems
and Bruhat order]]. It does not assert the converse inclusion of every
inversion in these finite sets.
