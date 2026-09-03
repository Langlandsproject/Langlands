---
id: tori.classification_hom_level
title: Homomorphisms of Tori Correspond to Lattice Maps
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
- AlgebraicGroups.Forms
uses:
- reductive_groups.diagonalizable_groups_antiequivalence
- forms.hopf_descent
- tori.character_and_cocharacter_lattices
- tori.characters_as_group_like_elements
- tori.twisted_form_of_lattice
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.CharLattice
  - LanglandsLean.AlgebraicGroups.Tori.Classification
  declarations:
  - Langlands.Tori.charLatticeMap
  - Langlands.Tori.charLatticeMap_galAct
  - Langlands.Tori.existsUnique_bialgHom_of_equivariant
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 13.1"
    format: section
    note: "Proposition 13.1.4, full faithfulness direction."
verification:
  statement: accepted
  proof: accepted
  alignment: pending
generality:
  reviewed: true
  prompt: "Is the hom bijection stated for tori over an arbitrary field split by a common finite Galois extension, contravariantly and compatibly with composition?"
  verdict: "Yes. Both tori are assumed split by the same finite Galois extension E (always arrangeable by enlarging E); the bijection is contravariant and functorial."
tags:
- torus
- homomorphism
- galois-lattice
- theorem
- AlgebraicGroups.Tori
---

# Homomorphisms of Tori Correspond to Lattice Maps

Let \(E/k\) be a finite Galois extension with group
\(\Gamma = \operatorname{Gal}(E/k)\), and let \(T, T'\) be tori over
\(k\) split by \(E\). Then the character-lattice functor gives a
bijection
\[
\operatorname{Hom}_{k\text{-grp}}(T,\, T')
\;\;\xrightarrow{\;\sim\;}\;\;
\operatorname{Hom}_{\Gamma}\bigl(X^*(T'),\, X^*(T)\bigr),
\qquad f \longmapsto X^*(f) = (\chi \mapsto \chi \circ f_E),
\]
where the right-hand side is the group of \(\Gamma\)-equivariant
homomorphisms of the character lattices
([[node:tori.character_and_cocharacter_lattices]]). The bijection is
contravariant and compatible with composition and identities.

*Proof.*
**Step 1: descent of homs.** \(k\)-homomorphisms \(T \to T'\)
correspond to \(k\)-Hopf algebra maps \(k[T'] \to k[T]\), and by the
hom part of [[node:forms.hopf_descent]] these correspond to
\(\Gamma\)-equivariant \(E\)-Hopf maps \(E[T'_E] \to E[T_E]\), i.e.
\[
\operatorname{Hom}_{k\text{-grp}}(T, T')
\;\cong\;
\operatorname{Hom}_{E\text{-grp}}(T_E,\, T'_E)^{\Gamma},
\]
where \(\Gamma\) acts on an \(E\)-homomorphism by conjugating with
the semilinear actions on both coordinate algebras.

**Step 2: the split case.** Over \(E\) both tori are split, so by
Cartier duality for diagonalizable groups
([[node:reductive_groups.diagonalizable_groups_antiequivalence]])
\[
\operatorname{Hom}_{E\text{-grp}}(T_E,\, T'_E)
\;\cong\;
\operatorname{Hom}_{\mathbb{Z}}\bigl(X^*(T'),\, X^*(T)\bigr),
\]
contravariantly: an \(E\)-homomorphism of split tori is determined by
its effect on characters, and every lattice map arises (on group
algebras, \(e^{m'} \mapsto e^{\phi(m')}\)).

**Step 3: matching the actions.** The \(\Gamma\)-action of Step 1 on
\(E\)-homomorphisms corresponds under Step 2 to the conjugation
action on lattice maps,
\(\phi \mapsto \sigma_\gamma \circ \phi \circ \sigma'^{-1}_\gamma\):
this is the computation that the semilinear action permutes the
group-like bases by the lattice actions
([[node:tori.characters_as_group_like_elements]] transported as in
[[node:tori.twisted_form_of_lattice]] property (3)). Fixed points of
the conjugation action are exactly the \(\Gamma\)-equivariant lattice
maps. Combining the three displays gives the bijection; functoriality
holds because each step is compatible with composition. \(\square\)
