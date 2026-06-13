# Reglas funcionales

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Regla | Aplicación |
|---|---|
| Todo cambio de estado emite evento o audit log | Datos, IA, módulos, admin |
| Todo módulo debe declarar permisos y eventos | Arquitectura modular |
| Ningún módulo escribe tablas ajenas sin contrato | Datos / modularidad |
| Dashboard muestra próximos pasos, no solo métricas | UX acompañada |
| Onboarding debe ser progresivo y retomable | Activación |
| Gamificación deriva de eventos fuente | Retención |
| IA no modifica sin nivel y aprobación | IA operativa |
| Integraciones MVP no usan credenciales reales | Seguridad |
| Doctor bloquea inconsistencias críticas | Calidad |
