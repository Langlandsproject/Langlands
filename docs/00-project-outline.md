# Langlands Mathematics Database: Project Outline

## Purpose

This project aims to build a structured mathematical database for the Langlands
program, in the spirit of the Stacks Project.

The mathematical database is independent of any formalization project. A future
Lean/Mathlib project may refer to stable mathematical node identifiers, but Lean
formalization does not determine the organization of the mathematical content.

## Editorial Principles

- All project files are written in English.
- The mathematical database is statement-first and dependency-first.
- Mathematical content should be organized as a directed acyclic graph of
  concepts, definitions, constructions, examples, lemmas, propositions, and
  theorems.
- Expository outlines may describe reading order, but the authoritative
  structure is the dependency DAG.
- The relative Langlands viewpoint is part of the organizing philosophy:
  ordinary group cases are treated as basic special cases of spaces with group
  action, such as homogeneous and spherical spaces.
- Source provenance, hypotheses, and dependencies should be explicit.

## Major Mathematical Themes

The following list records the top-level mathematical themes. At this stage, the
project only expands the algebraic-groups theme in detail.

1. Foundations
2. Local and Global Fields
3. Algebraic Groups and Homogeneous Spaces
4. Representation Theory and Harmonic Analysis
5. Trace Formulas and Relative Trace Formulas
6. Local Langlands and Local Relative Langlands
7. Automorphic Forms, Automorphic Representations, and Periods
8. L-Functions, Functoriality, and Relative Functoriality
9. Global Langlands and Global Relative Langlands
10. Galois Representations, Motives, and p-adic Hodge Theory
11. Shimura Varieties and Arithmetic Geometry
12. Function Field Langlands and Shtukas
13. Geometric Langlands and Geometric Relative Langlands
14. p-adic and mod p Langlands

## Current Focus

The initial focus is the DAG for algebraic groups and homogeneous spaces. This
topic includes the Borel-Tits-Bruhat-Tits line of algebraic group theory, the
root-theoretic and Coxeter-theoretic combinatorics needed for reductive groups,
rational forms, dual groups, Brylinski-Deligne and metaplectic covers,
homogeneous and spherical spaces, buildings, and the Kottwitz and Kaletha
structures needed for later Langlands applications.

See [Algebraic Groups and Homogeneous Spaces](topics/algebraic-groups.md).
