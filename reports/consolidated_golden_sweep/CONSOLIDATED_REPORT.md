# Consolidated Golden_SAS compiler report

- generated_utc: `2026-09-06T20:55:52.164059+00:00`
- scripts_union: **7572**
- reference_engine: `sas94`
- engines: `sas94`, `pk_python`, `pk_java`, `pk_c`, `viya`

## Sources

- **sas94**: local file _sas_runs/golden_sweep/report/results.csv (RunAsDate 2013-08-30 Windows SAS 9.4)
- **pk_python_viya_java_c_cells**: polykode-sasc origin/main unix/tests/golden_sweep/report/results.csv exported to _sas_runs/consolidate_src/prf_results.csv
- **pk_java_pk_c_cloud_aggregates**: polykode-sasc origin/cursor/pr-e-golden-sas-full-sweep-a785 unix/tests/golden_sweep/artifacts/summary.json -> _sas_runs/consolidate_src/pk3_summary.json
- **pk3_per_script_cells**: reports\consolidated_golden_sweep\pk3_cells.jsonl

## Coverage note (pk_java / pk_c per-script)

PR-F `results.csv` marks every `pk_java` and `pk_c` cell `not_available`
(sasc CLI on that run had no `--backend`). A separate Ubuntu cloud
PolyKode x3 sweep **did** run all three backends (7572 scripts each) but
only landed aggregate `summary.json` - per-cell JSONs were not committed.
Those aggregates are reproduced below; CSV columns for java/c therefore
remain `not_available` at row level.

## Per-engine status counts (joined CSV)

### `sas94`

- `ok`: 5254
- `soft_fail`: 1098
- `runtime_error`: 322
- `parse_error`: 320
- `compile_error`: 295
- `macro_error`: 228
- `timeout`: 49
- `harness_error`: 5

### `pk_python`

- `runtime_error`: 4811
- `parse_error`: 2367
- `ok`: 296
- `encoding_error`: 79
- `soft_fail`: 13
- `not_implemented`: 3
- `timeout`: 2
- `ok_no_error`: 1

### `pk_java`

- `ok`: 7119
- `runtime_error`: 441
- `soft_fail`: 11
- `not_available`: 1

### `pk_c`

- `ok`: 7014
- `runtime_error`: 531
- `timeout`: 18
- `soft_fail`: 8
- `not_available`: 1

### `viya`

- `ok_result_only`: 6420
- `engine_reported_data_error`: 815
- `harness_encoding_error`: 307
- `harness_process_error`: 21
- `engine_error_rate_limited`: 9

## PolyKode x3 cloud aggregates (per-script cells not published)

- n_scripts: 7572
- n_cells: 22716
- engines: pk_c, pk_java, pk_python

### cloud `pk_python`

- `ok`: 4074
- `not_implemented`: 2121
- `parse_error`: 561
- `encoding_error`: 309
- `soft_fail`: 216
- `lex_error`: 146
- `timeout`: 79
- `runtime_error`: 51
- `compile_error`: 10
- `macro_error`: 5

### cloud `pk_java`

- `ok`: 7132
- `lex_error`: 251
- `runtime_error`: 189

### cloud `pk_c`

- `ok`: 7179
- `lex_error`: 259
- `runtime_error`: 115
- `timeout`: 19

## Agreement vs sas94 (coarse: success / fail / absent)

- all_available_engines_agree=true: 208
- all_available_engines_agree=false: 7364

### first_divergence

- `pk_python`: 5198
- `pk_java`: 2021
- `viya`: 131
- `pk_c`: 14

## Artifacts

- `consolidated_results.csv`
- `CONSOLIDATED_REPORT.md`
- `engine_sources.json`
- `bucket_counts.json`
