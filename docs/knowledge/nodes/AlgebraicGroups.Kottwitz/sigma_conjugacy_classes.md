---
id: kottwitz.sigma_conjugacy_classes
title: Sigma-Conjugacy Classes
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Kottwitz
topics:
- AlgebraicGroups.Kottwitz
uses:
- foundations.local_fields
- buildings.reductive_groups_over_local_fields
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are sigma-conjugacy classes defined for reductive groups over arbitrary fields with a chosen Frobenius/automorphism?"
  verdict: "Yes. The definition only needs a group G(L) and an automorphism sigma; the cases L = breve F (local Langlands) and L = a finite extension (Galois descent) are unified by this framework."
tags:
- sigma-conjugacy
- kottwitz-structures
---

# Sigma-Conjugacy Classes

The notion of **\(\sigma\)-conjugacy** generalises ordinary conjugacy:
it depends on a group action by an automorphism \(\sigma\), most often
the Frobenius of an unramified extension of a local field. It is the
fundamental equivalence relation underlying the Kottwitz set
[[node:kottwitz.b_of_g|\(B(G)\)]].

## Definition

Let \(G\) be a group equipped with an automorphism \(\sigma\) (e.g.\
\(G = G(L)\) for a reductive group \(G\) over a field \(F\) with a
field automorphism \(\sigma\) of an overfield \(L/F\)). Two elements
\(g, h \in G\) are **\(\sigma\)-conjugate** if there exists \(x \in G\)
such that
\[
h \;=\; x \, g \, \sigma(x)^{-1}.
\]

The equivalence classes are called **\(\sigma\)-conjugacy classes**,
and the set of classes is denoted \(B(G, \sigma)\) (or simply
\(B(G)\) when the choice of \(\sigma\) is canonical).

When \(\sigma = \mathrm{id}\), \(\sigma\)-conjugacy is ordinary
conjugacy.

## The Lang–Steinberg setting

Let \(G\) be a connected algebraic group over a finite field
\(\mathbb{F}_q\) with geometric Frobenius \(\sigma = \mathrm{Frob}_q\).

**Lang–Steinberg theorem.** The map
\[
G(\bar{\mathbb{F}_q}) \;\to\; G(\bar{\mathbb{F}_q}), \quad g \mapsto g^{-1} \sigma(g)
\]
is surjective. Hence every \(\sigma\)-conjugacy class contains the
identity (modulo cohomology), and
\(H^1(\sigma, G(\bar{\mathbb{F}_q})) = 1\).

This is the foundational vanishing result that makes Galois cohomology
manageable over finite fields.

## The Kottwitz setting

Let \(F\) be a non-archimedean local field with residue field
\(\mathbb{F}_q\), and let \(\breve F\) be the completion of the
maximal unramified extension \(F^{\mathrm{unr}}\). The Frobenius
\(\sigma\) acts on \(\breve F\) (and on \(G(\breve F)\)) as the
\(q\)-th power map on residues, lifted to \(\breve F\).

The set
\[
B(G) \;=\; G(\breve F) / \sigma\text{-conjugacy}
\]
is the **Kottwitz set** of \(G\), the central object of
[[node:kottwitz.b_of_g|B(G)]].

In contrast to the Lang–Steinberg setting, the Kottwitz set is
typically **non-trivial** because \(\breve F\) (unlike
\(\bar{\mathbb{F}_q}\)) is **not** "Brauer-trivial" enough — there are
non-split inner forms, isocrystals with non-trivial Newton polygon,
etc.

## Why \(\sigma\)-conjugacy and not ordinary conjugacy

Many arithmetic invariants (isocrystals, inner forms, Galois twists)
are naturally classified by \(\sigma\)-conjugacy rather than
conjugacy:

- An **\(F\)-rational form** of an object over \(\bar F\) corresponds
  to a \(\sigma\)-conjugacy class of cocycles
  \(\mathrm{Gal}(\bar F/F) \to \mathrm{Aut}(X)\); for cyclic Galois
  groups this reduces to \(\sigma\)-conjugacy of a single cocycle
  value.
- An **isocrystal** of dimension \(n\) over \(\breve F\) is a pair
  \((V, F)\) with \(V \cong \breve F^n\) and \(F : V \to V\) a
  \(\sigma\)-linear isomorphism; isomorphism classes are
  \(\sigma\)-conjugacy classes in \(\mathrm{GL}_n(\breve F)\).

## Examples

### \(G = \mathrm{GL}_1 = \mathbb{G}_m\)

\(G(\breve F)^\times = \breve F^\times\); \(\sigma\)-conjugacy is the
equivalence \(b \sim a \cdot b \cdot \sigma(a)^{-1}\). Because
\(\breve F^\times\) is \(\sigma\)-divisible enough (Hilbert 90
unramified), \(\sigma\)-conjugacy classes are parametrised by
\(\mathbb{Z} = \breve F^\times / (\text{unramified norms})\) (the
valuation).

So \(B(\mathbb{G}_m) = \mathbb{Z}\), with class of \(b\) determined by
\(v(b)\).

### \(G = \mathrm{GL}_n\)

\(B(\mathrm{GL}_n)\) = isocrystals up to iso = Newton polygons (Dieudonné-Manin).

### \(G\) a torus

For a torus \(T\) over \(F\), \(B(T) = X_*(T)^\Gamma\) (Galois
invariants of the cocharacter lattice). The bijection sends a
cocharacter \(\mu : \mathbb{G}_m \to T\) to the class of
\(\mu(\pi) \in T(\breve F)\), where \(\pi\) is a uniformiser.

## Maps and invariants

\(\sigma\)-conjugacy classes carry two basic functors:

- **Newton map** \(\nu : B(G) \to (X_*(T)_{\mathbb{Q}})^\Gamma / W\)
  — extracts the slope filtration (for \(\mathrm{GL}_n\), the Newton
  polygon).
- **Kottwitz map** \(\kappa : B(G) \to \pi_1(G)_\Gamma\) — projects to
  the algebraic fundamental group modulo Frobenius coinvariants.

Together \((\nu, \kappa)\) injects \(B(G)\) into a product of
combinatorial sets ([[node:kottwitz.b_of_g|Kottwitz
theorem]]).

## References

- Kottwitz, *Isocrystals with additional structure I, II* (Compositio
  Math. 1985, 1997).
- Steinberg, *Endomorphisms of linear algebraic groups* (Mem. AMS 1968).
- Borel, *Linear Algebraic Groups* (1991), §16 (Lang–Steinberg).

## Prerequisite Topics

- [[node:foundations.local_fields|Local Fields]]
- [[node:buildings.reductive_groups_over_local_fields|Reductive Groups over Local Fields]]
