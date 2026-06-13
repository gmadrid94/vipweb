# Estado canónico actual

## Veredicto operativo

`READY_FOR_SPRINT_0`

La documentación canónica de VipWeb está lista para ejecutar Sprint 0. Este estado no autoriza desarrollo visible de producto.

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

- `documentation_baseline`: `1.0`
- Proyecto canónico: `VipWeb`
- Raíz canónica: `VipWeb_Documentacion_Canonica/`
- Paquete canónico: `VipWeb_Documentacion_Canonica.zip`


## Validador documental actual y Doctor runtime

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

`machine/doctor_checks.json` es el catálogo contractual de Doctor para validación documental y para implementación runtime futura. En el estado actual, los checks ejecutados realmente son los emitidos por `scripts/update_script.py`; el resto del catálogo no implica que exista un script Doctor completo en Sprint 0 documental.

`update_script.py` es readonly: no ejecuta migraciones, no ejecuta seeds, no escribe ni actualiza `evidence/sprint-0-local-execution.md`.

## Evidencia local pendiente

Debe completarse `evidence/sprint-0-local-execution.md` con ejecución local real de Sprint 0. Como mínimo debe registrar:

- estructura local creada;
- versiones reales de PHP, MySQL/MariaDB y Apache en WAMP;
- migraciones ejecutadas o bloqueo técnico concreto;
- seeds ejecutados o bloqueo técnico concreto;
- sustitución local segura del owner seed;
- validación posterior mediante `scripts/update_script.py`, cuya salida debe registrarse manualmente si se usa como evidencia;
- confirmación humana del gate.

## Estado de base de datos

- Las migraciones están generadas y conservadas en `database/migrations/`.
- Los rollbacks están generados y conservados en `database/rollbacks/`.
- Los seeds están preparados y conservados en `database/seeds/`.
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

## Regla de prevalencia

Cuando exista discrepancia documental, prevalecen en este orden:

1. `CURRENT_STATUS.md`.
2. Contratos machine-readable bajo `machine/`.
3. Migraciones, rollbacks, seeds y manifest SQL bajo `database/`.
4. ADRs aceptadas bajo `docs/12-decisions/adr/`.
5. Documentación funcional, técnica, UX, IA, roadmap y backlog bajo `docs/`.

## Siguiente paso operativo

Ejecutar Sprint 0 en local y completar `evidence/sprint-0-local-execution.md`.
