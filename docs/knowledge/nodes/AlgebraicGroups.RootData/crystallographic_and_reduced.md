---
id: root_data.crystallographic_and_reduced
title: Crystallographic and Reduced Root Systems
kind: definition
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.root_pairing
- root_data.root_systems
---

# Crystallographic and Reduced Root Systems

Two integrality/finiteness conditions on root pairings play a central role in the
structure theory of algebraic groups: **crystallographicity** (integrality of Cartan
integers) and **reducedness** (no root is a non-trivial scalar multiple of another).

## Crystallographic root systems

**Definition.** A root pairing `RootPairing ι R M N` is **crystallographic** if for
all indices `i, j : ι`,
\[
  \langle \mathrm{root}(i),\, \mathrm{coroot}(j) \rangle \;\in\; \mathbb{Z}.
\]
Equivalently, the image of the pairing `⟨root –, coroot –⟩` lies in the subring
\(\mathbb{Z} \hookrightarrow R\). In Mathlib this is captured by the typeclass
`IsCrystallographic`, which asserts `IsValuedIn ℤ` for the root–coroot pairings.

**Geometric meaning.** Crystallographicity is the integrality condition that makes a
root system compatible with a lattice (the **root lattice** \(\mathbb{Z}\Phi \subseteq
M\)). It is automatically satisfied for root data (which live over \(\mathbb{Z}\)) and
for any root system arising from an algebraic group over \(\mathbb{Z}\). Real root
systems that are not crystallographic (e.g.\ rank-2 systems with angles \(\pi/5\))
do not correspond to algebraic groups.

**Examples of crystallographic root systems:** all of \(A_n\), \(B_n\), \(C_n\),
\(D_n\), \(E_6\), \(E_7\), \(E_8\), \(F_4\), \(G_2\) are crystallographic.

## Reduced root systems

**Definition.** A root pairing is **reduced** if no root is a non-trivial scalar
multiple of another root. Precisely: if `i, j : ι` satisfy \(\mathrm{root}(j) = c \cdot
\mathrm{root}(i)\) for some \(c \in R\), then \(c = \pm 1\) (and `j` is either `i`
or the index of \(-\mathrm{root}(i)\)). Mathlib: `RootPairing.IsReduced`.

**Characterisation via Coxeter weights.** For a crystallographic root pairing, the
reducedness condition is equivalent to the following: two roots are linearly independent
in \(M\) if and only if their Coxeter weight satisfies
\[
  \mathrm{coxeterWeight}(i, j) \ne 4.
\]
This is `linearIndependent_iff_coxeterWeight_ne_four` in Mathlib (proved in
`Mathlib.LinearAlgebra.RootSystem.Finite.Lemmas`). The case `coxeterWeight = 4`
corresponds precisely to \(\mathrm{root}(j) = \pm 2 \cdot \mathrm{root}(i)\), i.e.\ a
non-reduced configuration.

## Admissible Coxeter weights

For a crystallographic root pairing, the Coxeter weight
\(\langle \alpha, \beta^\vee \rangle \cdot \langle \beta, \alpha^\vee \rangle\)
must lie in \(\{0, 1, 2, 3, 4\}\). The Cartan integer pairs
\((\langle \alpha, \beta^\vee \rangle,\, \langle \beta, \alpha^\vee \rangle)\) are
further constrained; the admissible pairs (up to interchange) are:

| Coxeter weight | Cartan integer pairs | Interpretation |
|---|---|---|
| 0 | \((0, 0)\) | Orthogonal roots |
| 1 | \((1, 1)\) or \((-1, -1)\) | Equal-length, angle \(2\pi/3\) |
| 2 | \((1, 2)\) or \((-1, -2)\) | Double bond (one root twice as long) |
| 3 | \((1, 3)\) or \((-1, -3)\) | Triple bond (G₂) |
| 4 | \((2, 2)\) or \((-2, -2)\) etc. | Proportional roots (non-reduced) |

These constraints are proved in `Mathlib.LinearAlgebra.RootSystem.Finite.Lemmas`.

## Non-reduced root systems and the BC_n case

The root systems \(BC_n\) (sometimes written \(B_n C_n\)) are non-reduced: they
contain roots of the form \(\alpha\) and \(2\alpha\) simultaneously. They arise
naturally in two contexts:

1. **Relative root systems of unitary groups**: For a unitary group \(\mathrm{U}(n)\)
   over a local field \(F/F_0\), the relative root system (the non-zero weights of the
   maximal \(F_0\)-split torus) is of type \(BC_n\) in general.
2. **Iwahori–Matsumoto classification**: The admissible parameters for Hecke algebras
   associated to \(BC_n\) Coxeter systems include cases corresponding to the
   non-reduced root system.

Non-reduced root systems do not correspond to reductive algebraic groups in the usual
sense but do appear as relative root systems of non-split groups.

## Mathlib references

- `IsCrystallographic` — typeclass for crystallographic root pairings
- `RootPairing.IsReduced` — typeclass for reduced root pairings
- `linearIndependent_iff_coxeterWeight_ne_four` — characterisation of reducedness
- `Mathlib.LinearAlgebra.RootSystem.Finite.Lemmas` — Coxeter weight bounds

## Related nodes

- [[node:root_data.root_pairing|Root Pairings]]
- [[node:root_data.root_systems|Root Systems]]
- [[node:root_data.root_chains|Root Chains and the String Property]]
- [[node:root_data.classification_of_root_systems|Classification of Irreducible Root Systems]]
