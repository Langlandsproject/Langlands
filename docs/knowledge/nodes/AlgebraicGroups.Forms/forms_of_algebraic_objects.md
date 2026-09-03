---
id: forms.forms_of_algebraic_objects
title: Forms of Algebraic Objects
kind: topic
status: admitted
primary_topic: AlgebraicGroups.Forms
topics:
- AlgebraicGroups.Forms
uses:
- forms.galois_groups_and_descent_data
- linear_algebraic_groups.automorphism_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the notion of 'form' treated uniformly across algebraic categories (varieties, algebras, vector spaces with structure)?"
  verdict: "Yes. A k-form of an object X over a field extension is any k-object whose base-change is iso to X; the classification by H^1(k, Aut(X)) is uniform."
tags:
- forms
- descent-and-forms
---

# Forms of Algebraic Objects

A **form** of an object \(X\) over a field \(k\) (with respect to an
extension \(K/k\)) is a \(k\)-object that becomes isomorphic to \(X\)
after base change to \(K\). Forms are classified by Galois cohomology
and underlie the entire theory of twisted objects in algebraic
geometry.

## General definition

Let \(K/k\) be a field extension and \(X_K\) an algebraic object over
\(K\) (e.g.\ a scheme, group scheme, vector bundle, algebra, etc.).
A **\(K/k\)-form** of \(X_K\) is a \(k\)-object \(X\) together with an
isomorphism \(X \otimes_k K \cong X_K\) (over \(K\)).

Two forms are **equivalent** if there is a \(k\)-isomorphism between
them inducing the trivial isomorphism on \(X_K\).

## Galois forms

For \(K/k\) a Galois extension with group \(\Gamma = \mathrm{Gal}(K/k)\):
**\(K/k\)-forms** of \(X_K\) are classified by
\[
H^1(\Gamma, \mathrm{Aut}_K(X_K)) \;=\; \{\text{cocycles}\} / \{\text{coboundaries}\}.
\]

Taking the limit over all finite Galois \(K/k\) gives the full
absolute Galois form classification:
\[
\{\text{forms of } X_{\bar k} \text{ over } k\} / \cong \;=\; H^1(k, \mathrm{Aut}(X_{\bar k})).
\]

## Examples

### Vector spaces

For \(V_{\bar k} = \bar k^n\): forms over \(k\) are exactly
\(n\)-dimensional \(k\)-vector spaces (by Hilbert-Speiser). All are
isomorphic to \(k^n\), so there is just one form.

### Algebras

For \(A_{\bar k} = M_n(\bar k)\) (matrix algebras):
\(\mathrm{Aut}(M_n(\bar k)) = \mathrm{PGL}_n(\bar k)\), and
\(H^1(k, \mathrm{PGL}_n) = \mathrm{Br}(k)[n]\). Forms of \(M_n(\bar k)\)
are exactly **central simple \(k\)-algebras of degree \(n\)**.

### Quadratic spaces

\((V, q)\) with \(q\) a quadratic form: \(\mathrm{Aut}(V_{\bar k}, q) = \mathrm{O}_n(\bar k)\),
and \(H^1(k, \mathrm{O}_n)\) classifies non-degenerate quadratic
\(k\)-forms of dimension \(n\) up to isometry.

### Algebraic groups

For \(G\) a split connected reductive group: \(\mathrm{Aut}(G)\) fits
into \(1 \to G_{\mathrm{ad}} \to \mathrm{Aut}(G) \to \mathrm{Out}(G) \to 1\),
and \(H^1(k, \mathrm{Aut}(G))\) classifies all \(k\)-forms of \(G\).

### Galois algebras

For \(\bar k^n\) (with permutation action): forms are **étale
\(k\)-algebras** of degree \(n\) (finite products of finite separable
field extensions, total dimension \(n\)).

## Twisting construction

Given a 1-cocycle \(c : \Gamma \to \mathrm{Aut}(X_{\bar k})\) and an
object \(X_{\bar k}\), the twist \(X_{\bar k}^c\) has the same
underlying set but with the Galois action
\(\sigma \cdot_c x = c_\sigma \cdot \sigma(x)\).

If the original action admitted a \(k\)-form \(X\), the twisted action
admits a different \(k\)-form \(X^c\). Two cocycles give equivalent
twists iff cohomologous.

See [[node:forms.cocycles_and_twisting|cocycles and twisting]].

## Comparison of forms

Given two forms \(X, X'\) of \(X_{\bar k}\), the comparison cocycle is
\(c : \Gamma \to \mathrm{Aut}(X_{\bar k})\), \(c_\sigma = i_\sigma \cdot \sigma_{X'}^{-1} \sigma_X\),
where \(i_\sigma\) is the natural identification. \(c\) is a cocycle,
and the cohomology class of \(c\) detects the equivalence class of
forms.

## Triviality criteria

\(X\) and \(X'\) are equivalent as forms iff \(c \in \mathrm{Aut}(X_{\bar k})\)
is a coboundary, iff \(X \cong X'\) over \(k\).

Forms over an algebraically closed field: all forms are trivial.

## Forms preserve invariants up to base change

For any "intrinsic" invariant of \(X_{\bar k}\) (e.g.\ dimension,
genus, discrete cohomological invariants): all forms share it. Forms
differ in "rational invariants" that depend on the field \(k\).

## Role in Langlands

- **Forms of reductive groups**: classified by Galois cohomology of
  the automorphism group; quasi-split + inner-form refinement
  organises the Langlands programme.
- **Forms of Shimura varieties**: the rational structure of Shimura
  varieties is encoded by forms over various subfields.
- **Forms of automorphic representations**: not quite a "form"
  question, but Langlands functoriality navigates between forms of
  reductive groups.

## References

- Serre, *Cohomologie Galoisienne* (1964), §I, §III.
- Knus–Merkurjev–Rost–Tignol, *The Book of Involutions* (1998).
- Skorobogatov, *Torsors and Rational Points* (CUP 2001).

## Prerequisite Topics

- [[node:forms.galois_groups_and_descent_data|Galois Groups and Descent Data]]
- [[node:linear_algebraic_groups.automorphism_groups|Automorphism Groups]]
