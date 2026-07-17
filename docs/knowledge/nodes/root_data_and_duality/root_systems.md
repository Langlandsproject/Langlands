---
id: root_data_and_duality.root_systems
title: Root Systems
kind: definition
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses: []
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition stated through Mathlib's abstract root-pairing interface rather than a real Euclidean realization?"
  verdict: "Yes. A root system is a RootPairing whose roots and coroots span the two ambient modules. Finiteness, crystallographicity, and reducedness are separate hypotheses, exactly as in Mathlib v4.28 and v4.32."
tags:
- root-systems
- root-pairing
- mathlib-aligned
- root-data-and-duality
---

# Root Systems

The project uses Mathlib's abstract interface. A root system is not defined
first as a finite subset of a real Euclidean space. Instead, roots and coroots
are treated symmetrically in two perfectly paired modules.

## Root pairing

Let \(R\) be a commutative ring, let \(M\) and \(N\) be \(R\)-modules, and
let

$$
\langle-,-\rangle:M\times N\longrightarrow R
$$

be a perfect \(R\)-bilinear pairing. Let \(\iota\) be an indexing type. A
**root pairing** \(P\) consists of:

- an injection \(\alpha:\iota\hookrightarrow M\), whose values
  \(\alpha_i\) are the roots;
- an injection \(\alpha^\vee:\iota\hookrightarrow N\), whose values
  \(\alpha_i^\vee\) are the coroots;
- the normalization
  \(\langle\alpha_i,\alpha_i^\vee\rangle=2\) for every \(i\);
- for every \(i\), a permutation \(r_i\) of \(\iota\) such that for all
  \(j\),

$$
\alpha_j-\langle\alpha_j,\alpha_i^\vee\rangle\alpha_i
  =\alpha_{r_i(j)},
$$

and

$$
\alpha_j^\vee-\langle\alpha_i,\alpha_j^\vee\rangle\alpha_i^\vee
  =\alpha_{r_i(j)}^\vee.
$$

The same permutation \(r_i\) occurs in both formulas. This records that the
reflection on roots and the dual reflection on coroots correspond under the
common index set.

In Lean, this data is the structure \(RootPairing\ \iota\ R\ M\ N\).

## Root-system condition

For a root pairing \(P\), Mathlib's predicate \(P.IsRootSystem\) asserts
exactly that roots and coroots span their ambient modules:

$$
\operatorname{span}_R\{\alpha_i:i\in\iota\}=M,
\qquad
\operatorname{span}_R\{\alpha_i^\vee:i\in\iota\}=N.
$$

Thus a **root system** in this knowledge base is a root pairing \(P\) together
with an instance of \(P.IsRootSystem\).

## Independent refinements

The following are not built into \(IsRootSystem\):

- **finite:** assume that the indexing type \(\iota\) is finite;
- **crystallographic:** \(P.IsCrystallographic\) means every
  \(\langle\alpha_i,\alpha_j^\vee\rangle\) comes from an integer;
- **reduced:** \(P.IsReduced\) means linearly dependent roots differ only by
  sign.

Consequently, "finite reduced crystallographic root system" means a
\(RootPairing\) carrying all four pieces of information: \(Finite\ \iota\),
\(P.IsRootSystem\), \(P.IsCrystallographic\), and \(P.IsReduced\).

The familiar Euclidean definition is a realization of this interface over
\(\mathbb R\), not the primary definition.

## References

- N. Bourbaki, *Groupes et algebres de Lie*, Chapters IV--VI.
- Mathlib, *LinearAlgebra.RootSystem.Defs*,
  *LinearAlgebra.RootSystem.IsValuedIn*, and
  *LinearAlgebra.RootSystem.Reduced*.
