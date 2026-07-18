---
id: descent_and_forms.galois_groups_and_descent_data
title: Galois Groups and Descent Data
kind: topic
status: admitted
primary_topic: linear_algebraic_groups
topics:
- descent_and_forms
uses:
- foundational_inputs.fields_and_field_extensions
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are Galois descent data treated for arbitrary algebraic objects (not just vector spaces or fields)?"
  verdict: "Yes. The descent formalism applies to any object on which the absolute Galois group acts, with the gluing data captured by a 1-cocycle for the action."
tags:
- galois-descent
- descent-and-forms
---

# Galois Groups and Descent Data

**Galois descent** is the technique of constructing \(k\)-objects
from \(\bar k\)-objects with Galois-equivariant data. It is the
elementary version of the more general descent theory (faithfully
flat, étale) and the foundation of the theory of forms.

## Setup

Let \(k\) be a field with separable closure \(\bar k\) and absolute
Galois group \(\Gamma = \mathrm{Gal}(\bar k / k)\) (a profinite
group).

For a category of "objects with field of definition" (e.g.\ vector
spaces, algebras, varieties, group schemes):
- \(\mathcal{C}(k)\) = \(k\)-objects;
- \(\mathcal{C}(\bar k)\) = \(\bar k\)-objects, with \(\Gamma\)-action.

## Galois descent for vector spaces

**Theorem (Hilbert-Speiser).** For \(V\) a finite-dimensional
\(\bar k\)-vector space with a continuous semi-linear \(\Gamma\)-action,
the **\(\Gamma\)-invariants**
\[
V^\Gamma \;\subseteq\; V
\]
form a \(k\)-vector space \(V^\Gamma \otimes_k \bar k \;\stackrel{\sim}{\to}\; V\)
(canonical isomorphism).

**Semi-linear** action: \(\sigma(\lambda v) = \sigma(\lambda) \cdot \sigma(v)\)
for \(\lambda \in \bar k, v \in V, \sigma \in \Gamma\).

This gives an equivalence:
\[
\{k\text{-vector spaces}\} \;\stackrel{\sim}{\to}\; \{\bar k\text{-vector spaces with continuous semi-linear } \Gamma\text{-action}\}.
\]

## Descent data

A **descent datum** on a \(\bar k\)-object \(X_{\bar k}\) is a
collection of isomorphisms
\[
\phi_\sigma : X_{\bar k} \;\xrightarrow{\sim}\; \sigma^* X_{\bar k}, \qquad \sigma \in \Gamma,
\]
satisfying the **cocycle condition**:
\[
\phi_{\sigma\tau} \;=\; \sigma^*(\phi_\tau) \circ \phi_\sigma.
\]

**Theorem.** Descent data on \(X_{\bar k}\) up to equivalence are in
bijection with \(k\)-forms of \(X_{\bar k}\). The trivial descent
datum (\(\phi_\sigma = \mathrm{id}\)) corresponds to \(X_{\bar k}\)
itself if it is defined over \(k\).

## Examples

### Vector spaces

For \(V_{\bar k}\) with \(\Gamma\)-action, the \(k\)-form is
\(V_{\bar k}^\Gamma\).

### Algebraic varieties

For \(X_{\bar k}\) with a descent datum (= a "form" of a \(k\)-variety):
the \(k\)-form is constructed as the closed subscheme of \(X\) cut
out by Galois-equivariant equations.

Equivalently: \(X = \mathrm{Spec}(\mathcal{O}(X)^\Gamma)\) where
\(\Gamma\) acts on the coordinate ring via the descent datum.

### Algebraic groups

A descent datum on a \(\bar k\)-group \(G_{\bar k}\) is a
\(\Gamma\)-equivariant collection of group isomorphisms; the
resulting \(k\)-form \(G\) has \(G(\bar k) = G_{\bar k}\) with
the new \(\Gamma\)-action.

### Forms of \(\mathrm{GL}_n\)

For a 1-cocycle \(c : \Gamma \to \mathrm{PGL}_n(\bar k)\) corresponding
to a central simple \(k\)-algebra \(D\) of degree \(n\):
- Descent datum: \(\phi_\sigma = \mathrm{conj}(c_\sigma)\).
- \(k\)-form: \(D^\times\) (the algebraic group of units of \(D\)).
- Original \(\bar k\)-form: \(D^\times \otimes \bar k = \mathrm{GL}_n(\bar k)\).

## Non-Galois descent (sketch)

Galois descent extends to:
- **fpqc descent**: faithfully flat quasi-compact (most general).
- **fppf descent**: faithfully flat finite presentation.
- **Étale descent**: cover by étale morphisms.

These are the technical foundation for working with non-reduced
schemes, stacks, and characteristic-\(p\) phenomena. SGA1 (Grothendieck)
gives the general formalism.

## Continuous vs.\ discrete

For Galois descent: the \(\Gamma\)-action on \(X_{\bar k}\) must be
**continuous** with respect to the natural discrete topology on
\(X_{\bar k}(\bar k')\) for finite extensions \(\bar k' / k\).
Equivalently, \(X_{\bar k}\) descends through a finite Galois
sub-extension.

For most objects (finite type, locally of finite type): this is
automatic.

## Connection to Galois cohomology

A descent datum on \(X_{\bar k}\) is equivalent to a 1-cocycle
\(c : \Gamma \to \mathrm{Aut}(X_{\bar k})\); equivalence of descent
data corresponds to cocycle cohomology. So:
\[
\{k\text{-forms of } X_{\bar k}\}/\cong \;\stackrel{\sim}{\longleftrightarrow}\; H^1(k, \mathrm{Aut}(X_{\bar k})).
\]

This is the bridge to [[node:descent_and_forms.galois_cohomology|Galois cohomology]].

## Role in Langlands

- **Forms of reductive groups**: classified by descent data on the
  Chevalley split form.
- **Adelic descent**: global objects (Shimura varieties, automorphic
  representations) are constructed via local-global descent.
- **Galois representations**: \(\ell\)-adic Galois representations
  are descent data on certain cohomology groups; the global Langlands
  programme is largely about understanding these.

## Mathlib

Not yet formalised. Galois descent for vector spaces / fields is
implicit in `Mathlib.FieldTheory.Galois`.

## References

- Borel–Serre, *Sur les sous-groupes d'algèbres de Lie* (Toulouse
  1958).
- Serre, *Local Fields* (1979), §X.
- Borel, *Linear Algebraic Groups* (1991), §24.
- SGA 1 (Grothendieck, 1971): general descent formalism.

## Prerequisite Topics

- [[node:foundational_inputs.fields_and_field_extensions|Fields and Field Extensions]]
