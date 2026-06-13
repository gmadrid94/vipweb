# Capas de producto

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Capa | Responsabilidad | No debe hacer |
|---|---|---|
| Core | Identidad, permisos, módulos, eventos, auditoría, configuración, Doctor | Contener negocio específico de módulos. |
| Módulo | Aportar funcionalidad con contrato propio | Acceder a tablas ajenas sin contrato. |
| AppShell | Dar estructura visual común | Resolver lógica de negocio. |
| Dashboard | Ser centro de retorno y continuidad | Sustituir todos los módulos. |
| IA operativa | Leer, auditar, proponer y registrar | Actuar sin permiso ni evidencia. |
| Gamificación | Reflejar progreso real | Crear loops o recompensas artificiales. |
| Integraciones | Preparar adaptadores externos | Acoplar proveedores reales en MVP. |
