---
id: linear_algebraic_groups.hopf_spec_grpobj_via_yoneda
title: Group Object Structure on Spec A via Yoneda
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.algebra_homs_form_group_under_convolution
- linear_algebraic_groups.spec_representability_via_global_sections
- linear_algebraic_groups.affine_group_scheme_definition
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Is the construction stated for an arbitrary commutative base ring R?"
  verdict: "Yes. The Yoneda + convolution argument works over any commutative R; specialization to a field is a special case."
tags:
- hopf-spec
- yoneda
- theorem
- linear-algebraic-groups
---

# Group Object Structure on \(\operatorname{Spec} A\) via Yoneda

Let \(R\) be a commutative ring and \(A\) a commutative \(R\)-Hopf
algebra. Then the affine scheme \(\operatorname{Spec} A\), viewed as an
object of \(\mathsf{Over}(\operatorname{Spec} R)\) via the structure
morphism \(\operatorname{Spec}(R \to A)\), carries a canonical group
object structure. Equivalently, \(\operatorname{Spec} A\) is an
[[node:linear_algebraic_groups.affine_group_scheme_definition|affine group scheme]]
over \(\operatorname{Spec} R\).

*Proof.*  
We use the Yoneda lemma to bypass the explicit construction of
multiplication, identity, and inverse morphisms.

*Setup.* The category \(\mathsf{Over}(\operatorname{Spec} R)\) is
Cartesian monoidal (binary products are pullbacks over \(\operatorname{Spec} R\),
terminal object is \(\operatorname{Spec} R\) itself). This is
\(\texttt{Over.cartesianMonoidalCategory}\) in Mathlib; it is the
ambient structure needed for the notion of group object in
\(\mathsf{Over}(\operatorname{Spec} R)\).

Step 1 — *the group-valued presheaf, defined for all \(T\).* For any
object \(T \in \mathsf{Over}(\operatorname{Spec} R)\) (not necessarily
affine), the global-sections ring \(\Gamma(T, \mathcal{O}_T)\) is a
commutative \(R\)-algebra via the structure morphism
\(T \to \operatorname{Spec} R\). By
[[node:linear_algebraic_groups.algebra_homs_form_group_under_convolution|the convolution group structure]],
the set
\(\operatorname{Hom}_{R\text{-Alg}}\bigl(A,\, \Gamma(T, \mathcal{O}_T)\bigr)\)
is a group. The assignment

\[
F : (\mathsf{Over}(\operatorname{Spec} R))^{\mathrm{op}} \longrightarrow \mathsf{Grp},
\qquad
F(T) = \operatorname{Hom}_{R\text{-Alg}}\bigl(A,\, \Gamma(T, \mathcal{O}_T)\bigr)
\]

is functorial in \(T\): a morphism \(g : T' \to T\) gives
\(g^\sharp : \Gamma(T, \mathcal{O}_T) \to \Gamma(T', \mathcal{O}_{T'})\)
as a ring hom, and post-composing an algebra hom
\(\varphi : A \to \Gamma(T, \mathcal{O}_T)\) with \(g^\sharp\) preserves
convolution (the convolution product depends only on \(\Delta_A\) and
on the target's multiplication, both of which are preserved by ring
homs).

Step 2 — *representability.* By
[[node:linear_algebraic_groups.spec_representability_via_global_sections|the \(\operatorname{Spec} \dashv \Gamma\) adjunction]],
there is a natural bijection of sets

\[
\operatorname{Hom}_{\mathsf{Over}(\operatorname{Spec} R)}(T,\, \operatorname{Spec} A)
\;\;\simeq\;\;
\operatorname{Hom}_{R\text{-Alg}}\bigl(A,\, \Gamma(T, \mathcal{O}_T)\bigr)
\;=\; F(T).
\]

Hence the underlying set-valued functor \(F \circ \operatorname{forget}\)
is the Yoneda presheaf representable by \(\operatorname{Spec} A\).

Step 3 — *Yoneda yields the group object structure.* Applying
\(\operatorname{GrpObj.ofRepresentableBy}\) (Mathlib's
\(\texttt{CategoryTheory.Monoidal.Cartesian.Grp\_}\)) to the
group-valued presheaf \(F\) and the representability witness from
Step 2 produces a canonical \(\operatorname{GrpObj}\) structure on
\(\operatorname{Spec} A\) in \(\mathsf{Over}(\operatorname{Spec} R)\).
The multiplication, identity, and inverse morphisms of this group
object are uniquely determined (by Yoneda) by the group structure on
the points functor.  
\(\square\)

**Remark.** This construction bypasses the explicit dualization of the
Hopf comultiplication, counit, and antipode into scheme morphisms via
the isomorphism \(\operatorname{Spec}(A \otimes_R A) \cong \operatorname{Spec} A \times_{\operatorname{Spec} R} \operatorname{Spec} A\)
and the verification of six group object axioms. The proof obligations
shift from "verify six scheme-level axioms" to "verify the convolution
group structure on algebra homs and its naturality", which is shorter
and reuses
[[node:linear_algebraic_groups.algebra_homs_form_group_under_convolution|the dedicated theorem]].
