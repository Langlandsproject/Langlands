---
id: affine_group_schemes.base_change
title: Base Change
kind: topic
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
uses:
- foundational_inputs.fields_and_field_extensions
- affine_group_schemes.affine_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does this treatment of base change apply to arbitrary morphisms of base schemes, not just field extensions?"
  verdict: "Yes. The pullback construction works for any morphism `f : T → S`, with the field-extension case being a special case."
tags:
- base-change
- linear-algebraic-groups
---

# Base Change

**Base change** is the operation that transports a group scheme \(G/S\)
along a morphism \(f : T \to S\) to a group scheme \(G_T/T\) over the
new base \(T\). Concretely \(G_T = G \times_S T\), the fibre product
\(T\)-scheme.

## Definition

Given:

- an algebraic group \(G \to S\) with structure morphism \(G \downarrow_S\);
- a morphism of base schemes \(f : T \to S\);

the **base change of \(G\) along \(f\)** is

\[
G_T \;=\; G \times_S T,
\]

with structure morphism the second projection \(G_T \to T\). The group
structure on \(G_T\) is induced from that on \(G\) via the universal
property of the fibre product.

## What is preserved

Many properties of algebraic groups are preserved by base change:

| property of \(G/S\) | property of \(G_T/T\) | proof technique |
|---|---|---|
| affine | affine | pullback of affine is affine |
| locally of finite type | locally of finite type | finite type stable under pullback |
| smooth | smooth | smooth stable under pullback |
| affine group scheme | affine group scheme | combine affine + GrpObj pullback |
| algebraic group | algebraic group | combine affine + LFT + GrpObj |
| commutative | commutative | symmetry of multiplication preserved |

The project's
[[node:affine_group_schemes.base_change_preserves_algebraic_group|base
change preservation lemma]] packages the algebraic-group preservation as
a Lean theorem, reusing Mathlib's `Scheme.GrpObjAsOverPullback`
combined with the base-change-stability lemmas for `IsAffineHom` and
`LocallyOfFiniteType`.

## Key examples

- **Field extension.** For \(k \to K\) a field extension, the base
  change \(G_K = G \otimes_k K\) recovers the classical
  "extension-of-scalars" construction.
- **Algebraic closure.** \(G_{\bar{k}}\) brings the geometric picture
  into view: connected components of \(G_{\bar{k}}\) (as a topological
  space) carry intrinsic information about \(G/k\).
- **Localisation at a prime.** For \(\mathfrak{p} \subseteq R\),
  \(G_{R_\mathfrak{p}}\) gives the local picture at \(\mathfrak{p}\).
- **Reduction modulo \(p\).** For \(G/\mathbb{Z}\), \(G_{\mathbb{F}_p}\)
  is the special fibre at the prime \(p\).
- **Galois descent.** For a Galois extension \(K/k\), the Galois group
  acts on \(G_K\), and \(G\) is determined by \((G_K, \text{Galois
  action})\) via [[node:descent_and_forms.forms_of_algebraic_groups|descent]].

## On the algebraic side

In coordinate-ring terms, base change \(G \mapsto G_T\) is the
**extension of scalars** on the Hopf algebra:

\[
A \;\to\; A \otimes_R R'
\]

where \(R' = \Gamma(T, \mathcal{O}_T)\) (and we restrict to the affine
base case \(S = \operatorname{Spec} R\), \(T = \operatorname{Spec} R'\)).
The new Hopf structure is

- \(\Delta_{A \otimes R'}(a \otimes r') = \Delta_A(a) \otimes r'\),
- \(\varepsilon_{A \otimes R'}(a \otimes r') = \varepsilon_A(a) \cdot r'\),
- \(S_{A \otimes R'}(a \otimes r') = S_A(a) \otimes r'\).

## Examples of base change in this project

- `Examples.Trivial`: smoke tests that
  `[IsAlgebraicGroup M S] [f : T ⟶ S] → IsAlgebraicGroup (M ×_S T) T`.
- The same pattern lifts to `G_a × T`, `G_m × T`, `μ_n × T`, etc.

## Prerequisite Topics

- [[node:foundational_inputs.fields_and_field_extensions|Fields and Field Extensions]]
- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
