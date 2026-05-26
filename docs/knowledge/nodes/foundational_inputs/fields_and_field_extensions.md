---
id: foundational_inputs.fields_and_field_extensions
title: Fields and Field Extensions
kind: topic
status: admitted
primary_topic: foundational_inputs
topics:
- foundational_inputs
uses: []
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does this cover both characteristic-zero and positive-characteristic fields, as both occur in the Langlands programme?"
  verdict: "Yes. The treatment is characteristic-agnostic; specific phenomena (separability, Frobenius) are flagged when they depend on characteristic."
tags:
- external-background
- fields
- foundational-inputs
---

# Fields and Field Extensions

Fields are the base over which the classical theory of algebraic groups
operates. Many global statements (the embedding theorem, structure of
reductive groups, Bruhat decomposition) require a field hypothesis.

## Scope

### Fields

- Field axioms; characteristic \(0\) vs.\ characteristic \(p\).
- Prime fields: \(\mathbb{Q}\) (char 0), \(\mathbb{F}_p\) (char p).
- Finite fields \(\mathbb{F}_q\) for \(q = p^n\); the Frobenius
  \(x \mapsto x^p\).
- Algebraic closure \(\bar{k}\); existence and uniqueness up to
  non-canonical isomorphism.

### Field extensions

- \(K/k\) extension: \(K\) is a field containing \(k\) as a subfield.
- Algebraic vs.\ transcendental extensions.
- Finite extensions: degree \([K : k] < \infty\).
- Tower of extensions: \([L : k] = [L : K] \cdot [K : k]\).

### Separability

- Separable polynomial: distinct roots in \(\bar{k}\).
- Separable extension: every element has separable minimal polynomial.
- Always satisfied in characteristic zero; in characteristic \(p\),
  the failure manifests in inseparable extensions
  (\(x^p - a\) for \(a \notin k^p\)).
- Perfect field: every algebraic extension is separable (includes
  characteristic zero and finite fields).

### Galois theory

- Galois extension: normal + separable.
- Galois group \(\operatorname{Gal}(K/k)\) and the
  fundamental theorem.
- Profinite groups via inverse limits: absolute Galois group
  \(\operatorname{Gal}(\bar{k}/k)\).
- Galois cohomology \(H^1(\operatorname{Gal}(\bar{k}/k), G(\bar{k}))\)
  for an algebraic group \(G\) — see
  [[node:descent_and_forms.forms_of_algebraic_groups|forms]].

### Number fields and local fields

- **Number field**: finite extension of \(\mathbb{Q}\). Has rings of
  integers, primes, valuations.
- **Local field**: \(\mathbb{R}\), \(\mathbb{C}\), \(\mathbb{Q}_p\) or
  \(\mathbb{F}_q((t))\). Complete with respect to a discrete or
  archimedean valuation. See
  [[node:foundational_inputs.local_fields|local fields]].
- **Global field**: number field or function field of a curve over
  \(\mathbb{F}_q\).

## Why fields are central in this DAG

- The classical theory of linear algebraic groups (Borel, Steinberg,
  Springer, Humphreys) is over a field, usually algebraically closed.
- Even when working over a general base, statements often require
  passing to the residue fields or fibres.
- Reductive group structure (root data) is canonically defined over
  the splitting field of a maximal torus.
- The Langlands programme distinguishes local (over local fields) from
  global (over global fields) — these are the natural domains of
  representation-theoretic statements.

## In this project's Lean code

The project's affine group schemes are defined over an arbitrary base
ring `R : CommRingCat`, NOT specialised to fields. Field-specific
results enter when references to standard structure theorems (Bruhat,
Borel, root data classification) come into scope; these are flagged in
the relevant blueprint nodes.

## Mathlib formalisation

- `Mathlib.Algebra.Field.Basic` — Field typeclass.
- `Mathlib.FieldTheory.*` — Field extensions, separability, Galois.
- `Mathlib.RingTheory.IsAlgClosed.Basic` — Algebraic closures.
- `Mathlib.NumberTheory.*` — Number fields, local fields.

## References

- Lang, *Algebra* (Springer GTM 211, 2002), chs. V–VIII.
- Neukirch, *Algebraic Number Theory* (Springer Grundlehren 322, 1999).
- Serre, *Local Fields* (Springer GTM 67, 1979).
