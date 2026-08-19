---
id: tori.tamely_ramified_torus
title: Tamely Ramified Torus
kind: definition
status: admitted
primary_topic: tori
topics:
- tori
uses:
- tori.algebraic_tori
- tori.torus_definition
- tori.split_torus
- tori.unramified_torus
- foundational_inputs.local_fields
source:
  spans:
  - artifact: kaletha-prasad-bruhat-tits
    locator: "Definition 17.1"
    format: section
    note: "A torus is tamely ramified if it splits over a tamely ramified Galois extension; automatic in residue characteristic zero."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Is the definition given via tame splitting extensions with the wild-inertia characterization and the residue-characteristic-zero degeneration recorded?"
  verdict: "Yes. Triviality of the wild inertia action on the character lattice is the equivalent condition, and every torus is tamely ramified when the residue characteristic is zero."
tags:
- torus
- tame
- ramification
- definition
- tori
---

# Tamely Ramified Torus

Let \(k\) be a Henselian discretely valued field with residue
characteristic \(p \geq 0\), and let
\(P \subseteq I \subseteq \Theta\) denote the wild inertia subgroup
(the pro-\(p\) radical of the inertia group \(I\); trivial when
\(p = 0\)).

A torus \(T\) over \(k\) is **tamely ramified** if it splits over a
tamely ramified Galois extension of \(k\). Equivalently, the wild
inertia group \(P\) acts trivially on \(X^*(T)\).

Special cases:

- every [[node:tori.unramified_torus|unramified torus]] is tamely
  ramified;
- if \(p = 0\), every torus over \(k\) is tamely ramified;
- if \(p > 0\), a torus whose minimal splitting field
  ([[node:tori.splitting_field]]) has degree prime to \(p\) is tamely
  ramified.
