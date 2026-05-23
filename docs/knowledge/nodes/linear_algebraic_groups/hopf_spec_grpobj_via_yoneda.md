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
- linear_algebraic_groups.hopf_spec_functor
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

Step 1 — *the group-valued presheaf.* For any commutative \(R\)-algebra
\(B\), the
[[node:linear_algebraic_groups.algebra_homs_form_group_under_convolution|set of \(R\)-algebra homomorphisms \(\operatorname{Hom}_{R\text{-Alg}}(A, B)\) is a group under convolution]].
The assignment \(B \mapsto (\operatorname{Hom}_{R\text{-Alg}}(A, B), *)\)
is functorial in \(B\) (post-composition by a morphism
\(B \to B'\) sends a convolution product to a convolution product, by
the algebra-hom property of the post-composition map). Equivalently,
we obtain a functor

\[
F : (\mathsf{CommAlg}_R)^{\mathrm{op}} \;\longrightarrow\; \mathsf{Grp},
\qquad F(B) = (\operatorname{Hom}_{R\text{-Alg}}(A, B), *).
\]

Composing with the equivalence \(\mathsf{Over}(\operatorname{Spec} R) \simeq (\mathsf{CommAlg}_R)^{\mathrm{op}}\)
(restricted to affine objects) and extending to all of
\(\mathsf{Over}(\operatorname{Spec} R)\) via Zariski sheafification (or
working with the restricted version when convenient) yields a
group-valued presheaf
\(\widetilde{F} : (\mathsf{Over}(\operatorname{Spec} R))^{\mathrm{op}} \to \mathsf{Grp}\).

Step 2 — *representability.* Under the standard
[[node:linear_algebraic_groups.hopf_spec_functor|algSpec equivalence]]
between commutative \(R\)-algebras and affine \(R\)-schemes,
\(\operatorname{Hom}_{R\text{-Alg}}(A, B)\) is naturally identified
with \(\operatorname{Hom}_{\mathsf{Over}(\operatorname{Spec} R)}(\operatorname{Spec} B, \operatorname{Spec} A)\).
Hence the underlying set-valued functor \(\widetilde{F} \circ \text{forget}\)
is the Yoneda presheaf representable by \(\operatorname{Spec} A\).

Step 3 — *Yoneda yields the group object structure.* Applying
\(\operatorname{GrpObj.ofRepresentableBy}\) (Mathlib's
\(\texttt{CategoryTheory.Monoidal.Cartesian.Grp\_}\)) to the
group-valued presheaf \(\widetilde{F}\) and the representability
witness from Step 2 produces a canonical \(\operatorname{GrpObj}\)
structure on \(\operatorname{Spec} A\) in
\(\mathsf{Over}(\operatorname{Spec} R)\). The multiplication, identity,
and inverse morphisms of this group object are uniquely determined by
the group structure on the points functor.  
\(\square\)

**Remark.** This construction bypasses the explicit dualization of the
Hopf comultiplication, counit, and antipode into scheme morphisms via
the isomorphism \(\operatorname{Spec}(A \otimes_R A) \cong \operatorname{Spec} A \times_{\operatorname{Spec} R} \operatorname{Spec} A\)
and the verification of six group object axioms. The proof obligations
shift from "verify six scheme-level axioms" to "verify the convolution
group structure on algebra homs and its naturality", which is shorter
and reuses
[[node:linear_algebraic_groups.algebra_homs_form_group_under_convolution|the dedicated theorem]].
