# 04 Decision Criteria

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-007, ADR-009, ADR-023, ADR-024, `machine/critical_decisions.json`.

## Propósito
Establecer cómo decidir cambios sin reabrir arquitectura innecesariamente.

## Criterios obligatorios
1. **Impacto modular:** qué módulo posee la responsabilidad y qué contrato cambia.
2. **Impacto en permisos:** qué permiso, rol y matriz de acceso se actualizan.
3. **Impacto en datos:** qué entidad, relación, constraint o migración se toca.
4. **Impacto IA:** qué nivel AI aplica y si requiere aprobación.
5. **Impacto UX:** qué pantalla, estado o flujo queda afectado.
6. **Impacto en evidencias:** qué Doctor check o reporte prueba el cambio.
7. **Rollback:** cómo se desactiva, revierte o restaura localmente.

## Decisión automática prohibida
No puede decidirse automáticamente:
- activar proveedores reales;
- conceder permisos críticos;
- escribir evidencia;
- marcar estado `VALIDATED`;
- cambiar ADRs aceptadas;
- ejecutar SQL destructivo.

## Criterios de validación
Una decisión está lista si identifica owner, módulo, documentos afectados, riesgo, rollback, evidencia y dependencia de aprobación humana si aplica.

## Riesgos si se incumple
Cambios aparentemente pequeños pueden romper seguridad, trazabilidad, IA operativa o roadmap.
