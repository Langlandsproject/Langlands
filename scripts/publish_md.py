#!/usr/bin/env python3
"""Publish the Langlands mdblueprint knowledge site.

This script is the standard publishing entry point for this repository. It
validates ``docs/knowledge``, builds the static mdblueprint site, verifies the
generated graph artifacts, syncs the result into the GitHub Pages checkout, and
optionally commits and pushes the published output.
"""

from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import sys
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Sequence


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_KNOWLEDGE_ROOT = REPO_ROOT / "docs" / "knowledge"
DEFAULT_MDBLUEPRINT_ROOT = Path(os.environ.get("MDBLUEPRINT_ROOT", "~/mycodes/mdblueprint")).expanduser()
DEFAULT_PAGES_ROOT = Path(os.environ.get("PAGES_ROOT", "~/mydoc/jiajunma.github.io")).expanduser()
DEFAULT_PAGES_SUBDIR = "Langlands"
EXPECTED_ROOT_TOPICS = {
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
}


@dataclass(frozen=True)
class Paths:
    knowledge_root: Path
    mdblueprint_root: Path
    pages_root: Path
    pages_subdir: str
    build_dir: Path

    @property
    def pages_target(self) -> Path:
        return self.pages_root / self.pages_subdir


def run(cmd: Sequence[str], *, cwd: Path, dry_run: bool = False) -> None:
    printable = " ".join(cmd)
    print(f"+ ({cwd}) {printable}")
    if dry_run:
        return
    subprocess.run(list(cmd), cwd=str(cwd), check=True)


def capture(cmd: Sequence[str], *, cwd: Path) -> str:
    return subprocess.check_output(list(cmd), cwd=str(cwd), text=True)


def ensure_paths(paths: Paths) -> None:
    if not paths.knowledge_root.exists():
        raise SystemExit(f"knowledge root not found: {paths.knowledge_root}")
    if not (paths.mdblueprint_root / "tools" / "knowledge" / "publish.py").exists():
        raise SystemExit(f"mdblueprint checkout not found or incomplete: {paths.mdblueprint_root}")
    if not (paths.pages_root / ".git").exists():
        raise SystemExit(f"GitHub Pages checkout not found: {paths.pages_root}")
    if paths.build_dir.resolve() == paths.knowledge_root.resolve():
        raise SystemExit("refusing to publish into the knowledge source directory")


def validate_source(paths: Paths, *, dry_run: bool) -> None:
    run(
        ["uv", "run", "python", "-m", "tools.knowledge.check", str(paths.knowledge_root)],
        cwd=paths.mdblueprint_root,
        dry_run=dry_run,
    )


def build_site(paths: Paths, *, dry_run: bool) -> None:
    if paths.build_dir.exists() and not dry_run:
        shutil.rmtree(paths.build_dir)
    run(
        [
            "uv",
            "run",
            "python",
            "-m",
            "tools.knowledge.publish",
            str(paths.knowledge_root),
            str(paths.build_dir),
        ],
        cwd=paths.mdblueprint_root,
        dry_run=dry_run,
    )


def verify_artifacts(paths: Paths) -> None:
    graph_path = paths.build_dir / "graph.json"
    topics_path = paths.build_dir / "graph_topics.json"
    hierarchy_path = paths.build_dir / "graph_topics_hierarchy.json"
    for path in (graph_path, topics_path, hierarchy_path, paths.build_dir / "index.html"):
        if not path.exists():
            raise SystemExit(f"published artifact missing: {path}")

    graph = json.loads(graph_path.read_text(encoding="utf-8"))
    topics = json.loads(topics_path.read_text(encoding="utf-8"))
    hierarchy = json.loads(hierarchy_path.read_text(encoding="utf-8"))

    nodes = graph.get("nodes", [])
    edges = graph.get("edges", [])
    if not nodes:
        raise SystemExit("published graph has no nodes")
    old_topic_ids = [node["id"] for node in nodes if str(node.get("id", "")).startswith("topic.")]
    if old_topic_ids:
        sample = ", ".join(old_topic_ids[:5])
        raise SystemExit(f"old topic.* node ids remain in graph.json: {sample}")
    if any(node.get("id") == "topic" for node in nodes):
        raise SystemExit("graph.json contains a synthetic 'topic' node")
    root_topics = {entry["id"] for entry in topics.get("topics", [])}
    if "topic" in root_topics or "topic" in hierarchy.get("topics", {}):
        raise SystemExit("published taxonomy still contains a 'topic' root")
    missing = EXPECTED_ROOT_TOPICS - root_topics
    extra = root_topics - EXPECTED_ROOT_TOPICS
    if missing or extra:
        raise SystemExit(
            "root topic mismatch: "
            f"missing={sorted(missing)} extra={sorted(extra)}"
        )

    print(f"verified graph artifacts: {len(nodes)} nodes, {len(edges)} edges")


def render_check(paths: Paths, pages: list[str], *, dry_run: bool) -> None:
    if not pages:
        return
    cmd = [
        "uv",
        "run",
        "--extra",
        "browser",
        "python",
        "-m",
        "tools.knowledge.render_check",
        str(paths.build_dir),
        "--timeout-ms",
        "30000",
    ]
    for page in pages:
        cmd.extend(["--page", page])
    run(cmd, cwd=paths.mdblueprint_root, dry_run=dry_run)


def sync_pages(paths: Paths, *, dry_run: bool) -> None:
    target = paths.pages_target
    if target.resolve() == paths.pages_root.resolve():
        raise SystemExit("refusing to replace the Pages repository root")
    print(f"sync {paths.build_dir} -> {target}")
    if dry_run:
        return
    if target.exists():
        shutil.rmtree(target)
    shutil.copytree(paths.build_dir, target)


def commit_and_push_pages(paths: Paths, *, message: str, push: bool, dry_run: bool) -> None:
    run(["git", "add", "-A", paths.pages_subdir], cwd=paths.pages_root, dry_run=dry_run)
    status = "" if dry_run else capture(["git", "status", "--short", "--", paths.pages_subdir], cwd=paths.pages_root)
    if status.strip():
        run(["git", "commit", "-m", message], cwd=paths.pages_root, dry_run=dry_run)
    else:
        print("no Pages changes to commit")
    if push:
        run(["git", "push", "origin", "main"], cwd=paths.pages_root, dry_run=dry_run)


def parse_args(argv: Sequence[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--knowledge-root", type=Path, default=DEFAULT_KNOWLEDGE_ROOT)
    parser.add_argument("--mdblueprint-root", type=Path, default=DEFAULT_MDBLUEPRINT_ROOT)
    parser.add_argument("--pages-root", type=Path, default=DEFAULT_PAGES_ROOT)
    parser.add_argument("--pages-subdir", default=DEFAULT_PAGES_SUBDIR)
    parser.add_argument("--build-dir", type=Path)
    parser.add_argument("--skip-render-check", action="store_true")
    parser.add_argument("--render-page", action="append", default=[])
    parser.add_argument("--commit-pages", action="store_true")
    parser.add_argument("--push-pages", action="store_true")
    parser.add_argument("--message", default="Publish Langlands knowledge site")
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    build_dir = args.build_dir
    temp_dir: tempfile.TemporaryDirectory[str] | None = None
    if build_dir is None:
        temp_dir = tempfile.TemporaryDirectory(prefix="langlands-mdblueprint-site-")
        build_dir = Path(temp_dir.name)

    paths = Paths(
        knowledge_root=args.knowledge_root.resolve(),
        mdblueprint_root=args.mdblueprint_root.resolve(),
        pages_root=args.pages_root.resolve(),
        pages_subdir=args.pages_subdir,
        build_dir=build_dir.resolve(),
    )

    try:
        ensure_paths(paths)
        validate_source(paths, dry_run=args.dry_run)
        build_site(paths, dry_run=args.dry_run)
        if not args.dry_run:
            verify_artifacts(paths)
        pages = args.render_page
        if not pages and not args.skip_render_check:
            pages = [
                "index.html",
                "dep_graph_document.html",
                "linear_algebraic_groups/index.html",
                "root_data_and_duality/root_data_and_duality_root_data.html",
            ]
        render_check(paths, pages, dry_run=args.dry_run)
        sync_pages(paths, dry_run=args.dry_run)
        if args.commit_pages or args.push_pages:
            commit_and_push_pages(
                paths,
                message=args.message,
                push=args.push_pages,
                dry_run=args.dry_run,
            )
        else:
            print("Pages synced but not committed; pass --commit-pages or --push-pages to publish via git.")
    finally:
        if temp_dir is not None:
            temp_dir.cleanup()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
