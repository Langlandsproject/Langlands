---
id: nilpotent_orbits.sl2_triples
title: SL2-Triples
kind: topic
status: admitted
primary_topic: nilpotent_orbits
topics:
- nilpotent_orbits
uses:
- nilpotent_orbits.nilpotent_elements
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are SL_2-triples treated for arbitrary semisimple Lie algebras in good characteristic?"
  verdict: "Yes. The Jacobson-Morozov theorem holds for semisimple Lie algebras in characteristic zero and in good positive characteristic; the formalism is type-independent."
tags:
- sl2-triples
- nilpotent-orbits
---

# SL2-Triples

An **\(\mathfrak{sl}_2\)-triple** in a Lie algebra is a triple
\((e, h, f)\) satisfying the standard \(\mathfrak{sl}_2\)-commutation
relations. Such triples are the algebraic counterpart of
representations of \(\mathfrak{sl}_2\) inside \(\mathfrak{g}\), and
they package the structure of a nilpotent orbit into a finite list of
weights.

## Definition

Let \(\mathfrak{g}\) be a Lie algebra over a field \(k\) (typically
characteristic 0 or good for the type of \(\mathfrak{g}\)). An
**\(\mathfrak{sl}_2\)-triple** is a triple \((e, h, f)\) of elements of
\(\mathfrak{g}\) satisfying:
\[
[h, e] = 2e, \qquad [h, f] = -2f, \qquad [e, f] = h.
\]

Equivalently: \((e, h, f)\) defines a Lie algebra homomorphism
\(\mathfrak{sl}_2(k) \to \mathfrak{g}\), \(\begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix} \mapsto e\),
\(\begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix} \mapsto h\), etc.

Conventions:
- \(e\) (or \(X\)) is the **nilpositive** element;
- \(f\) (or \(Y\)) is the **nilnegative** element;
- \(h\) (or \(H\)) is the **neutral** (semisimple) element.

## Jacobson-Morozov theorem

**Theorem (Jacobson-Morozov).** Let \(\mathfrak{g}\) be semisimple
over \(k\) of characteristic 0 (or good positive characteristic). For
every nonzero nilpotent \(e \in \mathfrak{g}\), there exist
\(h, f \in \mathfrak{g}\) such that \((e, h, f)\) is an
\(\mathfrak{sl}_2\)-triple.

Moreover: any two such extensions are conjugate by an element of
\(Z_G(e)^\circ\) (the identity component of the centraliser).

**Corollary.** There is a bijection
\[
\{\text{nonzero nilpotent orbits in } \mathfrak{g}\} \;\longleftrightarrow\;
\{\text{}\mathfrak{sl}_2\text{-triples in } \mathfrak{g}\}/G.
\]

## Weights and representation structure

For an \(\mathfrak{sl}_2\)-triple \((e, h, f)\) in \(\mathfrak{g}\),
the **adjoint representation** of the triple on \(\mathfrak{g}\)
decomposes
\[
\mathfrak{g} \;=\; \bigoplus_{n \in \mathbb{Z}} \mathfrak{g}_n,
\qquad \mathfrak{g}_n = \{X : [h, X] = nX\}.
\]

\(\mathfrak{g}\) becomes a graded \(\mathfrak{sl}_2\)-module: each
\(\mathfrak{g}_n\) is finite-dimensional, and the multiplicities of
irreducible \(\mathfrak{sl}_2\)-modules \(V_m\) in \(\mathfrak{g}\)
give a finite list of integers — the **dimension vector** of the
triple.

By the structure of \(\mathfrak{sl}_2\)-representations:
\(\dim \mathfrak{g}_n = \dim \mathfrak{g}_{-n}\), and \(e\) maps
\(\mathfrak{g}_n \xrightarrow{\cong} \mathfrak{g}_{n+2}\) for
\(n \ge 0\).

## Weighted Dynkin diagram

Given an \(\mathfrak{sl}_2\)-triple, conjugate \(h\) into the dominant
Weyl chamber of a fixed Cartan. The **weighted Dynkin diagram** records
\(d_i = \alpha_i(h)\) for each simple root \(\alpha_i\):
\[
d_i \in \{0, 1, 2\}.
\]

This is the canonical combinatorial invariant of the
\(G\)-conjugacy class of the triple (= the orbit \(G \cdot e\)). See
[[node:nilpotent_orbits.weighted_dynkin_diagrams|Weighted Dynkin Diagrams]].

## Examples

### \(\mathfrak{sl}_2\) standard

\(e = E_{12}\), \(h = E_{11} - E_{22}\), \(f = E_{21}\). Adjoint
representation decomposes as the irreducible \(V_3\)
(\(3\)-dimensional).

### \(\mathfrak{sl}_3\), regular nilpotent

Sum of all simple-root vectors:
\(e = E_{12} + E_{23}\). The triple has \(h = 2(\omega_1 + \omega_2)\)
in dominant Weyl coordinates; weighted Dynkin = \(2 - 2\).

\(\mathfrak{g}\) decomposes into one \(V_5\) (the regular module) and
nothing else.

### \(\mathfrak{sl}_n\), Jordan-block triple

For Jordan partition \(\lambda = (\lambda_1, \ldots, \lambda_k)\): each
block contributes an irreducible
\(\mathfrak{sl}_2\)-module \(V_{\lambda_i - 1}\). The total
\(\mathfrak{sl}_2\)-representation of \(\mathfrak{gl}_n\) (under the
nilpotent triple) is determined by \(\lambda\).

## Kostant's classification

**Theorem (Kostant 1959).** The \(G\)-conjugacy classes of
\(\mathfrak{sl}_2\)-triples in \(\mathfrak{g}\) are in bijection with
the \(G\)-conjugacy classes of nonzero nilpotents (via \((e, h, f) \mapsto e\)).

This is the existence-and-uniqueness theorem complementing
Jacobson-Morozov.

## Slice and transversal

For an \(\mathfrak{sl}_2\)-triple \((e, h, f)\), the **Kostant-Slodowy
slice**
\[
S_e \;:=\; e + Z_{\mathfrak{g}}(f) \;\subseteq\; \mathfrak{g}
\]
is a transverse slice to the nilpotent orbit \(G \cdot e\) inside
\(\mathfrak{g}\). The intersection \(S_e \cap \mathcal{N}\) gives a
"local model" for the closure ordering of orbits near \(G \cdot e\).

For the **subregular** nilpotent orbit: \(S_e \cap \mathcal{N}\) is a
**Kleinian (Du Val) singularity** of the same type as the Dynkin
diagram of \(\mathfrak{g}\) — a beautiful link between Lie theory and
surface singularities.

## Mathlib

Not formalised.

## References

- Kostant, *The principal three-dimensional subgroup and the Betti
  numbers of a complex simple Lie group* (Amer.\ J.\ Math.\ 1959).
- Carter, *Finite Groups of Lie Type* (1985), §5.5.
- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*
  (1993), Ch. 3.

## Prerequisite Topics

- [[node:nilpotent_orbits.nilpotent_elements|Nilpotent Elements]]
