---
id: nilpotent_orbits.jacobson_morozov_theorem
title: Jacobson-Morozov Theorem
kind: topic
status: admitted
primary_topic: nilpotent_orbits
topics:
- nilpotent_orbits
uses:
- nilpotent_orbits.sl2_triples
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the Jacobson-Morozov theorem treated uniformly in good characteristic, not just characteristic zero?"
  verdict: "Yes. The theorem holds in characteristic zero (classical Jacobson-Morozov) and in good positive characteristic (Pommerening); a clean characteristic-independent statement is standard in modern references."
tags:
- jacobson-morozov
- nilpotent-orbits
---

# Jacobson-Morozov Theorem

The **Jacobson-Morozov theorem** asserts that every nonzero nilpotent
element in a semisimple Lie algebra extends to an
\(\mathfrak{sl}_2\)-triple. This is the foundational existence
statement underlying the entire classification of nilpotent orbits.

## Statement

**Theorem (Jacobson-Morozov).** Let \(\mathfrak{g}\) be a
finite-dimensional semisimple Lie algebra over a field \(k\) of
characteristic 0 (or of good characteristic for the type of
\(\mathfrak{g}\)). For every nonzero nilpotent element
\(e \in \mathfrak{g}\), there exist \(h, f \in \mathfrak{g}\) such
that \((e, h, f)\) is an \(\mathfrak{sl}_2\)-triple:
\[
[h, e] = 2e, \qquad [h, f] = -2f, \qquad [e, f] = h.
\]

Furthermore, the extension is **unique up to \(Z_G(e)^\circ\)-conjugacy**:
any two \(\mathfrak{sl}_2\)-triples extending the same \(e\) differ by
conjugation by an element of \(Z_G(e)^\circ\).

## Proof sketch

The key idea: extend the action of \(e\) (a nilpotent element) to a
representation of \(\mathfrak{sl}_2\) on \(\mathfrak{g}\) by adjointly
acting.

1. **Construct \(h\).** Use \(e\) and a Lie-theoretic argument:
   \(\mathrm{im}(\mathrm{ad}\, e) \cap \mathrm{ker}(\mathrm{ad}\, e) \supseteq \{0\}\)
   when \(\mathfrak{g}\) is "non-degenerate enough" (the Killing form
   condition). Specifically, find \(h\) with
   \([h, e] = 2e\) using semisimplicity of \(\mathrm{ad}(h)\).
2. **Construct \(f\).** Solve the equation \([e, f] = h\) using the
   surjectivity of \(\mathrm{ad}\, e\) restricted to suitable weight
   spaces.
3. **Verify \([h, f] = -2f\).** Automatic from the construction.

The "non-degenerate enough" condition is automatic in characteristic
0 (Killing form non-degenerate); in positive characteristic, "good"
means: not a torsion prime for \(\mathfrak{g}\) (e.g.\ \(p \ne 2\) for
\(B_n, C_n, D_n\); \(p \ne 2, 3\) for exceptional types; with
specific exceptions for \(G_2, F_4, E_6, E_7, E_8\)).

## Failure in bad characteristic

In bad characteristic (e.g.\ \(p = 2\) for \(\mathrm{SO}_n\), \(p = 3\)
for \(G_2\)): the theorem can fail. Specific nilpotents may not
embed in any \(\mathfrak{sl}_2\)-triple, or extensions may not be
unique.

The remedy is the **Premet** correspondence: replacing
\(\mathfrak{sl}_2\)-triples with "associated cocharacters" — the
extension still works.

## Consequences

### Bijection of orbits with triples

\(G\)-conjugacy classes of nonzero nilpotents = \(G\)-conjugacy
classes of \(\mathfrak{sl}_2\)-triples (Kostant).

### Weighted Dynkin diagrams

Each triple gives a labelling of the simple roots by \(\alpha_i(h) \in \{0, 1, 2\}\)
— the **weighted Dynkin diagram**. Injective on orbits;
characterising image is the Bala-Carter analysis.

### Finiteness of nilpotent orbits

Because there are finitely many weighted Dynkin diagrams, there are
finitely many nilpotent orbits.

## Examples

### \(\mathfrak{sl}_2\)

For \(e = E_{12}\): \(h = E_{11} - E_{22}\), \(f = E_{21}\). The
unique triple (no centraliser).

### \(\mathfrak{sl}_3\)

For \(e = E_{12} + E_{23}\) (regular nilpotent): the unique extension
gives \(h = 2 E_{11} - 2 E_{33}\), \(f\) determined up to scale by
\([e, f] = h\). Centraliser \(Z_G(e)^\circ\) is trivial (regular
implies abelian centraliser, here just centre).

### Subregular nilpotent in \(E_8\)

\(e\) is a non-trivial sum of simple-root vectors; the triple's
\(h\)-weights give a specific weighted Dynkin label that distinguishes
the subregular orbit from neighbouring orbits in the closure order.

## Constructive aspects

The proof gives an algorithm: given \(e\), one can compute \(h\) and
\(f\) by solving linear equations in \(\mathfrak{g}\). This is the
basis of computer-algebra implementations (LiE, GAP, Magma) of
nilpotent-orbit classification.

## Mathlib

Not formalised. Depends on full Lie algebra and reductive group
infrastructure.

## References

- Jacobson, *Completely reducible Lie algebras of linear
  transformations* (Proc.\ AMS 1951).
- Morozov, *On a nilpotent element in a semisimple Lie algebra*
  (Doklady 1942).
- Bourbaki, *Groupes et algèbres de Lie*, Ch. VIII.
- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993), §3.3.
- Premet, *Nilpotent commuting varieties of reductive Lie algebras*
  (Invent.\ Math.\ 2003).

## Prerequisite Topics

- [[node:nilpotent_orbits.sl2_triples|SL2-Triples]]
