---
id: nilpotent_orbits.rational_nilpotent_orbits
title: Rational Nilpotent Orbits
kind: topic
status: admitted
primary_topic: nilpotent_orbits
topics:
- nilpotent_orbits
uses:
- nilpotent_orbits.nilpotent_orbits
- descent_and_forms.rational_forms_of_reductive_groups
- descent_and_forms.galois_cohomology
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are rational nilpotent orbits treated for arbitrary fields, with the cohomological refinement of the orbit set?"
  verdict: "Yes. Rational orbits are the G(k)-orbits inside a geometric orbit; they are classified by Galois cohomology of the stabiliser, applicable over any field k."
tags:
- rational-nilpotent-orbits
- nilpotent-orbits
---

# Rational Nilpotent Orbits

When the base field \(k\) is not algebraically closed, a **geometric**
nilpotent orbit \(\mathcal{O} \subseteq \mathfrak{g}_{\bar k}\) may
break up into multiple **rational** (= \(G(k)\)) orbits. The
classification of rational orbits is a finer invariant requiring
Galois cohomology.

## Setup

Let \(G\) be a connected reductive group over a field \(k\),
\(\mathfrak{g} = \operatorname{Lie}(G)\), and consider the action of
\(G(k)\) on the nilpotent cone \(\mathcal{N}(k) = \mathcal{N} \cap \mathfrak{g}(k)\).

A **geometric orbit** is a \(G(\bar k)\)-orbit in \(\mathcal{N}(\bar k)\),
defined over \(k\) iff fixed by Galois.

A **rational orbit** is a \(G(k)\)-orbit in \(\mathcal{N}(k)\).

A single geometric orbit defined over \(k\) may contain multiple
rational orbits.

## Classification

**Theorem.** For \(X \in \mathcal{N}(k)\) and geometric orbit
\(\mathcal{O} = G(\bar k) \cdot X\), the set of rational orbits inside
\(\mathcal{O}(k) = \mathcal{O} \cap \mathfrak{g}(k)\) is in bijection
with
\[
\ker\Big(H^1(k, Z_G(X)) \to H^1(k, G)\Big).
\]

In particular, if \(H^1(k, G) = 1\) (e.g.\ \(k\) finite, by Lang's
theorem), rational orbits inside \(\mathcal{O}\) are parametrised by
\(H^1(k, Z_G(X))\).

## Examples

### \(k = \mathbb{F}_q\) finite

Lang's theorem: \(H^1(\mathbb{F}_q, G) = 1\). So:
\[
\#\{\text{rational orbits inside } \mathcal{O}\} \;=\; \#H^1(\mathbb{F}_q, Z_G(X)).
\]

For nilpotent \(X\) in a finite reductive Lie algebra, the centraliser
\(Z_G(X)\) is typically a unipotent extension of a smaller reductive
group; explicit computations give a count of "Springer points" in the
fibre.

### \(k = \mathbb{R}\)

Real nilpotent orbits decompose as follows: a complex orbit
\(\mathcal{O}_\mathbb{C} \subseteq \mathfrak{g}_\mathbb{C}\) defined
over \(\mathbb{R}\) (\(= \mathfrak{g}\otimes\mathbb{C}\)) splits into
real orbits parametrised by \(H^1(\mathbb{R}, Z_G(X))\); since
\(\mathrm{Gal}(\mathbb{C}/\mathbb{R}) = \mathbb{Z}/2\), this is a
sum of \((\mathbb{Z}/2)^k\) for some \(k\).

For \(\mathfrak{sl}_n(\mathbb{R})\): a partition \(\lambda\) gives a
geometric orbit, but the rational orbits are labelled by **signed
Young diagrams** (real signature data).

For \(\mathfrak{u}(p, q)\): rational orbits classified by signed Young
diagrams compatible with the signature \((p, q)\).

### \(k\) a \(p\)-adic field

\(H^1(F, T)\) for \(T\) the centraliser of a regular nilpotent is
computable via local Tate duality; the result is the **abelianised
Galois cohomology** of the centraliser, computable from the root
datum.

For \(\mathrm{SL}_2(\mathbb{Q}_p)\): the regular nilpotent orbit
splits into two rational orbits, parametrised by \(\mathbb{Q}_p^\times / (\mathbb{Q}_p^\times)^2\)
(modulo squares — a group of order 4 for \(p\) odd).

## Connection to Galois cohomology

The bijection rests on the fundamental fact:
\[
G(\bar k) \cdot X \;\cong\; G/Z_G(X)
\]
(as varieties), so rational points are computed by:
\[
(G/Z_G(X))(k) \;\to\; H^1(k, Z_G(X)) \;\to\; H^1(k, G),
\]
the exact sequence of pointed sets associated to
\(1 \to Z_G(X) \to G \to G/Z_G(X) \to 1\).

## Role in Langlands

- **Local Langlands**: nilpotent orbits in the dual Lie algebra
  \(\mathrm{Lie}(\hat G)\), but the relevant orbits are typically
  **rational** orbits over an appropriate field (\(\mathbb{C}\) or
  \(\bar{\mathbb{Q}}_\ell\) in arithmetic context).
- **Endoscopy**: transfer of nilpotent orbits between inner forms
  involves identifying rational orbits with the same Newton/Bala-Carter
  data but in different forms.
- **Wavefront set**: a \(p\)-adic representation's wavefront set is a
  union of rational orbits in \(\mathfrak{g}(\bar F)\).

## References

- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993), §9 (real and \(p\)-adic).
- Bhargava–Gross, *The arithmetic invariant theory of certain
  nilpotent orbits* (Galois lifts paper, 2014).
- Reeder–Yu, *Epipelagic representations and invariant theory*
  (J.\ Amer.\ Math.\ Soc.\ 2014).

## Prerequisite Topics

- [[node:nilpotent_orbits.nilpotent_orbits|Nilpotent Orbits]]
- [[node:descent_and_forms.rational_forms_of_reductive_groups|Rational Forms of Reductive Groups]]
- [[node:descent_and_forms.galois_cohomology|Galois Cohomology]]
