# Algebraic Groups and Homogeneous Spaces

## Current Design Note

The current working design for the reductive linear algebraic group knowledge
DAG is maintained in
[Reductive Linear Algebraic Groups: Knowledge-Topic DAG](reductive-linear-algebraic-groups-dag.md).

That design supersedes the earlier `topics.*` graph model. In the corrected
model, every DAG node is a mathematical knowledge topic with an identifier of
the form `topic.*`, and `uses` edges record only mathematical prerequisite
relations.

## Purpose

This file records the initial dependency-DAG plan for the algebraic group part
of the Langlands Mathematics Database.

This is an outline, not a collection of concrete mathematical statement nodes.
Large theme nodes may exist in the knowledge base as `kind: concept` topic
nodes, but concrete definition, theorem, construction, example, and proof-plan
nodes will be created later. The present file fixes the intended module
structure and dependency direction.

The topic follows the Borel-Tits-Bruhat-Tits line of algebraic group theory and
keeps the relative Langlands viewpoint in scope: ordinary group cases are basic
special cases of homogeneous or spherical spaces with group action.

## DAG Convention

An arrow

```text
A -> B
```

means that module `B` depends on module `A`.

The eventual mdblueprint node-level DAG will be generated from each node's
`uses` field. Human-facing graph views should display dependencies in the
direction

```text
dependency -> dependent
```

even if internal graph tooling stores the reverse direction for validation or
topological sorting.

## External Prerequisites

These prerequisites are not owned by this topic, but algebraic-groups nodes may
depend on them.

```text
EXT1. Fields, separable closures, and Galois groups
EXT2. Affine algebraic geometry and affine schemes
EXT3. Hopf algebras and coordinate rings
EXT4. Nonabelian Galois cohomology
EXT5. Local fields and valuation theory
EXT6. Basic combinatorics and partially ordered sets
EXT7. Algebraic K-theory and K_2
EXT8. Global fields, adeles, and reciprocity symbols
```

## Core Algebraic Group DAG

```text
EXT1, EXT2, EXT3 -> AG1

AG1. Affine and Linear Algebraic Groups
  scope:
    affine algebraic groups; linear algebraic groups over fields; closed
    subgroups of general linear groups; coordinate algebras; Hopf algebras.

AG1 -> AG2

AG2. Morphisms, Subgroups, Quotients, and Base Change
  scope:
    morphisms of algebraic groups; kernels; images; closed subgroups; quotients
    when available; base change; restriction of scalars where appropriate.

AG1, AG2 -> AG3

AG3. Smoothness, Lie Algebras, and Connected Components
  scope:
    smoothness; tangent spaces; Lie algebras; identity components; component
    groups; geometric connectedness.

AG1, AG2, AG3 -> AG4

AG4. Basic Examples
  scope:
    additive groups; multiplicative groups; general linear groups; special
    linear groups; projective linear groups; orthogonal groups; symplectic
    groups; classical groups; diagonalizable groups; unipotent groups; finite
    group schemes when needed.
```

## Tori, Unipotent Groups, and Actions

```text
AG1, AG2, AG3 -> TU1

TU1. Tori, Diagonalizable Groups, Characters, and Cocharacters
  scope:
    split tori; algebraic tori; diagonalizable groups; character lattices;
    cocharacter lattices; Galois actions on character and cocharacter lattices;
    anisotropic tori; induced and coinduced tori; norm maps.

AG1, AG2, AG3 -> TU2

TU2. Unipotent, Solvable, and Nilpotent Groups
  scope:
    unipotent elements; unipotent groups; split unipotent groups; solvable
    groups; nilpotent groups; radicals; unipotent radicals; Lie-Kolchin type
    results.

AG1, AG2 -> TU3

TU3. Group Actions and Homogeneous Spaces
  scope:
    algebraic group actions; stabilizers; orbit maps; homogeneous spaces;
    quotient spaces; quotient stacks when needed.
```

## Reductive Groups

```text
TU1, TU2, AG3 -> RG1

RG1. Reductive and Semisimple Groups
  scope:
    reductive groups; semisimple groups; derived subgroup; center; adjoint
    quotient; simply connected cover; central isogenies; almost simple groups;
    products and restriction of scalars.

TU1, TU2, RG1 -> RG2

RG2. Borel, Parabolic, and Levi Subgroups
  scope:
    Borel subgroups; parabolic subgroups; minimal and standard parabolic
    subgroups; Levi subgroups; Levi decompositions; unipotent radicals; opposite
    parabolics; flag varieties; conjugacy theorems; rational parabolic
    subgroups.

TU1, RG1, RG2 -> RG3

RG3. Maximal Tori, Roots, Coroots, and Weyl Groups of Reductive Groups
  scope:
    maximal tori; roots; coroots; root subgroups; Weyl groups attached to
    reductive groups; normalizers and centralizers of tori.
```

## Root-Theoretic and Coxeter Combinatorics

This layer is not an independent top-level Langlands theme. It is the
combinatorial infrastructure used by reductive groups, root data, buildings,
Bruhat-Tits theory, and relative settings.

```text
EXT6 -> RC1

RC1. Abstract Coxeter Systems and Bruhat Order
  scope:
    Coxeter systems; Coxeter matrices; length functions; reduced expressions;
    parabolic subgroups of Coxeter groups; Bruhat order.

RC1 -> RC2

RC2. Abstract Root Systems, Cartan Matrices, and Dynkin Diagrams
  scope:
    root systems; coroot systems; Cartan matrices; Dynkin diagrams; dual
    diagrams; diagram automorphisms.

RC2 -> RC3

RC3. Classification of Root Systems and Dynkin Diagrams
  scope:
    irreducible finite root systems; simply laced and non-simply laced types;
    finite classification; affine Dynkin diagrams when used as combinatorial
    input.

RG3, RC2, RC3 -> RC4

RC4. Root Data and Based Root Data
  scope:
    character lattices; cocharacter lattices; root data; based root data;
    reduced and nonreduced root data.

RC4 -> RC5

RC5. Pinnings and Automorphisms of Root Data
  scope:
    pinnings; automorphisms of root data; automorphisms of based and pinned
    data.

RG1, RC4, RC5 -> RC6

RC6. Classification of Split Reductive Groups by Root Data
  scope:
    split reductive groups; classification by root data; uniqueness and
    existence statements; relation with central isogenies.
```

## Dual Groups and L-Groups

```text
RC4, RC5 -> DG1

DG1. Dual Root Data and Dual Reductive Groups
  scope:
    dual root datum; dual reductive group; duality on characters,
    cocharacters, roots, and coroots.

DG1, RC5 -> DG2

DG2. Pinned Dual Groups
  scope:
    pinned dual groups; automorphisms preserving pinned data.

DG2, RF2, EXT1 -> DG3

DG3. L-Groups as Group-Theoretic Objects
  scope:
    Galois action on dual groups; semidirect products defining L-groups;
    compatibility with based and pinned root data.
```

The construction of L-groups belongs here as group-theoretic infrastructure.
L-parameters, packets, and representation-theoretic applications belong to
later Langlands topics.

## Brylinski-Deligne and Metaplectic Covers

This layer belongs to algebraic groups because Brylinski-Deligne covers are
central-extension data attached to reductive groups. Their representation theory
and Langlands applications belong to later topics, but the algebraic and
root-theoretic input should be recorded here.

```text
AG1, AG2, EXT7 -> BD1

BD1. Central Extensions of Algebraic Groups
  scope:
    central extensions of algebraic groups; central extensions by multiplicative
    groups; central extensions by K-theoretic sheaves when needed; functoriality
    of central-extension data.

RG1, RC4, BD1 -> BD2

BD2. Brylinski-Deligne K_2-Central Extensions
  scope:
    Brylinski-Deligne central extensions of reductive groups by K_2;
    classification invariants; Weyl-invariant quadratic forms on cocharacter
    lattices; extensions of cocharacter lattices; compatibility data.

BD2, EXT5, EXT8 -> BD3

BD3. Local and Global Metaplectic Covers from BD Data
  scope:
    pushouts by local and global symbols; topological central extensions of
    local rational points; adelic metaplectic covers; canonical splittings where
    they are part of the algebraic input.

BD3, BT3 -> BD4

BD4. Splittings over Integral and Parahoric Subgroups
  scope:
    splittings over unipotent subgroups; hyperspecial and parahoric splittings;
    interaction with integral models and Bruhat-Tits group schemes.

BD2, DG1, DG2, RF2 -> BD5

BD5. Dual Groups and L-Groups for Covers
  scope:
    modified root data for covers; metaplectic dual groups; covering L-groups;
    Weissman and Gan-Gao style constructions as group-theoretic input for later
    Langlands topics.
```

## Rational Forms and Inner Forms

```text
AG1, AG2, EXT4 -> RF1

RF1. Descent, Forms, and Torsors
  scope:
    descent data; forms of algebraic groups; torsors; nonabelian cohomological
    classification.

RG1, RC4, RF1 -> RF2

RF2. Rational Reductive Groups
  scope:
    reductive groups over arbitrary fields; split groups; quasi-split groups;
    anisotropic groups; outer forms; Galois actions on root data.

RF2, EXT4 -> RF3

RF3. Inner Forms and Pure Inner Twists
  scope:
    inner automorphisms; outer automorphisms; inner forms; pure inner twists;
    relation with nonabelian Galois cohomology.

RF2, RF3, RC5 -> RF4

RF4. Real Forms and Vogan Diagrams
  scope:
    real forms of reductive groups; Vogan diagrams; extended Vogan diagrams;
    relation between diagram data and real reductive groups.

RF3, KT2, KT3 -> RF5

RF5. Refined Inner Twists and Kaletha Framework
  scope:
    extended pure inner twists; rigid inner twists; Kaletha refinements of
    inner forms; relevance to later local Langlands normalization.
```

Kaletha's refinements are part of the inner-form layer. They are not a flat
topic parallel to Kottwitz theory.

## Homogeneous and Spherical Spaces

```text
TU3, RG1 -> HS1

HS1. Homogeneous Spaces
  scope:
    homogeneous spaces for algebraic groups; stabilizers; quotients;
    quotient-stack language when necessary; group cases as basic examples.

HS1, RG2 -> HS2

HS2. Symmetric Spaces and Spherical Varieties
  scope:
    symmetric spaces; spherical varieties; Borel orbits; open orbits; basic
    examples relevant to relative Langlands.

HS2, RC1, RC2 -> HS3

HS3. Spherical Combinatorics
  scope:
    colors; valuations; little Weyl groups; spherical roots; relative root
    systems.

HS2, HS3 -> HS4

HS4. Boundary Degenerations and Wonderful Compactifications
  scope:
    boundary degenerations; wonderful compactifications; compactification data
    for spherical varieties when needed.
```

## Tits Systems and Buildings

```text
RC1, RG2 -> TB1

TB1. BN-Pairs and Tits Systems
  scope:
    BN-pairs; Tits systems; Weyl groups from BN-pairs; parabolic subgroups from
    Tits systems.

TB1, RG2 -> TB2

TB2. Spherical Buildings
  scope:
    chambers; apartments; residues; spherical buildings; Coxeter complexes;
    parabolic subgroups and buildings.

TB2, RF2 -> TB3

TB3. Rational Buildings
  scope:
    buildings over non-algebraically closed fields; rational parabolic
    subgroups; rational apartments.
```

## Bruhat-Tits Theory

```text
RC1, RC2, RC4, EXT5 -> BT1

BT1. Affine Root Systems and Affine Weyl Groups
  scope:
    affine roots; affine Weyl groups; extended affine Weyl groups; alcoves;
    apartment combinatorics.

BT1, RF2, EXT5 -> BT2

BT2. Bruhat-Tits Apartments and Affine Buildings
  scope:
    reductive groups over nonarchimedean local fields; apartments; affine
    buildings; facets.

BT2, AG1, AG3 -> BT3

BT3. Facets, Parahoric Subgroups, and Parahoric Group Schemes
  scope:
    facets; parahoric subgroups; parahoric group schemes; integral models.

BT3, AG3 -> BT4

BT4. Moy-Prasad Filtrations
  scope:
    Moy-Prasad filtrations and related filtration structures when needed.
```

## Kottwitz Structures

```text
RC4, RG1 -> KT1

KT1. Algebraic Fundamental Group of a Reductive Group
  scope:
    algebraic fundamental group; relation with cocharacter lattices and root
    data.

KT1, RF2, EXT4, EXT5 -> KT2

KT2. Kottwitz Homomorphism and Kottwitz Invariant
  scope:
    Kottwitz homomorphism; Kottwitz invariant; dependence on local fields and
    Galois/cohomological input.

KT1, KT2, EXT5 -> KT3

KT3. B(G), Newton Points, and Basic Elements
  scope:
    the set B(G); Newton points; basic elements; classification structures for
    isocrystals with G-structure.

KT3, BT1 -> KT4

KT4. Admissible Sets and Isocrystals with G-Structure
  scope:
    admissible subsets; isocrystals with G-structure; interaction with affine
    Weyl group combinatorics.
```

## High-Level Dependency Summary

```text
External prerequisites
  -> affine and linear algebraic groups
  -> tori, unipotent groups, actions
  -> reductive groups
  -> root-theoretic and Coxeter combinatorics
  -> root data and split classification
  -> dual groups and L-groups
  -> Brylinski-Deligne and metaplectic covers
  -> rational forms and inner forms
  -> refined inner twists and Kaletha framework

External prerequisites
  -> affine and linear algebraic groups
  -> actions and homogeneous spaces
  -> spherical varieties and spherical combinatorics

Root-theoretic combinatorics and reductive groups
  -> Tits systems and spherical buildings
  -> Bruhat-Tits affine buildings

Root data, rational reductive groups, local fields, and Galois cohomology
  -> Kottwitz structures
  -> refined inner twists

Reductive groups, root data, K_2, local/global symbols, and dual groups
  -> Brylinski-Deligne covers
  -> metaplectic dual groups and covering L-groups
```

## mdblueprint Graph Generation Plan

The project will use the local package at `~/mycodes/mdblueprint` to check and
publish the future knowledge base.

No concrete nodes are created by this outline. Once nodes exist, each node will
be a Markdown file with YAML frontmatter. The node-level DAG will be generated
from the `uses` field, and topic views will be generated from `primary_topic`
and `topics`.

The intended future knowledge-base root is:

```text
docs/knowledge/
```

The mdblueprint project configuration should live at:

```text
docs/knowledge/mdblueprint.yml
```

Future checking and publishing commands should be run from the mdblueprint
checkout:

```bash
cd ~/mycodes/mdblueprint
uv run python -m tools.knowledge.check /Users/hoxide/mydoc/Langlands/docs/knowledge
uv run python -m tools.knowledge.publish /Users/hoxide/mydoc/Langlands/docs/knowledge /tmp/langlands-mdblueprint-site
```

For browser-level rendering checks after publishing:

```bash
cd ~/mycodes/mdblueprint
uv run --extra browser python -m tools.knowledge.render_check /tmp/langlands-mdblueprint-site
```

The generated graph artifacts are owned by mdblueprint. They should not be
written manually. In particular, do not hand-write final `graph.json`, topic
subgraphs, reverse-dependency lists, or generated HTML.
