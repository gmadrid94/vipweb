#!/usr/bin/env python3
"""Validador canónico de documentación VipWeb.

Baseline documental: 1.2.

No modifica archivos. Comprueba estructura, JSON, schemas machine-readable,
referencias internas, identidad, ausencia de nomenclatura retirada,
checksums SQL y estado operativo.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path
from typing import Any

try:
    from jsonschema import Draft202012Validator
except Exception as exc:  # noqa: BLE001
    print(json.dumps({"status": "failed", "error": f"jsonschema no disponible: {exc}"}, ensure_ascii=False, indent=2))
    raise SystemExit(1)

ROOT = Path(__file__).resolve().parents[1]
APP_ROOT = ROOT.parent
IGNORED_TOP_LEVEL_DIRS = {"canonical-baseline"}


EMITTED_CHECK_IDS = [
    "REQUIRED_PATHS_EXIST",
    "JSON_PARSE",
    "MACHINE_MANIFEST_SCHEMA_VALID",
    "MACHINE_MANIFEST_REFERENCES_EXIST",
    "MACHINE_MANIFEST_LISTED_JSON_VALIDATE",
    "SPRINT0_TASKS_SCHEMA_VALID",
    "DOCTOR_CHECK_CATALOG_COVERS_EMITTED_CHECKS",
    "DATABASE_MANIFEST_CHECKSUMS_VALID",
    "NO_RETIRED_PACKAGE_REFERENCES",
    "PROJECT_IDENTITY_VIPWEB",
    "INTERNAL_REFERENCES_EXIST",
    "PROJECT_CLEAN_ROOT_LAYOUT_DECLARED",
    "READINESS_READY_FOR_SPRINT_0",
]


def join(*parts: str) -> str:
    return "".join(parts)


FORBIDDEN_PATTERNS = [
    join("v", "18"), join("v", "19"), join("v", "20"), join("v", "3", r"\.", "6"), join("v", "3", r"\.", "6", r"\.", "12"), join("v", "3", r"\.", "5"),
    join("v", "19", "_mejorada"), join("v", "18", "_mejorada"),
    join("documentacion_fundacional_", "v", "18", "_mejorada", r"\.zip"),
    join("documentacion_fundacional_", "v", "19", "_mejorada", r"\.zip"),
    join("release", "_manifest"), join("external", "-", "release", "-manifest"), join("closure", " register"),
    join("latest", r"\.json"), join("evidence/", "latest", r"\.json"), join("evidence", "/", "latest"),
    join("latest", " evidence"), join("Evidencia", " latest"), join("EVIDENCE", "_", "LATEST"),
    join("LATEST", "_", "EVIDENCE"), join("PACKAGE", "_", "VERSION"), join("package", "_", "version"),
    join("Doctor", " documental"),
    join("salida", " vigente"), join("entrada", " histórica"), join("paquete", " anterior"), join("versión", " vigente"),
    join("release", " externa"), join("release", " antigua"), join("releases", " antiguas"),
    join("manifest", " de empaquetado"), join("v", "36"),
    join("VipWeb_Documentacion_Fundacional_Final_WAMP_", "v", "36", "_HardeningContracts"),
    join("documento", " viejo"), join("Documento", " viejo"),
    join("OLD", "_FOUNDATIONAL", "_FILE", "_REMOVED"),
    join("PATCH", "_SUMMARIES", "_ARE", "_MARKED", "_HISTORICAL", "_OR", "_CURRENT"),
    join("patch", " summaries"),
    join("scripts/", "doctor", ".py"),
    join("scripts/", "generate", "_evidence", ".py"),
    join("scripts/", "sync", "_machine", "_docs", ".py"),
    join("reporte", " Doctor"), join("reportes", " legacy"), join("roadmap", " legacy"),
]

NON_CANONICAL_IDENTITY = join("Chill", "flix")

REQUIRED_PATHS = [
    "README.md",
    "CURRENT_STATUS.md",
    "docs/00-foundation/00-project-overview.md",
    "docs/01-business/03-value-proposition.md",
    "docs/02-product/04-mvp-definition.md",
    "docs/03-functional/07-action-contracts.md",
    "docs/04-architecture/03-module-contracts.md",
    "docs/05-domain-data/00-domain-model.md",
    "docs/06-technical/05-security.md",
    "docs/07-design-ux/03-screens.md",
    "docs/09-ai-operations/08-ai-approval-policy.md",
    "docs/10-roadmap/00-roadmap-overview.md",
    "docs/11-backlog/06-sprint-0-ejecutable.md",
    "database/migrations/000_create_schema_migrations.sql",
    "database/seeds/003_seed_local_owner_template.sql",
    "machine/action_contracts.json",
    "machine/migration_contracts.json",
    "machine/schema_registry.json",
    "machine/sprint0_tasks.json",
    "evidence/sprint-0-local-execution.md",
    "scripts/update_script.py",
]

TEXT_EXTS = {".md", ".txt", ".json", ".sql", ".yaml", ".yml", ".py"}


def is_ignored_path(path: Path) -> bool:
    try:
        rel = path.relative_to(ROOT)
    except ValueError:
        return False
    return bool(rel.parts and rel.parts[0] in IGNORED_TOP_LEVEL_DIRS)


def iter_project_files(pattern: str = "*"):
    for path in sorted(ROOT.rglob(pattern)):
        if is_ignored_path(path):
            continue
        yield path


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def read_json(path: Path) -> Any:
    return json.loads(read_text(path))


def result(checks: list[dict[str, str]], check_id: str, passed: bool, detail: str) -> None:
    checks.append({"id": check_id, "status": "passed" if passed else "failed", "detail": detail})


def validate_required_paths(checks: list[dict[str, str]]) -> None:
    missing = [p for p in REQUIRED_PATHS if not (ROOT / p).exists()]
    result(checks, "REQUIRED_PATHS_EXIST", not missing, "; ".join(missing) or "Rutas obligatorias presentes.")


def validate_json(checks: list[dict[str, str]]) -> None:
    errors = []
    for path in iter_project_files("*.json"):
        try:
            read_json(path)
        except Exception as exc:  # noqa: BLE001
            errors.append(f"{path.relative_to(ROOT).as_posix()}: {exc}")
    result(checks, "JSON_PARSE", not errors, "; ".join(errors[:20]) or "Todos los JSON parsean.")


def schema_errors(data_path: str, schema_path: str) -> list[str]:
    data = read_json(ROOT / data_path)
    schema = read_json(ROOT / schema_path)
    validator = Draft202012Validator(schema)
    return [f"{list(e.path)}: {e.message}" for e in sorted(validator.iter_errors(data), key=lambda e: list(e.path))]


def validate_machine_manifest_schema(checks: list[dict[str, str]]) -> None:
    errors = schema_errors("machine/machine_manifest.json", "machine/schemas/machine-manifest.schema.json")
    result(checks, "MACHINE_MANIFEST_SCHEMA_VALID", not errors, "; ".join(errors[:20]) or "machine_manifest valida contra su schema.")


def validate_machine_manifest_refs(checks: list[dict[str, str]]) -> None:
    errors = []
    manifest = read_json(ROOT / "machine/machine_manifest.json")
    for item in manifest:
        for key in ["file", "schema", "canonical_source"]:
            value = item.get(key)
            if value and not (ROOT / value).exists():
                errors.append(f"{item.get('file')} -> {key}: {value}")
        for doc in item.get("markdown_docs", []):
            if not (ROOT / doc).exists():
                errors.append(f"{item.get('file')} -> markdown_docs: {doc}")
    result(checks, "MACHINE_MANIFEST_REFERENCES_EXIST", not errors, "; ".join(errors[:50]) or "machine_manifest referencia archivos existentes.")


def validate_machine_manifest_listed_json(checks: list[dict[str, str]]) -> None:
    errors = []
    manifest = read_json(ROOT / "machine/machine_manifest.json")
    for item in manifest:
        file_ref = item.get("file")
        schema_ref = item.get("schema")
        if not file_ref or not schema_ref:
            continue
        if not (ROOT / file_ref).exists() or not (ROOT / schema_ref).exists():
            continue
        try:
            item_errors = schema_errors(file_ref, schema_ref)
        except Exception as exc:  # noqa: BLE001
            errors.append(f"{file_ref}: {exc}")
            continue
        if item_errors:
            errors.append(f"{file_ref}: " + "; ".join(item_errors[:5]))
    result(checks, "MACHINE_MANIFEST_LISTED_JSON_VALIDATE", not errors, "; ".join(errors[:20]) or "Todos los JSON del manifest validan contra sus schemas.")


def validate_sprint0_schema(checks: list[dict[str, str]]) -> None:
    errors = schema_errors("machine/sprint0_tasks.json", "machine/schemas/sprint0-task.schema.json")
    result(checks, "SPRINT0_TASKS_SCHEMA_VALID", not errors, "; ".join(errors[:20]) or "machine/sprint0_tasks.json valida contra su schema.")


def validate_doctor_catalog_coverage(checks: list[dict[str, str]]) -> None:
    doctor_checks = read_json(ROOT / "machine/doctor_checks.json")
    known = {item.get("id") for item in doctor_checks}
    missing = [check_id for check_id in EMITTED_CHECK_IDS if check_id not in known]
    result(checks, "DOCTOR_CHECK_CATALOG_COVERS_EMITTED_CHECKS", not missing, "; ".join(missing) or "Todos los checks emitidos están catalogados.")


def validate_database_manifest_checksums(checks: list[dict[str, str]]) -> None:
    errors = []
    manifest = read_json(ROOT / "database/manifest.json")
    artifacts = manifest.get("artifacts", []) if isinstance(manifest, dict) else []
    for art in artifacts:
        path_ref = art.get("artifact_path")
        expected = art.get("checksum")
        algo = art.get("checksum_algorithm")
        if not path_ref or not expected:
            errors.append(f"artifact incompleto: {art}")
            continue
        p = ROOT / path_ref
        if not p.exists():
            errors.append(f"missing: {path_ref}")
            continue
        if algo != "sha256":
            errors.append(f"{path_ref}: algoritmo no soportado {algo}")
            continue
        actual = hashlib.sha256(p.read_bytes()).hexdigest()
        if actual != expected:
            errors.append(f"{path_ref}: {actual} != {expected}")
    result(checks, "DATABASE_MANIFEST_CHECKSUMS_VALID", not errors, "; ".join(errors[:20]) or "database/manifest.json conserva checksums válidos.")


def validate_forbidden_refs(checks: list[dict[str, str]]) -> None:
    hits = []
    compiled = [(p, re.compile(p, re.IGNORECASE)) for p in FORBIDDEN_PATTERNS]
    for path in sorted(p for p in iter_project_files("*") if p.is_file() and p.suffix.lower() in TEXT_EXTS):
        rel = path.relative_to(ROOT).as_posix()
        text = read_text(path)
        for label, pattern in compiled:
            if pattern.search(text):
                hits.append(f"{rel}: {label}")
                break
    result(checks, "NO_RETIRED_PACKAGE_REFERENCES", not hits, "; ".join(hits[:50]) or "Sin nomenclatura retirada.")


def validate_identity(checks: list[dict[str, str]]) -> None:
    hits = []
    for path in sorted(p for p in iter_project_files("*") if p.is_file() and p.suffix.lower() in TEXT_EXTS):
        rel = path.relative_to(ROOT).as_posix()
        text = read_text(path)
        if re.search(NON_CANONICAL_IDENTITY, text, re.IGNORECASE):
            hits.append(rel)
    result(checks, "PROJECT_IDENTITY_VIPWEB", not hits and "VipWeb" in read_text(ROOT / "README.md"), "; ".join(hits) or "Identidad canónica VipWeb.")


PATH_EXTS = ("md", "json", "sql", "py", "txt", "yaml", "yml")
PATH_EXT_RE = "(?:" + "|".join(PATH_EXTS) + ")"


def normalize_ref(raw: str) -> str | None:
    ref = raw.strip().strip("`'\"<>")
    ref = ref.split("#", 1)[0].split("?", 1)[0]
    ref = ref.rstrip(".,;:!?)…")
    if not ref:
        return None
    if "*" in ref or ":" in ref or "\\" in ref:
        return None
    if any(ch in ref for ch in "[]()"):
        return None
    if ref.startswith(("^", "+")):
        return None
    if ref.startswith(".") and not ref.startswith(("./", "../")):
        return None
    if ref.startswith("_"):
        return None
    lowered = ref.lower()
    if lowered.startswith(("http://", "https://", "mailto:", "urn:", "data:")):
        return None
    if ref.startswith("#") or ref.startswith("/"):
        return None
    if "{" in ref or "}" in ref:
        return None
    if not re.search(rf"\.{PATH_EXT_RE}$", ref, re.IGNORECASE):
        return None
    # Markdown links can contain anchors or labels; avoid route-like/API examples.
    if ref.startswith(("@", "$")):
        return None
    return ref


def extract_internal_refs(text: str) -> set[str]:
    candidates: set[str] = set()

    # Markdown inline links and images: [label](relative/file.md), ![alt](path.png).
    for m in re.finditer(r"!?\[[^\]]*\]\(([^)]+)\)", text, flags=re.UNICODE):
        target = m.group(1).split(None, 1)[0]
        ref = normalize_ref(target)
        if ref:
            candidates.add(ref)

    # Reference-style Markdown definitions: [id]: relative/file.md
    for m in re.finditer(r"(?m)^\s*\[[^\]]+\]:\s+(\S+)", text, flags=re.UNICODE):
        ref = normalize_ref(m.group(1))
        if ref:
            candidates.add(ref)

    # Paths between backticks, including relative paths without top-level prefix.
    for m in re.finditer(r"`([^`]+)`", text, flags=re.UNICODE):
        content = m.group(1)
        for token in re.split(r"\s+", content):
            ref = normalize_ref(token)
            if ref:
                candidates.add(ref)

    # Plain paths in prose, including Unicode filenames and prefixed/unprefixed relative paths.
    plain_pattern = rf"(?<![\w./-])((?:\.\.?/)?[^\s`<>\[\]:'\"|*]+?\.{PATH_EXT_RE})(?![\w-])"
    for m in re.finditer(plain_pattern, text, flags=re.IGNORECASE | re.UNICODE):
        ref = normalize_ref(m.group(1))
        if ref:
            candidates.add(ref)

    return candidates


def ref_exists(source_path: Path, ref: str) -> bool:
    ref_path = Path(ref)
    possible = []
    if ref_path.is_absolute():
        return False
    possible.append((ROOT / ref_path).resolve())
    possible.append((APP_ROOT / ref_path).resolve())
    possible.append((source_path.parent / ref_path).resolve())
    try:
        root_resolved = ROOT.resolve()
        app_root_resolved = APP_ROOT.resolve()
        for candidate in possible:
            try:
                candidate.relative_to(root_resolved)
            except ValueError:
                try:
                    candidate.relative_to(app_root_resolved)
                except ValueError:
                    continue
            if candidate.exists():
                return True
        if "/" not in ref and "\\" not in ref:
            return any(p.is_file() and not is_ignored_path(p) for p in ROOT.rglob(ref))
    except Exception:  # noqa: BLE001
        return False
    return False


def should_ignore_ref(source_rel: str, ref: str) -> bool:
    if any(token in ref for token in ["ACTION_ID", "YYYY-MM-DD", "999_fixture", "{", "}"]):
        return True
    if source_rel.startswith("templates/") or source_rel.startswith("tests/fixtures/"):
        return True
    # These are illustrative generated artifact names, not package files.
    if ref in {"doctor-validation-canonica.json", "module.manifest.json", "relative/file.md", "run.log", "result.json", "stdout.txt", "stderr.txt", "context.json", "files_created.json", "files_modified.json", "git_status_before.txt", "git_status_after.txt"}:
        return True
    if ref.startswith("EXISTS_"):
        return True
    return False


def validate_internal_refs(checks: list[dict[str, str]]) -> None:
    missing = []
    for path in sorted(p for p in iter_project_files("*") if p.is_file() and p.suffix.lower() in TEXT_EXTS):
        rel = path.relative_to(ROOT).as_posix()
        for ref in sorted(extract_internal_refs(read_text(path))):
            if should_ignore_ref(rel, ref):
                continue
            if not ref_exists(path, ref):
                missing.append(f"{rel} -> {ref}")
    result(checks, "INTERNAL_REFERENCES_EXIST", not missing, "; ".join(missing[:80]) or "Referencias internas conservadas resuelven.")


def validate_clean_root_layout(checks: list[dict[str, str]]) -> None:
    required_app_dirs = ["public", "app", "config", "project", "tools", "logs", "tmp"]
    forbidden_app_paths = ["docs", "machine", "database", "scripts", "templates", "evidence"]
    errors = []
    if ROOT.name != "project":
        errors.append(f"PROJECT_CONTROL_ROOT debe llamarse project: {ROOT}")
    for rel in required_app_dirs:
        if not (APP_ROOT / rel).exists():
            errors.append(f"APP_ROOT missing: {rel}")
    for rel in forbidden_app_paths:
        if (APP_ROOT / rel).exists():
            errors.append(f"APP_ROOT debe mantenerse limpio; mover a project/: {rel}")
    if not (ROOT / "changelog").exists():
        errors.append("PROJECT_CONTROL_ROOT missing: changelog")
    if not (ROOT / "canonical-baseline").exists():
        errors.append("PROJECT_CONTROL_ROOT missing: canonical-baseline")
    result(checks, "PROJECT_CLEAN_ROOT_LAYOUT_DECLARED", not errors, "; ".join(errors) or "Raíz limpia APP_ROOT/PROJECT_CONTROL_ROOT declarada y presente.")


def validate_readiness(checks: list[dict[str, str]]) -> None:
    status = read_text(ROOT / "CURRENT_STATUS.md")
    ok = "READY_FOR_SPRINT_0" in status
    false_positive = re.search(r"(?i)(estado final|estado operativo|veredicto).*READY_FOR_VISIBLE_FEATURE_DEVELOPMENT", status) and "no alcanzado" not in status.lower()
    result(checks, "READINESS_READY_FOR_SPRINT_0", ok and not false_positive, "Estado operativo READY_FOR_SPRINT_0; desarrollo visible no alcanzado.")


def main() -> int:
    checks: list[dict[str, str]] = []
    validate_required_paths(checks)
    validate_json(checks)
    validate_machine_manifest_schema(checks)
    validate_machine_manifest_refs(checks)
    validate_machine_manifest_listed_json(checks)
    validate_sprint0_schema(checks)
    validate_doctor_catalog_coverage(checks)
    validate_database_manifest_checksums(checks)
    validate_forbidden_refs(checks)
    validate_identity(checks)
    validate_internal_refs(checks)
    validate_clean_root_layout(checks)
    validate_readiness(checks)
    passed = all(c["status"] == "passed" for c in checks)
    print(json.dumps({"status": "passed" if passed else "failed", "checks": checks}, ensure_ascii=False, indent=2))
    return 0 if passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
