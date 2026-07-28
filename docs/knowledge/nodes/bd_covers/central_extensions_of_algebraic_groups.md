---
id: bd_covers.central_extensions_of_algebraic_groups
title: Central Extensions of Algebraic Groups
kind: topic
status: admitted
primary_topic: bd_covers
topics:
- bd_covers
uses:
- affine_group_schemes.affine_algebraic_groups
- foundational_inputs.hopf_algebras
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are central extensions defined uniformly for arbitrary algebraic groups, including the sheaf-theoretic version needed for K_2-extensions?"
  verdict: "Yes. The definition via short exact sequences of fppf sheaves works for any group sheaf; classical (abelian-by-abelian) cases and modern Brylinski-Deligne (K_2-coefficient) extensions are both subsumed."
tags:
- central-extensions
- bd-covers
---

# Central Extensions of Algebraic Groups

A **central extension** of an algebraic group \(G\) by an abelian
group \(A\) is a short exact sequence with \(A\) in the centre. Such
extensions classify covering groups, metaplectic covers, and the
arithmetic phenomena studied in the Langlands programme for covers.

## Definition

Let \(G\) be a group scheme (or fppf sheaf of groups) over a base
\(S\), and \(A\) a sheaf of abelian groups on \(S\). A **central
extension** of \(G\) by \(A\) is a short exact sequence
\[
1 \;\longrightarrow\; A \;\stackrel{\iota}{\longrightarrow}\; \tilde G \;\stackrel{\pi}{\longrightarrow}\; G \;\longrightarrow\; 1
\]
of fppf sheaves of groups such that \(\iota(A)\) is contained in the
**centre** of \(\tilde G\).

Equivalence: two extensions are equivalent if there is an isomorphism
\(\tilde G \to \tilde G'\) of fppf sheaves of groups making the
obvious diagram commute. Equivalence classes form an abelian group
under **Baer sum**.

## Classification by cohomology

For \(G\) a sheaf of groups and \(A\) a sheaf of abelian groups (with
\(G\) acting trivially):
\[
\mathrm{CExt}(G, A) \;\cong\; H^2_{\mathrm{fppf}}(BG, A),
\]
the second cohomology of the classifying stack \(BG\).

For \(G\) abelian: equivalence classes are \(\mathrm{Ext}^1(G, A)\) in
the abelian category of fppf sheaves; this is computable by standard
homological methods.

For \(G\) non-abelian: \(\mathrm{CExt}(G, A)\) is still an abelian
group (under Baer sum), but the description via \(H^2\) requires
care.

## Examples

### \(\mathbb{G}_m\) by \(\mu_n\)

The Kummer sequence
\[
1 \to \mu_n \to \mathbb{G}_m \xrightarrow{[n]} \mathbb{G}_m \to 1
\]
gives a central extension of \(\mathbb{G}_m\) by \(\mu_n\). Equivalence
classes are \(\mathrm{Ext}^1(\mathbb{G}_m, \mu_n)\), computed via
Kummer theory.

### Heisenberg group

The integer Heisenberg group is a central extension
\[
1 \to \mathbb{Z} \to H_3(\mathbb{Z}) \to \mathbb{Z}^2 \to 1.
\]
Its algebraic analogue (for additive groups) is
\(1 \to \mathbb{G}_a \to H \to \mathbb{G}_a^2 \to 1\), classified by
\(\mathrm{Ext}^1(\mathbb{G}_a^2, \mathbb{G}_a)\), which is non-trivial.

### Universal central extension of \(\mathrm{SL}_n\)

For \(n \ge 3\) and an algebraically closed field \(k\),
\(\mathrm{SL}_n(k)\) is **perfect** but has a non-trivial universal
central extension:
\[
1 \to K_2(k) \to \mathrm{St}_n(k) \to \mathrm{SL}_n(k) \to 1,
\]
where \(\mathrm{St}_n(k)\) is the **Steinberg group** and \(K_2(k)\)
is the (Milnor) \(K_2\) group of \(k\). This is **Matsumoto's
theorem** and the prototype for Brylinski-Deligne extensions.

### Spin extension of \(\mathrm{SO}_n\)

\[
1 \to \mu_2 \to \mathrm{Spin}_n \to \mathrm{SO}_n \to 1,
\]
the algebraic-group version of the topological double cover.

### Metaplectic group

For \(F\) a local field of residue characteristic \(\ne 2\):
\[
1 \to \mu_2 \to \overline{\mathrm{Sp}_{2n}(F)} \to \mathrm{Sp}_{2n}(F) \to 1,
\]
the **metaplectic double cover**. Topologically it does not split;
in BD-language it arises from the standard K_2-extension by
specialising via the quadratic Hilbert symbol.

## Brylinski-Deligne extensions

The most important non-classical case: central extensions of a
reductive group \(G\) by the K-theory sheaf \(\mathbf{K}_2\):
\[
1 \to \mathbf{K}_2 \to \tilde G \to G \to 1.
\]

These are classified by combinatorial data on the root datum
(quadratic forms, bilinear pairings). See
[[node:bd_covers.brylinski_deligne_k2_extensions|BD K2-extensions]].

## Universal central extension

For a perfect group \(G\) (i.e.\ \(G = [G, G]\)), the **universal
central extension** is the initial object in \(\mathrm{CExt}(G, -)\):
\[
1 \to H_2(G, \mathbb{Z}) \to \tilde G^{\mathrm{univ}} \to G \to 1,
\]
where \(H_2\) is the **Schur multiplier**. The universal central
extension exists uniquely up to isomorphism for any perfect group.

For \(G\) a semisimple algebraic group: the Schur multiplier is
related to \(K_2\) of the base field.

## Splittings and obstructions

For a central extension \(1 \to A \to \tilde G \to G \to 1\), a
**splitting** is a homomorphism \(s : G \to \tilde G\) with \(\pi \circ s = \mathrm{id}\).

The obstruction to splitting lies in \(H^2(G, A)\). For trivial \(A\):
the extension splits iff it is "lifted from \(G\)."

In the metaplectic case, the extension does not split as algebraic
groups, but it splits over arithmetically interesting subgroups:
**unipotent radicals** of parabolics, **integral subgroups** (for
global metaplectic covers), and **parahoric subgroups** (for local
covers).

## Role in Langlands

- **Langlands programme for covers**: requires functorial central
  extensions to construct **L-groups** for covering groups.
- **Theta correspondence**: the metaplectic cover of \(\mathrm{Sp}_{2n}\)
  is essential for Weil representations and the theta dual pair.
- **Eisenstein series for covers**: integration over Eisenstein series
  on the metaplectic group recovers special \(L\)-values.
- **Kazhdan-Patterson**: their "generalised theta series" arise from
  Eisenstein series on \(\overline{\mathrm{GL}_n}\) (\(n\)-fold cover).

## References

- Moore, *Group extensions of p-adic and adelic linear groups*
  (Publ.\ IHES 1968).
- Matsumoto, *Sur les sous-groupes arithmétiques des groupes
  semi-simples déployés* (Ann.\ Sci.\ ENS 1969).
- Deligne, *Extensions centrales de groupes algébriques simplement
  connexes* (CRAS 1996).
- Brylinski–Deligne, *Central extensions of reductive groups by
  \(\mathbf{K}_2\)* (Publ.\ IHES 2001).

## Prerequisite Topics

- [[node:affine_group_schemes.affine_algebraic_groups|Affine Algebraic Groups]]
- [[node:foundational_inputs.hopf_algebras|Hopf Algebras]]
