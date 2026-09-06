"""Consolidate golden_sweep engine reports into one CSV + markdown pack.

Joins on script path:
  - local SAS 9.4 results.csv (sas94__)
  - PR-F results.csv (pk_python / pk_java / pk_c / viya)
  - PolyKode×3 cloud summary.json (engine-level buckets for pk_java/pk_c
    when per-script cells were not published)

No engine re-execution.
"""
from __future__ import annotations

import argparse
import csv
import json
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path


SUCCESS = {
    "ok",
    "ok_no_error",
    "ok_result_only",
}
ABSENT = {
    "not_available",
    "",
    None,
}


def _coarse(status: str | None) -> str:
    if status in ABSENT or status is None:
        return "absent"
    if status in SUCCESS:
        return "success"
    return "fail"


def _load_csv(path: Path) -> list[dict[str, str]]:
    with path.open(encoding="utf-8-sig", newline="") as fh:
        return list(csv.DictReader(fh))


def _index_by(rows: list[dict[str, str]], key: str) -> dict[str, dict[str, str]]:
    out: dict[str, dict[str, str]] = {}
    for row in rows:
        k = (row.get(key) or "").replace("\\", "/")
        if k:
            out[k] = row
    return out


def _load_pk3_cells(path: Path | None) -> dict[tuple[str, str], dict]:
    """Map (script_rel_path, engine) -> cell dict. Last line wins."""
    out: dict[tuple[str, str], dict] = {}
    if path is None or not path.is_file():
        return out
    with path.open(encoding="utf-8-sig") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            obj = json.loads(line)
            if not isinstance(obj, dict):
                continue
            rel = str(obj.get("script_rel_path") or "").replace("\\", "/")
            eng = str(obj.get("engine") or "")
            if rel and eng:
                out[(rel, eng)] = obj
    return out


def consolidate(
    *,
    sas94_csv: Path,
    prf_csv: Path,
    pk3_summary: Path,
    out_dir: Path,
    sources: dict,
    pk3_cells: Path | None = None,
) -> dict:
    out_dir.mkdir(parents=True, exist_ok=True)
    sas_rows = _load_csv(sas94_csv)
    prf_rows = _load_csv(prf_csv)
    pk3 = json.loads(pk3_summary.read_text(encoding="utf-8-sig"))
    cells = _load_pk3_cells(pk3_cells)

    by_sas = _index_by(sas_rows, "script")
    by_prf = _index_by(prf_rows, "script_rel_path")
    all_scripts = sorted(set(by_sas) | set(by_prf) | {k[0] for k in cells})

    engines = ["sas94", "pk_python", "pk_java", "pk_c", "viya"]
    fieldnames = [
        "script",
        "source_repo",
        "sha256",
        "bytes",
        "lines",
        "features",
        "sas94_status",
        "sas94_elapsed_ms",
        "sas94_error_class",
        "sas94_error_message",
        "pk_python_status",
        "pk_python_elapsed_ms",
        "pk_python_error_class",
        "pk_python_error_message",
        "pk_java_status",
        "pk_java_elapsed_ms",
        "pk_java_error_class",
        "pk_java_error_message",
        "pk_java_cell_source",
        "pk_c_status",
        "pk_c_elapsed_ms",
        "pk_c_error_class",
        "pk_c_error_message",
        "pk_c_cell_source",
        "viya_status",
        "viya_elapsed_ms",
        "viya_error_class",
        "viya_error_message",
        "sas94_coarse",
        "pk_python_coarse",
        "pk_java_coarse",
        "pk_c_coarse",
        "viya_coarse",
        "available_engines",
        "all_available_engines_agree",
        "per_engine_vs_sas94_agree",
        "first_divergence",
        "reference_engine",
    ]

    out_rows: list[dict[str, str]] = []
    bucket: dict[str, Counter[str]] = {e: Counter() for e in engines}
    agree_counts = Counter()
    first_div = Counter()

    for script in all_scripts:
        s = by_sas.get(script, {})
        p = by_prf.get(script, {})

        # Prefer local inventory metadata, else PR-F.
        source_repo = s.get("source_repo") or ""
        if not source_repo and script.startswith("sources/"):
            parts = script.split("/")
            source_repo = parts[1] if len(parts) > 1 else ""

        row: dict[str, str] = {
            "script": script,
            "source_repo": source_repo,
            "sha256": s.get("sha256") or p.get("sha256") or "",
            "bytes": s.get("bytes") or p.get("size_bytes") or "",
            "lines": s.get("lines") or "",
            "features": s.get("features") or p.get("features_touched") or "",
            "sas94_status": s.get("sas94__status") or "",
            "sas94_elapsed_ms": s.get("sas94__elapsed_ms") or "",
            "sas94_error_class": s.get("sas94__error_class") or "",
            "sas94_error_message": s.get("sas94__error_message") or "",
            "pk_python_status": p.get("pk_python_status") or "",
            "pk_python_elapsed_ms": p.get("pk_python_elapsed_ms") or "",
            "pk_python_error_class": p.get("pk_python_error_class") or "",
            "pk_python_error_message": p.get("pk_python_error_message") or "",
            "pk_java_status": p.get("pk_java_status") or "",
            "pk_java_elapsed_ms": p.get("pk_java_elapsed_ms") or "",
            "pk_java_error_class": p.get("pk_java_error_class") or "",
            "pk_java_error_message": p.get("pk_java_error_message") or "",
            "pk_java_cell_source": "prf_results.csv" if p else "",
            "pk_c_status": p.get("pk_c_status") or "",
            "pk_c_elapsed_ms": p.get("pk_c_elapsed_ms") or "",
            "pk_c_error_class": p.get("pk_c_error_class") or "",
            "pk_c_error_message": p.get("pk_c_error_message") or "",
            "pk_c_cell_source": "prf_results.csv" if p else "",
            "viya_status": p.get("viya_status") or "",
            "viya_elapsed_ms": p.get("viya_elapsed_ms") or "",
            "viya_error_class": p.get("viya_error_class") or "",
            "viya_error_message": p.get("viya_error_message") or "",
            "reference_engine": "sas94",
        }

        # Override PolyKode backends from pk3_cells.jsonl when present.
        for eng, src_label in (
            ("pk_python", "pk3_cells.jsonl"),
            ("pk_java", "pk3_cells.jsonl"),
            ("pk_c", "pk3_cells.jsonl"),
        ):
            cell = cells.get((script, eng))
            if not cell:
                continue
            row[f"{eng}_status"] = str(cell.get("status") or "")
            row[f"{eng}_elapsed_ms"] = str(cell.get("elapsed_ms") or "")
            row[f"{eng}_error_class"] = str(cell.get("error_class") or "")
            row[f"{eng}_error_message"] = str(cell.get("error_message") or "")
            row[f"{eng}_cell_source"] = src_label

        statuses = {
            "sas94": row["sas94_status"],
            "pk_python": row["pk_python_status"],
            "pk_java": row["pk_java_status"],
            "pk_c": row["pk_c_status"],
            "viya": row["viya_status"],
        }
        for eng, st in statuses.items():
            if st:
                bucket[eng][st] += 1
            row[f"{eng}_coarse"] = _coarse(st or None)

        available = [e for e, st in statuses.items() if _coarse(st or None) != "absent"]
        row["available_engines"] = "|".join(available)

        present_coarse = [row[f"{e}_coarse"] for e in available]
        if len(present_coarse) <= 1:
            all_agree = "true"
        else:
            all_agree = "true" if len(set(present_coarse)) == 1 else "false"
        row["all_available_engines_agree"] = all_agree
        agree_counts[all_agree] += 1

        ref_c = row["sas94_coarse"]
        pairs = []
        first = ""
        for eng in ["pk_python", "pk_java", "pk_c", "viya"]:
            c = row[f"{eng}_coarse"]
            if c == "absent" or ref_c == "absent":
                pairs.append(f"{eng}=n/a")
                continue
            ok = c == ref_c
            pairs.append(f"{eng}={'true' if ok else 'false'}")
            if not ok and not first:
                first = eng
        row["per_engine_vs_sas94_agree"] = "|".join(pairs)
        row["first_divergence"] = first
        if first:
            first_div[first] += 1

        out_rows.append(row)

    csv_path = out_dir / "consolidated_results.csv"
    with csv_path.open("w", encoding="utf-8", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=fieldnames)
        w.writeheader()
        w.writerows(out_rows)

    # Markdown pack
    md_path = out_dir / "CONSOLIDATED_REPORT.md"
    lines = [
        "# Consolidated Golden_SAS compiler report",
        "",
        f"- generated_utc: `{datetime.now(timezone.utc).isoformat()}`",
        f"- scripts_union: **{len(out_rows)}**",
        f"- reference_engine: `sas94`",
        "- engines: `sas94`, `pk_python`, `pk_java`, `pk_c`, `viya`",
        "",
        "## Sources",
        "",
    ]
    for name, meta in sources.items():
        lines.append(f"- **{name}**: {meta}")
    lines += [
        "",
        "## Coverage note (pk_java / pk_c per-script)",
        "",
        "PR-F `results.csv` marks every `pk_java` and `pk_c` cell `not_available`",
        "(sasc CLI on that run had no `--backend`). A separate Ubuntu cloud",
        "PolyKode x3 sweep **did** run all three backends (7572 scripts each) but",
        "only landed aggregate `summary.json` - per-cell JSONs were not committed.",
        "Those aggregates are reproduced below; CSV columns for java/c therefore",
        "remain `not_available` at row level.",
        "",
        "## Per-engine status counts (joined CSV)",
        "",
    ]
    for eng in engines:
        lines.append(f"### `{eng}`")
        lines.append("")
        if not bucket[eng]:
            lines.append("- (no cells)")
        else:
            for st, n in bucket[eng].most_common():
                lines.append(f"- `{st}`: {n}")
        lines.append("")

    lines += [
        "## PolyKode x3 cloud aggregates (per-script cells not published)",
        "",
        f"- n_scripts: {pk3.get('n_scripts')}",
        f"- n_cells: {pk3.get('n_cells')}",
        f"- engines: {', '.join(pk3.get('engines') or [])}",
        "",
    ]
    for eng, counts in (pk3.get("bucket_counts") or {}).items():
        lines.append(f"### cloud `{eng}`")
        lines.append("")
        for st, n in sorted(counts.items(), key=lambda kv: (-kv[1], kv[0])):
            lines.append(f"- `{st}`: {n}")
        lines.append("")

    lines += [
        "## Agreement vs sas94 (coarse: success / fail / absent)",
        "",
        f"- all_available_engines_agree=true: {agree_counts.get('true', 0)}",
        f"- all_available_engines_agree=false: {agree_counts.get('false', 0)}",
        "",
        "### first_divergence",
        "",
    ]
    if first_div:
        for eng, n in first_div.most_common():
            lines.append(f"- `{eng}`: {n}")
    else:
        lines.append("- (none)")
    lines += [
        "",
        "## Artifacts",
        "",
        f"- `{csv_path.name}`",
        f"- `{md_path.name}`",
        "- `engine_sources.json`",
        "- `bucket_counts.json`",
        "",
    ]
    md_path.write_text("\n".join(lines), encoding="utf-8")

    summary = {
        "scripts_union": len(out_rows),
        "overlap_sas94_and_prf": len(set(by_sas) & set(by_prf)),
        "only_sas94": len(set(by_sas) - set(by_prf)),
        "only_prf": len(set(by_prf) - set(by_sas)),
        "agree_counts": dict(agree_counts),
        "first_divergence": dict(first_div),
        "bucket_counts": {e: dict(c) for e, c in bucket.items()},
        "pk3_cloud_aggregates": pk3.get("bucket_counts"),
        "artifacts": {
            "consolidated_results.csv": str(csv_path),
            "CONSOLIDATED_REPORT.md": str(md_path),
        },
    }
    (out_dir / "engine_sources.json").write_text(
        json.dumps(sources, indent=2) + "\n", encoding="utf-8"
    )
    (out_dir / "bucket_counts.json").write_text(
        json.dumps(summary, indent=2) + "\n", encoding="utf-8"
    )
    return summary


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--sas94-csv", required=True)
    ap.add_argument("--prf-csv", required=True)
    ap.add_argument("--pk3-summary", required=True)
    ap.add_argument(
        "--pk3-cells",
        default="",
        help="Optional pk3_cells.jsonl with per-script pk_python/pk_java/pk_c rows",
    )
    ap.add_argument("--out-dir", required=True)
    args = ap.parse_args(argv)

    sources = {
        "sas94": f"local file {args.sas94_csv} (RunAsDate 2013-08-30 Windows SAS 9.4)",
        "pk_python_viya_java_c_cells": (
            f"polykode-sasc origin/main unix/tests/golden_sweep/report/results.csv "
            f"exported to {args.prf_csv}"
        ),
        "pk_java_pk_c_cloud_aggregates": (
            f"polykode-sasc origin/cursor/pr-e-golden-sas-full-sweep-a785 "
            f"unix/tests/golden_sweep/artifacts/summary.json -> {args.pk3_summary}"
        ),
    }
    pk3_cells = Path(args.pk3_cells) if args.pk3_cells else None
    if pk3_cells and pk3_cells.is_file():
        sources["pk3_per_script_cells"] = str(pk3_cells)
    summary = consolidate(
        sas94_csv=Path(args.sas94_csv),
        prf_csv=Path(args.prf_csv),
        pk3_summary=Path(args.pk3_summary),
        out_dir=Path(args.out_dir),
        sources=sources,
        pk3_cells=pk3_cells,
    )
    print(json.dumps(summary, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
