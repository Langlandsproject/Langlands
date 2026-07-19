---
id: root_data_and_duality.chevalley_basis
title: Chevalley Basis
kind: definition
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
uses:
- root_data_and_duality.root_systems
- root_data_and_duality.cartan_matrices_and_dynkin_diagrams
source:
  spans:
  - artifact: chevalley-algebraic-groups
    locator: "Séminaire 1956, Exposé 5"
    format: chapter
    note: "Chevalley's original construction of the integral basis."
  - artifact: carter-finite-groups-lie-type
    locator: "Section 1.4"
    format: section
    note: "Chevalley basis and structure constants."
  - artifact: humphreys-linear-algebraic-groups
    locator: "Section 25.2"
    format: section
    note: "Construction of Chevalley basis from root system."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the existence of a Chevalley basis proved for all complex semisimple Lie algebras?"
  verdict: "Yes. Chevalley showed that for any complex semisimple Lie algebra with root system Φ, one can choose a basis {Hα, Eα} with structure constants in Z, and the signs of Nα,β can be fixed by a sign convention."
tags:
- chevalley-basis
- semisimple-lie-algebra
- structure-constants
- integral-form
- root-data-and-duality
---

# Chevalley Basis

A **Chevalley basis** of a complex semisimple Lie algebra \(\mathfrak g\)
is a basis
\[
\{H_\alpha : \alpha \in \Delta\} \cup \{E_\alpha : \alpha \in \Phi\}
\]
(indexed by simple roots \(\Delta\) and all roots \(\Phi\))
satisfying the integer structure constant conditions:

\[
[H_\alpha, H_\beta] = 0, \quad
[H_\alpha, E_\beta] = \langle \beta, \alpha^\vee \rangle\, E_\beta,
\]
\[
[E_\alpha, E_{-\alpha}] = H_\alpha, \quad
[E_\alpha, E_\beta] = N_{\alpha,\beta}\, E_{\alpha+\beta}
\quad (\alpha + \beta \in \Phi),
\]
where \(N_{\alpha,\beta} \in \mathbb{Z} \setminus \{0\}\) and
\(N_{\alpha,\beta} = -N_{-\alpha,-\beta}\).

## Key properties

1. **Integer structure constants**: all \(N_{\alpha,\beta} \in \mathbb{Z}\), so
   the \(\mathbb{Z}\)-span
   \[
   \mathfrak g_{\mathbb{Z}} = \bigoplus_{\alpha \in \Delta} \mathbb{Z} H_\alpha
   \oplus \bigoplus_{\alpha \in \Phi} \mathbb{Z} E_\alpha
   \]
   is a Lie algebra over \(\mathbb{Z}\) (a **Chevalley \(\mathbb{Z}\)-form**).

2. **Base change**: \(\mathfrak g_{\mathbb{Z}} \otimes_{\mathbb{Z}} k\) is a
   Lie algebra over any field \(k\), and the structure constants remain
   the same integers modulo \(\mathrm{char}(k)\).

3. **Sign ambiguity**: The basis is not unique. Different Chevalley bases
   for the same root system differ by signs \(E_\alpha \mapsto \pm E_\alpha\).
   However, the isomorphism type of the resulting integral form
   \(\mathfrak g_{\mathbb{Z}}\) is unique.

4. **Existence**: Chevalley proved existence for all complex semisimple
   Lie algebras by explicit computation using Serre's presentation.

## Structure constants \(N_{\alpha,\beta}\)

For non-proportional roots \(\alpha, \beta \in \Phi\) with
\(\alpha + \beta \in \Phi\), define the **\(\alpha\)-string through \(\beta\)** as
\[
\beta - q\alpha, \ldots, \beta, \ldots, \beta + p\alpha \quad
(q,p \geq 0, \; q + p = -\langle \beta, \alpha^\vee \rangle + 2p).
\]
Then
\[
N_{\alpha,\beta} = \pm(q+1),
\]
where the sign is fixed by a global sign convention on the basis.

## Role in Chevalley group construction

The Chevalley basis is the essential input for the **Chevalley group
construction**:

1. The elements \(H_\alpha, E_\alpha\) define a faithful representation
   on a free \(\mathbb{Z}\)-module \(L\) (a lattice in the representation).
2. The **root subgroup elements** are formal exponentials
   \[
   x_\alpha(t) = \exp(t E_\alpha) = \sum_{k=0}^\infty \frac{t^k}{k!} E_\alpha^k.
   \]
   Since \(E_\alpha\) is nilpotent on \(L\), the sum is finite and
   \(x_\alpha(t)\) acts on \(L \otimes R\) for any ring \(R\).
3. The map \(t \mapsto x_\alpha(t)\) is a group scheme morphism
   \(\mathbb{G}_a \to \mathrm{GL}(L)\), defining the **root subgroup**
   \(U_\alpha\).
4. The commutator \([x_\alpha(s), x_\beta(t)]\) is computed by the
   **Chevalley commutator formula**, whose coefficients involve the
   \(N_{\alpha,\beta}\) and are integers.

## Examples

| Root system | \(\mathfrak g\) | Basis elements |
|---|---|---|
| \(A_1\) | \(\mathfrak{sl}_2\) | \(H, E, F\) with \([H,E]=2E, [H,F]=-2F, [E,F]=H\) |
| \(A_{n-1}\) | \(\mathfrak{sl}_n\) | \(E_{ij}\) (matrix units) for \(i \ne j\), \(H_i = E_{ii} - E_{i+1,i+1}\) |
| \(G_2\) | Exceptional | 14-dim basis with specific integer structure constants |

## References

- Chevalley (1955), original construction.
- Carter, *Finite Groups of Lie Type*, §1.4: explicit structure constants.
- Humphreys, *Introduction to Lie Algebras*, Chapter IV.
