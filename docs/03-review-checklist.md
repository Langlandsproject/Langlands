# Pre-Commit Review Checklist

Why this exists (2026-08-19 retrospective): one working day produced
seven owner-caught defect classes — adjective-named objects,
computed forms as definitions (twice), a "group" without a group
structure, smoke-test piles, a module in the wrong topic directory,
silently ignored Blueprint markers, and Mathlib naming violations.
Every one had a rule; several rules were written *the same day* and
violated hours later. The failure mode is not ignorance but
**generation-order bias**: code gets produced along the path of least
resistance (whatever Mathlib/the context makes cheap), and prose
rules far back in context do not fire at the moment of writing. A
checklist converts prose into procedure: it runs AFTER generation,
when violations are visible.

**Rule: no commit that touches KB nodes or Lean code without walking
this list.** For definition-layer commits (new public defs), also
show the statements to the owner before the proof pass.

## 0. Scope check
- [ ] Re-read the sections of `docs/01-design-conventions.md`
      relevant to what you touched (§2 topics, §3 ids, §4 linking,
      §6 faithfulness, §8 naming).

## 1. Faithfulness (conventions §6)
- [ ] Every new Lean definition transcribes the definiens of its KB
      node. Computed/equivalent forms are theorems.
- [ ] Every identification used by a definition has a KB node
      (bridge-node rule). Missing bridge = stop, add the node first.
- [ ] Every wrapper in a public statement has a conversion-glossary
      entry in the module docstring.

## 2. Naming (conventions §8)
- [ ] Types/type formers/predicates UpperCamel; data terms
      lowerCamel; theorems snake_case named by conclusion
      (head symbol first; `_eq_top`/`_iff_`/`_of_`/`_apply`/`foo_one`
      patterns; no typeclass hypotheses in names).
- [ ] No ad-hoc abbreviations; no abbrevs hiding honest types.
- [ ] As short as clarity allows; every name component carries
      meaning; no qualifier mashes.
- [ ] Grammatical number: classes plural, concepts/objects singular.

## 3. Placement & linking (conventions §2, §4)
- [ ] Every Lean file sits in the directory of the topic its KB
      node(s) belong to; general lemmas go with their mathematical
      home, applications with their object.
- [ ] `Blueprint:` markers START a docstring line (mid-line markers
      are silently ignored) and match the nodes' `lean.declarations`
      exactly. New public defs carry a marker or an explicit
      "deliberately unmarked" note.
- [ ] Definition nodes are never linked to special-case or
      computed-form witnesses.

## 4. Statements vs proofs
- [ ] Statement-first work: `sorry` only as a proof placeholder, one
      per statement, each tagged with its proof-pass milestone;
      never a sorry'd instance or sorry'd data used downstream.
- [ ] Statements that cannot even be formed yet get a `BLOCKED`
      comment at the definition site, not a weakened fake statement.
- [ ] No smoke-test sections; examples in `Examples`.

## 5. Gates (all three, every time)
- [ ] `tools.knowledge.check` — 0 errors.
- [ ] `tools.knowledge.lean_reverse_check` — 0 cross-mismatch, and
      READ the new warnings (the sorry-tracker and md-only lines
      carry information).
- [ ] `lake build` — green; sorry count changed only as intended.
- [ ] Site republished if KB changed; pushed to origin/main.

## What documentation cannot fix
Generation-order bias is intrinsic to how code gets produced; this
list is the countermeasure because it runs post-generation.
Independent review (owner, or a second model with
`docs/superpowers/prompts/kb-formalization-plan-review.md`) remains
the strongest gate — mandatory for definition-layer commits,
optional elsewhere. Where a rule is mechanically checkable, prefer a
linter to a checklist line: pending tooling items are tracked in
`docs/TODO.md` (Standing hygiene).
