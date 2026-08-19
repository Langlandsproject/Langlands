---
id: forms.inner_forms
title: Inner Forms
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.rational_forms_of_reductive_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are inner forms treated for arbitrary reductive groups, with the cohomological classification via H^1(k, G_ad) made explicit?"
  verdict: "Yes. Inner forms are defined via twists by 1-cocycles in G_ad; the classification via H^1(k, G_ad) and the relation to outer forms via the exact sequence 1 → G_ad → Aut(G) → Out(G) → 1 is uniform."
tags:
- inner-forms
- descent-and-forms
---

# Inner Forms

An **inner form** of a reductive group \(G\) over a field \(k\) is a
twist of \(G\) by a 1-cocycle valued in the adjoint group
\(G_{\mathrm{ad}}\). Inner forms preserve the "shape" of \(G\) (root
datum, Dynkin diagram) but can change its arithmetic properties
(splitting, anisotropy, division algebras).

## Setup

Let \(G\) be a connected reductive group over \(k\). The inner
automorphisms form a normal subgroup
\(\mathrm{Inn}(G) = G_{\mathrm{ad}} \subseteq \mathrm{Aut}(G)\), with
quotient the **outer automorphism group**
\(\mathrm{Out}(G) = \mathrm{Aut}(\text{based root datum})\):
\[
1 \;\to\; G_{\mathrm{ad}} \;\to\; \mathrm{Aut}(G) \;\to\; \mathrm{Out}(G) \;\to\; 1.
\]

An **inner form** is a \(k\)-form \(G'\) of \(G\) (i.e.\ \(G'_{\bar k} \cong G_{\bar k}\))
such that the Galois action on \(\mathrm{Aut}(G_{\bar k})\) projects
**trivially** to \(\mathrm{Out}\). Equivalently, the twisting cocycle
lies in \(G_{\mathrm{ad}}\).

## Cohomological classification

The set of inner forms of \(G\) over \(k\) (up to \(k\)-isomorphism) is
in bijection with the **pointed set**
\[
H^1(k, G_{\mathrm{ad}}).
\]

The marked point is \(G\) itself (the **quasi-split** inner form when
\(G\) is quasi-split).

## Examples

### \(\mathrm{GL}_n\) and central simple algebras

For \(G = \mathrm{GL}_n\): \(G_{\mathrm{ad}} = \mathrm{PGL}_n\),
\(H^1(k, \mathrm{PGL}_n) = \mathrm{Br}(k)[n]\) — the \(n\)-torsion of
the Brauer group. So inner forms of \(\mathrm{GL}_n\) are
\[
G^c \;=\; D^\times \;=\; (M_r(D'))^\times,
\]
where \(D\) is a central simple \(k\)-algebra of dimension \(n^2\),
\(D'\) the underlying division algebra, and \(r \cdot \deg D' = n\).

The split form (\(D = M_n(k)\)) corresponds to the marked class
\(0 \in \mathrm{Br}(k)[n]\).

### Real forms of \(\mathrm{SL}_n\)

\(H^1(\mathbb{R}, \mathrm{PGL}_n)\) gives:
- the split form \(\mathrm{SL}_n(\mathbb{R})\);
- the compact form \(\mathrm{SU}_n\);
- intermediate forms \(\mathrm{SU}(p, q)\) for \(p + q = n\).

These are all the "inner forms" of \(\mathrm{SL}_n\) over \(\mathbb{R}\).
(Outer forms include \(\mathrm{SL}_n(\mathbb{H})\) for \(n\) even.)

### Inner forms of \(\mathrm{Sp}_{2n}\)

\(H^1(k, \mathrm{Sp}_{2n,\mathrm{ad}})\) is non-trivial only when \(k\)
admits non-split central simple algebras of exponent 2. For \(k\)
local, this is the **Brauer group** \(\mathrm{Br}(k)[2]\), and the
non-trivial element gives a unique non-split inner form.

### Inner forms of orthogonal groups

\(H^1(k, \mathrm{SO}_n^{\mathrm{ad}})\) classifies non-degenerate
quadratic forms of dimension \(n\) with the same discriminant
(and Hasse-Witt invariant constraints).

## Inner twists and rigid inner forms

In the modern formulation (Vogan, Kaletha):

- An **inner twist** \((G^c, c)\) of a quasi-split \(G\) is a pair of
  an inner form \(G^c\) and a chosen cocycle representative \(c\).
- A **rigid inner twist** strengthens the cocycle: it carries
  additional data (a \(z\)-extension lift, e.g.) that rigidifies the
  L-packet classification.
- Two inner twists are equivalent if they differ by a Galois
  cohomology trivialisation.

This refinement is essential for stating local Langlands cleanly: the
L-packet of a parameter is not naturally indexed by representations
of one inner form, but by representations across all inner forms
parametrised by rigid inner twists.

## Local Langlands and inner forms

For a local field \(F\), the conjectural local Langlands correspondence
groups irreducible representations into **L-packets**:
\[
\Pi_\varphi \;\longleftrightarrow\; \varphi : W_F' \to {}^L G.
\]

Each L-packet \(\Pi_\varphi\) is divided across all inner forms of
\(G\). The component group \(S_\varphi = \pi_0(Z_{\hat G}(\varphi)/Z(\hat G)^\Gamma)\)
acts as a refinement, and:
\[
\Pi_\varphi \;\leftrightarrow\; \mathrm{Irr}(S_\varphi).
\]

The choice of bijection depends on a rigid inner twist (Kaletha's
formalism).

## Role in endoscopy

The Langlands–Shelstad transfer between inner forms uses:
- transfer factors on \(G\) and \(G^c\);
- character relations between L-packets on the two groups;
- Kaletha's refinement: rigid inner twists make the transfer canonical.

## References

- Borel, *Automorphic L-functions* (Corvallis 1979).
- Kottwitz, *Stable trace formula: elliptic singular terms* (Math.\
  Ann.\ 1986).
- Vogan, *The local Langlands conjecture* (in: Representation Theory
  of Groups and Algebras, AMS 1993).
- Kaletha, *Rigid inner forms of real and p-adic groups* (Annals 2016)
  and *Rigid inner forms vs isocrystals* (J.\ EMS 2018).

## Prerequisite Topics

- [[node:forms.rational_forms_of_reductive_groups|Rational Forms of Reductive Groups]]
