---
id: linear_algebraic_groups.affine_finite_type_faithful_representation
title: Affine Finite-Type Groups Have Faithful Finite-Dimensional Representations
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.algebraic_group_definition
- linear_algebraic_groups.faithful_linear_representation_definition
- linear_algebraic_groups.hopf_spec_essential_image_affine
- linear_algebraic_groups.finite_dim_subcomodule_lemma
- linear_algebraic_groups.embedding_theorem
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.FaithfulRepresentation
  declarations:
  - Langlands.AlgebraicGeometry.existsClosedImmersionToGeneralLinear
  - Langlands.AlgebraicGeometry.existsClosedImmersionToGeneralLinear_of_hasFaithfulLinearRepresentation
    - Langlands.AlgebraicGeometry.HasFaithfulLinearRepresentation
verification:
  statement: accepted
  alignment: pending
generality:
  reviewed: true
  prompt: "Is the theorem stated for arbitrary algebraic groups over an arbitrary field?"
  verdict: "Yes. No characteristic, separability, or smoothness assumption on \\(k\\); no smoothness assumption on \\(G\\)."
tags:
- embedding-theorem
- theorem
- linear-algebraic-groups
---

# Affine Finite-Type Groups Have Faithful Finite-Dimensional Representations

Let \(k\) be a field and \(G\) an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(\operatorname{Spec} k\). Then \(G\) admits a
[[node:linear_algebraic_groups.faithful_linear_representation_definition|faithful finite-dimensional representation]].
Equivalently, \(G\) is isomorphic, as a group scheme over
\(\operatorname{Spec} k\), to a closed subgroup scheme of some
\(\operatorname{GL}_n\).

This is the signature theorem of affine algebraic groups (Springer
§2.3.7, Borel §1.10, Waterhouse §3.4, Milne §4.9). In this project the
statement is recorded as the proposition
\(\texttt{HasFaithfulLinearRepresentation}\,k\,G\). The proof is the
subject of Phase B (Hopf algebra correspondence + finite-generation
lemma for comodules + regular representation argument); see
[[node:linear_algebraic_groups.embedding_theorem|the embedding theorem]].

*Proof.* (Statement form here; proof in
[[node:linear_algebraic_groups.embedding_theorem|the embedding theorem]].)

The proof proceeds as follows:

1. Apply the
   [[node:linear_algebraic_groups.hopf_spec_essential_image_affine|Hopf algebra correspondence]]
   to identify \(G\) with \(\operatorname{Spec} A\) for a finitely
   generated commutative Hopf \(k\)-algebra \(A\).
2. Apply
   [[node:linear_algebraic_groups.finite_dim_subcomodule_lemma|finite generation of comodules]]
   to find a finite-dimensional \(G\)-stable subspace
   \(W \subseteq A\) containing a \(k\)-algebra generating set of \(A\).
3. The coaction of \(A\) on \(W\) defines a representation
   \(\rho : G \to \operatorname{GL}(W)\); the corresponding ring
   homomorphism is surjective because \(W\) generates \(A\), so
   \(\rho\) is a closed immersion.
\(\square\)
