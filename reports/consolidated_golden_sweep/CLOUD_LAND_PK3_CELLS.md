# Cloud agent brief: land PolyKode x3 per-script cells

Goal: produce a commit-able `pk3_cells.jsonl` (one line per script x engine)
so Golden_SAS can re-join true per-row `pk_java` / `pk_c` / `pk_python` statuses.
Do **not** commit full logs or per-cell directories (too large).

## Why

The prior Ubuntu sweep finished 22,716 cells but only published
`unix/tests/golden_sweep/artifacts/summary.json`. Per-cell JSON under
`/workspace/golden_sweep/results/` was never pushed. PR-F CSV therefore
has `pk_java`/`pk_c` = `not_available` for every row.

## Required output (single file)

Path (commit this):
`unix/tests/golden_sweep/artifacts/pk3_cells.jsonl`

One JSON object per line, fields only:

```json
{"script_rel_path":"sources/.../file.sas","engine":"pk_java","status":"ok","elapsed_ms":123,"error_class":"","error_message":""}
```

Engines required: `pk_python`, `pk_java`, `pk_c`.
Expected lines: ~22,716 (7572 scripts x 3). Dedup by `(script_rel_path, engine)` last-wins.

## How

1. Checkout `main` (or branch from `cursor/pr-e-golden-sas-full-sweep-a785` harness).
2. Ensure `sasc`, `sasc-c`, and `sasc-j` run (same as prior cloud install).
3. Set `POLYKODE_GOLDEN_SAS_ROOT` to the Golden_SAS corpus clone.
4. Re-run PolyKode-only sweep (skip sas94/viya) with resume if a prior
   `/workspace/golden_sweep` still exists on this VM.
5. Emit `pk3_cells.jsonl` by scanning result cells / checkpoint — strip
   stdout/stderr/log bodies; keep status + error class/message + elapsed_ms.
6. Commit + push the jsonl on a branch `chore/pk3-cells-jsonl` and open a PR
   into `meharpsingh/polykode-sasc` `main`.
7. Also copy/upload the same file into
   `meharpsingh/Golden_SAS` at
   `reports/consolidated_golden_sweep/pk3_cells.jsonl` (or leave a note
   so the Windows agent can `git show` it).

## Non-goals

- Do not re-run SAS 9.4 or Viya.
- Do not invent statuses.
- Do not commit `results/**` trees or raw logs.
