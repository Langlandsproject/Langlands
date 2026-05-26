---
id: reductive_structure.semisimple_groups
title: Semisimple Groups
kind: topic
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
uses:
- reductive_structure.reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are semisimple groups treated as connected reductive groups with finite centre, uniformly over arbitrary fields?"
  verdict: "Yes. The definition is intrinsic (trivial radical, equivalently finite centre and reductive); the classification by simply connected and adjoint forms is uniform."
tags:
- semisimple-groups
- reductive-structure
---

# Semisimple Groups

A **semisimple algebraic group** is a connected reductive group with
trivial geometric **radical** (equivalently, with finite centre). The
semisimple groups are the "purest" reductive groups — those that
decompose as almost-products of simple factors.

## Definition

Let \(G\) be a connected linear algebraic group over a field \(k\),
and let \(R(G_{\bar k})\) denote the geometric **radical** (maximal
connected solvable normal subgroup of \(G_{\bar k}\)).

\(G\) is **semisimple** if \(R(G_{\bar k}) = 1\).

Equivalently: \(G\) is reductive with finite centre (in good
characteristic).

## Almost-direct product decomposition

**Theorem.** A connected semisimple algebraic group \(G\) over an
algebraically closed field is the **almost-direct product** of finitely
many **simple** factors:
\[
G \;=\; G_1 \cdot G_2 \cdots G_k,
\]
with each \(G_i\) simple (no normal connected proper subgroups), and
the \(G_i\) commuting; their intersections are finite central
subgroups.

This is the algebraic counterpart of "compact Lie group decomposes
as a quotient of a product of simply-connected simple compact groups
by a finite central subgroup."

## Classification

Connected simple algebraic groups over \(\bar k\) (good
characteristic) are classified by their Dynkin diagram:

\[
A_n, \quad B_n, \quad C_n, \quad D_n, \quad E_6, \quad E_7, \quad E_8, \quad F_4, \quad G_2.
\]

Within each Dynkin type, the possible groups form a **isogeny class**
parametrised by the lattice gap \(Q^\vee \subseteq X_* \subseteq P^\vee\):

- **Simply connected** form: \(X_* = Q^\vee\), trivial fundamental
  group, e.g.\ \(\mathrm{SL}_n, \mathrm{Spin}_n, \mathrm{Sp}_{2n}\).
- **Adjoint** form: \(X_* = P^\vee\), trivial centre, e.g.\
  \(\mathrm{PGL}_n, \mathrm{PSO}_n, \mathrm{PSp}_{2n}\).
- Intermediate forms exist for types where \(|P^\vee/Q^\vee| > 1\).

## Examples

| Group | Type | Form | Centre | \(\pi_1\) |
|---|---|---|---|---|
| \(\mathrm{SL}_n\) | \(A_{n-1}\) | sc | \(\mu_n\) | 0 |
| \(\mathrm{PGL}_n\) | \(A_{n-1}\) | ad | 1 | \(\mathbb{Z}/n\) |
| \(\mathrm{Spin}_{2n+1}\) | \(B_n\) | sc | \(\mu_2\) | 0 |
| \(\mathrm{SO}_{2n+1}\) | \(B_n\) | ad | 1 | \(\mathbb{Z}/2\) |
| \(\mathrm{Sp}_{2n}\) | \(C_n\) | sc | \(\mu_2\) | 0 |
| \(\mathrm{PSp}_{2n}\) | \(C_n\) | ad | 1 | \(\mathbb{Z}/2\) |
| \(\mathrm{Spin}_{2n}\) | \(D_n\) | sc | finite | 0 |
| \(\mathrm{SO}_{2n}\) | \(D_n\) | intermediate | \(\mu_2\) | \(\mathbb{Z}/2\) |
| \(G_2\) | \(G_2\) | sc = ad | 1 | 0 |
| \(F_4\) | \(F_4\) | sc = ad | 1 | 0 |
| \(E_6\) sc | \(E_6\) | sc | \(\mu_3\) | 0 |
| \(E_7\) sc | \(E_7\) | sc | \(\mu_2\) | 0 |
| \(E_8\) | \(E_8\) | sc = ad | 1 | 0 |

## Universal cover (sc cover)

For any connected semisimple group \(G\), there is a canonical
**simply connected cover**:
\[
1 \;\to\; \mu \;\to\; G^{\mathrm{sc}} \;\to\; G \;\to\; 1,
\]
where \(\mu = \ker(G^{\mathrm{sc}} \to G)\) is a finite central
subgroup of multiplicative type, and \(G^{\mathrm{sc}}\) is simply
connected (\(\pi_1 = 0\)).

Dually: the **adjoint quotient**
\(G^{\mathrm{ad}} := G/Z(G)\), with \(\pi_1(G^{\mathrm{ad}}) = Z(G^{\mathrm{sc}})\)
of size \(|P^\vee / Q^\vee|\).

## Relation to reductive groups

For any connected reductive \(G\):
\[
G \;=\; Z(G)^\circ \cdot G_{\mathrm{der}},
\]
where \(G_{\mathrm{der}}\) is the **derived group**, semisimple, and
\(Z(G)^\circ\) is the connected centre (a torus). The intersection
\(Z(G)^\circ \cap G_{\mathrm{der}}\) is a finite group of
multiplicative type.

So semisimple groups are exactly the **derived groups** of reductive
groups, modulo the central torus.

## Anisotropic semisimple groups

\(G\) semisimple is **anisotropic** if \(G\) has no proper parabolic
\(k\)-subgroup (equivalently, no \(k\)-rational maximal split torus
of positive dimension).

Over \(\mathbb{R}\): \(G\) anisotropic iff \(G(\mathbb{R})\) is
compact.

Over local fields: anisotropic groups are exactly the **inner forms
of \(\mathrm{SL}_1(D)\)** for \(D\) a central simple division algebra.

## Role in Langlands

- **Langlands functoriality**: most conjectures are stated for
  connected reductive groups, but the deepest non-trivial cases
  are semisimple.
- **Discrete series representations**: parametrised by **regular**
  characters of compact-modulo-centre maximal tori; the existence of
  such tori requires the group to be **of equal rank** with its
  maximal compact subgroup (a constraint that is automatic for
  semisimple groups in many cases).
- **Galois representations**: for \(G = \mathrm{SL}_n\), the
  Langlands correspondence gives the deepest known instances of the
  Fontaine-Mazur conjecture.
- **Geometric Langlands**: for semisimple \(G\), \(\mathrm{Bun}_G\)
  is connected, and the Langlands functoriality has a cleaner shape.

## Mathlib

`Mathlib.LinearAlgebra.RootSystem.IsCrystallographic` etc.\ provides
the abstract Dynkin/root-system infrastructure; explicit semisimple
algebraic groups are not yet there.

## References

- Borel, *Linear Algebraic Groups* (1991), §14.
- Springer, *Linear Algebraic Groups* (1998), §8.
- Humphreys, *Linear Algebraic Groups* (1975), §27.
- Tits, *Classification of algebraic semisimple groups* (Proc.\ AMS
  Symp.\ 1966).

## Prerequisite Topics

- [[node:reductive_structure.reductive_groups|Reductive Groups]]
