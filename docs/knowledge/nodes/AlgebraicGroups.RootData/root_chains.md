---
id: root_data.root_chains
title: Root Chains and the String Property
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.RootData
topics:
- AlgebraicGroups.RootData
uses:
- root_data.root_pairing
- root_data.crystallographic_and_reduced
---

# Root Chains and the String Property

For a crystallographic root pairing, the roots along any "direction" \(\alpha\)
through a starting root \(\beta\) form a **chain** — a contiguous interval with
no gaps. This **string property** is a fundamental combinatorial constraint that
underpins the classification of root systems.

## The α-chain through β

**Definition.** Let \(\Phi\) be a (crystallographic) root system and let
\(\alpha, \beta \in \Phi\) with \(\alpha \ne \pm\beta\). The **\(\alpha\)-chain
through \(\beta\)** (or **\(\alpha\)-string through \(\beta\)**) is the set of
all roots of the form \(\beta + k\alpha\) for \(k \in \mathbb{Z}\):
\[
  \mathrm{Chain}_\alpha(\beta) \;=\; \{\beta + k\alpha : k \in \mathbb{Z}\} \cap \Phi.
\]
Since \(\Phi\) is finite, this set is finite. Write it as
\(\{\beta - p\alpha,\, \beta - (p-1)\alpha,\, \dots,\, \beta,\, \dots,\, \beta + q\alpha\}\)
for non-negative integers \(p, q \ge 0\).

## The string property

**Theorem (Mathlib: `root_add_zsmul_mem_range_iff`).** The \(\alpha\)-chain through
\(\beta\) is an **unbroken interval**: for every integer \(k\) with
\(-p \le k \le q\), we have \(\beta + k\alpha \in \Phi\). Equivalently, there are
no "gaps" in the chain — if \(\beta - p\alpha\) and \(\beta + q\alpha\) are roots,
then all intermediate \(\beta + k\alpha\) are roots.

In Mathlib, this is formalized in `Mathlib.LinearAlgebra.RootSystem.Chain` (or
equivalent): the range of a root chain is a contiguous integer interval.

## The Cartan integer formula

**Theorem.** The chain endpoints satisfy:
\[
  q - p \;=\; -\langle \beta,\, \alpha^\vee \rangle \;\in\; \mathbb{Z}.
\]
In words: the "shift" \(q - p\) from the midpoint equals (minus) the Cartan
integer \(\langle \beta, \alpha^\vee \rangle\). This follows from the action of
the reflection \(s_\alpha\), which maps \(\beta + k\alpha\) to
\(\beta - (k + \langle \beta, \alpha^\vee \rangle)\alpha\), so in particular maps
the top of the chain to the bottom: \(s_\alpha(\beta + q\alpha) = \beta - p\alpha\),
giving \(p + q + \langle \beta, \alpha^\vee \rangle = 0\).

## Chain length bound

**Theorem (Mathlib: `chainBotCoeff_add_chainTopCoeff_le`).** For a finite
crystallographic root pairing:
\[
  p + q \;\le\; 3.
\]
Consequently, an \(\alpha\)-chain through \(\beta\) contains **at most 4 elements**.

*Proof sketch.* From \(q - p = -\langle \beta, \alpha^\vee \rangle\) and the
Coxeter weight bound \(\langle \beta, \alpha^\vee \rangle \cdot \langle \alpha,
\beta^\vee \rangle \le 4\) (with both factors integers), one deduces that
\(|\langle \beta, \alpha^\vee \rangle| \le 3\), giving \(p + q = |\langle \beta,
\alpha^\vee \rangle| + 2 \min(p, q) \le 3\) (using \(\min(p,q) \ge 0\)). The
Jacobson–Morozov argument (or \(\mathfrak{sl}_2\)-representation theory) provides
the key inequality.

The possible chain lengths and the corresponding Cartan integers are:

| \(p + q\) | \(\langle \beta, \alpha^\vee \rangle\) | Example |
|---|---|---|
| 0 | 0 | Orthogonal roots (\(A_1 \times A_1\)) |
| 1 | \(\pm 1\) | Single bond (type \(A_2\)) |
| 2 | \(\pm 2\) | Double bond (types \(B_2\), \(C_2\)) |
| 3 | \(\pm 3\) | Triple bond (type \(G_2\)) |

## Applications

1. **Lie algebra structure.** For a Lie algebra \(\mathfrak{g} = \bigoplus_\alpha
   \mathfrak{g}_\alpha \oplus \mathfrak{h}\), the root spaces along an
   \(\alpha\)-chain form an irreducible \(\mathfrak{sl}_2\)-module under the
   action of \(e_\alpha, h_\alpha, f_\alpha\). The chain length is \(p + q + 1\).

2. **Classification constraints.** The chain-length bound limits how many
   roots can exist between two adjacent root directions. Iterating this constraint
   across all pairs of simple roots produces the constraints on the Cartan matrix
   that lead to the A, B, C, D, G₂, F₄, E₆, E₇, E₈ classification.

3. **Root system embeddings.** Two non-proportional roots \(\alpha, \beta\) with
   their chains generate a rank-2 sub-root-system of type \(A_1 \times A_1\)
   (Coxeter weight 0), \(A_2\) (weight 1), \(B_2\) or \(C_2\) (weight 2),
   or \(G_2\) (weight 3).

## Mathlib references

- `root_add_zsmul_mem_range_iff` — the string (gap-free) property
- `chainBotCoeff_add_chainTopCoeff_le` — chain length bound \(p + q \le 3\)
- `Mathlib.LinearAlgebra.RootSystem.Chain` — chain definitions
- `Mathlib.LinearAlgebra.RootSystem.Finite.Lemmas` — finiteness results

## Related nodes

- [[node:root_data.root_pairing|Root Pairings]]
- [[node:root_data.crystallographic_and_reduced|Crystallographic and Reduced Root Systems]]
- [[node:root_data.cartan_matrices_and_dynkin_diagrams|Cartan Matrices and Dynkin Diagrams]]
- [[node:root_data.classification_of_root_systems|Classification of Irreducible Root Systems]]
