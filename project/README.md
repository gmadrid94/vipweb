# VipWeb — Documentación canónica

Este paquete contiene la documentación canónica vigente de VipWeb para construir el proyecto desde Sprint 0 con raíz runtime limpia y modelo local AI-first asistido por tools externas.

## Estado operativo

- **documentation_baseline:** `1.2`
- **layout_profile:** `clean_root_project_control_root + external_ai_roadmap_tools`
- **execution_model:** `AI_FIRST_LOCAL_EXECUTION`
- **Estado final:** `READY_FOR_SPRINT_0`
- **Estado no alcanzado:** `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`
- **Uso previsto:** ejecutar Sprint 0 en entorno local WAMP, con GPT/Codex/tools externas, validando runtime, base de datos, migraciones, seeds, logs y evidencias locales antes de iniciar desarrollo visible.

`READY_FOR_SPRINT_0` no equivale a `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

El desarrollo visible de Dashboard, Onboarding, UI visible, módulos funcionales, integraciones reales e IA operativa avanzada queda bloqueado hasta completar Sprint 0 con ejecución local real y confirmación humana del gate correspondiente.

## Raíces canónicas

VipWeb separa la raíz runtime local, la raíz documental/de control y las raíces externas de operación:

```txt
WAMP_WWW_ROOT = C:/wamp64/www
APP_ROOT = OFFICIAL_REPO_ROOT = C:/wamp64/www/vipweb
PROJECT_CONTROL_ROOT = C:/wamp64/www/vipweb/project
PUBLIC_ROOT = PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public
APP_CODE_ROOT = C:/wamp64/www/vipweb/app
CONFIG_ROOT = C:/wamp64/www/vipweb/config
INTERNAL_PROJECT_TOOLS_ROOT = C:/wamp64/www/vipweb/tools
LOGS_ROOT = C:/wamp64/www/vipweb/logs
TMP_ROOT = C:/wamp64/www/vipweb/tmp
BACKUP_ROOT = C:/wamp64/www/vipweb_backups
EXTERNAL_ROADMAP_TOOLS_ROOT = C:/wamp64/www/vipweb_tools
EXTERNAL_TOOL_LOG_ROOT = C:/wamp64/www/vipweb_tools/logs
```

Salvo indicación contraria, las rutas `docs/`, `machine/`, `database/`, `scripts/`, `templates/` y `evidence/` son relativas a `PROJECT_CONTROL_ROOT`.

Ejemplos:

```txt
scripts/update_script.py = C:/wamp64/www/vipweb/project/scripts/update_script.py
evidence/sprint-0-local-execution.md = C:/wamp64/www/vipweb/project/evidence/sprint-0-local-execution.md
```

## Estructura de raíz limpia

```txt
vipweb/
  public/
  app/
  config/
  project/
  tools/
  logs/
  tmp/
```

`project/canonical-baseline/` conserva una copia histórica intocable del baseline histórico previo. No es fuente operativa vigente y no sustituye a `CURRENT_STATUS.md`, `machine/` ni `database/` bajo `PROJECT_CONTROL_ROOT`.

## Estructura local AI-first esperada

```txt
www/
  vipweb/
  vipweb_backups/
  vipweb_tools/
    logs/
```

- `vipweb/tools` contiene tools internas del producto.
- `vipweb_tools` contiene tools externas para ejecutar fases del roadmap que GPT/Codex no pueden ejecutar directamente.
- Cada ejecución externa crea una carpeta de log única en `vipweb_tools/logs`.
- El log más reciente debe revisarse con GPT antes de avanzar al siguiente gate.

## Fuentes canónicas principales

1. `CURRENT_STATUS.md`: estado operativo, restricciones y lectura del paquete.
2. `docs/00-foundation/`: visión, alcance, núcleo y criterios de decisión.
3. `docs/01-business/` y `docs/02-product/`: propuesta de valor, usuarios, MVP y capas de producto.
4. `docs/03-functional/`: requisitos, reglas funcionales, criterios de aceptación y contratos de acción.
5. `docs/04-architecture/`: arquitectura, módulos, contratos e integraciones.
6. `docs/05-domain-data/`: modelo de datos, entidades, relaciones, eventos y gobierno de datos.
7. `docs/06-technical/`: stack, estructura, seguridad, testing, observabilidad, despliegue local, runtime y tools externas.
8. `docs/07-design-ux/`: navegación, pantallas, componentes, estados, accesibilidad y responsive.
9. `docs/09-ai-operations/`: modelo operativo IA, permisos, guardrails, runbooks, política de aprobación y ejecución AI-first.
10. `docs/10-roadmap/` y `docs/11-backlog/`: roadmap, backlog, Sprint 0 ejecutable y ejecución AI-first.
11. `database/`: migraciones, rollbacks, seeds y manifest técnico de artefactos SQL.
12. `machine/`: contratos y catálogos machine-readable vigentes.
13. `evidence/sprint-0-local-execution.md`: registro operativo pendiente de ejecución local real.
14. `changelog/`: resumen humano por fase cerrada; no sustituye a `evidence/`.

## Validador actual y contrato Doctor

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

Doctor permanece como módulo, catálogo y contrato runtime futuro en `machine/doctor_checks.json`; los checks realmente emitidos hoy por `scripts/update_script.py` están catalogados explícitamente. `update_script.py` no modifica archivos ni genera evidencia.

## Cómo validar la documentación

Desde `APP_ROOT`:

```bash
python project/scripts/update_script.py
```

Desde `PROJECT_CONTROL_ROOT`:

```bash
python scripts/update_script.py
```

El script valida estructura, JSON, schemas machine-readable listados, referencias internas, identidad de proyecto, checksums SQL, ausencia de nomenclatura retirada, layout de raíz limpia y estado operativo. No modifica archivos ni genera evidencia.

## Cómo empezar

1. Leer `CURRENT_STATUS.md` desde `PROJECT_CONTROL_ROOT`.
2. Revisar `docs/06-technical/12-external-roadmap-tools.md`.
3. Revisar `docs/09-ai-operations/11-ai-first-execution-model.md`.
4. Ejecutar Sprint 0 desde `docs/11-backlog/06-sprint-0-ejecutable.md` mediante tools externas cuando aplique.
5. Completar `evidence/sprint-0-local-execution.md` con evidencia local real.
6. Ejecutar `python project/scripts/update_script.py` desde `APP_ROOT` o `python scripts/update_script.py` desde `PROJECT_CONTROL_ROOT`.
7. Mantener bloqueado el desarrollo visible hasta cerrar Sprint 0.

## Restricciones activas

- No iniciar UI visible antes de completar Sprint 0.
- No iniciar Dashboard, Onboarding, módulos funcionales, integraciones reales ni IA operativa avanzada antes del gate operativo posterior a Sprint 0.
- No declarar migraciones ni seeds como ejecutados hasta validación local real.
- No declarar `PUBLIC_DOCUMENT_ROOT` verificado hasta ejecutar una comprobación local.
- No declarar ADR-026 activa sin activation_record, ApprovalRecord humano, commit baseline real y evidencia.
- El seed local owner contiene placeholders por seguridad y debe sustituirse localmente antes de desarrollo visible.
- La documentación canónica está lista; la ejecución local todavía debe realizarse.
