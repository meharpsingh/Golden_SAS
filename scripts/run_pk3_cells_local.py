"""Emit pk3_cells.jsonl by running local pk_python / pk_java / pk_c (no sas94/viya).

Resume-safe via checkpoint jsonl. Status classification is coarse from
returncode + stderr/stdout tails (not the full golden_sweep classifier).
"""
from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path


def _load_inventory(path: Path) -> list[dict]:
    rows = []
    with path.open(encoding="utf-8") as fh:
        for line in fh:
            line = line.strip()
            if line:
                rows.append(json.loads(line))
    return rows


def _done(checkpoint: Path) -> set[tuple[str, str]]:
    done: set[tuple[str, str]] = set()
    if not checkpoint.is_file():
        return done
    with checkpoint.open(encoding="utf-8") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            try:
                obj = json.loads(line)
            except json.JSONDecodeError:
                continue
            if isinstance(obj, dict):
                done.add((obj.get("script_rel_path", ""), obj.get("engine", "")))
    return done


def _classify(rc: int | None, out: str, err: str, timed_out: bool) -> tuple[str, str, str]:
    if timed_out or rc is None:
        return "timeout", "Timeout", "harness timeout"
    blob = (out or "") + "\n" + (err or "")
    low = blob.lower()
    msg = ""
    for line in blob.splitlines():
        if "error" in line.lower() or "traceback" in line.lower() or "ParseError" in line:
            msg = line.strip()[:400]
            break
    if rc == 0 and "error" not in low and "traceback" not in low:
        return "ok", "", ""
    if "parseerror" in low or "syntax" in low:
        return "parse_error", "ParseError", msg
    if "not implemented" in low:
        return "not_implemented", "NotImplemented", msg
    if "unicode" in low or "codec" in low:
        return "encoding_error", "EncodingError", msg
    if rc != 0:
        return "runtime_error", "RuntimeError", msg or f"rc={rc}"
    return "soft_fail", "SoftFail", msg or "rc0_with_error_text"


def _run_cmd(argv: list[str], timeout_s: int) -> tuple[int | None, str, str, bool, int]:
    t0 = time.perf_counter()
    try:
        p = subprocess.run(
            argv,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=timeout_s,
        )
        ms = int((time.perf_counter() - t0) * 1000)
        return p.returncode, p.stdout[-4000:], p.stderr[-4000:], False, ms
    except subprocess.TimeoutExpired as exc:
        ms = int((time.perf_counter() - t0) * 1000)
        out = (exc.stdout or b"") if isinstance(exc.stdout, (bytes, bytearray)) else (exc.stdout or "")
        err = (exc.stderr or b"") if isinstance(exc.stderr, (bytes, bytearray)) else (exc.stderr or "")
        if isinstance(out, (bytes, bytearray)):
            out = out.decode("utf-8", errors="replace")
        if isinstance(err, (bytes, bytearray)):
            err = err.decode("utf-8", errors="replace")
        return None, str(out)[-4000:], str(err)[-4000:], True, ms


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--golden-root", default=os.environ.get("POLYKODE_GOLDEN_SAS_ROOT", ""))
    ap.add_argument("--inventory", required=True)
    ap.add_argument("--poly-root", required=True, help="polykode-sasc checkout with built unix/")
    ap.add_argument("--out-jsonl", required=True)
    ap.add_argument("--checkpoint", required=True)
    ap.add_argument("--parallel", type=int, default=4)
    ap.add_argument("--timeout-s", type=int, default=30)
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--engines", default="pk_python,pk_java,pk_c")
    args = ap.parse_args(argv)

    golden = Path(args.golden_root)
    poly = Path(args.poly_root)
    if not golden.is_dir():
        print("golden-root missing", file=sys.stderr)
        return 2

    sasc_c = poly / "unix" / "c" / "build" / "sasc-c.exe"
    if not sasc_c.is_file():
        sasc_c = poly / "unix" / "c" / "build" / "sasc-c"
    java_cp = poly / "unix" / "java" / "build" / "classes"
    py = sys.executable

    engine_cmds = {
        "pk_python": lambda script: [py, "-m", "sasc", "run", str(script)],
        "pk_c": lambda script: [str(sasc_c), "run", str(script)],
        "pk_java": lambda script: [
            "java",
            "-cp",
            str(java_cp),
            "com.polykode.sasc.cli.Main",
            "run",
            str(script),
        ],
    }
    engines = [e.strip() for e in args.engines.split(",") if e.strip()]
    for e in engines:
        if e not in engine_cmds:
            print(f"unknown engine {e}", file=sys.stderr)
            return 2
    if "pk_c" in engines and not sasc_c.is_file():
        print(f"missing {sasc_c}", file=sys.stderr)
        return 2
    if "pk_java" in engines and not java_cp.is_dir():
        print(f"missing {java_cp}", file=sys.stderr)
        return 2

    inventory = _load_inventory(Path(args.inventory))
    if args.limit > 0:
        inventory = inventory[: args.limit]

    checkpoint = Path(args.checkpoint)
    out_jsonl = Path(args.out_jsonl)
    checkpoint.parent.mkdir(parents=True, exist_ok=True)
    out_jsonl.parent.mkdir(parents=True, exist_ok=True)

    done = _done(checkpoint)
    jobs: list[tuple[str, str, Path]] = []
    for row in inventory:
        rel = row["rel_path"]
        script = golden / rel
        for eng in engines:
            if (rel, eng) in done:
                continue
            jobs.append((rel, eng, script))

    print(
        f"pk3 local export: inventory={len(inventory)} pending={len(jobs)} "
        f"done={len(done)} workers={args.parallel}",
        flush=True,
    )

    lock = threading.Lock()
    completed = 0

    def _one(job: tuple[str, str, Path]) -> dict:
        rel, eng, script = job
        if not script.is_file():
            return {
                "script_rel_path": rel,
                "engine": eng,
                "status": "harness_error",
                "elapsed_ms": 0,
                "error_class": "MissingFile",
                "error_message": str(script),
            }
        rc, out, err, timed_out, ms = _run_cmd(engine_cmds[eng](script), args.timeout_s)
        status, eclass, emsg = _classify(rc, out, err, timed_out)
        return {
            "script_rel_path": rel,
            "engine": eng,
            "status": status,
            "elapsed_ms": ms,
            "error_class": eclass,
            "error_message": emsg,
        }

    with checkpoint.open("a", encoding="utf-8") as ck, out_jsonl.open(
        "a", encoding="utf-8"
    ) as outfh:
        with ThreadPoolExecutor(max_workers=max(1, args.parallel)) as pool:
            futs = [pool.submit(_one, j) for j in jobs]
            for fut in as_completed(futs):
                cell = fut.result()
                line = json.dumps(cell, ensure_ascii=False)
                with lock:
                    ck.write(line + "\n")
                    ck.flush()
                    outfh.write(line + "\n")
                    outfh.flush()
                    completed += 1
                    if completed % 100 == 0 or completed == len(jobs):
                        msg = (
                            f"heartbeat {completed}/{len(jobs)} "
                            f"last={cell['script_rel_path']} "
                            f"{cell['engine']}={cell['status']}"
                        )
                        try:
                            print(msg, flush=True)
                        except UnicodeEncodeError:
                            print(msg.encode("ascii", "replace").decode("ascii"), flush=True)

    print(f"pk3 local export complete: wrote {completed} new cells -> {out_jsonl}", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
