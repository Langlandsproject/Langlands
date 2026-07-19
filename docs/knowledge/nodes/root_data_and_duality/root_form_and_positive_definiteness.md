---
id: root_data_and_duality.root_form_and_positive_definiteness
title: Root Form and Positive Definiteness
kind: theorem
status: formalized
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.root_pairing
- root_data_and_duality.weyl_groups
---

# Root Form and Positive Definiteness

For a finite root pairing, there is a canonical `W`-invariant bilinear form on
the weight space, the **root form**, which is positive definite on the span of
roots. This is the algebraic analogue of the Killing form restricted to the
Cartan subalgebra.

## The Polarization map

**Definition (Mathlib: `RootPairing.Polarization`).** For a finite root pairing
`RootPairing ι R M N` with a fintype on `ι`, the **polarization map** is the
`R`-linear map \(\Phi: M \to N\) defined by
\[
  \Phi(x) \;=\; \sum_{i : \iota} \langle x,\, \mathrm{coroot}(i) \rangle \cdot \mathrm{coroot}(i),
\]
where the sum ranges over all indices (equivalently, all roots in the finite case).

The polarization map is the algebraic substitute for the map \(x \mapsto
\sum_\alpha (x, \alpha^\vee) \alpha^\vee\) in classical Euclidean root system
theory. It lands in the span of coroots in \(N\).

## The Root Form

**Definition (Mathlib: `RootPairing.RootForm`).** The **root form** is the bilinear
form \(B: M \times M \to R\) defined by
\[
  B(x, y) \;=\; \langle \Phi(x),\, y \rangle \;=\; \sum_{i : \iota} \langle x,\, \mathrm{coroot}(i) \rangle \cdot \langle y,\, \mathrm{coroot}(i) \rangle.
\]

Equivalently, composing the polarization with the original perfect pairing:
\(B = \langle \Phi(-), - \rangle\).

This mirrors the Killing form \(\kappa(x, y) = \mathrm{tr}(\mathrm{ad}(x) \circ
\mathrm{ad}(y))\) on a semisimple Lie algebra: restricted to the Cartan subalgebra
(identified with its dual via the roots), \(\kappa\) coincides with \(B\).

## Positive semidefiniteness

**Theorem (Mathlib: `rootForm_self_sum_of_squares`).** For all \(x \in M\):
\[
  B(x, x) \;=\; \sum_{i : \iota} \langle x,\, \mathrm{coroot}(i) \rangle^2 \;\ge\; 0.
\]

In particular, \(B\) is **positive semidefinite** on \(M\). The proof is
immediate from the sum-of-squares formula.

## Weyl invariance

**Theorem (Mathlib: `rootForm_reflection_reflection_apply`).** The root form is
invariant under the Weyl group action:
\[
  B(w \cdot x,\, w \cdot y) \;=\; B(x, y) \qquad \text{for all } w \in W,\; x, y \in M.
\]

Equivalently, the polarization map \(\Phi: M \to N\) intertwines the \(W\)-actions
on \(M\) and \(N\): \(\Phi(w \cdot x) = w \cdot \Phi(x)\). This follows because the
Weyl group permutes the set of roots, so the sum defining \(\Phi(w \cdot x)\) is a
rearrangement of the sum defining \(w \cdot \Phi(x)\).

## Positive definiteness on the root span

**Theorem (Mathlib: `rootForm_pos_of_nonzero`, `rootForm_restrict_nondegenerate_of_ordered`).**
For a finite crystallographic root pairing over an ordered field, the root form \(B\)
is **positive definite** on the \(R\)-span of the roots:
\[
  B(x, x) > 0 \qquad \text{for all nonzero } x \in \mathrm{span}_R\{\mathrm{root}(i) : i \in \iota\}.
\]

More precisely, `rootForm_restrict_nondegenerate_of_ordered` asserts that the
restriction of \(B\) to the root span is nondegenerate; together with positive
semidefiniteness this gives positive definiteness on the root span (over ordered
fields where \(B(x,x) = 0 \Rightarrow x = 0\) from the sum-of-squares).

## Consequences and applications

The root form gives the span of roots a canonical structure of a Euclidean space:

1. **W as a Euclidean reflection group.** Since \(B\) is a \(W\)-invariant
   positive definite form on the root span, \(W\) embeds into the orthogonal
   group \(O(\mathrm{span}\, \Phi, B) \cong O(r)\) where \(r = \mathrm{rank}\, \Phi\).
   This is the geometric realization of the Weyl group as a finite reflection
   group.

2. **Angles and length ratios.** The angles between roots \(\alpha, \beta\) are
   \(\cos\theta = B(\alpha, \beta) / \sqrt{B(\alpha,\alpha) B(\beta,\beta)}\),
   and the length ratios \(\|\alpha\|^2 / \|\beta\|^2 = B(\alpha,\alpha) / B(\beta,\beta)\)
   recover the classical geometry of the root system.

3. **Connection to the Killing form.** For \(\mathfrak{g} = \mathrm{Lie}(G)\) a
   semisimple Lie algebra over \(\mathbb{R}\) or \(\mathbb{C}\), the Killing form
   \(\kappa|_{\mathfrak{h} \otimes \mathfrak{h}^*}\) agrees with the root form up
   to a positive scalar, confirming that the root form is the "correct" inner product.

## Mathlib references

- `RootPairing.Polarization` — the map \(\Phi: M \to N\)
- `RootPairing.RootForm` — the bilinear form \(B\)
- `rootForm_self_sum_of_squares` — positive semidefiniteness
- `rootForm_reflection_reflection_apply` — Weyl invariance
- `rootForm_pos_of_nonzero` — positivity on nonzero root-span elements
- `rootForm_restrict_nondegenerate_of_ordered` — nondegeneracy over ordered fields
- `Mathlib.LinearAlgebra.RootSystem.RootPositive` (or similar)

## Related nodes

- [[node:root_data_and_duality.root_pairing|Root Pairings]]
- [[node:root_data_and_duality.weyl_groups|Weyl Groups]]
- [[node:root_data_and_duality.crystallographic_and_reduced|Crystallographic and Reduced Root Systems]]
