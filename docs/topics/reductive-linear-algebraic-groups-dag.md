# Reductive Linear Algebraic Groups: Knowledge-Topic DAG

## Purpose

This file records the working design for a knowledge-topic dependency DAG for
linear algebraic groups, reductive groups, rational forms, inner forms, dual
groups, buildings, Kottwitz structures, and closely related algebraic-group
foundations.

The nodes in this DAG are not individual theorem or definition nodes. Each node
is a mathematical topic block that may later contain definitions, examples,
standard constructions, key theorems, references, and finer statement-level
nodes.

## Node Convention

All knowledge-topic nodes use the namespace

```text
topic.*
```

Do not use separate namespaces such as `background.*`, `lag.*`,
`reductive.*`, or `topics.*`.

Some `topic.*` nodes may be external background topics, for example fields,
affine schemes, or commutative algebra. That status should be recorded in tags
or prose, not in the node identifier.

## Edge Convention

An edge

```text
topic.a -> topic.b
```

means that topic `a` is a mathematical prerequisite for topic `b`.

Edges must not encode website navigation, table-of-contents containment, or
project management priority. Topic taxonomy belongs in `mdblueprint.yml` and
`topics.md`; mathematical dependency belongs in `uses`.

## Phase 1: Linear Algebraic Group Basics

The first layer records the basic knowledge needed before discussing rational
forms and inner forms.

```text
topic.fields_and_field_extensions
topic.affine_schemes
topic.commutative_algebra
topic.hopf_algebras

topic.coordinate_rings_and_hopf_algebras
topic.affine_algebraic_groups
topic.linear_algebraic_groups
topic.morphisms_and_closed_subgroups
topic.kernels_images_and_quotients
topic.base_change
topic.smoothness_tangent_spaces_lie_algebras
topic.connected_components
topic.basic_examples
```

Proposed dependencies:

```text
topic.commutative_algebra
topic.affine_schemes
topic.hopf_algebras
  -> topic.coordinate_rings_and_hopf_algebras

topic.coordinate_rings_and_hopf_algebras
  -> topic.affine_algebraic_groups

topic.affine_algebraic_groups
  -> topic.linear_algebraic_groups
  -> topic.morphisms_and_closed_subgroups

topic.morphisms_and_closed_subgroups
  -> topic.kernels_images_and_quotients

topic.fields_and_field_extensions
topic.affine_algebraic_groups
  -> topic.base_change

topic.affine_schemes
topic.affine_algebraic_groups
  -> topic.smoothness_tangent_spaces_lie_algebras

topic.smoothness_tangent_spaces_lie_algebras
  -> topic.connected_components

topic.linear_algebraic_groups
topic.morphisms_and_closed_subgroups
  -> topic.basic_examples
```

## Galois Descent, Cohomology, and Twisting

This layer is needed before rational forms and inner forms.

```text
topic.galois_groups_and_descent_data
topic.galois_cohomology
topic.nonabelian_h1
topic.torsors
topic.automorphism_groups
topic.conjugacy_classes
topic.twisted_conjugacy_classes
topic.cocycles_and_twisting
topic.forms_of_algebraic_objects
topic.forms_of_algebraic_groups
topic.rational_forms_of_linear_algebraic_groups
```

Proposed dependencies:

```text
topic.fields_and_field_extensions
  -> topic.galois_groups_and_descent_data

topic.galois_groups_and_descent_data
  -> topic.galois_cohomology
  -> topic.nonabelian_h1

topic.nonabelian_h1
  -> topic.torsors

topic.affine_algebraic_groups
topic.morphisms_and_closed_subgroups
  -> topic.automorphism_groups

topic.galois_groups_and_descent_data
topic.automorphism_groups
  -> topic.forms_of_algebraic_objects

topic.linear_algebraic_groups
topic.automorphism_groups
  -> topic.conjugacy_classes

topic.galois_cohomology
topic.conjugacy_classes
  -> topic.twisted_conjugacy_classes

topic.nonabelian_h1
topic.torsors
topic.automorphism_groups
  -> topic.cocycles_and_twisting

topic.base_change
topic.forms_of_algebraic_objects
topic.cocycles_and_twisting
topic.affine_algebraic_groups
  -> topic.forms_of_algebraic_groups

topic.forms_of_algebraic_groups
topic.linear_algebraic_groups
  -> topic.rational_forms_of_linear_algebraic_groups
```

## Reductive Group Structure

This is the main structural layer of reductive linear algebraic groups.

```text
topic.algebraic_tori
topic.character_and_cocharacter_lattices
topic.diagonalizable_groups
topic.unipotent_groups
topic.solvable_groups
topic.borel_subgroups
topic.parabolic_subgroups
topic.levi_subgroups_and_unipotent_radicals
topic.reductive_groups
topic.semisimple_groups
topic.central_isogenies
topic.derived_group_center_adjoint_sc_cover
topic.maximal_tori
```

Proposed dependencies:

```text
topic.linear_algebraic_groups
  -> topic.algebraic_tori
  -> topic.diagonalizable_groups
  -> topic.unipotent_groups

topic.algebraic_tori
  -> topic.character_and_cocharacter_lattices

topic.unipotent_groups
  -> topic.solvable_groups

topic.algebraic_tori
topic.solvable_groups
topic.connected_components
  -> topic.borel_subgroups

topic.borel_subgroups
  -> topic.parabolic_subgroups

topic.parabolic_subgroups
  -> topic.levi_subgroups_and_unipotent_radicals

topic.algebraic_tori
topic.unipotent_groups
topic.solvable_groups
topic.levi_subgroups_and_unipotent_radicals
  -> topic.reductive_groups

topic.reductive_groups
  -> topic.semisimple_groups
  -> topic.central_isogenies
  -> topic.derived_group_center_adjoint_sc_cover

topic.reductive_groups
topic.algebraic_tori
  -> topic.maximal_tori
```

## Root Systems, Root Data, and Dual Groups

This layer records the root-theoretic and dual-group structure of reductive
groups.

```text
topic.roots_coroots_and_root_subgroups
topic.weyl_groups
topic.coxeter_systems_and_bruhat_order
topic.root_systems
topic.dual_root_systems
topic.cartan_matrices_and_dynkin_diagrams
topic.root_data
topic.dual_root_data
topic.based_root_data
topic.pinnings
topic.automorphisms_of_root_data
topic.classification_of_split_reductive_groups
topic.fundamental_group_of_root_datum
topic.dual_reductive_groups
topic.pinned_dual_groups
topic.langlands_dual_groups
topic.galois_action_on_root_data
topic.l_groups
topic.l_morphisms
topic.central_isogenies_and_duality
topic.centers_and_dual_centers
```

Proposed dependencies:

```text
topic.reductive_groups
topic.maximal_tori
  -> topic.roots_coroots_and_root_subgroups

topic.roots_coroots_and_root_subgroups
  -> topic.weyl_groups

topic.weyl_groups
  -> topic.coxeter_systems_and_bruhat_order

topic.roots_coroots_and_root_subgroups
topic.weyl_groups
  -> topic.root_systems

topic.root_systems
  -> topic.dual_root_systems
  -> topic.cartan_matrices_and_dynkin_diagrams

topic.character_and_cocharacter_lattices
topic.roots_coroots_and_root_subgroups
  -> topic.root_data

topic.root_data
  -> topic.dual_root_data
  -> topic.based_root_data
  -> topic.fundamental_group_of_root_datum

topic.based_root_data
topic.roots_coroots_and_root_subgroups
  -> topic.pinnings

topic.root_data
topic.based_root_data
  -> topic.automorphisms_of_root_data

topic.root_data
topic.based_root_data
topic.pinnings
  -> topic.classification_of_split_reductive_groups

topic.dual_root_data
topic.classification_of_split_reductive_groups
  -> topic.dual_reductive_groups

topic.dual_reductive_groups
topic.pinnings
  -> topic.pinned_dual_groups
  -> topic.langlands_dual_groups

topic.rational_forms_of_reductive_groups
topic.automorphisms_of_root_data
  -> topic.galois_action_on_root_data

topic.langlands_dual_groups
topic.galois_action_on_root_data
  -> topic.l_groups

topic.l_groups
topic.dual_reductive_groups
  -> topic.l_morphisms

topic.central_isogenies
topic.root_data
  -> topic.central_isogenies_and_duality

topic.fundamental_group_of_root_datum
topic.dual_root_data
  -> topic.centers_and_dual_centers
```

## Rational Forms and Inner Forms

Rational forms and inner forms should be developed after the basic linear
algebraic group layer, descent/cohomology layer, and reductive/root-data layer.

```text
topic.rational_forms_of_reductive_groups
topic.quasi_split_forms
topic.inner_forms
topic.outer_forms
topic.real_forms
topic.vogan_diagrams
topic.pure_inner_twists
topic.extended_groups_for_real_forms
topic.strong_real_forms
topic.strong_inner_forms
topic.rigid_inner_twists
topic.rigid_inner_forms
topic.kaletha_refined_inner_forms
```

Proposed dependencies:

```text
topic.forms_of_algebraic_groups
topic.reductive_groups
topic.root_data
topic.galois_cohomology
  -> topic.rational_forms_of_reductive_groups

topic.rational_forms_of_reductive_groups
  -> topic.quasi_split_forms
  -> topic.inner_forms
  -> topic.outer_forms

topic.rational_forms_of_reductive_groups
topic.inner_forms
  -> topic.real_forms

topic.real_forms
topic.root_data
topic.galois_action_on_root_data
  -> topic.vogan_diagrams

topic.inner_forms
topic.nonabelian_h1
topic.cocycles_and_twisting
  -> topic.pure_inner_twists

topic.real_forms
topic.inner_forms
topic.automorphism_groups
  -> topic.extended_groups_for_real_forms

topic.extended_groups_for_real_forms
topic.real_forms
  -> topic.strong_real_forms

topic.strong_real_forms
topic.inner_forms
  -> topic.strong_inner_forms

topic.pure_inner_twists
topic.galois_cohomology
topic.algebraic_fundamental_group
topic.kottwitz_homomorphism
  -> topic.rigid_inner_twists

topic.rigid_inner_twists
topic.inner_forms
  -> topic.rigid_inner_forms

topic.rigid_inner_forms
topic.kottwitz_map_on_b_of_g
topic.b_of_g
  -> topic.kaletha_refined_inner_forms
```

ABV strong real and strong inner forms are part of the real inner-form
refinement line. Kaletha rigid inner twists and rigid inner forms belong to the
inner-form refinement line, but they also depend on Kottwitz-type structures.

## Tits and Bruhat-Tits Buildings

Buildings belong to algebraic group theory. Spherical/Tits buildings are
attached to parabolic geometry, while Bruhat-Tits buildings require local-field
and valuation input.

```text
topic.coxeter_complexes
topic.bn_pairs_and_tits_systems
topic.spherical_buildings
topic.tits_buildings
topic.local_fields
topic.reductive_groups_over_local_fields
topic.valued_root_data
topic.affine_root_systems
topic.affine_weyl_groups
topic.bruhat_tits_apartments
topic.bruhat_tits_buildings
topic.facets_in_bruhat_tits_buildings
topic.parahoric_subgroups
topic.smooth_affine_group_schemes_over_valuation_rings
topic.parahoric_group_schemes
topic.reductive_quotients_of_parahoric_group_schemes
topic.moy_prasad_filtrations
```

Proposed dependencies:

```text
topic.coxeter_systems_and_bruhat_order
  -> topic.coxeter_complexes

topic.coxeter_complexes
topic.parabolic_subgroups
  -> topic.bn_pairs_and_tits_systems

topic.bn_pairs_and_tits_systems
  -> topic.spherical_buildings

topic.reductive_groups
topic.parabolic_subgroups
topic.spherical_buildings
  -> topic.tits_buildings

topic.local_fields
topic.reductive_groups
topic.root_data
topic.galois_action_on_root_data
  -> topic.reductive_groups_over_local_fields
  -> topic.valued_root_data

topic.root_systems
topic.valued_root_data
  -> topic.affine_root_systems

topic.coxeter_systems_and_bruhat_order
topic.affine_root_systems
  -> topic.affine_weyl_groups

topic.local_fields
topic.reductive_groups_over_local_fields
topic.valued_root_data
topic.affine_weyl_groups
  -> topic.bruhat_tits_apartments

topic.bruhat_tits_apartments
topic.bn_pairs_and_tits_systems
  -> topic.bruhat_tits_buildings

topic.bruhat_tits_buildings
  -> topic.facets_in_bruhat_tits_buildings

topic.facets_in_bruhat_tits_buildings
topic.reductive_groups_over_local_fields
  -> topic.parahoric_subgroups

topic.parahoric_subgroups
topic.smooth_affine_group_schemes_over_valuation_rings
  -> topic.parahoric_group_schemes

topic.parahoric_group_schemes
  -> topic.reductive_quotients_of_parahoric_group_schemes

topic.parahoric_subgroups
topic.lie_algebras_of_reductive_groups
  -> topic.moy_prasad_filtrations
```

## Kottwitz Structures

Kottwitz maps and \(B(G)\) are part of the algebraic group foundation for
rational reductive groups over local fields.

```text
topic.algebraic_fundamental_group
topic.kottwitz_homomorphism
topic.sigma_conjugacy_classes
topic.b_of_g
topic.newton_map
topic.kottwitz_map_on_b_of_g
topic.basic_sigma_conjugacy_classes
topic.admissible_sets
topic.isocrystals_with_g_structure
```

Proposed dependencies:

```text
topic.reductive_groups
topic.root_data
  -> topic.algebraic_fundamental_group

topic.algebraic_fundamental_group
topic.galois_action_on_root_data
topic.local_fields
  -> topic.kottwitz_homomorphism

topic.local_fields
topic.reductive_groups_over_local_fields
  -> topic.sigma_conjugacy_classes

topic.sigma_conjugacy_classes
topic.kottwitz_homomorphism
topic.algebraic_fundamental_group
  -> topic.b_of_g

topic.b_of_g
topic.root_data
  -> topic.newton_map

topic.b_of_g
topic.algebraic_fundamental_group
  -> topic.kottwitz_map_on_b_of_g

topic.newton_map
topic.kottwitz_map_on_b_of_g
  -> topic.basic_sigma_conjugacy_classes

topic.b_of_g
topic.affine_weyl_groups
  -> topic.admissible_sets

topic.b_of_g
topic.sigma_conjugacy_classes
  -> topic.isocrystals_with_g_structure
```

## Nilpotent Orbits

Nilpotent orbits belong to the algebraic group foundation through Lie algebras,
the adjoint action, and reductive group structure.

```text
topic.lie_algebras_of_reductive_groups
topic.adjoint_action
topic.nilpotent_elements
topic.nilpotent_cone
topic.nilpotent_orbits
topic.sl2_triples
topic.jacobson_morozov_theorem
topic.weighted_dynkin_diagrams
topic.bala_carter_classification
topic.rational_nilpotent_orbits
```

Proposed dependencies:

```text
topic.smoothness_tangent_spaces_lie_algebras
topic.reductive_groups
  -> topic.lie_algebras_of_reductive_groups

topic.reductive_groups
topic.lie_algebras_of_reductive_groups
  -> topic.adjoint_action

topic.lie_algebras_of_reductive_groups
  -> topic.nilpotent_elements

topic.nilpotent_elements
topic.adjoint_action
  -> topic.nilpotent_cone
  -> topic.nilpotent_orbits

topic.nilpotent_elements
  -> topic.sl2_triples
  -> topic.jacobson_morozov_theorem

topic.nilpotent_orbits
topic.root_systems
  -> topic.weighted_dynkin_diagrams

topic.nilpotent_orbits
topic.parabolic_subgroups
topic.levi_subgroups_and_unipotent_radicals
topic.weighted_dynkin_diagrams
  -> topic.bala_carter_classification

topic.nilpotent_orbits
topic.rational_forms_of_reductive_groups
topic.galois_cohomology
  -> topic.rational_nilpotent_orbits
```

## Brylinski-Deligne and Metaplectic Covers

Brylinski-Deligne covers are algebraic-group foundation topics because they are
central-extension data attached to reductive groups.

```text
topic.central_extensions_of_algebraic_groups
topic.brylinski_deligne_k2_extensions
topic.local_and_global_metaplectic_covers
topic.splittings_over_integral_and_parahoric_subgroups
topic.dual_groups_for_covers
topic.l_groups_for_covers
```

Proposed dependencies:

```text
topic.affine_algebraic_groups
topic.hopf_algebras
  -> topic.central_extensions_of_algebraic_groups

topic.reductive_groups
topic.root_data
topic.central_extensions_of_algebraic_groups
topic.algebraic_k_theory_and_k2
  -> topic.brylinski_deligne_k2_extensions

topic.brylinski_deligne_k2_extensions
topic.local_fields
topic.global_fields_adeles_and_reciprocity_symbols
  -> topic.local_and_global_metaplectic_covers

topic.local_and_global_metaplectic_covers
topic.parahoric_subgroups
  -> topic.splittings_over_integral_and_parahoric_subgroups

topic.brylinski_deligne_k2_extensions
topic.dual_root_data
topic.langlands_dual_groups
  -> topic.dual_groups_for_covers
  -> topic.l_groups_for_covers
```

## Additional Topics to Consider

The following topics are likely needed, but their exact position should be
settled before creating nodes:

- quotient representability for algebraic groups and homogeneous spaces;
- Chevalley groups, Chevalley bases, and integral forms;
- root subgroup parametrizations and Chevalley commutator relations;
- Bruhat decomposition, Birkhoff decomposition, and big cells;
- centralizers and normalizers, especially centralizers of semisimple elements;
- Jordan decomposition in algebraic groups and Lie algebras;
- Lang-Steinberg theorem and applications to rational conjugacy;
- restriction of scalars and Weil restriction;
- pseudo-reductive groups over imperfect fields;
- nonconnected reductive groups and disconnected group actions;
- finite groups of Lie type as rational points of reductive groups;
- z-extensions and cohomological exact sequences for reductive groups;
- G-complete reducibility;
- invariant theory for reductive groups, if needed for quotients;
- wonderful compactifications and spherical varieties, if the relative
  viewpoint enters this reductive-topic layer.

## Current Modeling Correction

The current published `topics.*` graph should not be treated as the mathematical
DAG. It mixes website topic navigation and mathematical dependency.

The next rebuild should replace it with `topic.*` knowledge-topic nodes whose
`uses` edges are only mathematical prerequisites.

