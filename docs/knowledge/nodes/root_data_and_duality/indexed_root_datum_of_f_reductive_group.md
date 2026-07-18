---
id: root_data_and_duality.indexed_root_datum_of_f_reductive_group
title: Indexed Root Datum of an F-Reductive Group
kind: definition
status: admitted
primary_topic: descent_and_forms
topics:
- root_data_and_duality
- reductive_structure
- descent_and_forms
uses:
- root_data_and_duality.root_datum_from_reductive_group
- root_data_and_duality.galois_action_on_root_data
- root_data_and_duality.relative_root_datum_of_f_reductive_group
- descent_and_forms.rational_forms_of_reductive_groups
source:
  spans:
  - artifact: springer-linear-algebraic-groups
    locator: "Section 16.2"
    format: section
    note: "Section 16.2.1: indexed root datum and Tits index of a reductive F-group."
verification:
  definition: accepted
  proof: not_applicable
generality:
  reviewed: true
  prompt: "Does this encode both the absolute based root datum and the F-rational anisotropic part?"
  verdict: "Yes. The datum includes the based root datum, the distinguished subset D_0, and the Galois action preserving it."
tags:
- springer
- indexed-root-datum
- tits-index
- f-reductive-group
- definition
- root-data-and-duality
---

# Indexed Root Datum of an F-Reductive Group

An **indexed root datum over \(F\)** is a tuple
\[
(X,D,X^\vee,D^\vee,D_0,\Gamma)
\]
where:

- \((X,D,X^\vee,D^\vee)\) is a based root datum;
- \(D_0\subseteq D\) is the distinguished subset, recording the anisotropic
  kernel;
- the absolute Galois group \(\Gamma_F=\operatorname{Gal}(F_s/F)\) acts
  continuously on \(X\), preserving \(D\) and \(D_0\), and dually on
  \(X^\vee\).

For a connected reductive \(F\)-group \(G\), choose a maximal \(F\)-split
torus \(S\), a maximal \(F\)-torus \(T\supseteq S\), and a compatible basis
\(D\) of the absolute roots. The resulting indexed root datum
\[
{}_{F}\Psi(G)=(X,D,X^\vee,D^\vee,D_0,\Gamma_F)
\]
is independent of the choices up to isomorphism.

The group \(G\) is \(F\)-split exactly when \(D_0=\emptyset\) and the Galois
action on the based root datum is trivial. It is quasi-split exactly when
\(D_0=\emptyset\). It is anisotropic exactly when \(D_0=D\).
