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
lean:
  modules:
  - LanglandsLean.AlgebraicGroups.Tori.CharacterGroup
  - LanglandsLean.AlgebraicGroups.Tori.GaloisDescent
  - LanglandsLean.AlgebraicGroups.Tori.Speiser
  declarations:
  - Langlands.Tori.diagCharEquiv
  - Langlands.Tori.diag_bialgEquiv_iff_addEquiv
  - Langlands.Tori.twistedGroupAlgebra
  - Langlands.Tori.twistedGroupAlgebra_span_top
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
  alignment: pending
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
For a torus \(T\), all characters of \(T_{F_s}\) are defined over \(F_s\), and
the natural Galois action on \(F_s[T]\) preserves the character basis. Thus
\(X^*(T_{F_s})\) is a continuous \(\Gamma\)-module.

Conversely, for such a module \(M\), the group algebra \(F_s[M]\) has its
standard Hopf algebra structure and the semilinear \(\Gamma\)-action
\[
\gamma(ae^m)=\gamma(a)e^{\gamma m}.
\]
The fixed algebra descends this Hopf algebra to \(F\), giving an
\(F\)-torus with character module \(M\). These constructions are inverse.

The split criterion follows because an \(F\)-split torus has a basis of
\(F\)-defined characters, exactly a trivial Galois action. An \(F\)-split
subtorus corresponds to a nonzero fixed cocharacter; hence anisotropy is
equivalent to the absence of nonzero Galois-fixed cocharacters, and by duality
to the absence of nonzero Galois-fixed characters. The complement statement is
Maschke's theorem over \(\mathbb{Q}\) applied to the finite quotient through
which \(\Gamma\) acts.
