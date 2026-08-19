---
id: tori.f_tori_galois_module_classification
title: F-Tori Are Classified by Galois Modules
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
- AlgebraicGroups.Forms
uses:
- tori.algebraic_tori
- reductive_groups.diagonalizable_groups_antiequivalence
- tori.character_and_cocharacter_lattices
- forms.galois_groups_and_descent_data
- forms.galois_descent_for_vector_spaces
- forms.rational_forms_of_linear_algebraic_groups
- forms.hopf_descent
- tori.twisted_form_of_lattice
- tori.classification_hom_level
- tori.characters_as_group_like_elements
- tori.anisotropic_torus
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 13.1"
    format: section
    note: "Proposition 13.1.4: diagonalizable F-groups and Galois modules."
  - artifact: springer-linear-algebraic-groups
    locator: "Section 13.2"
    format: section
    note: "Proposition 13.2.2: split and anisotropic tori via Galois invariants."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the classification use the separable Galois action and not assume the torus is split over F?"
  verdict: "Yes. The character lattice is a finite-rank continuous Galois module; split, anisotropic, and general tori are read from this module."
tags:
- springer
- torus
- galois-module
- f-group
- theorem
- AlgebraicGroups.Tori
---

# F-Tori Are Classified by Galois Modules

Let \(F_s/F\) be a separable closure with Galois group
\(\Gamma=\operatorname{Gal}(F_s/F)\). The functor
\[
T\longmapsto X^*(T_{F_s})
\]
gives an anti-equivalence between \(F\)-tori and finite-rank free abelian
groups with continuous \(\Gamma\)-action.

Under this correspondence:

- \(T\) is \(F\)-split if and only if \(\Gamma\) acts trivially on
  \(X^*(T_{F_s})\), equivalently on \(X_*(T_{F_s})\);
- \(T\) is anisotropic if and only if \(X^*(T_{F_s})^\Gamma=0\),
  equivalently \(X_*(T_{F_s})^\Gamma=0\);
- every \(F\)-torus is split over \(F_s\);
- every \(F\)-subtorus has an almost complementary \(F\)-subtorus: if
  \(T_1\subseteq T\), then there is \(T_2\subseteq T\) with
  \(T=T_1T_2\) and \(T_1\cap T_2\) finite.

*Proof.*
The statement asserts an anti-equivalence of categories; per the
working reduction to a finite level (every torus is split by a finite
Galois extension, and the continuous \(\Gamma\)-action factors
through its group — see the discussion in
[[node:tori.character_and_cocharacter_lattices]]), it suffices to
prove, for each finite Galois \(E/k\) with group
\(\Gamma_E = \operatorname{Gal}(E/k)\), an anti-equivalence between
tori split by \(E\) and \(\Gamma_E\)-lattices, compatibly with
enlarging \(E\). Three steps, each with its own node:

1. **Well-definedness.** For \(T\) split by \(E\), the character
   lattice \(X^*(T_E)\) is a finite free \(\mathbb{Z}\)-module and
   the Galois action on \(E[T_E]\) preserves the character basis, so
   \(X^*(T)\) is a \(\Gamma_E\)-lattice, functorially in \(T\)
   ([[node:tori.character_and_cocharacter_lattices]], with the
   characters realized as group-likes of the coordinate algebra by
   [[node:tori.characters_as_group_like_elements]]).

2. **Full faithfulness.** The functor is bijective on homomorphism
   sets:
   \(\operatorname{Hom}_k(T, T') \cong
   \operatorname{Hom}_{\Gamma_E}(X^*(T'), X^*(T))\) — this is
   [[node:tori.classification_hom_level]], whose proof combines the
   hom part of Galois descent for Hopf algebras
   ([[node:forms.hopf_descent]]) with Cartier duality over the
   splitting field
   ([[node:reductive_groups.diagonalizable_groups_antiequivalence]]).

3. **Essential surjectivity.** Every \(\Gamma_E\)-lattice
   \((M, \sigma)\) is the character lattice of a torus: the twisted
   form \(T(M,\sigma) = \operatorname{Spec} E[M]^{\Gamma_E}\)
   constructed in [[node:tori.twisted_form_of_lattice]] is a torus
   split by \(E\) with \(X^*(T(M,\sigma)) \cong (M,\sigma)\).

The four bullets under the correspondence:

- **Split criterion.** A split torus has a basis of \(k\)-defined
  characters, so the action is trivial; conversely trivial action
  gives \(T = D(M)\) split
  ([[node:tori.twisted_form_of_lattice]], property (4)). The
  \(X_*\) formulation follows by the perfect pairing
  ([[node:tori.character_and_cocharacter_lattices]]).
- **Anisotropy criterion.** This is the working definition and the
  averaging argument recorded in [[node:tori.anisotropic_torus]].
- **Splitting over \(F_s\).** Continuity of the action on the
  discrete lattice \(X^*\) forces a finite-index kernel, whose fixed
  field is a finite Galois splitting extension.
- **Almost-complement.** Over \(\mathbb{Q}\), Maschke's theorem for
  the finite quotient through which \(\Gamma\) acts splits off
  \(X^*(T_1)_{\mathbb{Q}}\) as a direct summand; scaling the
  projection by a suitable integer produces a sublattice
  complementary up to finite index, i.e. a subtorus \(T_2\) with
  \(T = T_1 T_2\) and \(T_1 \cap T_2\) finite.

\(\square\)

## Remarks

Downstream nodes that develop the bullets: the minimal splitting
field and its Galois group are identified in
[[node:tori.splitting_field]]; the split–anisotropic decomposition
theory built on the almost-complement statement is
[[node:tori.split_anisotropic_decomposition]]. Both consume this
classification, so they are cited here only as forward pointers, not
as inputs.
