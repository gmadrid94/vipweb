# Criterios de aceptación funcional

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Área | Criterio mínimo |
|---|---|
| Identidad | Usuario puede iniciar/cerrar sesión y queda registrado evento. |
| Permisos | Rutas protegidas fallan sin permiso y pasan con rol válido. |
| Módulos | Manifest inválido impide activar módulo. |
| Eventos | Evento no registrado no se acepta. |
| Auditoría | Acción sensible genera `AuditLog`. |
| Dashboard | Muestra módulos, próximo paso, progreso y estado. |
| Onboarding | Puede completarse y retomarse. |
| Perfil | Puede verse y actualizarse con evento `profile.updated`. |
| Admin | Ve evidencias y auditoría sin mutación peligrosa. |
| IA | AI-0/AI-1 no modifican archivos; AI-2 requiere aprobación. |
| Gamificación | Progreso se actualiza solo por evento válido. |
| Integraciones | Stub visible sin credenciales reales. |
| Doctor | Falla ante referencias inexistentes, plantillas críticas o divergencias. |
