---
id: descent_and_forms.f_subgroup_field_of_definition
title: Field of Definition for Subgroups of F-Groups
kind: theorem
status: admitted
primary_topic: linear_algebraic_groups
topics:
- descent_and_forms
- linear_algebraic_groups
uses:
- descent_and_forms.rational_forms_of_linear_algebraic_groups
- descent_and_forms.galois_groups_and_descent_data
- linear_algebraic_groups.identity_component_normal_finite_index
- linear_algebraic_groups.algebraic_group_action_orbits_stabilizers
- linear_algebraic_groups.closed_image_of_homomorphism
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 12.1"
    format: section
    note: "Propositions 12.1.1-12.1.5: field of definition for identity components, stabilizers, kernels, centralizers, and intersections."
verification:
  statement: accepted
  proof: accepted
generality:
  reviewed: true
  prompt: "Does the theorem keep the perfect-field and separability hypotheses visible?"
  verdict: "Yes. The unconditional assertions are separated from statements that require a perfect field or a tangent-map/separability condition."
tags:
- springer
- f-group
- field-of-definition
- descent
- theorem
---

# Field of Definition for Subgroups of F-Groups

Let \(G\) be a linear algebraic group defined over a field \(F\), with
separable closure \(F_s\).

1. The identity component \(G^\circ\) is an \(F\)-subgroup.
2. If \(G\) acts on an \(F\)-variety \(X\) and \(x\in X(F)\), then the
   orbit \(Gx\) is defined over \(F\). The stabilizer \(G_x\) is defined over
   \(F\) if \(F\) is perfect, or if the tangent map
   \(T_eG\to T_x(Gx)\) is surjective.
3. If \(\varphi:G\to G'\) is a homomorphism of \(F\)-groups, then
   \(\ker(\varphi)\) is defined over \(F\) under the same perfectness or
   tangent-surjectivity hypotheses.
4. If \(G\) is connected and \(x,y\in G(F)\) are semisimple, then every
   nonempty transporter
   \[
   N_G(x,y)=\{g\in G:gxg^{-1}=y\}
   \]
   is defined over \(F\). In particular, centralizers of semisimple
   \(F\)-points are \(F\)-subgroups.
5. If \(H,K\subseteq G\) are \(F\)-subgroups, then \(H\cap K\) is defined
   over \(F\) if \(F\) is perfect, or if
   \[
   \operatorname{Lie}(H\cap K)=\operatorname{Lie}(H)\cap\operatorname{Lie}(K).
   \]

*Proof.*  
The identity component is stable under \(\operatorname{Gal}(F_s/F)\), because
it is the unique component containing the \(F\)-rational identity element.
Galois descent for closed subvarieties then shows it is defined over \(F\).

For actions, the orbit morphism \(G\to X\) is defined over \(F\). Its image
closure is therefore Galois-stable, and the orbit is open in its closure.
Descent gives the field of definition of the orbit. The stabilizer is the
fiber over \(x\); perfectness, or equivalently the stated separability
condition for the orbit morphism, ensures that this fiber descends as an
\(F\)-subgroup.

Kernels are stabilizers for the action of \(G\) on \(G'\) by
\(\varphi(g)x\). Transporters and centralizers of semisimple elements are
fibers of separable conjugacy orbit maps. Intersections descend when the
scheme-theoretic intersection has the expected tangent space; over a perfect
field this condition is automatic for the subgroup situations above.
