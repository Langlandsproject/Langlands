---
id: kottwitz.admissible_sets
title: Admissible Sets
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Kottwitz
topics:
- AlgebraicGroups.Kottwitz
uses:
- kottwitz.b_of_g
- buildings.affine_weyl_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are admissible sets in B(G) treated as the canonical subsets indexed by minuscule (or arbitrary) cocharacters, applicable across reductive groups?"
  verdict: "Yes. Adm(μ) and B(G, μ) are defined for any pair (G, μ) of reductive group and cocharacter; the convex-hull / dominance characterisation is uniform."
tags:
- admissible-sets
- kottwitz-structures
---

# Admissible Sets

For a reductive group \(G\) over a local field and a cocharacter
\(\mu \in X_*(T)\), the **admissible set** \(B(G, \mu) \subseteq B(G)\)
consists of those \(\sigma\)-conjugacy classes whose Newton point
lies in the convex hull of the Weyl orbit of \(\mu\). It indexes the
Newton stratification of Shimura varieties of type \(\mu\).

## Definition

Let \(G\) be a connected reductive group over a non-archimedean local
field \(F\), and let \(\mu \in X_*(T)\) be a cocharacter (typically
minuscule for Shimura applications). The **set of \(\mu\)-admissible
classes** is
\[
B(G, \mu) \;:=\; \{[b] \in B(G) : \nu([b]) \le \bar\mu \text{ in dominance order}, \;\kappa([b]) = \mu \bmod (\sigma-1)\pi_1(G)\},
\]
where \(\bar\mu\) is the dominant representative of the Galois orbit
of \(\mu\) modulo the Weyl group, and \(\le\) is the standard
**dominance order** on rational cocharacters.

## Equivalent description

\([b] \in B(G, \mu)\) iff there exist:

- A representative \(b \in G(\breve F)\) of \([b]\);
- An element \(x \in G(\breve F)\) with \(x b \sigma(x)^{-1} \in K \mu(\pi) K\),
  where \(K = G(\mathcal{O}_F)\) is a hyperspecial maximal compact
  subgroup and \(\pi\) is a uniformiser.

Equivalently: the \(\sigma\)-conjugacy class \([b]\) is "approachable"
from the lattice flag of \(K \mu(\pi) K\) in the affine flag variety.

## Examples

### Minuscule \(\mu\) for \(\mathrm{GL}_n\)

For \(\mu = (1^d, 0^{n-d})\) (\(d\) ones, \(n-d\) zeros): the
admissible set \(B(\mathrm{GL}_n, \mu)\) consists of isocrystals of
dimension \(n\) and slope sum \(d\), with Newton polygon below the
"Hodge polygon" \((1, \ldots, 1, 0, \ldots, 0)\) (i.e.\ slopes in
\([0, 1]\)).

**Mazur's inequality** ensures this is exactly the condition coming
from a \(p\)-divisible group of height \(n\) and dimension \(d\).

### Minuscule \(\mu\) for \(\mathrm{Sp}_{2n}\)

For the "minuscule" minuscule \(\mu = (1, 0, \ldots, 0; 0, \ldots, 0, -1)\)
(corresponding to symplectic \(p\)-divisible groups of height \(2n\)):
admissible Newton polygons have slope multiset \(\{\lambda_i\}\)
satisfying \(\lambda_i + \lambda_{2n+1-i} = 0\), \(\lambda_i \in [0, 1]\),
and \(\sum \lambda_i = n\).

## Rapoport's conjecture (= Mazur's inequality, proven)

**Theorem (Rapoport-Richartz, Lucarelli, Gashi).** For any reductive
\(G\) and dominant \(\mu\):
\[
B(G, \mu) \;=\; \{[b] : \nu([b]) \preceq \mu^\diamond, \;\kappa([b]) = \mu^\natural\},
\]
where \(\mu^\diamond\) is the Galois average of \(W \mu\), and
\(\mu^\natural\) is the image in \(\pi_1(G)_\Gamma\). Originally
conjectured by Kottwitz, proven case-by-case by various authors.

## Hodge-Newton decomposition

For an admissible class \([b] \in B(G, \mu)\) whose Newton point lies
on a **wall** of the dominant chamber: the corresponding isocrystal
admits a canonical **Hodge-Newton decomposition** into a Levi piece
(slope on the wall) and a basic piece.

This gives the **base-change** stratification of admissible sets,
foundational for the Kottwitz conjecture on Shimura varieties.

## Shimura variety connection

For a Shimura variety \(\mathrm{Sh}_K(G, X)\) at \(p\) good reduction
with minuscule cocharacter \(\mu\):

- Newton strata of \(\mathrm{Sh}_K \pmod p\) are indexed by elements
  of \(B(G, \mu)\).
- Each stratum has a description via **affine Deligne-Lusztig
  varieties** and **Rapoport-Zink spaces**.
- The **basic stratum** is the unique class \([b]_0\) with central
  Newton point; the corresponding RZ space has dimension equal to
  the dimension of \(\mathrm{Sh}_K\).

## Affine Deligne-Lusztig varieties

For \(\tilde w \in \tilde W\) (affine Weyl) and \([b] \in B(G)\):
\[
X_w(b) \;:=\; \{g K \in G(\breve F)/K : g^{-1} b \sigma(g) \in K \tilde w K\}.
\]

\(X_w(b)\) is non-empty iff certain compatibilities hold; for
\(\tilde w = t_\mu\) (translation by \(\mu\)) one recovers the basic
geometry of the basic Rapoport-Zink space, and admissibility of
\([b]\) in \(B(G, \mu)\) is exactly non-emptiness of \(X_{t_\mu}(b)\).

## Role in Langlands

- **Local Langlands at non-tempered**: \(\mu\)-admissibility captures
  the "discrete series + boundary" decomposition; basic vs.\
  non-basic strata distinguish supercuspidal vs.\ non-supercuspidal
  L-packets.
- **Shimura variety arithmetic**: the **Tate conjecture**, point
  counts, and intersection numbers on Shimura varieties are organised
  by admissible sets and their RZ uniformisation.

## References

- Kottwitz, *Shimura varieties and twisted orbital integrals* (Math.\
  Ann.\ 1984), §4.
- Rapoport–Richartz, *On the classification and specialization of
  F-isocrystals with additional structure* (Compositio 1996), §4.
- Görtz, *Affine Deligne-Lusztig varieties and the geometry of
  Shimura varieties* (notes, 2009).

## Prerequisite Topics

- [[node:kottwitz.b_of_g|B(G)]]
- [[node:buildings.affine_weyl_groups|Affine Weyl Groups]]
