# PR-E Golden_SAS sweep report (PolyKode ×3, Ubuntu cloud)

- Generated: 2026-09-05T22:53:39.280455+00:00
- Corpus: `Total scripts: **7572**` (discovered via POLYKODE_GOLDEN_SAS_ROOT)
- Compiler: branch=`main` commit=`c65fc26c1d5213473b494dc41ab37f9e73175cd8` date=`2026-09-05T15:05:57-07:00`
- Harness: `test/golden-sas-full-sweep` @ `2c425c4c3838ef930b8e2852b9d66512991f53cb`
- Wall clock: `done cells=22716 wall_s=1101.1`
- OS: Ubuntu 24.04 (brief asked 22.04; recorded warning)
- Engines not_available: `sas94` (SAS Foundation absent on this VM; SAS Local runs separately)

## Bucket counts (raw)

### `pk_python` (7572 cells)

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

### `pk_java` (7572 cells)

- `ok`: 7132
- `lex_error`: 251
- `runtime_error`: 189

### `pk_c` (7572 cells)

- `ok`: 7179
- `lex_error`: 259
- `runtime_error`: 115
- `timeout`: 19

## Artifacts

- `unix/tests/golden_sweep/artifacts/summary.json`
- `unix/tests/golden_sweep/artifacts/error_taxonomy.md`
- `unix/tests/golden_sweep/artifacts/feature_coverage.md`
- `unix/tests/golden_sweep/artifacts/divergence_report_head.md` (truncated)
- `unix/tests/golden_sweep/artifacts/inventory_summary.md`
- `unix/tests/golden_sweep/artifacts/compiler_version.json`
- `unix/tests/golden_sweep/artifacts/engine_cli.json`

Per-cell JSON lives on the agent VM under `/workspace/golden_sweep/results/` (not committed).
