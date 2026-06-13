# 02 Definition of Done

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Una tarea está done si
- Se implementa solo el alcance aprobado.
- Pasa tests locales.
- Pasa Doctor.
- Actualiza catálogos si cambian contratos.
- Registra registro operativo local.
- Genera evidencia cuando corresponde.
- Mantiene rollback válido.
- No introduce permisos, eventos o entidades sin catálogo.

## Regla IA
Una IA no puede marcar done ni validated. Puede proponer evidencia, pero la validación final corresponde a humano autorizado.
