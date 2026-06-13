# 05 AI Architecture

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-005, ADR-021, `machine/ai_approval_policy.json`, `machine/permissions.json`.

## Propósito
Definir cómo la IA opera sobre VipWeb sin convertirse en actor autónomo inseguro.

## Flujo permitido
1. Leer documentación y catálogos.
2. Detectar incoherencias.
3. Proponer cambios.
4. Generar borradores si el rol lo permite.
5. Ejecutar Doctor readonly.
6. Solicitar aprobación humana para escribir evidencia o modificar catálogos.
7. Registrar acción en `AIActionLog` si modifica o propone cambios de riesgo.

## Separación obligatoria
- `system.run_doctor.readonly`: ejecuta checks y muestra resultado.
- `evidence.write`: escribe evidencia versionada.
- `doctor.status.validate`: valida estado; solo owner humano.

## Guardrails
- AI-4 prohibido.
- AI-2 requiere aprobación para escritura.
- IA no accede a secretos.
- IA no ejecuta SQL destructivo.
- IA no marca `VALIDATED`.

## Criterios de validación
Doctor debe fallar si un rol IA recibe permisos de escritura sin aprobación o si una ruta usa el permiso legacy `system.run_doctor`.

## Riesgos si se incumple
Evidencia fabricada, validación automática indebida, cambios de permisos sin aprobación o pérdida de trazabilidad.
