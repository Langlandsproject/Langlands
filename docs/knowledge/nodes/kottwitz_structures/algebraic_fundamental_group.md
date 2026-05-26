---
id: kottwitz_structures.algebraic_fundamental_group
title: Algebraic Fundamental Group
kind: topic
status: admitted
primary_topic: kottwitz_structures
topics:
- kottwitz_structures
uses:
- reductive_structure.reductive_groups
- root_data_and_duality.root_data
- root_data_and_duality.fundamental_group_of_root_datum
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the algebraic fundamental group defined for any connected reductive group, not specialised to a particular type?"
  verdict: "Yes. pi_1(G) is defined from the root datum of any connected reductive group over any field; the construction is functorial and the Galois action on root data gives pi_1(G) a canonical Galois module structure."
tags:
- algebraic-fundamental-group
- kottwitz-structures
---

# Algebraic Fundamental Group

The **algebraic fundamental group** \(\pi_1(G)\) of a connected
reductive group \(G\) is the cokernel of the coroot lattice in the
cocharacter lattice of a maximal torus. It plays the role for
reductive groups that \(\pi_1\) of a Lie group plays in topology, and
it is the target of the
[[node:kottwitz_structures.kottwitz_homomorphism|Kottwitz map]].

## Definition

Let \(G\) be a connected reductive group over a field \(k\), with
maximal torus \(T\), cocharacter lattice \(X_*(T)\), and coroots
\(\Phi^\vee \subseteq X_*(T)\). Then
\[
\pi_1(G) \;:=\; X_*(T) \,/\, \mathbb{Z}\Phi^\vee,
\]
the cokernel of the inclusion of the **coroot lattice** \(Q^\vee :=
\mathbb{Z}\Phi^\vee\) into \(X_*(T)\).

This depends only on \(G\), not on the choice of \(T\) (since maximal
tori are conjugate). For \(G\) over \(k\) (not necessarily split),
the Galois group \(\Gamma = \operatorname{Gal}(\bar k/k)\) acts on
\(\pi_1(G)\).

## Equivalent description via short exact sequences

Let \(G_{\mathrm{sc}}\) be the simply connected cover of the derived
group \(G_{\mathrm{der}}\), and let \(D(G) := G/G_{\mathrm{der}}\) be
the cocharacter quotient (a torus). Then there is a short exact
sequence
\[
1 \;\longrightarrow\; G_{\mathrm{sc}} \;\longrightarrow\; G \;\longrightarrow\; D(G) \;\longrightarrow\; 1.
\]
\(\pi_1(G)\) fits into a long exact sequence relating it to
\(\pi_1(G_{\mathrm{der}})\) (the **fundamental group of the root
system**) and \(X_*(D(G))\):
\[
0 \;\to\; \pi_1(G_{\mathrm{der}}) \;\to\; \pi_1(G) \;\to\; X_*(D(G)) \;\to\; 0.
\]

## Examples

| \(G\) | \(\pi_1(G)\) |
|---|---|
| \(\mathbb{G}_m\) | \(\mathbb{Z}\) |
| \(T\) a torus | \(X_*(T)\) |
| \(\mathrm{GL}_n\) | \(\mathbb{Z}\) (via det) |
| \(\mathrm{SL}_n\) | \(0\) (simply connected) |
| \(\mathrm{PGL}_n\) | \(\mathbb{Z}/n\) |
| \(\mathrm{SO}_{2n+1}\) | \(\mathbb{Z}/2\) |
| \(\mathrm{Sp}_{2n}\) | \(0\) (simply connected) |
| \(\mathrm{SO}_{2n}\), \(n \ge 2\) | \(\mathbb{Z}/2\) (or \(\mathbb{Z}/4\) for \(n = 1\)) |
| \(\mathrm{PSp}_{2n}\) | \(\mathbb{Z}/2\) |
| \(E_8\) | \(0\) (simply connected = adjoint) |
| \(G_2\), \(F_4\) | \(0\) |
| \(E_6\) (simply connected) | \(0\); adjoint form has \(\pi_1 = \mathbb{Z}/3\) |

## Topological analogy

For a complex reductive group \(G(\mathbb{C})\), regarded as a
topological group, the algebraic fundamental group \(\pi_1(G)\)
defined above agrees with the **topological fundamental group** of
the underlying real Lie group of \(G(\mathbb{C})\). For example,
\(\pi_1^{\mathrm{top}}(\mathrm{PGL}_n(\mathbb{C})) = \mathbb{Z}/n\),
\(\pi_1^{\mathrm{top}}(\mathrm{SL}_n(\mathbb{C})) = 0\), etc.

This is why the same symbol \(\pi_1\) is used.

## Galois action

For \(G/k\) and an algebraic closure \(\bar k\), the Galois group
\(\Gamma\) acts on \(X_*(T_{\bar k})\) and on the set of coroots,
hence on \(\pi_1(G_{\bar k})\). The resulting **\(\Gamma\)-module**
\(\pi_1(G)\) is the basic Galois-theoretic invariant of \(G\).

For local fields \(F\), the **Frobenius coinvariants**
\(\pi_1(G)_\Gamma\) appear as the target of the Kottwitz homomorphism.

## Role in Galois cohomology and Langlands

- **Borovoi's abelianisation.** For a connected reductive group \(G\)
  over a field \(k\), Borovoi defines an "abelianised Galois
  cohomology"
  \[
  H^i_{\mathrm{ab}}(k, G) \;:=\; H^i(\Gamma, \pi_1(G_{\bar k}) \to X_*(T_{\bar k})),
  \]
  and shows
  \[
  H^1(k, G) \;\twoheadrightarrow\; H^1_{\mathrm{ab}}(k, G)
  \]
  with fibres governed by \(H^1(k, G_{\mathrm{sc}})\).
- **Kottwitz map.** \(\kappa_G : B(G) \to \pi_1(G)_\Gamma\) detects
  the "discrete part" of \(\sigma\)-conjugacy classes.
- **Dual group.** Under Langlands duality, \(\pi_1(G)\) becomes
  \(Z(\hat G)\), the centre of the dual group:
  \[
  \pi_1(G) \;=\; X^*(Z(\hat G)), \qquad \pi_1(G)_\Gamma \;=\; X^*(Z(\hat G))^\Gamma.
  \]
  So Kottwitz's map factors through characters of \(Z(\hat G)^\Gamma\),
  which directly correspond to L-packets via Langlands parametrisation.

## References

- Borovoi, *Abelian Galois cohomology of reductive groups* (Mem. AMS
  1998).
- Kottwitz, *Stable trace formula: cuspidal tempered terms* (Duke 1984)
  and *Isocrystals II* (Compositio 1997).
- Milne, *Reductive Groups* (notes), §17.

## Prerequisite Topics

- [[node:reductive_structure.reductive_groups|Reductive Groups]]
- [[node:root_data_and_duality.root_data|Root Data]]
- [[node:root_data_and_duality.fundamental_group_of_root_datum|Fundamental Group of a Root Datum]]
