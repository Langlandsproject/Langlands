# TODO — Knowledge-Base Roadmap

The current working surface is **Bruhat–Tits theory** for the
`buildings_and_parahorics` topic (theme codes BT1–BT4 in
[topics/algebraic-groups.md](topics/algebraic-groups.md)). The knowledge
base comes first; Lean formalization follows the admitted nodes.

Method for every goal (see `AGENTS.md`):

1. blueprint nodes in `docs/knowledge/nodes/buildings_and_parahorics/`;
2. bind sources (`source:` spans against the registered reference ids);
3. `tools.knowledge.check` reports 0 errors;
4. only then GitHub issues / Lean work.

A goal is sized for one or two focused sessions. Do them in order unless
noted; each goal leaves the DAG consistent and publishable.

## Reference layer — done 2026-07-28

- [x] Register the Bruhat–Tits articles with precise journal data and
      the Kaletha–Prasad monograph in `docs/knowledge/mdblueprint.yml`:
      `bruhat-tits-groupes-reductifs-i` (IHÉS 41, 1972),
      `bruhat-tits-groupes-reductifs-ii` (IHÉS 60, 1984),
      `kaletha-prasad-bruhat-tits` (Cambridge NMM 44, 2023).
- [x] Record the citations and the chapter structure of Kaletha–Prasad
      in
      [knowledge/references/bruhat-tits-sources.md](knowledge/references/bruhat-tits-sources.md).

## G1 — Affine root systems and affine Weyl groups (BT1)

Sources: KP Ch. 1 §1.3; Bourbaki *Groupes et algèbres de Lie* VI.

- [ ] Upgrade `affine_root_systems`, `affine_weyl_groups`,
      `coxeter_complexes` from topic stubs to definition-complete nodes
      (affine roots, gradients, alcoves, extended affine Weyl group).
- [ ] New node: alcoves and the fundamental alcove (walls, vertices,
      local Dynkin diagram).
- [ ] `uses:` edges into `root_data_and_duality`
      (`weyl_group_coxeter_structure`, `coxeter_systems_and_bruhat_order`,
      `classification_of_root_systems`).

## G2 — Tits systems and spherical buildings (TB layer)

Sources: KP Ch. 1 §1.4–1.5; BT I §2.

- [ ] Complete `bn_pairs_and_tits_systems` (axioms, Bruhat
      decomposition from a BN-pair, parabolic subgroups from subsets of
      simple reflections).
- [ ] Complete `spherical_buildings` and `tits_buildings` (abstract
      buildings, apartments, the spherical building of a reductive
      group); connect to `root_data_and_duality.bruhat_decomposition`.

## G3 — Valued root data and the apartment (BT2, part 1)

Sources: BT I §6; KP Ch. 4 §4.1, Ch. 6.

- [ ] Complete `valued_root_data`: valuation of the root datum of a
      reductive group over a discretely valued field; the affine space
      A(G,S); equipollence classes.
- [ ] New node: root group filtrations \(U_{a,r}\) and the affine root
      system of a quasi-split group.
- [ ] New node: axiomatization of Bruhat–Tits theory (the KP §4.1
      axiom list), as the interface later nodes depend on.
- [ ] Complete `bruhat_tits_apartments`; affine Weyl group action;
      uniqueness of the apartment (KP §4.4).
- [ ] Complete `reductive_groups_over_local_fields` as the topic-level
      entry point (Henselian and complete discretely valued cases).

## G4 — The building, parahorics, decompositions (BT2/BT3)

Sources: BT I §7; KP Ch. 5, Ch. 7.

- [ ] Complete `bruhat_tits_buildings` (construction from the valued
      root datum, metric, CAT(0) statement as external-theorem) and
      `facets_in_bruhat_tits_buildings` (facets, chambers, special
      points; hyperspecial to be added in G6).
- [ ] Complete `parahoric_subgroups`; new nodes: Iwahori subgroups and
      the Iwahori–Tits system; the Iwahori–Weyl group.
- [ ] New nodes: affine Bruhat decomposition; Cartan decomposition;
      Iwasawa decomposition (KP Ch. 5).

## G5 — Integral models and parahoric group schemes (BT3)

Sources: BT II; KP Ch. 2 §2.10, Ch. 8, App. A–B.

- [ ] Complete `smooth_affine_group_schemes_over_valuation_rings`
      (smooth models, dilatation/smoothening as constructions,
      Néron models of tori as external input).
- [ ] Complete `parahoric_group_schemes` (the BT/KP construction;
      connected stabilizer description via the Kottwitz homomorphism,
      linking `kottwitz_structures` — KP Ch. 11).
- [ ] Complete `reductive_quotients_of_parahoric_group_schemes`
      (special fiber structure, KP §8.4).

## G6 — Descent (BT2/BT3 closure)

Sources: BT II §5; KP Ch. 9, Ch. 12.

- [ ] New node: unramified descent — the building over k from the
      building over the maximal unramified extension; existence of
      valued root data for all (not just quasi-split) groups.
- [ ] New node: special, superspecial, and hyperspecial points;
      residually split and residually quasi-split groups (KP §9.9–9.10).
- [ ] New node: tamely ramified descent and fixed-point buildings
      (KP Ch. 12), marked optional if time is short.
- [ ] `uses:` edges into `descent_and_forms` (Galois descent,
      cohomology) rather than restating descent theory locally.

## G7 — Moy–Prasad filtrations and first applications (BT4)

Sources: KP Ch. 13; Ch. 16–17 optional.

- [ ] Complete `moy_prasad_filtrations` (filtrations of tori, parahoric
      subgroups, Lie algebra; the Moy–Prasad isomorphism; depth).
- [ ] Optional stretch: classification of maximal unramified tori
      (KP Ch. 16, d'après DeBacker) as external-theorem nodes.

## G8 — Lean linkage (after G1–G2 are admitted)

- [ ] Mathlib survey per AGENTS.md step 1 (Coxeter groups exist in
      Mathlib; check affine root systems / buildings coverage — expect
      genuine gaps to record as issues, not blockers).
- [ ] Issue-per-node for G1–G2 nodes; fill `lean:` fields and
      `verification.alignment` as implementations land.

## Standing hygiene

- [ ] Keep `tools.knowledge.check` at 0 errors before every commit
      (the 2026-07-28 merge repaired 71 errors introduced by a remote
      batch; do not let cloud sessions land unchecked).
- [ ] Re-publish the site (`scripts/publish_md.py`) after each goal so
      the graph JSONs track the node set.
