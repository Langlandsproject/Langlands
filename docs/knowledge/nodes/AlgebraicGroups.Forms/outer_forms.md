---
id: forms.outer_forms
title: Outer Forms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.rational_forms_of_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are outer forms classified uniformly via the Galois action on the Dynkin diagram, for arbitrary reductive groups?"
  verdict: "Yes. Outer forms are exactly twists by cocycles in Out(G) = Aut(Dynkin diagram); the classification is uniform over Dynkin types and fields."
tags:
- outer-forms
- descent-and-forms
---

# Outer Forms

An **outer form** of a connected reductive group \(G\) is a form
twisted by a cocycle valued in \(\mathrm{Out}(G)\) — equivalently, a
non-trivial Galois action on the based root datum of \(G_{\bar k}\).
Outer forms are the "non-trivial diagram twists" that arise from
Dynkin diagram automorphisms.

## Definition

Let \(G_0\) be a split connected reductive group over \(k\). An
**outer form** of \(G_0\) is a form whose isomorphism class in
\(H^1(k, \mathrm{Aut}(G_0))\) projects **non-trivially** to
\(H^1(k, \mathrm{Out}(G_0))\) under the exact sequence
\[
1 \to G_{0, \mathrm{ad}} \to \mathrm{Aut}(G_0) \to \mathrm{Out}(G_0) \to 1.
\]

Equivalently: \(G\) is an outer form iff the Galois action on the
based root datum of \(G_{\bar k}\) is **non-trivial**.

## Classification

The set of outer-form classes is
\[
H^1(k, \mathrm{Out}(G_0)) \;=\; \mathrm{Hom}_{\mathrm{cont}}(\Gamma_k, \mathrm{Out}(G_0)) / \mathrm{Out}(G_0)\text{-conj}.
\]

Within each outer-form class, the inner-twist refinement is by
\(H^1(k, G_{0, \mathrm{ad}}^c)\) (where \(c\) is the outer twist).

## Out(G) for irreducible types

| Type | \(\mathrm{Out}(G)\) | Generators |
|---|---|---|
| \(A_n\), \(n \ge 2\) | \(\mathbb{Z}/2\) | reverse Dynkin diagram |
| \(B_n, C_n\) | trivial | — |
| \(D_4\) | \(S_3\) | triality (3-fold) |
| \(D_n\), \(n \ge 5\) | \(\mathbb{Z}/2\) | swap outer leaves |
| \(E_6\) | \(\mathbb{Z}/2\) | reflection |
| \(E_7, E_8\) | trivial | — |
| \(F_4, G_2\) | trivial | — |

So outer forms exist only for types \(A_n\) (\(n \ge 2\)), \(D_n\)
(\(n \ge 4\)), and \(E_6\).

## Examples

### Outer forms of \(\mathrm{GL}_n\) (type \(A_{n-1}\))

\(\mathrm{Out}(\mathrm{GL}_n) = \mathbb{Z}/2\); the non-trivial outer
form is the **unitary group** \(\mathrm{U}(n, K/k)\) for a quadratic
extension \(K/k\). The Galois action on the Dynkin diagram of
\(A_{n-1}\) is the reflection sending \(\alpha_i \mapsto \alpha_{n-i}\).

Inner forms within the unitary class: \(\mathrm{U}(p, q)\) for
\(p + q = n\), classified by the Hermitian form's signature.

### \({}^3 D_4\) (triality form)

For a cubic Galois extension \(K/k\) with \(\mathrm{Gal}(K/k) = \mathbb{Z}/3\):
the outer form \({}^3 D_4\) is the unique form of \(\mathrm{Spin}_8\)
over \(k\) whose Galois action on the Dynkin diagram is the 3-fold
cyclic rotation of the outer leaves.

\({}^3 D_4\) shows up over function fields and is foundational for
"triality" phenomena in number theory.

### Outer forms of \(D_n\) (\(n \ge 5\))

Over \(\mathbb{R}\): the outer forms include \(\mathrm{SO}(p, q)\) for
\((p, q)\) different from \((n, n)\) — these are inner forms of
\(\mathrm{SO}_{2n}\) for the trivial outer twist.

The non-trivial outer twist gives \({}^2 D_n\), realised by
\(\mathrm{SO}^*(2n)\) over the reals (quaternionic form).

### \({}^2 E_6\)

Outer form of \(E_6\) determined by a quadratic extension. Over
\(\mathbb{R}\): the compact form of \(E_6\) is the quasi-split outer
form; \(E_{6(-26)}\) is another real form.

## Quasi-split outer forms

Every outer-form class contains a unique **quasi-split** form (a form
with a Borel defined over \(k\)). The quasi-split outer form is the
"largest" in its class.

For \(\mathrm{GL}_n\) with non-trivial outer twist: quasi-split form
= \(\mathrm{U}(n)\) (the unitary group of the standard split
Hermitian form).

## Galois representations on the Dynkin diagram

For each Dynkin type and each base field \(k\), classifying outer
forms reduces to classifying continuous homomorphisms
\[
\Gamma_k \;\to\; \mathrm{Out}(G_0).
\]

This is a tractable problem: \(\mathrm{Out}(G_0)\) is a finite group,
so the classification reduces to listing the finite Galois extensions
of \(k\) with appropriate Galois groups.

For \(k\) a finite field: \(\Gamma_k = \hat{\mathbb{Z}}\), so
\(\mathrm{Hom}(\Gamma_k, \mathrm{Out}(G_0)) = \mathrm{Out}(G_0)\) —
one outer form per element.

## Role in Langlands

- **L-group**: \({}^L G = \hat G \rtimes \Gamma_k\) with the Galois
  action coming from the outer twist.
- **Endoscopic groups** of an outer form may themselves be outer
  forms — endoscopic transfer must be Galois-compatible.
- **Theta correspondence** for \(\mathrm{U}(n)\): a major topic of
  modern automorphic forms, using outer forms as the natural setting.
- **Functoriality**: lifting from \(\mathrm{U}(n)\) to \(\mathrm{GL}_n\)
  is **base change** for the quadratic extension, an instance of
  L-morphism reversal.

## References

- Tits, *Classification of algebraic semisimple groups* (Proc.\ AMS
  Symp.\ 1966).
- Borel–Serre, *Théorèmes de finitude en cohomologie galoisienne*
  (Comment.\ Math.\ Helv.\ 1964).
- Platonov–Rapinchuk, *Algebraic Groups and Number Theory* (1994).

## Prerequisite Topics

- [[node:forms.rational_forms_of_reductive_groups|Rational Forms of Reductive Groups]]
