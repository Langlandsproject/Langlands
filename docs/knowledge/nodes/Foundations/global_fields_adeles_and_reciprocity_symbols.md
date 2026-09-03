---
id: foundations.global_fields_adeles_and_reciprocity_symbols
title: Global Fields, Adeles, and Reciprocity Symbols
kind: topic
status: admitted
primary_topic: Foundations
topics:
- Foundations
uses:
- foundations.fields_and_field_extensions
- foundations.local_fields
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the topic treated uniformly for number fields and function fields, since both are global fields?"
  verdict: "Yes. The adele ring and reciprocity laws are stated for any global field; specific phenomena (archimedean places, function field analogues) are flagged."
tags:
- external-background
- global-fields
- adeles
- foundational-inputs
---

# Global Fields, Adeles, and Reciprocity Symbols

A **global field** is either:

- a **number field**: a finite extension of \(\mathbb{Q}\); or
- a **function field**: a finite extension of \(\mathbb{F}_p(t)\)
  (equivalently, the function field of a smooth projective curve over a
  finite field).

This is the setting for the *global* Langlands programme.

## Places of a global field

A **place** of \(F\) is an equivalence class of absolute values on \(F\).
For a number field, places are:

- **archimedean places** (real, complex), corresponding to embeddings
  \(F \hookrightarrow \mathbb{R}\) or \(F \hookrightarrow \mathbb{C}\);
- **non-archimedean places**, corresponding to prime ideals of the
  ring of integers \(\mathcal{O}_F\).

For a function field over \(\mathbb{F}_q\), all places are
non-archimedean and correspond to closed points of the underlying
curve.

At each place \(v\), the completion \(F_v\) is a
[[node:foundations.local_fields|local field]] with ring of
integers \(\mathcal{O}_{F_v}\) (when non-archimedean).

## The adele ring

The **adele ring** is the restricted product

\[
\mathbb{A}_F \;=\; \prod_{v}^{'} F_v
  \;=\; \{(x_v) \in \prod_v F_v : x_v \in \mathcal{O}_{F_v} \text{ for almost all } v\}.
\]

It is a locally compact topological ring containing \(F\) discretely.
The **idele group** is \(\mathbb{A}_F^\times\), the units of
\(\mathbb{A}_F\).

For a reductive group \(G/F\), the **adelic group**
\(G(\mathbb{A}_F)\) carries the natural topology making it a locally
compact topological group; the quotient \(G(F) \backslash G(\mathbb{A}_F)\)
(or \(G(F) \backslash G(\mathbb{A}_F) / G(\mathbb{A}_F)_{\mathrm{cpt}}\))
is the setting for automorphic forms.

## Class field theory (sketch)

For an abelian extension \(L/F\) of global fields, there is a canonical
isomorphism (the **reciprocity isomorphism**)

\[
\operatorname{Gal}(L/F) \;\to\; \pi_0\bigl(\mathbb{A}_F^\times / F^\times \cdot N_{L/F}(\mathbb{A}_L^\times)\bigr).
\]

The full statement extends to non-abelian extensions via the Langlands
correspondence.

## Reciprocity laws and symbols

For each place \(v\), local reciprocity gives a map

\[
F_v^\times \to \operatorname{Gal}(F_v^{\mathrm{ab}}/F_v),
\]

and global reciprocity is the assembly of these via the adelic
exponential sequence. The relevant **reciprocity symbols** include:

- **Hilbert symbol** \((a, b)_v \in \{\pm 1\}\) for a local field
  containing \(\sqrt{-1}\) or for archimedean places (quadratic).
- **Tame symbol** at a non-archimedean place — see
  [[node:foundations.algebraic_k_theory_and_k2|\(K_2\)]] for
  the \(K\)-theoretic interpretation.
- **Power residue symbols** \((a, b)_v^{1/n}\) for \(n\)-th powers in
  fields containing \(\mu_n\).

These symbols satisfy a **product formula**: for fixed \(a, b \in F^\times\),
the product \(\prod_v (a, b)_v = 1\) over all places.

## Why this matters for Langlands

- The local-global principle reduces (some) global statements to
  compatibility of local statements at each place.
- Automorphic forms on \(G(\mathbb{A}_F)\) decompose (at each place)
  into local components — the **factorisation** of automorphic
  representations.
- The metaplectic groups
  ([[node:covers.local_and_global_metaplectic_covers|BD covers]])
  are constructed via reciprocity / tame symbols at each place.

## Mathlib formalisation

- `Mathlib.NumberTheory.NumberField.*` — Number fields, ring of
  integers, places.
- `Mathlib.NumberTheory.Padics.*` — \(p\)-adic local fields.
- `Mathlib.NumberTheory.AdeleRing` — Adele ring (when available).

Significant infrastructure here is still in development upstream;
many later Langlands-roadmap nodes are blocked on Mathlib gaps in this
area.

## Prerequisite Topics

- [[node:foundations.fields_and_field_extensions|Fields and Field Extensions]]
- [[node:foundations.local_fields|Local Fields]]
