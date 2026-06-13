# 01 Definition of Ready

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Una tarea está ready si tiene
- Módulo owner.
- Documento fuente.
- Permisos/rutas si aplica.
- Entidades/relaciones si aplica.
- Eventos si aplica.
- Dependencias.
- Criterios de aceptación.
- Riesgo.
- Rollback.
- Evidencia esperada.
- Check Doctor o test asociado.

## Regla
No se implementa UI visible si la tarea requiere permisos, datos o contratos no cerrados.
