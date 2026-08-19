---
id: reductive_structure.diagonalizable_groups_antiequivalence
title: Diagonalizable Groups Are Dual to Character Groups
kind: theorem
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
- root_data_and_duality
uses:
- reductive_structure.diagonalizable_group_characterization
lean:
  modules:
  - LanglandsLean.Tori.CharacterGroup
  declarations:
  - Langlands.Tori.diagCharEquiv
  - Langlands.Tori.diagHomEquiv
  - Langlands.Tori.diag_bialgEquiv_iff_addEquiv
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 3.2"
    format: section
    note: "Theorems 3.2.6 and 3.2.7: diagonalizable groups and character groups."
verification:
  statement: accepted
  proof: accepted
  alignment: pending
generality:
  reviewed: true
  prompt: "Does the statement distinguish diagonalizable groups from tori?"
  verdict: "Yes. Tori correspond to free character groups; finite diagonalizable groups allow torsion in the character group subject to the characteristic constraints of the classical setting."
tags:
- springer
- diagonalizable-group
- character-lattice
- torus
- theorem
- reductive-structure
---

# Diagonalizable Groups Are Dual to Character Groups

The functor
\[
D \longmapsto X(D)=\operatorname{Hom}(D,\mathbb{G}_m)
\]
gives an anti-equivalence between diagonalizable algebraic groups over an
algebraically closed field and finitely generated abelian character groups
of the allowed type in the given characteristic. Under this correspondence,
groups with free abelian character group of finite rank are exactly the
split tori; how the remaining invariants (smoothness, connectedness)
read off the torsion of the character group is recorded where tori are
defined.

For a finitely generated abelian group \(M\), the associated diagonalizable
group is
\[
D(M)=\operatorname{Spec} k[M],
\]
where \(k[M]\) is the group algebra with Hopf structure
\(\Delta(e^m)=e^m\otimes e^m\).

*Proof.*  
For diagonalizable \(D\), the character decomposition of \(k[D]\) identifies
the coordinate Hopf algebra with the group algebra \(k[X(D)]\). A morphism
\(D_1\to D_2\) pulls characters back, giving a homomorphism
\(X(D_2)\to X(D_1)\).

Conversely, any finitely generated abelian group \(M\) defines the Hopf
algebra \(k[M]\), hence the diagonalizable group \(D(M)\). Its characters
are exactly the basis elements indexed by \(M\). These two constructions are
inverse to each other. Groups with torsion-free character group are
precisely the split tori; note that in characteristic \(p > 0\)
connectedness alone does not force torsion-freeness, since the character
group \(\mathbb{Z}/p\) gives the connected non-smooth group \(\mu_p\).
