# ADR-029 — Raíz limpia y separación entre runtime root y project control root

## Estado

Aceptada.

## Contexto

La estructura anterior distribuía documentación, machine-readable, database specs, scripts y evidencias en la raíz del paquete. Para el trabajo local WAMP se requiere una raíz `vipweb/` más limpia, donde lo visible, el backend y el control documental estén separados.

La reorganización no debe romper manifests, checksums SQL, referencias internas ni la lectura por IA/Codex. Tampoco debe desbloquear Dashboard, Onboarding, UI visible, módulos funcionales, integraciones reales ni IA operativa avanzada.

## Decisión

VipWeb separa dos raíces:

```txt
APP_ROOT = C:/wamp64/www/vipweb
PROJECT_CONTROL_ROOT = C:/wamp64/www/vipweb/project
```

`APP_ROOT` contiene solo:

```txt
public/
app/
config/
project/
tools/
logs/
tmp/
```

`PROJECT_CONTROL_ROOT` contiene la documentación y control operativo:

```txt
docs/
machine/
database/
scripts/
templates/
evidence/
changelog/
canonical-baseline/
```

Las rutas internas `docs/`, `machine/`, `database/`, `scripts/`, `templates/` y `evidence/` se mantienen relativas a `PROJECT_CONTROL_ROOT`. No se debe hacer sustitución global a `project/docs/`, `project/machine/`, etc.

## Consecuencias

- La raíz local queda limpia y separa runtime de control documental.
- `public/` sigue siendo el único punto previsto para contenido visible.
- `app/` contiene backend privado.
- `config/` contiene configuración runtime local sin secretos reales.
- `project/` contiene canon operativo vigente, evidencias y changelog.
- `tools/` contiene wrappers `.bat` locales y no sustituye a `scripts/`.
- `logs/` contiene salidas crudas generadas por tools/scripts y no sustituye a `evidence/`.
- `tmp/` contiene artefactos temporales prescindibles y no canónicos.
- `project/canonical-baseline/` conserva una copia histórica intocable y no prevalece sobre `CURRENT_STATUS.md`, `machine/`, `database/` ni ADRs aceptadas.

## Reglas de ejecución

- El validador se puede ejecutar desde `APP_ROOT` con `python project/scripts/update_script.py`.
- El validador se puede ejecutar desde `PROJECT_CONTROL_ROOT` con `python scripts/update_script.py`.
- `scripts/update_script.py` sigue siendo readonly: no ejecuta migraciones, no ejecuta seeds y no genera evidencia.
- Sprint 0 debe registrar evidencia real en `evidence/sprint-0-local-execution.md` bajo `PROJECT_CONTROL_ROOT`.
- Cualquier backup operativo debe conservar `project/evidence/sprint-0-local-execution.md` y logs relevantes si existen.

## Documentos afectados

- `README.md`
- `CURRENT_STATUS.md`
- `docs/06-technical/02-project-structure.md`
- `docs/06-technical/08-deployment.md`
- `docs/06-technical/10-wamp-local-workflow.md`
- `docs/11-backlog/06-sprint-0-ejecutable.md`
- `docs/13-quality/05-traceability-matrix.md`
- `docs/13-quality/06-doctor-checks.md`
- `machine/sprint0_tasks.json`
- `machine/doctor_checks.json`
- `scripts/update_script.py`
