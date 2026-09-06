# Cloud agent brief: land PolyKode x3 per-script cells

**Open this agent on `meharpsingh/polykode-sasc` (not Golden_SAS).**
A prior cloud attempt on Golden_SAS failed: no sasc compilers and
polykode-sasc was not in that environment.

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

1. Confirm `git remote -v` shows `meharpsingh/polykode-sasc`. If not, stop.
2. Checkout `main` (harness reference: `cursor/pr-e-golden-sas-full-sweep-a785`).
3. Run `.cursor/install.sh` so `sasc`, `sasc-c`, and `sasc-j` work.
4. Clone Golden_SAS; set `POLYKODE_GOLDEN_SAS_ROOT` to that clone.
5. Re-run PolyKode-only sweep (skip sas94/viya); resume if
   `/workspace/golden_sweep` still exists on this VM.
6. Emit `pk3_cells.jsonl` by scanning result cells / checkpoint — strip
   stdout/stderr/log bodies; keep status + error class/message + elapsed_ms.
7. Branch `chore/pk3-cells-jsonl`, commit ONLY the jsonl, push, open PR to main.
8. Optional: also place the file on Golden_SAS at
   `reports/consolidated_golden_sweep/pk3_cells.jsonl`.

## After the PR lands (Windows agent)

```powershell
cd C:\Users\Admin\Projects\Golden_SAS
git -C ..\polykode-sasc-integrate fetch origin
# adjust branch/ref once PR merges
git -C ..\polykode-sasc-integrate show origin/chore/pk3-cells-jsonl:unix/tests/golden_sweep/artifacts/pk3_cells.jsonl > reports/consolidated_golden_sweep/pk3_cells.jsonl
python scripts/consolidate_engine_reports.py `
  --sas94-csv "_sas_runs/golden_sweep/report/results.csv" `
  --prf-csv "_sas_runs/consolidate_src/prf_results.csv" `
  --pk3-summary "_sas_runs/consolidate_src/pk3_summary.json" `
  --pk3-cells "reports/consolidated_golden_sweep/pk3_cells.jsonl" `
  --out-dir "reports/consolidated_golden_sweep"
```

## Non-goals

- Do not re-run SAS 9.4 or Viya.
- Do not invent statuses.
- Do not commit `results/**` trees or raw logs.
