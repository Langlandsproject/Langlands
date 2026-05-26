---
id: buildings_and_parahorics.reductive_groups_over_local_fields
title: Reductive Groups over Local Fields
kind: topic
status: admitted
primary_topic: buildings_and_parahorics
topics:
- buildings_and_parahorics
uses:
- foundational_inputs.local_fields
- reductive_structure.reductive_groups
- root_data_and_duality.galois_action_on_root_data
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are reductive groups over local fields treated for all locally compact non-discrete topological fields (archimedean and non-archimedean)?"
  verdict: "Yes. The framework covers G over any local field F, with archimedean F (giving real/complex Lie groups) and non-archimedean F (giving p-adic Lie groups) as the two main cases."
tags:
- local-fields
- reductive-groups
- buildings-and-parahorics
---

# Reductive Groups over Local Fields

A **reductive group over a local field** \(G/F\) (with \(F\) locally
compact and non-discrete) carries a rich representation theory:
locally compact topology, smooth representations, parahoric structure,
local Langlands. This is the natural setting for local Langlands and
the foundation of the global automorphic theory.

## Setup

A **local field** is a locally compact non-discrete topological
field. Up to isomorphism:

- **Archimedean**: \(\mathbb{R}\) or \(\mathbb{C}\).
- **Non-archimedean** mixed characteristic: finite extensions of
  \(\mathbb{Q}_p\) (\(p\)-adic fields).
- **Non-archimedean** equal characteristic: finite extensions of
  \(\mathbb{F}_q((t))\) (Laurent series).

For \(F\) a local field, \(G(F)\) is a locally compact topological
group; for the non-archimedean case it is a totally disconnected
topological group.

## Topology and structure

For \(G\) reductive over \(F\):

- \(G(F)\) is a **locally compact topological group**.
- For non-archimedean \(F\): \(G(F)\) is **totally disconnected** (the
  open subgroups form a basis of identity).
- The **Bruhat-Tits building** \(\mathcal{B}(G, F)\) is a contractible
  metric space on which \(G(F)\) acts properly by simplicial
  isometries.

## Representation theory

- **Smooth representations**: representations on complex (or
  \(\bar{\mathbb{Q}}_\ell\)) vector spaces such that every vector has
  open stabiliser.
- **Admissible representations**: smooth representations on which all
  finite-dim vector spaces of invariants are finite-dimensional.
- **Supercuspidal representations**: admissible representations not
  appearing as subquotients of any parabolically induced representation
  from a proper Levi.

## Parahoric structure

\(G(F)\) has a rich collection of compact open subgroups:

- **Hyperspecial \(K_v = G(\mathcal{O}_F)\)** at hyperspecial vertices
  \(v\) of \(\mathcal{B}(G, F)\); exist iff \(G\) is unramified.
- **Iwahori \(I = K_C\)** for an alcove \(C \subseteq \mathcal{B}(G, F)\).
- **Parahoric \(K_F\)** for any facet \(F\); see
  [[node:buildings_and_parahorics.parahoric_subgroups|parahoric subgroups]].

These compact opens stratify the topology of \(G(F)\) and give the
Bushnell-Kutzko "types" for parametrising representations.

## Classification (Tits)

Reductive groups \(G\) over a non-archimedean local field \(F\) are
classified by:

- The **quasi-split form** over the maximal unramified extension
  \(\breve F\) (= a quasi-split type, like \({}^2 A_n\), \({}^3 D_4\), etc.);
- An **inner-form class** in \(H^1(F, G_{\mathrm{ad}})\).

For the unramified case: the inner-form class is detected by Newton/
Kottwitz invariants on \(B(G)\).

## Lang's theorem and connectedness

**Lang's theorem.** For \(G\) connected reductive over
\(\mathbb{F}_q\): \(H^1(\mathbb{F}_q, G) = 0\); the Lang map
\(g \mapsto g^{-1} F(g)\) is surjective.

Consequence: every reductive group over \(\mathbb{F}_q\) is split (=
quasi-split form is itself); inner forms over a local field reduce to
the residue-field case via the Tits index.

## Archimedean vs.\ non-archimedean

| Setting | Archimedean \(\mathbb{R}, \mathbb{C}\) | Non-archimedean \(\mathbb{Q}_p, \mathbb{F}_q((t))\) |
|---|---|---|
| Topology | Connected Lie group | Totally disconnected; locally profinite |
| Building | Symmetric space \(G/K\) | Bruhat-Tits building (CAT(0) simplicial complex) |
| Forms | Classified by Vogan/strong real forms | Classified by Tits index + \(H^1(F, G_{\mathrm{ad}})\) |
| Reps | \((g, K)\)-modules, Harish-Chandra | Smooth admissible reps, Bushnell-Kutzko types |
| L-parameters | \(W_F = \mathbb{C}^\times\) or non-abelian for \(\mathbb{R}\) | Weil-Deligne group \(W_F \times \mathrm{SL}_2(\mathbb{C})\) |

## Tate-Nakayama duality

For an algebraic torus \(T\) over a local field \(F\): Tate-Nakayama
duality gives canonical isomorphisms
\[
H^i(F, T) \;\cong\; H^{2-i}(F, X^*(T))^\vee,
\]
relating the cohomology of \(T\) to the Pontryagin dual of the
cohomology of its character lattice.

For non-abelian reductive \(G\): Borovoi-Kottwitz abelianisation
gives an analogue, foundational for stable conjugacy and endoscopy.

## Role in Langlands

- **Local Langlands**: \(G(F)\)-representations \(\leftrightarrow\)
  L-parameters \(W_F' \to {}^L G\).
- **Local L-functions**: defined for L-parameter and finite-dim
  representation of \(\hat G\).
- **Local epsilon factors**: defined for L-parameter; the local
  components of global epsilon factors.
- **Endoscopic transfer**: of stable distributions across \(G\) and
  its endoscopic groups.

## Mathlib

Partial infrastructure (\(\mathbb{Q}_p\), \(\mathbb{F}_q((t))\), local
fields in general) exists; reductive groups over them not yet
formalised.

## References

- Bruhat–Tits, *Groupes réductifs sur un corps local I, II* (1972,
  1984).
- Borel, *Linear Algebraic Groups* (1991), §16.
- Bushnell–Henniart, *The Local Langlands Conjecture for GL(2)*
  (2006).
- Bernstein–Zelevinsky, *Induced representations of reductive p-adic
  groups I* (Ann.\ Sci.\ ENS 1977).

## Prerequisite Topics

- [[node:foundational_inputs.local_fields|Local Fields]]
- [[node:reductive_structure.reductive_groups|Reductive Groups]]
- [[node:root_data_and_duality.galois_action_on_root_data|Galois Action on Root Data]]
