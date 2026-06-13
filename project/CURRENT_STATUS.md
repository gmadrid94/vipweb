# Estado canónico actual

## Veredicto operativo

`READY_FOR_SPRINT_0`

La documentación canónica de VipWeb está lista para ejecutar Sprint 0 bajo el modelo local **AI-first asistido por tools externas**. Este estado no autoriza desarrollo visible de producto.

## Estado de desarrollo visible

`READY_FOR_VISIBLE_FEATURE_DEVELOPMENT` permanece **no alcanzado**.

Quedan bloqueados hasta cerrar Sprint 0 con evidencia local real:

- Dashboard funcional visible.
- Onboarding funcional visible.
- UI visible de módulos.
- Módulos funcionales de negocio.
- Integraciones reales externas.
- IA operativa avanzada.

## Baseline documental

- `documentation_baseline`: `1.2`
- `layout_profile`: `clean_root_project_control_root + external_ai_roadmap_tools`
- `execution_model`: `AI_FIRST_LOCAL_EXECUTION`
- Proyecto canónico: `VipWeb`
- Raíz WAMP local: `WAMP_WWW_ROOT = C:/wamp64/www`
- Raíz runtime local / repo oficial: `APP_ROOT = OFFICIAL_REPO_ROOT = C:/wamp64/www/vipweb`
- Raíz pública servida por WAMP: `PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public`
- Raíz canónica operativa: `PROJECT_CONTROL_ROOT = C:/wamp64/www/vipweb/project`
- Raíz backups externos: `BACKUP_ROOT = C:/wamp64/www/vipweb_backups`
- Raíz tools externas de roadmap: `EXTERNAL_ROADMAP_TOOLS_ROOT = C:/wamp64/www/vipweb_tools`
- Raíz logs de tools externas: `EXTERNAL_TOOL_LOG_ROOT = C:/wamp64/www/vipweb_tools/logs`
- Raíz tools internas del proyecto: `INTERNAL_PROJECT_TOOLS_ROOT = C:/wamp64/www/vipweb/tools`
- Paquete canónico recomendado: `VipWeb_AI_First_Canonical.zip`

## Hecho operativo local declarado

El entorno WAMP ya está configurado por el owner para servir `C:/wamp64/www/vipweb/public` como carpeta pública.

Sprint 0 debe **verificar y conservar** esta configuración. No debe rediseñarla ni mover el punto público salvo decisión humana posterior.

## Regla de rutas

Salvo indicación contraria, las rutas `docs/`, `machine/`, `database/`, `scripts/`, `templates/` y `evidence/` son relativas a `PROJECT_CONTROL_ROOT`.

Ejemplos:

- `docs/11-backlog/06-sprint-0-ejecutable.md` equivale a `C:/wamp64/www/vipweb/project/docs/11-backlog/06-sprint-0-ejecutable.md`.
- `scripts/update_script.py` equivale a `C:/wamp64/www/vipweb/project/scripts/update_script.py`.
- `evidence/sprint-0-local-execution.md` equivale a `C:/wamp64/www/vipweb/project/evidence/sprint-0-local-execution.md`.

La raíz runtime debe permanecer limpia:

```txt
APP_ROOT/
  public/
  app/
  config/
  project/
  tools/
  logs/
  tmp/
```

La raíz `C:/wamp64/www` debe quedar organizada así:

```txt
www/
  vipweb/          # proyecto oficial y repo Git
  vipweb_backups/  # backups externos del proyecto
  vipweb_tools/    # tools externas para ejecutar fases del roadmap
```

`project/canonical-baseline/` conserva una copia histórica intocable. No forma parte del canon operativo vigente ni desbloquea gates.

## Modelo AI-first local

El roadmap debe diseñarse para ejecución mediante:

- GPT: análisis, planificación, generación de instrucciones, revisión de logs y validación conceptual.
- Codex: cambios de código/documentación dentro de `APP_ROOT` cuando el gate lo permita.
- Tools externas: ejecución local de tareas que GPT/Codex no pueden realizar directamente sobre Windows/WAMP/MySQL/filesystem.
- Humano owner: ejecución física de `.bat/.cmd`, introducción de datos privados, aprobación de gates y revisión final.

El objetivo operativo es `development_mode = ai_prepared_changes_enabled`, pero los cambios protegidos siguen bloqueados hasta cerrar `S0-000A` y completar el contrato aplicable de ADR-026 con datos locales reales.

## Git y control de cambios

`C:/wamp64/www/vipweb` es el proyecto oficial enlazado a Git.

Git es obligatorio para el modelo AI-first, pero este paquete no puede declarar un commit baseline real. Sprint 0 debe registrar en evidencia:

- que `APP_ROOT` está bajo Git;
- rama vigente;
- commit baseline previo al primer cambio protegido preparado por IA;
- `git status` limpio antes y después de aplicar cambios protegidos.

ADR-026 permanece como contrato de activación verificable para aplicar cambios protegidos preparados por IA. La IA puede detectar bloqueos y preparar borradores; no puede inventar ApprovalRecord, commit baseline ni validación humana.

## Validador documental actual y Doctor runtime

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

`machine/doctor_checks.json` es el catálogo contractual de Doctor para validación documental y para implementación runtime futura. En el estado actual, los checks ejecutados realmente son los emitidos por `scripts/update_script.py`; el resto del catálogo no implica que exista un script Doctor completo en Sprint 0 documental.

`update_script.py` es readonly: no ejecuta migraciones, no ejecuta seeds, no escribe ni actualiza `evidence/sprint-0-local-execution.md`.

## Evidencia local pendiente

Debe completarse `evidence/sprint-0-local-execution.md` con ejecución local real de Sprint 0. Como mínimo debe registrar:

- estructura local creada;
- confirmación de `PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public`;
- verificación de que carpetas privadas no son accesibles por navegador;
- versiones reales de PHP, MySQL/MariaDB y Apache en WAMP;
- existencia y estado Git de `APP_ROOT`;
- logs de tools externas bajo `C:/wamp64/www/vipweb_tools/logs`;
- migraciones ejecutadas o bloqueo técnico concreto;
- seeds ejecutados o bloqueo técnico concreto;
- sustitución local segura del owner seed;
- validación posterior mediante `scripts/update_script.py`, cuya salida debe registrarse manualmente si se usa como evidencia;
- confirmación humana del gate.

## Estado de base de datos

- Las migraciones están generadas y conservadas en `database/migrations/` bajo `PROJECT_CONTROL_ROOT`.
- Los rollbacks están generados y conservados en `database/rollbacks/` bajo `PROJECT_CONTROL_ROOT`.
- Los seeds están preparados y conservados en `database/seeds/` bajo `PROJECT_CONTROL_ROOT`.
- No se declara ejecución local real dentro de este paquete.
- `database/seeds/003_seed_local_owner_template.sql` contiene placeholders por seguridad y debe completarse localmente.

## Fuentes de verdad

- Producto y alcance: `docs/00-foundation/`, `docs/01-business/`, `docs/02-product/`.
- Funcionalidad: `docs/03-functional/` y `machine/action_contracts.json`.
- Arquitectura: `docs/04-architecture/`.
- Datos: `docs/05-domain-data/`, `database/`, `machine/schema_registry.json`, `machine/migration_contracts.json`.
- Seguridad y privacidad: `docs/06-technical/05-security.md`, `docs/13-quality/`, `machine/ai_approval_policy.json`.
- UX/UI: `docs/07-design-ux/` y catálogos machine-readable asociados.
- IA: `docs/09-ai-operations/` y contratos machine-readable asociados.
- Roadmap, backlog y Sprint 0: `docs/10-roadmap/`, `docs/11-backlog/`, `machine/sprint0_tasks.json`.
- Tools externas de roadmap: `docs/06-technical/12-external-roadmap-tools.md`, `docs/09-ai-operations/11-ai-first-execution-model.md`, `docs/10-roadmap/09-ai-first-roadmap-execution.md`, `machine/external_tool_contracts.json`.

## Regla de prevalencia

Cuando exista discrepancia documental, prevalecen en este orden:

1. `CURRENT_STATUS.md`.
2. Contratos machine-readable bajo `machine/`.
3. Migraciones, rollbacks, seeds y manifest SQL bajo `database/`.
4. ADRs aceptadas bajo `docs/12-decisions/adr/`.
5. Documentación funcional, técnica, UX, IA, roadmap y backlog bajo `docs/`.
6. `changelog/`, notas auxiliares y `project/canonical-baseline/`, que no prevalecen sobre las fuentes anteriores.

## Siguiente paso operativo

Ejecutar Sprint 0 en local mediante el bucle AI-first:

```txt
1. Ejecutar tool externa .bat/.cmd.
2. Conservar log generado en C:/wamp64/www/vipweb_tools/logs.
3. Pasar el log más reciente a GPT.
4. Revisar si la tool hizo lo esperado.
5. Registrar evidencia manual validada.
6. Continuar con la siguiente tarea permitida.
```
