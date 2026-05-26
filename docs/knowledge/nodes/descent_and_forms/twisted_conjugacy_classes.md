---
id: descent_and_forms.twisted_conjugacy_classes
title: Twisted Conjugacy Classes
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.galois_cohomology
- linear_algebraic_groups.conjugacy_classes
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are twisted conjugacy classes defined uniformly for any group with an action by another?"
  verdict: "Yes. The notion x ~ g x σ(g)^{-1} makes sense for any group G with an automorphism σ; sigma-conjugacy and stable conjugacy are special cases."
tags:
- twisted-conjugacy
- descent-and-forms
---

# Twisted Conjugacy Classes

**Twisted conjugacy** is conjugation by a group element that is also
acted upon by an automorphism. It includes \(\sigma\)-conjugacy (for
Frobenius / Galois actions) and stable conjugacy (for cohomologically-
adjusted equivalence) as special cases.

## Definition

Let \(G\) be a group with an automorphism \(\sigma : G \to G\). Two
elements \(x, y \in G\) are **\(\sigma\)-conjugate** (or
**\(\sigma\)-twisted conjugate**) if there exists \(g \in G\) with
\[
y \;=\; g \, x \, \sigma(g)^{-1}.
\]

The equivalence classes are the **\(\sigma\)-conjugacy classes**, denoted
\(B(G, \sigma)\) (or just \(B(G)\) when \(\sigma\) is canonical).

When \(\sigma = \mathrm{id}\), this reduces to ordinary conjugacy.

## Geometric interpretation

For an algebraic group \(G\) over \(k\) with automorphism \(\sigma\)
(e.g.\ Frobenius for a group over \(\bar{\mathbb{F}_q}\) coming from
a group over \(\mathbb{F}_q\)): \(\sigma\)-conjugacy classes
parametrise twisted forms.

Specifically: a 1-cocycle \(c \in Z^1(\langle \sigma \rangle, G)\) is
the same as an element of \(G\); the cohomology class is the
\(\sigma\)-conjugacy class.

## Examples

### Frobenius twisted conjugacy

For \(G(\bar{\mathbb{F}_q})\) with Frobenius \(F\): by Lang's theorem,
every \(F\)-conjugacy class contains the identity (\(F\)-conjugacy is
trivial). This is why finite reductive groups are studied via the
Lang-Steinberg map \(g \mapsto g^{-1} F(g)\), which is surjective.

### Kottwitz setting

For \(G(\breve F)\) with \(\sigma\) the Frobenius of the unramified
extension: \(B(G) = G(\breve F) / \sigma\)-conjugacy is the **Kottwitz
set**, the central object of \(p\)-adic geometric Langlands.

### Stable conjugacy

In the theory of stable conjugacy, one declares \(\gamma, \gamma' \in G(k)\)
**stably conjugate** if they are \(G(\bar k)\)-conjugate. The
stable conjugacy class \([\gamma]_{\mathrm{st}}\) is a Galois-twisted
version of the conjugacy class, classified by:
\[
\mathrm{Stab}(\gamma) \backslash H^1(k, Z_G(\gamma)),
\]
where \(Z_G(\gamma)\) is the centraliser.

For a regular semisimple \(\gamma\): \(Z_G(\gamma)\) is a maximal
torus, and the classification is purely \(H^1\)-cohomological.

## Galois-cohomological reformulation

\(\sigma\)-conjugacy classes in \(G\) for an order-\(n\) automorphism
\(\sigma\) correspond to:
\[
B(G, \sigma) \;\cong\; H^1(\mathbb{Z}/n, G).
\]

More generally, for a profinite group \(\Gamma\) acting on \(G\):
1-cocycles in \(H^1(\Gamma, G)\) are essentially \(\sigma\)-conjugacy
classes (with \(\sigma\) ranging over \(\Gamma\)).

## Counting and orbit structure

For finite groups (or \(G(\mathbb{F}_q)\) for finite reductive groups):

**Theorem (Burnside, Lang).** The number of \(\sigma\)-conjugacy
classes in \(G(\bar{\mathbb{F}_q})\) for \(\sigma = \mathrm{Frob}\)
equals the number of \(\mathrm{Frob}\)-fixed conjugacy classes in
\(G(\bar{\mathbb{F}_q})\) — equivalently, the number of conjugacy
classes in \(G(\mathbb{F}_q)\).

This is the basis of **Deligne-Lusztig theory**: representations of
finite reductive groups indexed by Frobenius-fixed conjugacy classes
of pairs \((T, \theta)\) with \(T\) a maximal torus and \(\theta\) a
character.

## Stable vs.\ ordinary conjugacy

Over a field \(k\), elements \(\gamma, \gamma' \in G(k)\):

- **Conjugate** if they are \(G(k)\)-conjugate.
- **Stably conjugate** if they are \(G(\bar k)\)-conjugate.

The "stable" notion is coarser; the obstruction to lifting stable to
ordinary conjugacy lies in \(H^1(k, Z_G(\gamma))\).

For regular semisimple \(\gamma\) over a local field: stable conjugacy
classes split into multiple ordinary classes, parametrised by
characters of a finite cohomology group — the **endoscopic
component group**.

## Role in Langlands

- **Kottwitz set \(B(G)\)**: \(\sigma\)-conjugacy classes index inner
  forms and isocrystals.
- **Stable trace formula**: integrates over stable conjugacy classes,
  not just conjugacy classes; the difference is captured by the
  **endoscopic transfer factors**.
- **Twisted endoscopy** (Kottwitz-Shelstad): generalisation to
  twisted conjugacy with non-trivial Galois action; foundation of
  **base change** trace formula identities.

## References

- Steinberg, *Endomorphisms of linear algebraic groups* (Mem.\ AMS
  1968).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke
  1984).
- Kottwitz–Shelstad, *Foundations of twisted endoscopy* (Astérisque
  1999).

## Prerequisite Topics

- [[node:descent_and_forms.galois_cohomology|Galois Cohomology]]
- [[node:linear_algebraic_groups.conjugacy_classes|Conjugacy Classes]]
