---
id: tori.algebraic_tori
title: Algebraic Tori
kind: topic
status: admitted
primary_topic: tori
topics:
- tori
uses:
- linear_algebraic_groups.linear_algebraic_groups
- affine_group_schemes.multiplicative_group_scheme
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the topic set up over an arbitrary base field via the separable closure, covering split, non-split, and anisotropic tori uniformly?"
  verdict: "Yes. All statements are phrased over a separable closure with the Galois action as separate data; no algebraically closed base or perfectness hypothesis is used."
tags:
- tori
- torus
---

# Algebraic Tori

An algebraic torus is a [[node:linear_algebraic_groups.linear_algebraic_groups|linear algebraic group]]
that becomes isomorphic to a finite power of
[[node:affine_group_schemes.multiplicative_group_scheme|the multiplicative group]]
over a separable closure of the base field. Tori are simultaneously a
special case of reductive groups and the foundation on which the
structure theory of reductive groups is built: maximal tori carry root
data, maximal split tori carry relative root data and apartments, and
the arithmetic of tori over discretely valued fields underlies parahoric
subgroups and Bruhat–Tits buildings. This topic develops the theory of
tori in itself, before and independently of reductive structure theory.

## Conventions

Fixed for every node of this topic and for downstream consumers.

- \(k\) denotes the base field, \(k_s\) a separable closure,
  \(\Theta = \operatorname{Gal}(k_s/k)\). Statements are phrased over
  \(k_s\), never over an algebraic closure: a torus splits over a finite
  separable extension, so \(\bar{k}\) is an unnecessary strengthening.
- The **character lattice** is
  \(X^*(T) = \operatorname{Hom}_{k_s\text{-grp}}(T_{k_s}, \mathbb{G}_m)\)
  and the **cocharacter lattice** is
  \(X_*(T) = \operatorname{Hom}_{k_s\text{-grp}}(\mathbb{G}_m, T_{k_s})\),
  in perfect duality; the continuous \(\Theta\)-action on each is part
  of the data, not built into the Hom. See
  [[node:tori.character_and_cocharacter_lattices]].
- **Anisotropic** means \(X_*(T)^{\Theta} = 0\); this is equivalent to
  \(X^*(T)^{\Theta} = 0\) (see [[node:tori.anisotropic_torus]]), and the
  cocharacter form is the one used downstream.
- \(X_*\) is the preferred working lattice: valuation-theoretic
  invariants of \(T(k)\) and, downstream, apartments of buildings are
  expressed through \(X_*\).
- Primitive maps are \(\mathbb{Z}\)-valued into finitely generated
  abelian groups. Tensoring with \(\mathbb{Q}\) or \(\mathbb{R}\)
  happens at the point of use, never inside a definition.

## Core nodes

- [[node:tori.torus_definition]] — the definition.
- [[node:tori.multiplicative_type_characterization]] — tori among
  groups of multiplicative type; the characteristic-\(p\) trichotomy.
- [[node:tori.f_tori_galois_module_classification]] — the
  anti-equivalence with Galois lattices, the complete invariant.
- [[node:tori.splitting_field]] — the minimal splitting field.
- [[node:tori.split_torus]], [[node:tori.anisotropic_torus]] — the two
  extreme classes.
- [[node:tori.subtori_and_quotients]] — the lattice dictionary for
  subtori and quotients.
- [[node:tori.split_anisotropic_decomposition]] — every torus is an
  almost direct product of the two extremes.
- [[node:tori.weil_restriction_of_tori]], [[node:tori.norm_one_torus]],
  [[node:tori.rank_one_classification]] — the basic examples.
- [[node:tori.induced_tori]], [[node:tori.induced_resolution]] — the
  class that behaves like \(\mathbb{G}_m\), and the resolution of an
  arbitrary torus by it.
- [[node:tori.unramified_torus]], [[node:tori.tamely_ramified_torus]],
  [[node:tori.weakly_induced_torus]] — ramification classes over
  discretely valued fields.

## Planned extensions

Galois cohomology of tori, the Kottwitz homomorphism and the subgroups
\(T(k)_0 \subseteq T(k)_1\) of \(T(k)\), integral models and their
filtrations, and the dual torus with the local Langlands correspondence
for tori are tracked as later stages of this topic.
