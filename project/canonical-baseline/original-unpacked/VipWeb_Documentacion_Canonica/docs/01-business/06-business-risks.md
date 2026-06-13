# Riesgos de negocio

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Riesgo | Causa | Impacto | Mitigación | Decisión asociada |
|---|---|---|---|---|
| Plataforma sin foco | Querer resolver todo desde MVP | Alto | MVP guiado y limitado por ADR-014 | ADR-014 |
| Dashboard técnico | Priorizar administración sobre acompañamiento | Alto | Dashboard con próximo paso, progreso y módulos | ADR-016 |
| Freemium prematuro | Añadir pagos antes de validar uso | Medio | Pagos fuera de MVP; medir uso modular | ADR-013 |
| IA percibida como insegura | Permisos y aprobación poco claros | Alto | AI-0/AI-1; AI-2 con aprobación; AI-4 prohibido | ADR-005 |
| Gamificación irrelevante | Logros no conectados a valor | Medio | Eventos fuente y reglas antifatiga | ADR-010 |
| Integraciones acopladas | Proveedor real demasiado pronto | Alto | Integrations stub y ADR futura | ADR-015 |

## Riesgo de telemetría de producto no contractual

- **Riesgo:** implementar tracking de vistas sin catálogo ni contrato de acción.
- **Impacto:** métricas de activación o retorno no reproducibles; gamificación accidental por refresh; side effects en rutas `GET`.
- **Mitigación:** `machine/analytics_events.json`, action contracts `POST` para eventos persistentes y checks Doctor específicos.
- **Decisiones relacionadas:** ADR-014, ADR-016, ADR-022.
