---
id: bd_covers.local_and_global_metaplectic_covers
title: Local and Global Metaplectic Covers
kind: topic
status: admitted
primary_topic: bd_covers
topics:
- bd_covers
uses:
- bd_covers.brylinski_deligne_k2_extensions
- foundational_inputs.local_fields
- foundational_inputs.global_fields_adeles_and_reciprocity_symbols
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Are local and global metaplectic covers treated uniformly, with their compatibility via the product formula?"
  verdict: "Yes. Local covers arise from BD extensions specialised via the Hilbert symbol; global covers from product of local data, compatible via reciprocity."
tags:
- metaplectic-covers
- bd-covers
---

# Local and Global Metaplectic Covers

A **metaplectic cover** is a central extension of a reductive group
\(G(F)\) (local) or \(G(\mathbb{A}_F)\) (global) by \(\mu_n\) obtained
by specialising a Brylinski-Deligne extension via a character of
\(K_2\). The local-global compatibility is a major aspect of the
modern Langlands programme for covers.

## Local metaplectic covers

For \(F\) a local field with \(\mu_n \subseteq F\) and a connected
reductive \(G/F\) with BD extension \(\tilde G\):

A continuous character \(\chi : K_2(F) \to \mu_n\) (where \(K_2(F)\)
is Milnor's K_2) gives a topological central extension:
\[
1 \;\to\; \mu_n \;\to\; \overline G \;\to\; G(F) \;\to\; 1.
\]

By Moore's theorem, continuous characters of \(K_2(F)\) for \(F\)
local are given by the **\(n\)-th Hilbert symbol**
\((-, -)_n : F^\times \otimes F^\times \to \mu_n\), so cover data is
encoded in Hilbert symbols.

## Classical examples

### Metaplectic double cover \(\overline{\mathrm{Sp}_{2n}(F)}\)

For \(F = \mathbb{Q}_p\) (\(p\) odd) or \(F = \mathbb{R}\), the
\(\mu_2\)-cover of \(\mathrm{Sp}_{2n}(F)\) via the quadratic Hilbert
symbol. This is the **Weil-metaplectic group**, foundational for the
**Weil representation** and the **theta correspondence**.

### Higher metaplectic covers \(\overline{\mathrm{SL}_n(F)}^{(k)}\)

For \(\mu_k \subseteq F\): the \(k\)-fold metaplectic cover of
\(\mathrm{SL}_n(F)\). For \(F\) a global field with class number 1,
the global cover gives the **Kazhdan-Patterson** family of generalised
theta series.

## Global metaplectic covers

For \(F\) a global field and \(G/F\) with BD extension, the **global
metaplectic cover** is
\[
1 \;\to\; \mu_n \;\to\; \overline{G(\mathbb{A}_F)} \;\to\; G(\mathbb{A}_F) \;\to\; 1,
\]
constructed by:

1. At each place \(v\): the local cover \(\overline{G(F_v)}\)
   determined by the Hilbert symbol \((-, -)_n^{(v)}\).
2. Take the restricted product over all \(v\):
   \(\overline{G(\mathbb{A}_F)} = \prod_v' \overline{G(F_v)}\)
   (modulo the diagonal \(\mu_n\)).
3. The global cover descends to \(G(F)\) via the **product formula**
   for Hilbert symbols:
   \[
   \prod_v (-,-)_n^{(v)} \;=\; 1
   \]
   (the global reciprocity law for the \(n\)-th Hilbert symbol).

## Splittings and rational sections

A **splitting** of the global cover over \(G(F)\) is a section
\(G(F) \to \overline{G(\mathbb{A}_F)}\). The product formula ensures
this exists, since each local Hilbert symbol's contribution cancels.

This is the foundation of **automorphic forms on metaplectic groups**:
they are functions on \(\overline{G(F) \backslash G(\mathbb{A}_F)}\)
of fixed central character \(\chi\) under the \(\mu_n\)-action.

## Automorphic forms on covers

\(\overline{G(F) \backslash G(\mathbb{A}_F)}\) has a natural
left-action by \(G(\mathbb{A}_F)\); automorphic forms on \(\overline G\)
are functions on this space that:

- Are smooth (in archimedean variables) or locally constant (in
  non-archimedean variables);
- Transform by the central character \(\chi : \mu_n \to \mathbb{C}^\times\);
- Satisfy growth and admissibility conditions.

The space \(\mathcal{A}(\overline G)\) of automorphic forms on
\(\overline G\) decomposes into automorphic representations.

## Examples

### Modular forms of half-integral weight

For \(G = \mathrm{SL}_2 / \mathbb{Q}\) and the double cover
\(\overline{\mathrm{SL}_2(\mathbb{A}_\mathbb{Q})}\): genuine
automorphic representations are precisely the **half-integral
weight modular forms** in the classical sense (Shimura, Niwa).

### Generalised theta series

For \(G = \mathrm{GL}_r / \mathbb{Q}\) and the \(n\)-fold metaplectic
cover: Kazhdan-Patterson constructed automorphic forms via residues
of Eisenstein series, generalising the classical theta series.

### Patterson's generalised \(L\)-functions

The metaplectic Eisenstein series produce **\(L\)-functions** with
unusual Euler product structure (involving Hilbert symbols at all
places), studied via integral representations.

## Role in Langlands

- **Metaplectic Langlands**: organises automorphic forms on
  metaplectic covers parallelly to the classical Langlands programme.
- **Theta correspondence**: the metaplectic double cover of
  \(\mathrm{Sp}_{2n}\) realises the Weil representation; the theta lift
  is local-global.
- **Symmetric power lifts**: the modular form symmetric power lifts
  (Kim-Shahidi, Newton-Thorne) bridge the classical and metaplectic
  worlds.
- **Bump-Friedberg-Hoffstein**: special L-values via integrals on
  metaplectic Eisenstein series.

## References

- Weil, *Sur certains groupes d'opérateurs unitaires* (Acta Math.\
  1964).
- Kubota, *On automorphic functions and the reciprocity law in a
  number field* (1969).
- Kazhdan–Patterson, *Metaplectic forms* (Publ.\ IHES 1984).
- Brylinski–Deligne, *Central extensions of reductive groups by
  \(\mathbf{K}_2\)* (Publ.\ IHES 2001).
- Gan–Gao–Weissman, *L-Groups and the Langlands Program for Covering
  Groups* (Asterisque 2018).

## Prerequisite Topics

- [[node:bd_covers.brylinski_deligne_k2_extensions|Brylinski-Deligne K2-Extensions]]
- [[node:foundational_inputs.local_fields|Local Fields]]
- [[node:foundational_inputs.global_fields_adeles_and_reciprocity_symbols|Global Fields, Adeles, and Reciprocity Symbols]]
