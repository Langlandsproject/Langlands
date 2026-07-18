---
id: linear_algebraic_groups.smoothness_tangent_spaces_lie_algebras
title: Smoothness, Tangent Spaces, and Lie Algebras
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- foundational_inputs.affine_schemes
- affine_group_schemes.affine_algebraic_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is this material treated in characteristic-independent generality, allowing non-smooth groups in positive characteristic?"
  verdict: "Yes. The tangent space and Lie algebra are defined for any algebraic group; smoothness is a separate hypothesis that constrains characteristic-p phenomena."
tags:
- smoothness
- tangent-space
- lie-algebras
- linear-algebraic-groups
---

# Smoothness, Tangent Spaces, and Lie Algebras

The infinitesimal structure of an algebraic group at the identity
controls many of its global properties. The basic objects are the
**tangent space** \(T_e G\) and the **Lie algebra** \(\mathfrak{g}\)
(which carries an additional bracket).

## The tangent space at the identity

For an algebraic group \(G\) over a base ring \(R\) (or a field \(k\)),
the **tangent space at the identity** is

\[
T_e G \;=\; \ker\bigl(G(R[\varepsilon]/\varepsilon^2) \to G(R)\bigr),
\]

where the map is induced by \(R[\varepsilon]/\varepsilon^2 \to R\),
\(\varepsilon \mapsto 0\). Concretely, \(T_e G\) is an \(R\)-module,
and it has dimension equal to the dimension of \(G\) when \(G\) is
smooth over \(R\).

Examples:

- \(T_e \mathbb{G}_a = R\) (one-dimensional, generator \(d/dT\)).
- \(T_e \mathbb{G}_m = R\) (one-dimensional, generator \(T \, d/dT\)).
- \(T_e \operatorname{GL}_n = \mathfrak{gl}_n = \operatorname{Mat}_n(R)\) (the algebra of \(n \times n\) matrices).
- \(T_e \operatorname{SL}_n = \mathfrak{sl}_n\) (traceless matrices, of dimension \(n^2 - 1\)).

## The Lie algebra

\(T_e G\) is not just an \(R\)-module: it carries a **Lie bracket**
\([-,-] : T_e G \otimes T_e G \to T_e G\) coming from the commutator in
\(G\). The pair \((T_e G, [-,-])\) is the **Lie algebra of \(G\)**,
denoted \(\mathfrak{g} = \operatorname{Lie}(G)\).

The Lie algebra is a powerful invariant:

- For connected complex Lie groups, \(\mathfrak{g}\) determines the
  group up to covers (Lie's theorem).
- Over fields of characteristic zero, the same holds for affine
  algebraic groups (Cartier's theorem).
- In positive characteristic, the Lie algebra "loses information" —
  multiple non-isomorphic algebraic groups can share the same Lie
  algebra (e.g. \(\mathbb{G}_m\) and \(\mu_p\) over \(\mathbb{F}_p\)
  both have \(\mathfrak{g} = \mathbb{F}_p\)).

## Smoothness

\(G\) is **smooth over \(S\)** if the structure morphism \(G \to S\) is
smooth in the scheme-theoretic sense: locally on \(G\), it factors as
an étale morphism into an affine space over \(S\). Equivalent
characterisations:

- **Submersion at every point.** \(G \to S\) is flat and the relative
  cotangent sheaf \(\Omega_{G/S}\) is locally free of rank \(\dim G/S\).
- **Lifting property.** Infinitesimal deformations lift.
- **Geometric.** Every geometric fibre is smooth in the variety sense.

**Smooth examples.** \(\mathbb{G}_a\), \(\mathbb{G}_m\),
\(\operatorname{GL}_n\), \(\operatorname{SL}_n\), tori, classical
groups in characteristic zero.

**Non-smooth examples in characteristic \(p\).** \(\mu_p\) over
\(\mathbb{F}_p\), \(\alpha_p = \ker(\text{Frobenius on }\mathbb{G}_a)\),
the Frobenius kernel of any non-étale group scheme.

## In characteristic zero

Cartier's theorem states: **every algebraic group over a field of
characteristic zero is smooth.** Consequently, in characteristic zero,
the distinction "algebraic group" vs. "smooth algebraic group"
collapses, and the Lie algebra fully determines the connected component
of the identity.

In positive characteristic this fails, and the
modern Milne / SGA 3 convention is to NOT require smoothness: the
"algebraic group" notion allows non-reduced objects like \(\mu_p\) and
\(\alpha_p\), with smoothness added as an additional hypothesis
\([Smooth (G \downarrow S)]\) when the theory needs it.

## Dimension

For a smooth algebraic group \(G/k\), the **dimension** is just the
dimension of \(G\) as a variety. For a general (possibly non-smooth)
group, several notions diverge:

- \(\dim G\) = Krull dimension of the underlying scheme;
- \(\dim_k T_e G\) = tangent-space dimension (= dim \(G\) iff smooth);
- "rank" = dimension of a maximal torus.

For \(\operatorname{GL}_n\): all coincide and equal \(n^2\).

## Prerequisite Topics

- [[node:foundational_inputs.affine_schemes|Affine Schemes]]
- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
