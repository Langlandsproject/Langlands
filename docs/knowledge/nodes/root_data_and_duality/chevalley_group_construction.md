---
id: root_data_and_duality.chevalley_group_construction
title: Chevalley Group Construction from a Root Datum
kind: definition
status: admitted
primary_topic: root_data_and_duality
topics:
- root_data_and_duality
- reductive_structure
uses:
- root_data_and_duality.root_data
- root_data_and_duality.based_root_data
- root_data_and_duality.pinnings
- root_data_and_duality.chevalley_existence_theorem
- root_data_and_duality.chevalley_isomorphism_theorem
- reductive_structure.algebraic_tori
- affine_group_schemes.affine_group_scheme_definition
- affine_group_schemes.general_linear_group_scheme
- root_data_and_duality.chevalley_basis
- root_data_and_duality.rank_one_subgroups_sl2_embeddings
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: Section 10.1
    format: section
    note: Chevalley group construction; Springer follows the original Chevalley 1955
      method via Lie algebras.
  - artifact: conrad-sga3-reductive-book
    locator: Exposé XXIII
    format: chapter
    note: Demazure's SGA3 construction of the group scheme associated to a based root
      datum over Z.
  - artifact: springer-algebraic-groups-survey
    locator: §4
    format: section
    note: Split reductive groups and Chevalley group schemes over Z.
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: Is the construction given over Z (Chevalley-Demazure integral form), not
    just over an algebraically closed field?
  verdict: Yes. The construction produces a group scheme G over Z (a Chevalley group
    scheme), and base change G_R = G x_Z R recovers a split reductive group over any
    base ring R.
tags:
- chevalley
- root-datum
- split-reductive-group
- construction
- group-scheme
- root-data-and-duality
---

# Chevalley Group Construction from a Root Datum

Given a **based root datum** \(\Psi = (X, \Phi, \Delta, X^\vee, \Phi^\vee, \Delta^\vee)\),
or equivalently a **pinning** \((G, B, T, (e_\alpha)_{\alpha \in \Delta})\) over an
algebraically closed field, the Chevalley–Demazure construction builds a
canonical split reductive group scheme \(\mathbf{G}_\Psi\) over \(\mathbb{Z}\).

## Step 1: The semisimple Lie algebra and Chevalley basis

Starting from the abstract root datum, choose the corresponding
**semisimple Lie algebra** \(\mathfrak{g}\) over \(\mathbb{Q}\) with root system
\(\Phi \subset X \otimes \mathbb{R}\). Chevalley (1955) showed that
\(\mathfrak{g}\) admits a \(\mathbb{Z}\)-basis
\[
\{H_\alpha : \alpha \in \Delta\} \cup \{e_\alpha : \alpha \in \Phi\}
\]
with structure constants in \(\mathbb{Z}\):
\[
[H_\alpha, e_\beta] = \langle \beta, \alpha^\vee \rangle\, e_\beta,\quad
[e_\alpha, e_{-\alpha}] = H_\alpha,\quad
[e_\alpha, e_\beta] = N_{\alpha,\beta}\, e_{\alpha+\beta}
\]
where \(N_{\alpha,\beta} \in \mathbb{Z}\) depend only on the root system
and can be chosen with a sign convention (the **Chevalley basis**).

The \(\mathbb{Z}\)-lattice
\(\mathfrak{g}_\mathbb{Z} = \operatorname{span}_\mathbb{Z}\{H_\alpha, e_\alpha\}\)
is a Lie algebra over \(\mathbb{Z}\) and is the **Chevalley \(\mathbb{Z}\)-form**.

## Step 2: Root subgroups \(U_\alpha\)

For each root \(\alpha \in \Phi\), define the **root subgroup** by the exponential
of the nilpotent \(e_\alpha\)-action. In the construction, one introduces
elements
\[
x_\alpha(t) = \exp(t\, e_\alpha) = \sum_{k=0}^\infty \frac{t^k}{k!} e_\alpha^k
\]
acting on a representation. For a suitable faithful representation
\((\rho, V)\) with \(\mathbb{Z}\)-lattice \(L \subset V\),
\(\rho(e_\alpha)^k/k!\) maps \(L\) to \(L\) for all \(k\),
so \(x_\alpha(t)\) is a well-defined element of \(\mathrm{GL}(L)\) for any
\(t\) in a \(\mathbb{Z}\)-algebra \(R\).

The map \(t \mapsto x_\alpha(t)\) defines a group scheme homomorphism
\[
x_\alpha : \mathbb{G}_a \longrightarrow \mathrm{GL}(L_R)
\]
whose image \(U_\alpha \cong \mathbb{G}_a\) is the **root subgroup** for
\(\alpha\). The key point is that this is defined over \(\mathbb{Z}\).

## Step 3: The torus \(T\)

The character lattice of the maximal torus is the group \(X = X^*(T)\)
specified by the root datum. Define
\[
T = \operatorname{Hom}_\mathbb{Z}(X, \mathbb{G}_m)
= \operatorname{Spec}(\mathbb{Z}[X])
\]
where \(\mathbb{Z}[X]\) is the group ring of \(X\). This is a split
algebraic torus over \(\mathbb{Z}\) with \(X^*(T) = X\).

## Step 4: Chevalley commutator relations

The root subgroups and torus satisfy the following relations
(**Chevalley commutator formulas**):

1. **Torus action on root subgroup:**
   \[
   t \cdot x_\alpha(c) \cdot t^{-1} = x_\alpha(\alpha(t)\, c)
   \]
   for \(t \in T(R)\), \(c \in R\), where \(\alpha(t) = \chi_\alpha(t) \in R^\times\)
   is the character \(\alpha : T \to \mathbb{G}_m\).

2. **Commutator of root subgroups:**
   For \(\alpha, \beta \in \Phi\) with \(\alpha + \beta \ne 0\),
   \[
   [x_\alpha(s), x_\beta(t)]
   = \prod_{i,j > 0,\, i\alpha+j\beta \in \Phi} x_{i\alpha+j\beta}(C_{\alpha\beta ij}\, s^i t^j)
   \]
   where the product is over roots of the form \(i\alpha+j\beta\)
   and \(C_{\alpha\beta ij} \in \mathbb{Z}\).

3. **Inverse and Weyl elements:** For each simple root \(\alpha\), define
   \[
   n_\alpha(t) = x_\alpha(t)\, x_{-\alpha}(-t^{-1})\, x_\alpha(t),\quad
   h_\alpha(t) = n_\alpha(t)\, n_\alpha(-1)^{-1}.
   \]
   Then \(h_\alpha : \mathbb{G}_m \to T\) is the coroot \(\alpha^\vee\) viewed as a
   cocharacter, and \(n_\alpha(1)\) represents the simple reflection
   \(s_\alpha \in W\).

## Step 5: The group \(\mathbf{G}_\Psi\)

The **Chevalley group scheme** \(\mathbf{G}_\Psi\) over \(\mathbb{Z}\) is
defined as the closed subgroup scheme of \(\mathrm{GL}(L)\) generated
by all \(U_\alpha\) and \(T\). More precisely:
\[
\mathbf{G}_\Psi = \text{(group scheme generated by } T, \{U_\alpha : \alpha \in \Phi\}).
\]
By the Bruhat decomposition (which holds at the level of functors
on \(\mathbb{Z}\)-algebras), this group scheme is affine of finite type
over \(\mathbb{Z}\), smooth and flat, with geometrically connected fibres.

## Properties of the output

| Property | Value |
|---|---|
| Base | \(\mathbb{Z}\) (or any ring \(R\) by base change) |
| Maximal torus | \(T = \operatorname{Spec}(\mathbb{Z}[X])\), split |
| Root datum | \((X, \Phi, X^\vee, \Phi^\vee)\) as given |
| Smoothness | Yes (relative dimension \(= |{\Phi}| + \mathrm{rank}\)) |
| Fibres | Geometrically connected reductive groups |

## Independence of choices

The construction depends on:
- The choice of Chevalley basis (sign conventions for structure
  constants \(N_{\alpha,\beta}\)): different choices give isomorphic
  groups.
- The choice of representation \(V\): different representations give
  isomorphic groups (by the Chevalley isomorphism theorem).

The resulting group scheme \(\mathbf{G}_\Psi\) is therefore **canonical
up to isomorphism** given the based root datum \(\Psi\).

## Examples

| Based root datum | Chevalley group |
|---|---|
| \((A_{n-1}, \text{SC})\) | \(\mathrm{SL}_n\) |
| \((A_{n-1}, \text{adj})\) | \(\mathrm{PGL}_n\) |
| \((C_n, \text{SC})\) | \(\mathrm{Sp}_{2n}\) |
| \((B_n, \text{adj})\) | \(\mathrm{SO}_{2n+1}\) |
| \((D_n, \text{SC})\) | \(\mathrm{Spin}_{2n}\) |
| \((G_2, \text{adj})\) | \(G_2\) |

(SC = simply connected; adj = adjoint.)

## Relation to the Chevalley classification theorems

- **Existence** (Chevalley existence theorem): Every root datum arises
  from some connected reductive group. The construction above provides
  the explicit witness.
- **Isomorphism** (Chevalley isomorphism theorem): Any two split
  connected reductive groups with the same based root datum are
  uniquely isomorphic as pinned groups. The construction above gives
  the canonical representative.

The two theorems together give the bijection:
\[
\{\text{split connected reductive groups over } k\}/\cong
\;\xrightarrow{\sim}\;
\{\text{based root data}\}/\cong.
\]
