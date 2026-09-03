# Reductive, Classical, and Coxeter Foundations Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build an accurate mdblueprint and Lean roadmap from reductive group schemes through classical groups to abstract and classical Coxeter complexes.

**Architecture:** Abstract Coxeter theory becomes an independent topic below root data. Reductive and classical group nodes use small definition/theorem nodes, while Lean additions stop at the boundary of Mathlib's verified infrastructure.

**Tech Stack:** mdblueprint Markdown/YAML, Lean 4, Mathlib v4.28.0, GitHub issues.

---

### Task 1: Extract the abstract Coxeter topic

**Files:**
- Modify: `docs/knowledge/mdblueprint.yml`
- Create: `docs/knowledge/nodes/coxeter_theory/topics.md`
- Create: `docs/knowledge/nodes/coxeter_theory/coxeter_system_definition.md`
- Create: `docs/knowledge/nodes/coxeter_theory/coxeter_length_and_reduced_words.md`
- Create: `docs/knowledge/nodes/coxeter_theory/standard_parabolic_subgroups.md`
- Create: `docs/knowledge/nodes/coxeter_theory/bruhat_order_definition.md`
- Create: `docs/knowledge/nodes/coxeter_theory/coxeter_complex_definition.md`
- Modify: `docs/knowledge/nodes/root_data_and_duality/coxeter_systems_and_bruhat_order.md`

- [ ] Add `coxeter_theory` to the configured topic catalog.
- [ ] Write atomic definition nodes with dependencies directed from Coxeter matrices toward words,
      parabolics, Bruhat order, and the complex.
- [ ] Replace the old combined root-data topic with redirects or a concept node using the new
      abstract definitions; remove its dependency on Weyl groups.
- [ ] Run the mdblueprint checker and require `0 error(s)`.
- [ ] Publish to `/tmp/langlands-mdblueprint-site` and inspect the Coxeter topic DAG.
- [ ] Compare topic/node/edge/boundary-edge counts with the deployed `graph_topics.json` and
      affected topic subgraphs; investigate every opposed topic-edge pair involving Coxeter theory.

### Task 2: Repair the reductive definition cluster

**Files:**
- Create: `docs/knowledge/nodes/reductive_structure/geometric_reductive_fiber.md`
- Create: `docs/knowledge/nodes/reductive_structure/reductive_group_scheme_definition.md`
- Create: `docs/knowledge/nodes/reductive_structure/reductive_group_over_field_characterization.md`
- Modify: `docs/knowledge/nodes/reductive_structure/reductive_groups.md`
- Modify: `docs/knowledge/nodes/reductive_structure/topics.md`

- [ ] State the SGA 3 geometric-fiber definition over an arbitrary base scheme.
- [ ] State the field-level unipotent-radical characterization separately, including the imperfect
      field warning.
- [ ] Turn the broad topic page into a catalog that depends on the atomic definitions.
- [ ] Add source spans to SGA 3 or Conrad entries already registered in `mdblueprint.yml`.
- [ ] Run the mdblueprint checker and publisher.

### Task 3: Split the classical group definitions

**Files:**
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/general_and_special_linear_groups.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/symplectic_group_scheme.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/orthogonal_group_schemes.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/unitary_group_over_quadratic_algebra.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/classical_groups_and_coxeter_types.md`
- Modify: `docs/knowledge/nodes/classical_and_exceptional_groups/classical_groups.md`
- Modify: `docs/knowledge/nodes/classical_and_exceptional_groups/topics.md`

- [ ] State each group functor with exact base-ring and form hypotheses.
- [ ] Separate orthogonal from special orthogonal groups and record the characteristic-two caveat.
- [ ] Treat unitary groups over a quadratic etale algebra with involution; discuss field extensions
      as a specialization.
- [ ] Prove in natural language the Coxeter-type identifications from the standard maximal torus
      and root system.
- [ ] Run the mdblueprint checker and publisher.

### Task 4: Define classical Coxeter complexes

**Files:**
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/type_a_coxeter_complex.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/type_bc_coxeter_complex.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/type_d_coxeter_complex.md`
- Create: `docs/knowledge/nodes/classical_and_exceptional_groups/classical_group_coxeter_complex.md`

- [ ] Identify type `A` faces with proper flags of subsets.
- [ ] Identify type `B/C` faces with signed-subset flags and explain why the complexes coincide.
- [ ] Identify type `D` as the even-signed subgroup complex and state the fork behavior.
- [ ] Connect each group to its complex through its based Weyl group, not directly through its
      matrix realization.
- [ ] Run static and browser render checks on the new pages.
- [ ] Inspect the public-style DAG at desktop and mobile widths: labels, edge crossings, zoom,
      breadcrumbs, fallback behavior, and node-detail dialogs must remain usable.

### Task 5: Add the minimal Lean Coxeter layer

**Files:**
- Create: `lean/LanglandsLean/Coxeter/Parabolic.lean`
- Create: `lean/LanglandsLean/Coxeter/Complex.lean`
- Create: `lean/LanglandsLean/Coxeter.lean`

- [ ] Define the subgroup generated by a selected family of simple reflections.
- [ ] Prove monotonicity in the selected generators and the empty/full boundary lemmas.
- [ ] Define typed left cosets of standard parabolics and the proper-face carrier.
- [ ] Define the left `W` action and verify it preserves face type and incidence.
- [ ] Run Lean file diagnostics after every focused edit; do not run a full build during ordinary
      proof iteration.
- [ ] Populate `lean.modules`, `lean.declarations`, and aligned verification only after diagnostics
      report no errors.

### Task 6: Track foundational gaps as issues

**Files:**
- Modify: GitHub issues in `Langlandsproject/Langlands`

- [ ] Update issue #31 so the primary definition is the geometric-fiber SGA 3 definition and list
      unipotent-radical infrastructure as a blocker for the field characterization.
- [ ] Create one issue for mdblueprint Coxeter extraction and DAG repair.
- [ ] Create one issue for standard parabolic subgroups and Coxeter complex in Lean.
- [ ] Create separate issues for exchange/deletion plus Matsumoto, Bruhat order, and classical-type
      Coxeter realizations.
- [ ] Create one issue cluster for classical group definitions and one for their Coxeter complexes.
- [ ] Make every `Blocked by` relation mirror the mathematical dependency graph.

### Task 7: Audit the deployed DAG presentation

**Files:**
- Inspect: `/tmp/langlands-mdblueprint-site/graph_topics.json`
- Inspect: `/tmp/langlands-mdblueprint-site/subgraphs/topics/coxeter_theory.json`
- Inspect: `/tmp/langlands-mdblueprint-site/subgraphs/topics/root_data_and_duality.json`
- Inspect: `/tmp/langlands-mdblueprint-site/subgraphs/topics/classical_and_exceptional_groups.json`

- [ ] Record topic, node, internal-edge, and boundary-edge counts before and after the refactor.
- [ ] Detect pairs of aggregate topic edges in opposite directions and remove dependencies that
      encode subject association rather than logical prerequisite.
- [ ] Confirm no expanded affected topic exceeds the configured 120 visible-node or 80 expansion
      cap; split a topic only along a genuine mathematical boundary.
- [ ] Run `render_check` against the locally published site.
- [ ] Inspect desktop and mobile graph views for clipped labels, excessive crossings, unusable zoom,
      broken breadcrumbs, and inaccessible node-detail dialogs.
- [ ] Compare the final local graph JSON with `https://jiajunma.github.io/Langlands/` before deploy.
