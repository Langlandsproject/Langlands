# Publishing the Knowledge Site

Use `scripts/publish_md.py` as the standard publishing entry point.

```bash
python3 scripts/publish_md.py
```

The default command:

- checks `docs/knowledge` with mdblueprint;
- builds a temporary static site;
- verifies the generated graph artifacts;
- runs browser render checks on representative pages;
- syncs the result to `~/mydoc/jiajunma.github.io/Langlands`.

It does not commit or push by default. To publish to GitHub Pages:

```bash
python3 scripts/publish_md.py --commit-pages --push-pages
```

Useful options:

```bash
python3 scripts/publish_md.py --skip-render-check
python3 scripts/publish_md.py --render-page index.html --render-page dep_graph_document.html
python3 scripts/publish_md.py --build-dir /tmp/langlands-mdblueprint-site
```

Environment variables:

- `MDBLUEPRINT_ROOT`: path to the local mdblueprint checkout.
- `PAGES_ROOT`: path to the local `jiajunma.github.io` checkout.

The script deliberately stages only the `Langlands` subdirectory in the Pages
repository, so unrelated files in that checkout are left alone.
