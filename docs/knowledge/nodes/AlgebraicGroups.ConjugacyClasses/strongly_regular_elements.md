---
id: conjugacy_classes.strongly_regular_elements
title: Strongly Regular Elements and Harish-Chandra Theory
kind: definition
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- conjugacy_classes.regular_elements
- conjugacy_classes.stable_conjugacy_classes
- conjugacy_classes.lie_algebras_of_reductive_groups
- reductive_groups.maximal_tori
source:
  spans:
  - artifact: harish-chandra-harmonic-analysis-on-reductive-groups
    locator: "§1"
    format: section
    note: "Harish-Chandra's notion of strongly regular elements and the regularity condition for orbital integrals."
  - artifact: springer-linear-algebraic-groups
    locator: "Section 6.7"
    format: section
    note: "Strongly regular elements and the open dense subset of G where all centralisers are maximal tori."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the notion of strongly regular element used in the theory of orbital integrals and the trace formula?"
  verdict: "Yes. The strongly regular semisimple elements form an open dense subset G^sr of G. Harish-Chandra's orbital integrals O_γ(f) are defined and well-behaved for γ in G^sr(F). The regular semisimple elements G^rs are slightly larger (connected centraliser, which is a maximal torus, but possibly disconnected for non-simply-connected G); strongly regular means the centraliser is exactly a maximal torus (connected and abelian)."
tags:
- strongly-regular
- harish-chandra
- orbital-integrals
- trace-formula
---

# Strongly Regular Elements and Harish-Chandra Theory

## Definition

Let $G$ be a connected reductive group. A semisimple element $\gamma \in G$
is **strongly regular** if its centraliser $C_G(\gamma)$ is a **maximal torus**
(i.e.\ connected and abelian of rank $r$):
$$C_G(\gamma) = T \quad \text{(a maximal torus)}.$$

The set of strongly regular elements is denoted $G^{\mathrm{sr}}$.

## Comparison with regular elements

| Property | Strongly regular | Regular semisimple |
|---|---|---|
| $C_G(\gamma)$ | Maximal torus (connected) | $C_G(\gamma)^\circ$ a max.\ torus |
| Condition on $\alpha(\gamma)$ | $\alpha(\gamma) \ne 1$ for **all** $\alpha$ | Same |
| $C_G(\gamma)$ connected? | Yes, by definition | Not always |

For **simply connected** $G$ (or adjoint $G$): regular semisimple $\iff$
strongly regular (since $C_G(\gamma)$ is automatically connected).

For general reductive $G$: strongly regular $\Rightarrow$ regular semisimple,
with the difference measured by $\pi_0(C_G(\gamma))$.

## Open dense subset

$G^{\mathrm{sr}}$ is **open dense** in $G$ (and in particular in the set
of semisimple elements). Its complement has codimension $\ge 1$.

## Role in harmonic analysis

**Harish-Chandra's theorem:** For a regular semisimple element $\gamma \in G(F)$
($F$ a local field), the **orbital integral**
$$O_\gamma(f) = \int_{G(F)/C_G(\gamma)(F)} f(g \gamma g^{-1})\, dg$$
is absolutely convergent for any $f \in C_c^\infty(G(F))$.

The function $\gamma \mapsto O_\gamma(f)$ (as $\gamma$ varies over
$G^{\mathrm{sr}}(F)$) extends to all regular semisimple elements and
satisfies the **germ expansion** near the identity:
$$O_\gamma(f) \sim \sum_{\mathcal{O}} c_{\mathcal{O}}(\gamma) \cdot O_{\mathcal{O}}(f)$$
where $\mathcal{O}$ ranges over nilpotent orbits and $c_\mathcal{O}(\gamma)$ are
the **Shalika germs**.

## Lie algebra version

On $\mathfrak{g} = \mathrm{Lie}(G)$, the strongly regular elements of
$\mathfrak{g}$ are the **regular semisimple** elements
$\mathfrak{g}^{\mathrm{rs}} = \{X \in \mathfrak{g} : C_G(X) \text{ is a max torus}\}$.

The invariant polynomials $\mathfrak{g} \to \mathfrak{t}/W$ restrict to a
smooth fibration over the strongly regular locus, with fibres $G/T$ (flag variety).

## Stable orbital integrals

For strongly regular $\gamma \in G(F)$, the **stable orbital integral** is
$$SO_\gamma(f) = \sum_{\gamma' \sim_{\mathrm{st}} \gamma} O_{\gamma'}(f),$$
where the sum is over $G(F)$-conjugacy classes within the stable class of $\gamma$.
These are the building blocks of the **geometric side** of the stable trace formula.
