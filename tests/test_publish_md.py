from __future__ import annotations

import json
from pathlib import Path

import pytest

from scripts.publish_md import Paths, verify_artifacts


ROOT_TOPICS = [
    "foundational_inputs",
    "linear_algebraic_groups",
    "descent_and_forms",
    "reductive_structure",
    "root_data_and_duality",
    "classical_and_exceptional_groups",
    "buildings_and_parahorics",
    "kottwitz_structures",
    "nilpotent_orbits",
    "bd_covers",
]


def _paths(tmp_path: Path) -> Paths:
    site = tmp_path / "site"
    site.mkdir()
    return Paths(
        knowledge_root=tmp_path / "knowledge",
        mdblueprint_root=tmp_path / "mdblueprint",
        pages_root=tmp_path / "pages",
        pages_subdir="Langlands",
        build_dir=site,
    )


def _write_site(paths: Paths, *, node_id: str = "linear_algebraic_groups.linear_algebraic_groups") -> None:
    (paths.build_dir / "index.html").write_text("<html></html>", encoding="utf-8")
    (paths.build_dir / "graph.json").write_text(
        json.dumps({
            "nodes": [{"id": node_id, "title": "Linear Algebraic Groups", "kind": "topic", "status": "admitted"}],
            "edges": [],
        }),
        encoding="utf-8",
    )
    (paths.build_dir / "graph_topics.json").write_text(
        json.dumps({"topics": [{"id": topic} for topic in ROOT_TOPICS], "edges": []}),
        encoding="utf-8",
    )
    (paths.build_dir / "graph_topics_hierarchy.json").write_text(
        json.dumps({"roots": [{"id": topic} for topic in ROOT_TOPICS], "topics": {topic: {} for topic in ROOT_TOPICS}}),
        encoding="utf-8",
    )


def test_verify_artifacts_accepts_current_topic_kind_shape(tmp_path: Path) -> None:
    paths = _paths(tmp_path)
    _write_site(paths)

    verify_artifacts(paths)


def test_verify_artifacts_allows_definition_and_theorem_nodes(tmp_path: Path) -> None:
    paths = _paths(tmp_path)
    (paths.build_dir / "index.html").write_text("<html></html>", encoding="utf-8")
    (paths.build_dir / "graph.json").write_text(
        json.dumps({
            "nodes": [
                {"id": "linear_algebraic_groups.linear_algebraic_group_definition", "kind": "definition"},
                {"id": "linear_algebraic_groups.faithful_representation", "kind": "theorem"},
            ],
            "edges": [],
        }),
        encoding="utf-8",
    )
    (paths.build_dir / "graph_topics.json").write_text(
        json.dumps({"topics": [{"id": topic} for topic in ROOT_TOPICS], "edges": []}),
        encoding="utf-8",
    )
    (paths.build_dir / "graph_topics_hierarchy.json").write_text(
        json.dumps({"roots": [{"id": topic} for topic in ROOT_TOPICS], "topics": {topic: {} for topic in ROOT_TOPICS}}),
        encoding="utf-8",
    )

    verify_artifacts(paths)


def test_verify_artifacts_rejects_old_topic_id_prefix(tmp_path: Path) -> None:
    paths = _paths(tmp_path)
    _write_site(paths, node_id="topic.linear_algebraic_groups")

    with pytest.raises(SystemExit, match=r"topic\.\* node ids"):
        verify_artifacts(paths)
