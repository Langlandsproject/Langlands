---
id: linear_algebraic_groups.kernels_images_and_quotients
title: Kernels, Images, and Quotients
kind: topic
status: admitted
primary_topic: AlgebraicGroups.LinearAlgebraicGroups
topics:
- AlgebraicGroups.LinearAlgebraicGroups
uses:
- linear_algebraic_groups.morphisms_and_closed_subgroups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Do kernel and quotient constructions work over an arbitrary base?"
  verdict: "Yes. Kernels always exist (as fibre products); quotients require a base over which the equivalence relation cut out by `H` is effective — over a field this is automatic for closed normal subgroups; over more general bases, fppf/fpqc descent enters."
tags:
- kernels
- images
- quotients
- linear-algebraic-groups
---

# Kernels, Images, and Quotients

This topic records the categorical/structural relations between
algebraic groups under the analogue of the "first isomorphism theorem"
for abstract groups.

## Kernels (always exist as schemes)

For a morphism \(\varphi : G \to G'\) of algebraic groups over \(S\),
the **kernel** is the fibre product

\[
\ker \varphi \;=\; G \,\times_{G'}\, S
\]

(where \(S \to G'\) is the identity section). \(\ker \varphi\) is a
closed subgroup of \(G\); it represents the functor
\(B \mapsto \ker(G(B) \to G'(B))\).

**Examples.**

- \(\ker(\det : \operatorname{GL}_n \to \mathbb{G}_m) = \operatorname{SL}_n\).
- \(\ker((-)^n : \mathbb{G}_m \to \mathbb{G}_m) = \mu_n\).
- \(\ker(\text{Frobenius}) = \) infinitesimal group schemes in
  positive characteristic.

## Images (require care)

The **image** of \(\varphi : G \to G'\) is the scheme-theoretic image
of the morphism — the smallest closed subscheme of \(G'\) through which
\(\varphi\) factors. It is a closed subgroup of \(G'\) (when the
factorisation respects the group structure, which is automatic for
group morphisms).

Subtleties:

- The set-theoretic image (the image on points) may not be closed even
  for finite-type morphisms; the scheme-theoretic image is the closure.
- Over an algebraically closed field of characteristic zero, image
  equals scheme-theoretic image equals set-theoretic image; in
  characteristic \(p\), Frobenius-style morphisms can produce
  set-theoretically surjective but not flat (hence not faithfully flat)
  morphisms.

## Quotient by a closed normal subgroup

For a closed normal subgroup \(N \triangleleft G\), the quotient
\(G/N\) should be an algebraic group fitting in an exact sequence

\[
1 \to N \to G \to G/N \to 1.
\]

**Existence.** Over a field, \(G/N\) exists as an algebraic group and
the sequence is exact. The proof goes through the **Chevalley quotient
theorem**: \(G/N\) is constructed as the orbit space, which has a
canonical scheme structure via Chevalley's theorem on representations.

Over a general base, quotients exist as fppf sheaves of groups; they
are algebraic spaces (and sometimes schemes) under finite presentation
hypotheses.

## Exact sequences

The standard notion of **exactness** for group schemes uses the
fppf (or fpqc) topology: a sequence
\(1 \to N \to G \to G' \to 1\) is **exact** iff

- \(N \to G\) is a closed immersion (so \(N\) is a closed subgroup);
- \(G \to G'\) is faithfully flat;
- \(N\) is the (scheme-theoretic) kernel of \(G \to G'\).

Equivalently, after fppf-localising on \(G'\), \(G\) is a torsor for
\(N\).

## First isomorphism theorem

For a morphism \(\varphi : G \to G'\) of algebraic groups over a field,

\[
G / \ker \varphi \;\to\; \operatorname{Im}(\varphi).
\]

This requires the quotient on the left and the image on the right; both
exist under field hypotheses, and the canonical map is an isomorphism
of algebraic groups.

## In this project

The Lean formalisation of kernels (as pullbacks) is straightforward via
Mathlib's `Limits.pullback`. Quotients require more infrastructure
(fppf sheaves, descent) and are deferred — see
[[node:forms.forms_of_algebraic_groups|descent and forms]].

## Prerequisite Topics

- [[node:linear_algebraic_groups.morphisms_and_closed_subgroups|Morphisms and Closed Subgroups]]
