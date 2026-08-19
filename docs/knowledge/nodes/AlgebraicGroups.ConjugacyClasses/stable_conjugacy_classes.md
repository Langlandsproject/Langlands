---
id: conjugacy_classes.stable_conjugacy_classes
title: Stable Conjugacy Classes
kind: definition
status: admitted
primary_topic: AlgebraicGroups.ConjugacyClasses
topics:
- AlgebraicGroups.ConjugacyClasses
- AlgebraicGroups.Forms
uses:
- conjugacy_classes.semisimple_conjugacy_classes
- conjugacy_classes.unipotent_orbits
- conjugacy_classes.regular_elements
- forms.galois_cohomology
- forms.inner_forms
source:
  spans:
  - artifact: langlands-shelstad-on-the-definition-of-transfer-factors
    locator: "§1"
    format: section
    note: "Langlands–Shelstad definition of stable conjugacy and transfer factors."
  - artifact: kottwitz-rational-conjugacy-classes
    locator: "§1–2"
    format: section
    note: "Kottwitz's cohomological approach to stable vs rational conjugacy."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the notion of stable conjugacy defined for both semisimple and unipotent elements over local and global fields?"
  verdict: "Yes. Stable conjugacy is defined for both semisimple and unipotent elements of G(F) for any local or global field F. For semisimple elements: g, g' in G(F) are stably conjugate if they are G(F̄)-conjugate (i.e., conjugate over the algebraic closure). For unipotent elements over local fields, stable conjugacy is defined via the Springer correspondence and involves an additional local system datum."
tags:
- stable-conjugacy
- endoscopy
- langlands
- inner-forms
- galois-cohomology
---

# Stable Conjugacy Classes

## Motivation

Over a non-algebraically-closed field $F$, a single geometric conjugacy class
in $G(\bar F)$ may split into several $G(F)$-rational conjugacy classes. The
trace formula and the theory of **endoscopy** require a notion that groups these
together: the **stable conjugacy class**.

## Definition (semisimple case)

Two semisimple elements $\gamma, \gamma' \in G(F)$ are **stably conjugate** if
they are conjugate over $\bar F$:
$$\gamma' = g \gamma g^{-1} \quad \text{for some } g \in G(\bar F).$$

This is a coarser equivalence relation than $G(F)$-conjugacy. The stable
conjugacy class of $\gamma$ is the set of all $G(F)$-conjugacy classes inside
its geometric conjugacy class.

## Cohomological parametrisation

The set of $G(F)$-conjugacy classes within the stable class of $\gamma$ is
parametrised by the Galois cohomology set
$$\ker\bigl(H^1(F, C_G(\gamma)) \to H^1(F, G)\bigr),$$
where $C_G(\gamma)$ is the centraliser of $\gamma$ in $G$.

For $G = \mathrm{GL}_n$, all $H^1$ vanish, so stable $=$ rational conjugacy.
The difference first appears for groups with non-trivial $H^1$.

## Regular semisimple case

For **regular semisimple** $\gamma$ with connected centraliser $T = C_G(\gamma)$
(a maximal torus), the $G(F)$-classes within the stable class of $\gamma$ are
parametrised by
$$\ker\bigl(H^1(F, T) \to H^1(F, G)\bigr) \cong H^1(F, T)/\mathrm{im}.$$
This finite set measures the failure of Hilbert 90 for the torus $T$.

## Role in endoscopy

**Endoscopic groups** $H$ of $G$ are defined so that:
- Stable conjugacy classes of $H(F)$ map to stable conjugacy classes of $G(F)$.
- The **transfer** of orbital integrals from $G$ to $H$ (or vice versa) respects
  stable conjugacy classes.

The **fundamental lemma** (Ngô, 2010) and the **transfer conjecture**
(Langlands–Shelstad) are stated in terms of stable orbital integrals:
$$SO_\gamma^G(f) = \sum_{\delta \leftrightarrow \gamma} \Delta(\gamma, \delta)\, O_\delta^H(f^H),$$
where the sum is over conjugacy classes $\delta$ within the stable class of $\gamma$.

## Unipotent case

For unipotent elements over $p$-adic fields, stable conjugacy is more subtle.
Two unipotent elements are stably conjugate if they lie in the same orbit over
$\bar F$ **and** correspond under the Springer correspondence to the same local
system. The parametrisation involves Lusztig's theory of character sheaves.
