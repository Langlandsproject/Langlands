---
id: descent_and_forms.cocycles_and_twisting
title: Cocycles and Twisting
kind: topic
status: admitted
primary_topic: descent_and_forms
topics:
- descent_and_forms
uses:
- descent_and_forms.nonabelian_h1
- descent_and_forms.torsors
- linear_algebraic_groups.automorphism_groups
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the twisting operation by 1-cocycles defined for arbitrary algebraic groups acting on arbitrary geometric objects?"
  verdict: "Yes. The twisting construction X ↦ X^c is functorial in any G-object X and any 1-cocycle c with values in Aut_G(X) — the formalism is general."
tags:
- twisting
- cocycles
- descent-and-forms
---

# Cocycles and Twisting

**Twisting** is the operation that constructs a new \(k\)-form of an
object from a 1-cocycle valued in its automorphism group. It is the
hands-on counterpart of \(H^1\) classifying forms.

## Setup

Let \(k\) be a field with separable closure \(\bar k\) and Galois
group \(\Gamma\). Let \(X\) be a \(k\)-object (an algebraic group, a
variety, a vector space with structure, etc.), and let
\(A = \mathrm{Aut}(X_{\bar k})\) be the \(\bar k\)-automorphism group
of \(X_{\bar k}\) (a \(\Gamma\)-group).

## Cocycles

A **1-cocycle** of \(\Gamma\) with values in \(A\) is a continuous
function
\[
c : \Gamma \;\longrightarrow\; A
\]
satisfying the cocycle condition
\[
c_{\sigma \tau} \;=\; c_\sigma \cdot \sigma(c_\tau) \qquad \text{for all } \sigma, \tau \in \Gamma.
\]

Two cocycles \(c, c'\) are **cohomologous** if there exists \(a \in A\)
with \(c'_\sigma = a^{-1} c_\sigma \sigma(a)\) for all \(\sigma\).

Cohomology classes form the pointed set \(H^1(\Gamma, A) = H^1(k, A)\).

## Twisting construction

Given a 1-cocycle \(c \in Z^1(\Gamma, A)\), the **twisted form** \(X^c\)
is the \(k\)-object whose \(\bar k\)-points are \(X(\bar k)\) but with
the new Galois action:
\[
\sigma \cdot_c x \;:=\; c_\sigma \cdot \sigma(x).
\]

That this defines an action of \(\Gamma\) is precisely the cocycle
condition; descent from \(\bar k\)-points to a \(k\)-form requires
\(X\) to be acted upon by \(A\) in a "good" way (which is automatic
if \(X\) is functorial in its structure).

## Examples

### Inner twists of \(\mathrm{GL}_n\)

\(A = \mathrm{PGL}_n\). A cocycle
\(c : \Gamma \to \mathrm{PGL}_n(\bar k)\) lifts to a 2-cocycle in
\(\bar k^\times\), giving a central simple algebra \(D_c\) of dim
\(n^2\) over \(k\). Then \(\mathrm{GL}_n^c = D_c^\times\) (the unit
group of \(D_c\) as an algebraic group).

### Forms of vector spaces

For \(X = k^n\) with quadratic form \(q\), \(A = \mathrm{O}(q)\).
Cocycles in \(H^1(k, \mathrm{O}(q))\) classify quadratic forms of the
same rank and (over \(\mathbb{R}\)) the same discriminant.

### Torsors and twisted forms

If \(X = G\) is an algebraic group acting on itself by left
multiplication, then \(A = G\) (right translations centralise left).
A 1-cocycle in \(G\) gives a **torsor** \(P\), and the twisted form
of \(X = G\) is \(P\) itself.

### Forms of root data

For \(X = (G_0, T_0, B_0)\) a pinned reductive group, the cocycle
takes values in \(\mathrm{Out}(G_0) = \mathrm{Aut}(\text{based root datum})\).
Outer twists produce non-split forms (e.g.\ \({}^2 A_n\), \({}^3 D_4\)).

## Triviality of twisting on \(H^0\)

For a \(\Gamma\)-set \(Y\) on which \(A\) acts, twisting by \(c\)
gives a new \(\Gamma\)-action on \(Y(\bar k)\), and there is a
bijection
\[
H^0(\Gamma, Y^c) \;=\; \{y \in Y(\bar k) : c_\sigma \cdot \sigma(y) = y \text{ for all } \sigma\}.
\]

This identifies "\(k\)-rational points of the twist" with "\(c\)-twisted
\(\Gamma\)-invariants of \(Y\)."

## Twisting and long exact sequences

For a short exact sequence \(1 \to A \to B \to C \to 1\) and an
element \(c \in H^1(k, C)\), twisting gives a new short exact sequence
\[
1 \to A^c \to B^c \to C \to 1
\]
where \(C\) acts on \(A\) (and \(B\)) by inner conjugation in \(B\).
This is the mechanism behind the **comparison of \(H^1\)** under
twists, a basic tool for explicit calculations.

## The "form" interpretation

The bijection between cocycles modulo coboundaries and \(k\)-forms can
be summarised as:

\[
\{k\text{-forms of } X\} \;\stackrel{\sim}{\longleftrightarrow}\; H^1(k, \mathrm{Aut}(X)),
\]

with the trivial cocycle going to \(X\) itself. This is the most
concrete face of [[node:descent_and_forms.galois_cohomology|Galois
cohomology]].

## Role in Langlands

- **Inner forms** of reductive groups (Aut = adjoint): twisting by
  cocycles in \(G_{\mathrm{ad}}\).
- **Outer forms** (e.g.\ \({}^2 E_6\)): twisting by cocycles in
  \(\mathrm{Out}(G)\), the diagram automorphism component.
- **Rigid inner twists** (Kaletha): cocycles with values in
  \(z\)-extensions or in the "Galois gerbe."
- **Pure inner forms**: cocycles in \(G\) itself rather than
  \(G_{\mathrm{ad}}\); coincide with inner forms when \(G\) is adjoint
  but differ otherwise (Vogan's distinction).

## References

- Serre, *Cohomologie Galoisienne* (1964), §I.5, II.
- Borel–Serre, *Sur les sous-groupes d'algèbres de Lie* (Toulouse
  1958).
- Kaletha, *Rigid inner forms of real and p-adic groups* (Annals 2016).

## Prerequisite Topics

- [[node:descent_and_forms.nonabelian_h1|Nonabelian H1]]
- [[node:descent_and_forms.torsors|Torsors]]
- [[node:linear_algebraic_groups.automorphism_groups|Automorphism Groups]]
