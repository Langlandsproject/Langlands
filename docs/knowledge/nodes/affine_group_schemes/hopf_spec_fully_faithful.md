---
id: affine_group_schemes.hopf_spec_fully_faithful
title: Spec Functor on Hopf Algebras Is Fully Faithful
kind: theorem
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- affine_group_schemes.hopf_spec_functor
verification:
  statement: accepted
generality:
  reviewed: true
  prompt: "Is the statement formulated for an arbitrary commutative base ring \\(R\\)?"
  verdict: "Yes. The full-faithfulness is a consequence of \\(\\operatorname{Spec}\\) being fully faithful on \\(\\mathsf{CommRingCat}\\) and of \\(\\operatorname{mapGrp}\\) reflecting full-faithfulness."
tags:
- hopf-spec
- theorem
- linear-algebraic-groups
---

# Spec Functor on Hopf Algebras Is Fully Faithful

The functor

\[
\operatorname{hopfSpec}_R : \mathsf{Grp}((\mathsf{CommAlgCat}\,R)^{\mathrm{op}})
  \longrightarrow \mathsf{Grp}(\mathsf{Over}(\operatorname{Spec} R))
\]

is fully faithful.

*Proof sketch.*  
The classical Spec functor
\(\operatorname{Spec} : \mathsf{CommRingCat}^{\mathrm{op}} \to
\mathsf{Scheme}\) is fully faithful (Stacks 01HU). Restricting to
\(R\)-algebras and composing with the slice-category equivalences yields
that \(\operatorname{algSpec}_R\) is fully faithful.

Hopf-level full-faithfulness then follows because a morphism of group
objects is uniquely determined by its underlying morphism on the
underlying objects (this is a general fact about group objects in any
Cartesian monoidal category: the group-hom axioms are a property, not
extra data). Concretely: given Hopf algebras \(A, A'\) and a morphism
of underlying schemes \(\varphi : \operatorname{Spec} A' \to \operatorname{Spec} A\)
in \(\mathsf{Over}(\operatorname{Spec} R)\), if \(\varphi\) is a group
object morphism then by \(\operatorname{algSpec}_R\) full-faithfulness
\(\varphi = \operatorname{algSpec}_R(f)\) for a unique
\(R\)-algebra hom \(f : A \to A'\); the group-hom property of
\(\varphi\) translates to \(f\) preserving the Hopf structure
(comultiplication, counit, antipode), via the Yoneda determination
of the group object structures in
[[node:affine_group_schemes.hopf_spec_grpobj_via_yoneda|the Yoneda
construction]].  
\(\square\)
