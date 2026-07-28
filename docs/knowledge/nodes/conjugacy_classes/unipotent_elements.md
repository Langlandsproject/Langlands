---
id: conjugacy_classes.unipotent_elements
title: Unipotent Elements and the Unipotent Variety
kind: definition
status: admitted
primary_topic: conjugacy_classes
topics:
- conjugacy_classes
- reductive_structure
uses:
- conjugacy_classes.jordan_decomposition
- reductive_structure.reductive_groups
- affine_group_schemes.affine_group_scheme_definition
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 2.4"
    format: section
    note: "Unipotent elements, the unipotent variety, and its relation to the nilpotent cone."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition of unipotent elements and the unipotent variety valid in all characteristics?"
  verdict: "Yes. An element g in G(k) is unipotent if and only if its image under every faithful representation has all eigenvalues equal to 1 (equivalently, (g-1)^N = 0 for some N). This is intrinsic and works in all characteristics. The unipotent variety U = {g in G : g_u = g} is a closed G-stable subvariety."
tags:
- unipotent-elements
- unipotent-variety
- conjugacy
---

# Unipotent Elements and the Unipotent Variety

## Definition

Let \(G\) be a linear algebraic group. An element \(g \in G(k)\) is
**unipotent** if its semisimple part in the Jordan decomposition is trivial:
\(g = g_u\), i.e.\ \(g_s = 1\).

Equivalently, for any faithful representation \(\rho : G \to \mathrm{GL}(V)\),
\(\rho(g)\) is a unipotent matrix: all eigenvalues equal \(1\), i.e.\((\rho(g) - I)^N = 0\) for some \(N \le \dim V\).

## The unipotent variety

The **unipotent variety** (or **unipotent cone**) is
\[
\mathcal{U} = \{g \in G : g \text{ is unipotent}\}.
\]
This is a **closed**, **\(G\)-stable** (under conjugation) subvariety of \(G\).

### Dimension

\[
\dim \mathcal{U} = \dim G - \mathrm{rank}(G).
\]

### Irreducibility

For \(G\) connected reductive, \(\mathcal{U}\) is **irreducible**: every
unipotent element is conjugate to an element of the unipotent radical
\(U_B\) of a Borel subgroup \(B\), and \(G/B \times U_B \to \mathcal{U}\)
is a resolution (the Springer resolution).

## Relation to the nilpotent cone

In characteristic \(0\), the exponential map gives a \(G\)-equivariant
isomorphism
\[
\exp : \mathcal{N} \xrightarrow{\;\sim\;} \mathcal{U},
\]
where \(\mathcal{N} \subset \mathrm{Lie}(G)\) is the nilpotent cone.
This identifies unipotent orbits in \(G\) with nilpotent orbits in
\(\mathrm{Lie}(G)\).

In characteristic \(p > 0\), the exponential map does not converge globally.
Instead, the identification goes through the **Springer isomorphism** (a
\(G\)-equivariant isomorphism \(\mathcal{N} \xrightarrow{\sim} \mathcal{U}\)
that exists under mild hypotheses on \(p\), e.g.\ \(p\) good for \(G\)).

## Unipotent subgroups

The unipotent elements in a **connected unipotent** algebraic group \(U\) fill
all of \(U\). For a reductive \(G\), unipotent elements appear in:
- Unipotent radicals \(R_u(P)\) of parabolic subgroups \(P\).
- Root subgroups \(U_\alpha \cong \mathbb{G}_a\).
- The big cell \(B^- \cdot B\) (open dense in \(G\)).
