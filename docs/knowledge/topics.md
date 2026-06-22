# Reductive Linear Algebraic Groups Knowledge DAG

This knowledge root publishes a topic-level mathematical dependency DAG for reductive linear algebraic groups and related foundations.

A node with `kind: topic` records a mathematical subject that has not yet been expanded into individual definitions, constructions, theorems, examples, references, and Lean targets. The `uses` field records mathematical prerequisite relations only; it is not navigation containment.

The public taxonomy has no `topic` root. Its roots are the mathematical categories listed below.

## Mathematical Categories

- `foundational_inputs`: Foundational Inputs
- `linear_algebraic_groups`: Linear Algebraic Groups
- `descent_and_forms`: Galois Descent, Cohomology, and Forms
- `reductive_structure`: Reductive Group Structure
- `root_data_and_duality`: Root Data and Duality
- `classical_and_exceptional_groups`: Classical and Exceptional Groups
- `buildings_and_parahorics`: Buildings and Parahorics
- `kottwitz_structures`: Kottwitz Structures
- `nilpotent_orbits`: Nilpotent Orbits
- `bd_covers`: Brylinski-Deligne and Metaplectic Covers

## Current Springer Expansion Wave

The current source-backed expansion extracts statement-level nodes from
Springer, *Linear Algebraic Groups*. These entries are navigation and project
planning only; mathematical dependency remains encoded in each node's `uses:`
frontmatter.

Recommended issue order:

1. Operations on algebraic groups: #22, #23, #24.
2. Diagonalizable, Lie, unipotent, and solvable structure: #25, #26, #27, #28.
3. Borel, maximal tori, reductive groups, roots, parabolics, and Bruhat cells:
   #29, #30, #31, #32, #33, #34, #35.
4. Chevalley classification and rational/relative \(F\)-group structure:
   #36, #37, #38, #39.

Lean execution for these issues follows `AGENTS.md`: use the `lean4` skill and
Archon/Lean LSP MCP for local diagnostics and proof-state checks. Full project
builds are checkpoint/CI-style validation only when explicitly requested.
