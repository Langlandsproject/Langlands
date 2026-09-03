---
id: root_data.root_pairing
title: Root Pairings (Unified Framework)
kind: definition
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses: []
---

# Root Pairings (Unified Framework)

A **root pairing** is Mathlib4's unified generalisation that subsumes both abstract
root systems (over \(\mathbb{R}\)) and root data (over \(\mathbb{Z}\)) under a
single algebraic framework.

## Definition (Mathlib: `Mathlib.LinearAlgebra.RootSystem.Defs`)

A **root pairing** `RootPairing ι R M N` consists of:

- An index type `ι` (ranging over the roots);
- A commutative ring `R`;
- An `R`-module `M` (the **weight space**) and an `R`-module `N` (the **coweight space**),
  equipped with a perfect bilinear pairing \(\langle -, - \rangle : M \times N \to R\);
- An injective map `root : ι ↪ M` (the **roots**);
- An injective map `coroot : ι ↪ N` (the **coroots**);
- For each index `i`, a **reflection permutation** `reflectionPerm i : ι ≃ ι`.

satisfying the following axioms:

- **(Normalisation)** \(\langle \mathrm{root}(i),\, \mathrm{coroot}(i) \rangle = 2\) for
  all `i : ι`;
- **(Reflection stability)** For each `i`, the induced permutation of roots satisfies
  \(\mathrm{root}(\mathrm{reflectionPerm}(i)(j)) = s_i(\mathrm{root}(j))\), where the
  reflection \(s_i : M \to M\) is defined by
  \[
    s_i(x) \;=\; x - \langle x,\, \mathrm{coroot}(i) \rangle \cdot \mathrm{root}(i).
  \]

## Special cases

- **`RootSystem`**: A root pairing where the image of `root` spans `M` (i.e.\ the roots
  generate the weight space). This specialises to the classical notion of a root system when
  \(R = \mathbb{R}\).
- **`RootDatum`**: A root pairing over \(R = \mathbb{Z}\) where `M` and `N` are finitely
  generated free \(\mathbb{Z}\)-modules (i.e.\ free abelian groups of finite rank) with a
  perfect \(\mathbb{Z}\)-bilinear pairing. This captures the algebraic-geometry notion of a
  root datum as in the Chevalley classification.

## Key Mathlib results

- **`RootPairing.ext`**: Coroots are uniquely determined by roots in characteristic zero
  (when `2` is injective in `R`), since the normalisation condition pins down
  `⟨root i, coroot i⟩ = 2` and the reflection permutation data.
- **`RootPairing.mk'`**: A simplified constructor that accepts an explicit coroot function
  and verifies the axioms, avoiding the need to supply `reflectionPerm` directly.
- **Coxeter weights**: The quantity
  \[
    \mathrm{coxeterWeight}(i, j) \;=\; \langle \mathrm{root}(i),\, \mathrm{coroot}(j) \rangle
    \cdot \langle \mathrm{root}(j),\, \mathrm{coroot}(i) \rangle
  \]
  is defined in Mathlib as `RootPairing.coxeterWeight i j`. For finite root pairings, this
  is bounded: \(\mathrm{coxeterWeight}(i, j) \le 4\).
  (Proved as `RootPairing.coxeterWeight_le_four` for finite crystallographic pairings.)

## Motivation for the unified framework

The `RootPairing` framework allows Mathlib to prove theorems about root systems and root
data simultaneously, without duplicating proofs. The two classical objects differ only in:

| | `RootSystem` | `RootDatum` |
|---|---|---|
| Base ring | Any (often \(\mathbb{R}\)) | \(\mathbb{Z}\) |
| Extra axiom | Roots span \(M\) | Free finitely generated modules |
| Classical source | Bourbaki root systems | Chevalley/Tits root data |

## References

- Mathlib4 source: `Mathlib.LinearAlgebra.RootSystem.Defs`
- Bourbaki, *Groupes et Algèbres de Lie* IV–VI.
- Conrad, *Reductive Group Schemes* (2014), §1.

## Related nodes

- [[node:root_data.root_systems|Root Systems]]
- [[node:root_data.root_data|Root Data]]
- [[node:root_data.crystallographic_and_reduced|Crystallographic and Reduced Root Systems]]
