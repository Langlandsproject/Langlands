---
id: linear_algebraic_groups.hopf_spec_fully_faithful
title: Spec Functor on Hopf Algebras Is Fully Faithful
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.hopf_spec_functor
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
that \(\operatorname{algSpec}_R\) is fully faithful. The
\(\operatorname{mapGrp}\) construction preserves full-faithfulness (a
morphism of group objects in a Cartesian monoidal category is determined
by the underlying morphism of objects), so the Hopf-level lift
\(\operatorname{hopfSpec}_R = (\operatorname{algSpec}_R).\operatorname{mapGrp}\)
is fully faithful as well.  
\(\square\)
