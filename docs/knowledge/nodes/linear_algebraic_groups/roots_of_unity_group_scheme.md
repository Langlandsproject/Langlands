---
id: linear_algebraic_groups.roots_of_unity_group_scheme
title: Roots of Unity Group Scheme μ_n
kind: definition
status: admitted
primary_topic: linear_algebraic_groups
topics:
- linear_algebraic_groups
uses:
- linear_algebraic_groups.algebraic_group_definition
- linear_algebraic_groups.multiplicative_group_scheme
- linear_algebraic_groups.coordinate_hopf_algebra_of_group_scheme
lean:
  modules:
    - LanglandsLean.AlgebraicGeometry.Examples.MuN
  declarations:
    - Langlands.AlgebraicGeometry.Examples.muN.hopfAlg
    - Langlands.AlgebraicGeometry.Examples.muN
    - Langlands.AlgebraicGeometry.Examples.muN.instGrpObj
    - Langlands.AlgebraicGeometry.Examples.MuN
verification:
  definition: accepted
  proof: not_applicable
  alignment: aligned
generality:
  reviewed: true
  prompt: "Is the construction stated over an arbitrary base scheme \\(S\\) and arbitrary positive integer \\(n\\)?"
  verdict: "Yes. \\(S\\) is any scheme; \\(n\\) is any positive integer (for \\(n = 0\\) we recover \\(\\mathbb{G}_m\\))."
tags:
- example
- definition
- roots-of-unity
- linear-algebraic-groups
---

# Roots of Unity Group Scheme \(\mu_n\)

Let \(n\) be a non-negative integer and \(S\) a scheme. The
**\(n\)-th roots of unity group scheme over \(S\)**, denoted
\(\mu_{n,S}\), is defined as the kernel of the \(n\)-th power map on
\(\mathbb{G}_m\):

\[
\mu_{n,S} \;=\; \ker\bigl(\mathbb{G}_{m,S} \to \mathbb{G}_{m,S}\bigr) \quad (\text{the } n\text{-th power map})
       \;=\; S \,\times_{\operatorname{Spec} \mathbb{Z}}\, \operatorname{Spec}\bigl(\mathbb{Z}[T]/(T^n - 1)\bigr).
\]

Its coordinate Hopf algebra is the quotient \(\mathbb{Z}[T]/(T^n - 1)\),
which is canonically isomorphic to the **additive group algebra of the
cyclic group of order \(n\)**:

\[
\mathbb{Z}[T]/(T^n - 1) \;\cong\; \mathbb{Z}[\mathbb{Z}/n]
  \qquad (T^k \mapsto \mathrm{single}\, k\, 1).
\]

The Hopf structure, transported via this isomorphism, gives the
**group-like Hopf structure** on basis elements:

\[
\Delta(\mathrm{single}\, k\, 1) = \mathrm{single}\, k\, 1 \otimes \mathrm{single}\, k\, 1, \qquad
\varepsilon(\mathrm{single}\, k\, 1) = 1, \qquad
S(\mathrm{single}\, k\, 1) = \mathrm{single}\, (-k)\, 1.
\]

For \(n > 0\), \(\mu_n\) is finite (of order \(n\)) and is an
[[node:linear_algebraic_groups.algebraic_group_definition|algebraic group]]
over \(S\). For \(n = 0\), the convention \(\mathbb{Z}/0 = \mathbb{Z}\)
yields \(\mu_0 = \mathbb{G}_m\) (the no-constraint case).

In characteristic coprime to \(n\), \(\mu_n\) is étale (a finite étale
group scheme of order \(n\)). In characteristic \(p \mid n\), \(\mu_n\)
acquires infinitesimal pieces (e.g., \(\mu_p\) over \(\mathbb{F}_p\) is
the non-étale "Frobenius kernel"), but it is **always** an algebraic
group in the modern Milne / SGA 3 convention.
