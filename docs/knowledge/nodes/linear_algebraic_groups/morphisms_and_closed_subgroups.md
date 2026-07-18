---
id: linear_algebraic_groups.morphisms_and_closed_subgroups
title: Morphisms and Closed Subgroups
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- affine_group_schemes.affine_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are morphisms and closed subgroups treated over an arbitrary base, not just over a field?"
  verdict: "Yes. The definitions and propagation results work over an arbitrary base scheme; the field case is a special case."
tags:
- morphisms
- closed-subgroups
- linear-algebraic-groups
---

# Morphisms and Closed Subgroups

## Morphisms of algebraic groups

A **morphism of algebraic groups** \(\varphi : G \to G'\) over \(S\) is
a morphism of schemes over \(S\) that respects the group-object
structure on each side. Equivalently:

- in the typeclass form, a morphism in
  \(\mathsf{Grp}(\mathsf{Over}\, S)\) — a scheme morphism intertwining
  the multiplication, identity, and inverse;
- in the coordinate-ring form (over an affine base), a homomorphism of
  \(R\)-Hopf algebras \(A' \to A\) (note the contravariant direction).

The categorical group-object axiom (\(\varphi \circ \mu_G = \mu_{G'} \circ (\varphi \times \varphi)\))
is a *property* of a scheme morphism — once a candidate \(\varphi\) is
fixed, the group-hom property is checked, not extra data.

## Examples

- **Determinant** \(\det : \operatorname{GL}_n \to \mathbb{G}_m\).
- **Inclusion** \(\operatorname{SL}_n \hookrightarrow \operatorname{GL}_n\).
- **\(n\)-th power** \((-)^n : \mathbb{G}_m \to \mathbb{G}_m\)
  (kernel = \(\mu_n\)).
- **Frobenius** \(F : G \to G^{(p)}\) in characteristic \(p\).

## Closed subgroups

A **closed subgroup** of \(G\) is a closed subscheme \(H \subseteq G\)
such that the group operations of \(G\) restrict to \(H\) (equivalently,
the inclusion is a morphism in \(\mathsf{Grp}\)). Closed subgroups are
the kernels of group-scheme morphisms.

**Examples.**
- \(\operatorname{SL}_n \subseteq \operatorname{GL}_n\) (kernel of det).
- \(\mu_n \subseteq \mathbb{G}_m\) (kernel of \(n\)-th power).
- Diagonal torus \(T \subseteq \operatorname{GL}_n\).
- Borel subgroup \(B \subseteq \operatorname{GL}_n\) (upper-triangular).
- Unipotent radical \(U \subseteq B\) (strictly upper-triangular).

## Closed-image construction

Given any morphism \(\varphi : G \to G'\), the **scheme-theoretic image**
of \(\varphi\) is a closed subscheme of \(G'\) (when \(\varphi\) is
quasi-compact and quasi-separated, which always holds for finite-type
morphisms over a Noetherian base). Carrying the group-object structure
across, this gives the **image subgroup**
\(\operatorname{Im}(\varphi) \subseteq G'\), a closed subgroup scheme.

## Kernels

Dually, the **kernel** of a morphism \(\varphi : G \to G'\) is the
fibre product \(G \times_{G'} \{e\}\), a closed subgroup of \(G\).
See [[node:linear_algebraic_groups.kernels_images_and_quotients|kernels,
images, and quotients]] for the exact sequence formalism.

## Faithfully flat / faithful descent

For surjective morphisms, the right notion is **faithfully flat**:
a morphism is faithfully flat iff it is flat and surjective. Over a
field, every morphism of finite-type group schemes is automatically
flat once it is surjective on geometric points.

## Closed subgroups via Hopf-algebra quotients

Under the coordinate-ring equivalence, a closed subgroup
\(H \subseteq G\) corresponds to a **quotient Hopf algebra**
\(\Gamma(G, \mathcal{O}_G) \twoheadrightarrow \Gamma(H, \mathcal{O}_H)\):
the ideal of \(H\) is a **Hopf ideal** (an ideal closed under \(\Delta\)
and \(S\) in a suitable sense, equivalently the kernel of a Hopf
algebra map).

This is the algebraic shadow of the embedding theorem
([[node:linear_algebraic_groups.embedding_theorem|every affine algebraic
group over a field embeds as a closed subgroup of \(\operatorname{GL}_n\)]]).

## Prerequisite Topics

- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
