---
id: conjugacy_classes.regular_elements
title: Regular Elements
kind: definition
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
uses:
- conjugacy_classes.jordan_decomposition
- conjugacy_classes.semisimple_conjugacy_classes
- conjugacy_classes.unipotent_orbits
- reductive_groups.maximal_tori
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.5"
    format: section
    note: "Regular elements, regular semisimple elements, and their density."
  - artifact: steinberg-endomorphisms-of-algebraic-groups
    locator: "Section 1"
    format: section
    note: "Regular unipotent elements and the regular unipotent class."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the notion of regular element defined uniformly for semisimple and unipotent elements, and does the regular unipotent class exist in all characteristics?"
  verdict: "Yes. An element g is regular if dim C_G(g) = rank(G) (the minimum possible). For semisimple elements this is classical; for unipotent elements the regular class exists and is dense in the unipotent variety in all characteristics."
tags:
- regular-elements
- regular-semisimple
- regular-unipotent
- centralizer
---

# Regular Elements

## Definition

Let $G$ be a connected reductive group of rank $r = \mathrm{rank}(G)$. An element
$g \in G$ is **regular** if the dimension of its centraliser is minimal:
$$\dim C_G(g) = r.$$

This is equivalent to saying $g$ lies in the open dense subset of $G$ where
the function $g \mapsto \dim C_G(g)$ attains its minimum.

## Regular semisimple elements

A semisimple element $s \in G$ is **regular semisimple** if $C_G(s)^\circ$ is
a maximal torus (equivalently, $\alpha(s) \ne 1$ for all roots $\alpha$).

**Properties:**

- The set $G^{\mathrm{rs}}$ of regular semisimple elements is open dense in $G$.
- $s$ is regular semisimple $\iff$ $s$ lies in a **unique** maximal torus.
- Over an algebraically closed field, $G^{\mathrm{rs}}$ is the complement of
  the root hyperplanes $\ker(\alpha - 1) \subset T$ (and their conjugates).

## Regular unipotent elements

A unipotent element $u \in G$ is **regular unipotent** if $\dim C_G(u) = r$.
There exists a **unique regular unipotent conjugacy class** $\mathcal{O}_{\mathrm{reg}}$,
which is the **open dense orbit** in the unipotent variety $\mathcal{U}$.

**Characterisation:** $u$ is regular unipotent $\iff$ for every Borel subgroup
$B \supset T$, the projection of $u$ onto each simple root factor $U_{\alpha_i}
\cong \mathbb{G}_a$ is non-zero.

## Regular elements in general

For a general element $g = g_s g_u$, $g$ is regular $\iff$ $g_u$ is a regular
unipotent element of $C_G(g_s)^\circ$.

## Strongly regular elements

An element $g$ is **strongly regular** if $C_G(g)$ is a torus (automatically
a maximal torus). Strongly regular $\Rightarrow$ regular semisimple, but the
converse fails for non-simply-connected groups where $C_G(s)$ may be non-connected.

## Density theorem

The set of regular elements is open dense in $G$, as is the set of regular
semisimple elements. The complement has codimension $\ge 1$.
