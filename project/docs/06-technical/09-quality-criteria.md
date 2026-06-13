# 09 Quality Criteria


## Propósito
Fijar criterios técnicos de calidad para que cada cambio sea implementable, verificable y reversible.
**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Definition of Ready técnica
- Documento fuente sustantivo.
- Módulo owner identificado.
- Permisos y rutas definidos.
- Entidades/relaciones/constraints actualizados.
- Test y evidencia esperados.
- Rollback local descrito.

## Definition of Done técnica
- Implementación mínima.
- Tests ejecutados.
- Doctor verde.
- Evidencia registrada si procede.
- Registro operativo actualizado.
- No quedan permisos, eventos o entidades fuera de catálogo.

## Criterios de validación
La calidad no se mide por cantidad de documentación, sino por trazabilidad, validación automática y reducción de reinterpretación.
