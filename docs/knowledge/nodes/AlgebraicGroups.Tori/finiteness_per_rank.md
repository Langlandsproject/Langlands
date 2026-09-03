---
id: tori.finiteness_per_rank
title: Finiteness of Tori of Bounded Rank
kind: theorem
status: admitted
primary_topic: AlgebraicGroups.Tori
topics:
- AlgebraicGroups.Tori
uses:
- tori.f_tori_galois_module_classification
- tori.classification_by_cocycles
source:
  spans:
  - artifact: curtis-reiner-methods
    locator: "Volume I"
    format: section
    note: "Jordan-Zassenhaus theorem: finiteness of isomorphism classes of lattices over a Z-order."
verification:
  statement: accepted
  proof: gap
generality:
  reviewed: true
  prompt: "Is the finiteness stated per rank over an arbitrary field, and is the dependence on Jordan-Zassenhaus (statement-only in this knowledge base) made explicit?"
  verdict: "Yes. The statement is per rank and per base field; the input Jordan-Zassenhaus theorem is cited as an external statement and its proof is explicitly out of scope (verification.proof: gap)."
tags:
- torus
- finiteness
- jordan-zassenhaus
- theorem
- AlgebraicGroups.Tori
---

# Finiteness of Tori of Bounded Rank

Let \(k\) be a field and \(n \geq 0\). Then:

1. \(\operatorname{GL}_n(\mathbb{Z})\) has only finitely many
   conjugacy classes of finite subgroups (a form of the
   **Jordan–Zassenhaus theorem**: there are finitely many
   isomorphism classes of \(\mathbb{Z}[G]\)-lattices of rank \(n\)
   for each finite group \(G\), and finitely many candidate \(G\)
   embed in \(\operatorname{GL}_n(\mathbb{Z})\) since finite
   subgroups have order bounded in terms of \(n\) — Minkowski);
2. consequently, for each \(n\) there are only **finitely many
   \(\Gamma\)-lattice types of rank \(n\)** for any profinite
   \(\Gamma\) acting continuously, and hence — by
   [[node:tori.f_tori_galois_module_classification]] in the cocycle
   form [[node:tori.classification_by_cocycles]] — for a fixed
   finite Galois extension \(E/k\), only finitely many isomorphism
   classes of rank-\(n\) tori over \(k\) split by \(E\).

Over \(k\) itself the set of rank-\(n\) tori need not be finite
(splitting fields vary), but each is determined by a finite-image
continuous homomorphism \(\Theta \to \operatorname{GL}_n(\mathbb{Z})\)
whose image is one of the finitely many finite subgroups up to
conjugacy.

**Status.** Statement-only: the Jordan–Zassenhaus theorem and the
Minkowski bound are recorded here as external inputs with source;
their proofs are outside the scope of this knowledge base
(`verification.proof: gap` marks the node as consumed
statement-only). Downstream uses: finiteness of the candidate list in
rank-one and rank-two classifications.
