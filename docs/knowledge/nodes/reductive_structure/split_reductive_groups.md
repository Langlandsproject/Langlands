---
id: reductive_structure.split_reductive_groups
title: Split Reductive Groups
kind: definition
status: admitted
primary_topic: reductive_structure
topics:
- reductive_structure
- root_data_and_duality
uses:
- reductive_structure.reductive_groups
- tori.algebraic_tori
- reductive_structure.maximal_tori
- tori.character_and_cocharacter_lattices
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 7.1"
    format: section
    note: "Split groups and split maximal tori."
  - artifact: conrad-reductive-group-schemes
    locator: "Definition 5.1.1"
    format: section
    note: "Split reductive groups over arbitrary base schemes."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition of split given for arbitrary fields, not just algebraically closed?"
  verdict: "Yes. A split reductive group is one that has a split maximal torus; over an algebraically closed field every reductive group is split, but over a general field this is a genuine condition."
tags:
- split-reductive-group
- split-torus
- reductive-structure
---

# Split Reductive Groups

A connected reductive group \(G\) over a field \(k\) is **split** if it
contains a maximal torus \(T\) that is **\(k\)-split**, i.e., isomorphic
to a product of copies of \(\mathbb{G}_m\) as a \(k\)-group scheme:
\[
T \cong \mathbb{G}_m^r \quad \text{over } k,
\]
where \(r = \mathrm{rank}(G)\).

## Split torus

A torus \(T\) is split over \(k\) if its character group
\(X^*(T) = \mathrm{Hom}_{k\text{-gp}}(T, \mathbb{G}_m)\)
is a free \(\mathbb{Z}\)-module on which \(\mathrm{Gal}(\bar k/k)\) acts
trivially. Equivalently, \(T\) is diagonalizable over \(k\) itself (not
just over \(\bar k\)).

## Split maximal torus

A **split maximal torus** is a maximal torus among the tori of \(G\)
that is split over \(k\). Such a torus need not exist for a general
reductive group over a non-algebraically closed field \(k\).

**Example.** For \(G = \mathrm{SL}_2\) over \(\mathbb{R}\), the
diagonal torus \(T = \left\{\begin{pmatrix} t & \\ & t^{-1}
\end{pmatrix}\right\}\) is split, while the "compact" torus
\(\mathrm{SO}(2)\) is not. So \(\mathrm{SL}_2/\mathbb{R}\) is split.

**Example.** The unitary group \(\mathrm{U}(n)\) over \(\mathbb{R}\)
associated to the standard Hermitian form is not split; its maximal
\(\mathbb{R}\)-split torus has rank \(0\).

## Classification

The fundamental theorem of Chevalley–Demazure–Grothendieck states that
over any field \(k\), split connected reductive groups are classified
up to isomorphism by their **based root data**:
\[
\{\text{split connected reductive groups over } k\}/{\cong}
\;\xrightarrow{\sim}\;
\{\text{based root data}\}/{\cong}.
\]
This is the content of the Chevalley existence and isomorphism
theorems.

## Split forms of reductive groups

Over a general field \(k\), a reductive group \(G\) may not be split,
but it always has a **unique split inner form** (the quasi-split or
split form), which serves as the canonical representative of the
\(k\)-forms of \(G\). All \(k\)-forms of a fixed split group \(G_0\)
are classified by the Galois cohomology set
\(H^1(k, \mathrm{Aut}(G_0))\).

## Over algebraically closed fields

Every reductive group over an algebraically closed field is split:
since all tori split over \(\bar k\), and a maximal torus over
\(\bar k\) is rational by the conjugacy of maximal tori, the group
is automatically split. Thus the Chevalley classification over
\(\bar k\) classifies all reductive groups.

## Role in the theory

Split reductive groups are the starting point for:
- **Chevalley group construction**: building \(G\) from a based root
  datum.
- **Galois descent**: non-split forms are torsors for split groups.
- **Langlands programme**: the L-group \({}^L G = \hat G \rtimes W_k\)
  involves the dual group \(\hat G\), defined using the dual root datum
  of the split form.
