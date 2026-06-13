# 07 Observability


## Propósito
Definir qué debe poder observarse, auditarse y evidenciarse en el entorno local antes de implementar runtime visible.
**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Observabilidad MVP
- `AuditLog` para acciones sensibles.
- `AIActionLog` para acciones propuestas o ejecutadas por IA.
- `EvidenceReport` para Doctor, backup, migraciones, seeds y revisión manual.
- Logs locales para errores técnicos.

## Reglas
- Audit log es append-only.
- Evidence report es versionado y con checksum externo en `evidence/sprint-0-local-execution.md` para evitar hashes autorreferenciales.
- Ejecutar Doctor readonly no genera evidencia persistida automáticamente.
- Escribir evidencia exige `evidence.write`.

## Criterios de validación
Toda acción sensible debe poder reconstruirse con actor, permiso, target, fecha, resultado y evidencia si aplica.


## Lectura de eventos de sistema

La consulta de eventos de dominio/sistema vive en `/admin/events`, usa `system.view_events` y requiere `audit_required=true` aunque sea una ruta `GET` de solo lectura. Esta decisión permite reconstruir quién consultó eventos operativos, cuándo y con qué permiso.

Doctor valida `SYSTEM_EVENT_READS_REQUIRE_AUDIT` y `SYSTEM_EVENT_UI_ROUTE_IS_ADMIN_SCOPED`.
