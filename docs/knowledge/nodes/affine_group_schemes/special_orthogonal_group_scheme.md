---
id: affine_group_schemes.special_orthogonal_group_scheme
title: Special Orthogonal Group Scheme SO_n
kind: definition
status: admitted
primary_topic: affine_group_schemes
topics:
- affine_group_schemes
- classical_and_exceptional_groups
uses:
- affine_group_schemes.special_linear_group_scheme
- affine_group_schemes.general_linear_group_scheme
- affine_group_schemes.affine_group_scheme_definition
- affine_group_schemes.coordinate_hopf_algebra_of_group_scheme
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.2"
    format: section
    note: "Orthogonal and special orthogonal groups as group schemes preserving a quadratic form."
  - artifact: chevalley-algebraic-groups
    locator: "Chapter II"
    format: chapter
    note: "Classical groups as algebraic groups."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is SO_n defined for quadratic forms over an arbitrary base ring, including in characteristic 2?"
  verdict: "Mostly yes. In characteristic not 2, SO_n = ker(det: O_n -> {±1}) is smooth. In characteristic 2, the orthogonal group requires a separate theory via quadratic forms (not symmetric bilinear forms, which degenerate). The Zariski-closure definition still gives a group scheme but smoothness requires the form to be non-degenerate in the relevant sense."
tags:
- classical-groups
- orthogonal
- special-orthogonal
- group-scheme
- affine-group-scheme
- type-B
- type-D
---

# Special Orthogonal Group Scheme SO_n

## Setup: the quadratic form

Fix the standard split quadratic form of rank \(n\). Over \(\mathbb{Z}\):

- For **\(n = 2m+1\)** (odd):
  \[
  Q = x_0^2 + x_1 x_{n-1} + x_2 x_{n-2} + \cdots + x_m x_{m+1}
  \]
  with Gram matrix \(I_1 \oplus \begin{pmatrix}0&1\\1&0\end{pmatrix}^m\).

- For **\(n = 2m\)** (even):
  \[
  Q = x_1 x_n + x_2 x_{n-1} + \cdots + x_m x_{m+1}
  \]
  with Gram matrix \(\begin{pmatrix}0&1\\1&0\end{pmatrix}^m\).

Write the associated bilinear form as
\(B(v,w) = Q(v+w) - Q(v) - Q(w)\), and its matrix as \(M\)
(\(M = 2\,\mathrm{Gram}(Q)\) when \(2\) is invertible).

## Definition

### Orthogonal group \(\mathrm{O}(Q)\)

\[
\mathrm{O}(Q)(R) = \{A \in \mathrm{GL}_n(R) : Q(Av) = Q(v) \text{ for all } v \in R^n\}.
\]
In terms of matrices (when \(2\) is a unit in \(R\)):
\[
\mathrm{O}(Q)(R) = \{A \in \mathrm{GL}_n(R) : A^T M A = M\}.
\]
This is a closed subgroup scheme of \(\mathrm{GL}_n\).

### Special orthogonal group \(\mathrm{SO}(Q)\)

\[
\mathrm{SO}(Q) = \ker\bigl(\det : \mathrm{O}(Q) \to \mathbb{G}_m\bigr).
\]
Concretely,
\[
\mathrm{SO}(Q)(R) = \{A \in \mathrm{O}(Q)(R) : \det A = 1\}.
\]

## Coordinate Hopf algebra

\[
\mathcal{O}(\mathrm{SO}_n) = \mathbb{Z}[x_{ij}] / (A^T M A - M,\; \det(x_{ij}) - 1).
\]
The Hopf algebra structure (comultiplication \(\Delta(x_{ij}) = \sum_k x_{ik} \otimes x_{kj}\),
counit \(\varepsilon(x_{ij}) = \delta_{ij}\), antipode via the inverse matrix)
is inherited from \(\mathrm{GL}_n\).

## Smoothness and structure

In characteristic \(\ne 2\):

- \(\mathrm{O}_n\) and \(\mathrm{SO}_n\) are smooth over \(\mathbb{Z}[1/2]\).
- \(\mathrm{O}_n\) has two connected components: the identity component
  \(\mathrm{SO}_n\) (det \(= 1\)) and the component of reflections (det \(= -1\)).
- \(\dim \mathrm{SO}_n = \tfrac{n(n-1)}{2}\).

In characteristic \(2\), the correct definition uses quadratic forms directly
(not the bilinear form), and \(\mathrm{SO}_n\) is defined differently to
remain smooth.

## Lie algebra

\[
\operatorname{Lie}(\mathrm{SO}_n) = \mathfrak{so}_n
= \{X \in M_n : X^T M + M X = 0\}
= \{X \in M_n : X^T = -X\} \quad (\text{for }M = I_n).
\]
Skew-symmetric matrices; dimension \(\frac{n(n-1)}{2}\).

## Root data and types

### Type \(B_n\): \(\mathrm{SO}_{2n+1}\)

Maximal split torus
\(T = \mathrm{diag}(t_1, \dots, t_n, 1, t_n^{-1}, \dots, t_1^{-1})\).
\[
\Phi = \{\pm\varepsilon_i \pm \varepsilon_j : i<j\} \cup \{\pm\varepsilon_i\},
\quad W = (\mathbb{Z}/2)^n \rtimes S_n.
\]
Simple roots: \(\varepsilon_i - \varepsilon_{i+1}\) for \(i < n\),
and \(\varepsilon_n\) (the unique short simple root).

### Type \(D_n\): \(\mathrm{SO}_{2n}\)

Maximal split torus
\(T = \mathrm{diag}(t_1,\dots,t_n,t_n^{-1},\dots,t_1^{-1})\).
\[
\Phi = \{\pm\varepsilon_i \pm \varepsilon_j : i < j\},\quad
W = (\mathbb{Z}/2)^{n-1} \rtimes S_n.
\]
Simple roots: \(\varepsilon_i - \varepsilon_{i+1}\) for \(i < n\),
and \(\varepsilon_{n-1} + \varepsilon_n\).

## Centre and (co)spin covers

| \(n\) | \(Z(\mathrm{SO}_n)\) | Simply connected cover |
|---|---|---|
| \(2n+1\) (odd) | \(1\) | \(\mathrm{Spin}_{2n+1}\), centre \(\mu_2\) |
| \(2n\) (even, \(n\) even) | \(\mu_2\) | \(\mathrm{Spin}_{2n}\), centre \(\mu_2 \times \mu_2\) |
| \(2n\) (even, \(n\) odd) | \(\mu_2\) | \(\mathrm{Spin}_{2n}\), centre \(\mu_4\) |

## Langlands duals

| \(G\) | \(\hat G\) |
|---|---|
| \(\mathrm{SO}_{2n+1}\) | \(\mathrm{Sp}_{2n}\) (type \(C_n\)) |
| \(\mathrm{SO}_{2n}\) | \(\mathrm{SO}_{2n}\) (self-dual, type \(D_n\)) |
