---
id: classical_and_exceptional_groups.classical_groups
title: Classical Groups
kind: topic
status: admitted
primary_topic: AlgebraicGroups.ClassicalAndExceptionalGroups
topics:
- AlgebraicGroups.ClassicalAndExceptionalGroups
uses:
- linear_algebraic_groups.basic_examples
- reductive_groups.reductive_groups
- root_data.root_data
- root_data.classification_of_split_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are classical groups treated uniformly over arbitrary base fields, including their non-split and outer forms?"
  verdict: "Yes. The definitions are given via bilinear/Hermitian forms over arbitrary fields; the inner-form and outer-form structure (unitary groups, twisted orthogonal groups) is treated alongside the split case."
tags:
- classical-groups
- classical-and-exceptional-groups
---

# Classical Groups

The **classical groups** are the families \(\mathrm{GL}_n\),
\(\mathrm{SL}_n\), \(\mathrm{SO}_n\), \(\mathrm{Sp}_{2n}\), and
\(\mathrm{U}_n\) (and their adjoint / inner-form variants). They
provide the bulk of the concrete cases in the Langlands programme
and a complete bestiary of root-datum types \(A_n, B_n, C_n, D_n\).

## The four classical families

| Type | Group | Dynkin | Form preserved |
|---|---|---|---|
| \(A_{n-1}\) | \(\mathrm{GL}_n\), \(\mathrm{SL}_n\) | \(A_{n-1}\) | none (linear automorphisms) |
| \(B_n\) | \(\mathrm{SO}_{2n+1}\) | \(B_n\) | symmetric bilinear, dim \(2n+1\) |
| \(C_n\) | \(\mathrm{Sp}_{2n}\) | \(C_n\) | symplectic, dim \(2n\) |
| \(D_n\) | \(\mathrm{SO}_{2n}\) | \(D_n\) | symmetric bilinear, dim \(2n\) |

Each can be defined as a group preserving a non-degenerate form on a
finite-dimensional vector space.

## Definitions

Over a field \(k\) of characteristic \(\ne 2\):

- \(\mathrm{GL}_n = \{g \in M_n(k) : \det g \ne 0\}\).
- \(\mathrm{SL}_n = \ker(\det : \mathrm{GL}_n \to \mathbb{G}_m)\).
- \(\mathrm{O}(q) = \{g \in \mathrm{GL}(V) : q(gv) = q(v)\}\) for a
  non-degenerate quadratic form \(q\) on \(V\); \(\mathrm{SO}(q)\) is
  its identity component.
- \(\mathrm{Sp}(V, \omega) = \{g \in \mathrm{GL}(V) : \omega(gv, gw) = \omega(v, w)\}\)
  for a non-degenerate alternating form \(\omega\).
- \(\mathrm{U}(V, h) = \{g \in \mathrm{GL}_K(V) : h(gv, gw) = h(v, w)\}\)
  for a non-degenerate Hermitian form \(h\) over a quadratic
  extension \(K/k\).

## Inner and outer forms

Over a non-algebraically-closed field \(k\), the classical groups have
**non-split forms** parametrised by Galois cohomology:

| Group | Forms over \(k\) |
|---|---|
| \(\mathrm{GL}_n\) | Twisted by \(H^1(k, \mathrm{PGL}_n) = \mathrm{Br}(k)[n]\): inner forms are \(D^\times\) for central simple \(k\)-algebras \(D\) of degree \(n\) |
| \(\mathrm{SO}_n\) | Twisted by quadratic forms: forms are \(\mathrm{SO}(q)\) for non-isometric \(q\) of dimension \(n\) |
| \(\mathrm{Sp}_{2n}\) | No non-trivial inner forms over fields (symplectic forms are unique up to isometry) |
| \(\mathrm{U}_n\) | Forms are \(\mathrm{U}(h)\) for Hermitian forms \(h\); also depends on the quadratic extension \(K/k\) |

Outer forms involve non-trivial Galois action on the Dynkin diagram
(\(A_n\) and \(D_n\) have non-trivial diagram automorphisms);
\(\mathrm{U}_n\) is the outer form of \(\mathrm{GL}_n\) for the
quadratic extension \(K/k\).

## Root data

For the split forms:

### \(\mathrm{GL}_n\) (\(A_{n-1}\))

\(X^* = \mathbb{Z}^n\), \(\Phi = \{\varepsilon_i - \varepsilon_j\}\),
\(W = S_n\).

### \(\mathrm{Sp}_{2n}\) (\(C_n\))

\(X^* = \mathbb{Z}^n\),
\(\Phi = \{\pm \varepsilon_i \pm \varepsilon_j : i < j\} \cup \{\pm 2\varepsilon_i\}\),
\(W = (\mathbb{Z}/2)^n \rtimes S_n\).

### \(\mathrm{SO}_{2n+1}\) (\(B_n\))

\(\Phi = \{\pm \varepsilon_i \pm \varepsilon_j : i < j\} \cup \{\pm \varepsilon_i\}\);
the **dual** of \(\mathrm{Sp}_{2n}\) under Langlands duality.

### \(\mathrm{SO}_{2n}\) (\(D_n\))

\(\Phi = \{\pm \varepsilon_i \pm \varepsilon_j : i < j\}\); no short
roots. Self-dual under Langlands duality.

## Centres and fundamental groups

| \(G\) | \(Z(G)\) | \(\pi_1(G)\) |
|---|---|---|
| \(\mathrm{GL}_n\) | \(\mathbb{G}_m\) | \(\mathbb{Z}\) |
| \(\mathrm{SL}_n\) | \(\mu_n\) | \(0\) |
| \(\mathrm{PGL}_n\) | \(1\) | \(\mathbb{Z}/n\) |
| \(\mathrm{Sp}_{2n}\) | \(\mu_2\) | \(0\) |
| \(\mathrm{SO}_{2n+1}\) | \(1\) | \(\mathbb{Z}/2\) |
| \(\mathrm{SO}_{2n}\) | \(\mu_2\) | \(\mathbb{Z}/2\) (or \(\mathbb{Z}/4\) for \(n\) odd) |
| \(\mathrm{Spin}_n\) | \(\mu_2 \times \mu_2\) etc. (depends on parity) | \(0\) |

## Langlands duality

| \(G\) | \(\hat G\) |
|---|---|
| \(\mathrm{GL}_n\) | \(\mathrm{GL}_n\) (self-dual) |
| \(\mathrm{SL}_n\) | \(\mathrm{PGL}_n\) |
| \(\mathrm{Sp}_{2n}\) | \(\mathrm{SO}_{2n+1}\) |
| \(\mathrm{SO}_{2n+1}\) | \(\mathrm{Sp}_{2n}\) |
| \(\mathrm{SO}_{2n}\) | \(\mathrm{SO}_{2n}\) (self-dual; \(D_n\) has non-trivial outer auto for \(n > 4\)) |
| \(\mathrm{U}_n\) | \(\mathrm{GL}_n\) (with non-trivial Galois action) |

## Role in Langlands

Classical groups carry the most worked-out instances of the Langlands
correspondence:

- **\(\mathrm{GL}_n\)**: Langlands correspondence proved over local
  fields (Harris-Taylor, Henniart, Scholze); functional equation of
  \(L\)-functions; Rankin-Selberg theory.
- **Symplectic and orthogonal groups**: Arthur's endoscopic
  classification (2013) gives a complete description of the
  automorphic spectrum in terms of \(\mathrm{GL}_n\) data.
- **Unitary groups**: \(p\)-adic Langlands (Bushnell-Kutzko types);
  Shimura varieties (Kottwitz, Kisin); rigid inner forms (Kaletha).

## References

- Weyl, *The Classical Groups* (1939).
- Borel, *Linear Algebraic Groups* (1991), §23.
- Springer, *Linear Algebraic Groups* (1998), §17.
- Arthur, *The Endoscopic Classification of Representations:
  Orthogonal and Symplectic Groups* (Colloquium Publications, 2013).

## Prerequisite Topics

- [[node:linear_algebraic_groups.basic_examples|Basic Examples]]
- [[node:reductive_groups.reductive_groups|Reductive Groups]]
- [[node:root_data.root_data|Root Data]]
- [[node:root_data.classification_of_split_reductive_groups|Classification of Split Reductive Groups]]
