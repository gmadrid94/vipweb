# Métricas de éxito

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica: `machine/metrics.json`.

| Métrica | Área | Definición | Eventos fuente | Objetivo MVP |
|---|---|---|---|---|
| activation_rate | producto | Porcentaje de usuarios provisionados activos con rol registered_user que completan onboarding y llegan al dashboard. | `onboarding.completed`, `dashboard.first_viewed` | >= 60% |
| dashboard_return_rate | producto | Porcentaje de usuarios que vuelven al dashboard tras activación. | `dashboard.viewed` | medir baseline |
| module_usage_count | negocio | Número de usos reales de módulos por usuario provisionado activo; no mide instalación, activación, configuración ni disponibilidad del módulo. | `module.used` | >= 1 módulo usado |
| onboarding_completion_time | ux | Tiempo hasta completar onboarding mínimo. | `onboarding.started`, `onboarding.completed` | sin fricción crítica |
| ai_suggestion_acceptance_rate | ia | Proporción de sugerencias IA aceptadas o convertidas en backlog. | `ai.suggestion.created`, `ai.action.approved` | medir baseline |
| doctor_pass_rate | calidad | Proporción de ejecuciones Doctor sin fallos críticos. | `system.doctor.executed`, `doctor.check.failed` | 100% critical passed |
| progress_event_count | gamificacion | Eventos que actualizan progreso sin duplicidad/fatiga. | `progress.updated`, `achievement.unlocked` | medir baseline |

## Regla de interpretación

Si una métrica no puede medirse con eventos canónicos, no debe considerarse lista para MVP. La medición debe derivarse de `machine/events.json` y no de contadores improvisados.

`module_usage_count` se calcula exclusivamente con `module.used`; `module.activated` y `module.configured` solo sirven como contexto administrativo. `module_activation_count` queda como alias consolidado/deprecado y no debe usarse en nuevas implementaciones.


## Política de muestra pequeña

El ICP inicial puede ser un owner individual o un equipo pequeño. Por tanto, una métrica con muestra inferior a su `minimum_sample` no aprueba ni bloquea gates por sí sola.

Cuando no se alcance la muestra mínima:

- la métrica se clasifica como `quantitative_baseline_only`;
- se conserva como señal direccional y línea base;
- no desbloquea expansión visible por sí sola;
- no bloquea avance si el protocolo cualitativo muestra comprensión suficiente;
- prevalecen las sesiones cualitativas documentadas en `machine/mvp_qualitative_validation.json` para decisiones tempranas de UX/producto.

Cada métrica debe declarar un denominador verificable. Si el denominador no existe todavía, la métrica se mantiene como baseline no concluyente hasta que los eventos y la población medida estén disponibles.

## Política de decisión

Toda métrica con `target_mvp` debe declarar:

- ventana de medición;
- muestra mínima;
- regla de éxito;
- regla de alerta;
- regla de fallo;
- decisión si hay alerta o fallo;
- owner;
- cadencia de revisión.

Una métrica baseline no desbloquea ampliación de alcance si no existe decisión posterior documentada en `machine/metrics.json`.

## Protocolos de decisión

| Métrica | Ventana | Muestra mínima | Éxito | Alerta | Fallo | Decisión si hay alerta/fallo | Owner |
|---|---|---|---|---|---|---|---|
| activation_rate | primeros 7 días desde provisioning o hasta completar onboarding, lo que ocurra antes | 30 usuarios provisionados activos o 30 días de validación MVP | >= 60% de usuarios provisionados activos con rol registered_user completan onboarding y llegan al dashboard | 40% - 59% | < 40% | Revisar onboarding, fricción de login, copy de bienvenida y transición hacia dashboard antes de añadir nuevos módulos visibles. | producto |
| dashboard_return_rate | 7 días tras activation_rate positiva | 30 usuarios activados o 30 días naturales, lo que ocurra antes | >= 30% de usuarios activados vuelven al dashboard al menos una vez en D1-D7 | 20% - 29% | < 20% | Revisar dashboard, next-step card, onboarding completion copy y notificaciones internas antes de añadir nuevas features | producto |
| module_usage_count | primeros 7 días tras activation_rate positiva | 30 usuarios activados o 30 días | >= 1 módulo usado por usuario activado durante la ventana MVP | 0.5 - 0.99 módulos usados de media por usuario activado | < 0.5 módulos usados de media por usuario activado | Revisar claridad del catálogo de módulos, cards del dashboard, next-step card y onboarding antes de activar nuevos módulos. | producto |
| onboarding_completion_time | primera sesión de onboarding | 30 sesiones iniciadas o 30 días naturales, lo que ocurra antes | p75 <= 7 minutos y tasa de bloqueo/error <= 5% | p75 entre 7 y 10 minutos o tasa de bloqueo/error entre 5% y 10% | p75 > 10 minutos o tasa de bloqueo/error > 10% | Reducir pasos, simplificar copy, revisar estados empty/error y posponer enriquecimiento visual no esencial | ux |
| ai_suggestion_acceptance_rate | primeras 30 sugerencias IA o 30 días naturales | 30 sugerencias generadas | >= 25% de sugerencias aceptadas o convertidas en backlog | 10% - 24% | < 10% | Restringir superficie visible de IA, revisar prompts operativos, mejorar contexto leído y no ampliar AI-2 | ia_operativa |
| doctor_pass_rate | cada ejecución Doctor durante Sprint 0 y antes de merge o entrega documental | 1 ejecución por cambio estructural o lote de cambios documentales | 100% de checks critical passed y overall passed | fallos medium/high sin fallos critical | cualquier fallo critical o overall failed | Bloquear avance de gates y corregir inconsistencias antes de iniciar desarrollo visible. | calidad |
| progress_event_count | primera sesión tras onboarding y primeros 7 días | 30 usuarios activados | >= 80% de usuarios activados reciben al menos un progress.updated legítimo; duplicate_rate <= 1%; cooldown_violations = 0 | 50% - 79% de cobertura o duplicate_rate entre 1% y 3% | < 50% de cobertura, duplicate_rate > 3% o cualquier cooldown_violations > 0 | Revisar reglas de gamificación, cooldowns, eventos fuente y evitar añadir nuevas recompensas hasta corregir duplicados | gamificacion |

Doctor valida `BASELINE_METRICS_DECLARE_DECISION_POLICY`, `CORE_VALIDATION_METRICS_DECLARE_DECISION_POLICY`, `MODULE_USAGE_METRIC_HAS_USAGE_EVENT` y `METRICS_WITH_TARGET_MVP_HAVE_REVIEW_CADENCE`.

Regla operativa: el numerador de `module_usage_count` solo puede alimentarse desde `MODULE_USE_TRACK` o contrato equivalente aprobado que emita `module.used`. `module_activation_count` queda reservado como alias consolidado/deprecado.

## Validación cualitativa MVP

Fuente: `docs/01-business/07-mvp-qualitative-validation.md` y `machine/mvp_qualitative_validation.json`.

Las métricas cuantitativas se complementan con 3-5 sesiones cualitativas cuando todavía no exista muestra suficiente. Este protocolo valida comprensión, acompañamiento y continuidad antes de ampliar funcionalidad visible.

| Señal cualitativa | Métricas conectadas | Decisión si falla |
|---|---|---|
| Usuario identifica siguiente paso sin ayuda | `activation_rate`, `dashboard_return_rate` | Revisar dashboard, NextStepCard y copy de onboarding. |
| Dashboard se entiende como punto de continuidad | `dashboard_return_rate` | Bloquear expansión visible hasta corregir composición. |
| Progreso orienta y no decora | `module_usage_count`, `dashboard_return_rate` | Revisar ProgressSummary y reglas de gamificación visible. |
| IA helper se entiende como no autónoma | `ai_suggestion_acceptance_rate` | Reforzar copy, permisos y guardrails visibles. |

## Fuentes de medición para vistas y activación

Las métricas que dependen de vistas no deben tomar datos de renderizados `GET` ni de claves libres de analítica.

- `activation_rate` usa `onboarding.completed` y `dashboard.first_viewed` como eventos de dominio.
- `dashboard_return_rate` usa `dashboard.viewed` como evento de dominio persistente.
- `qualitative_mvp_validation` puede combinar señales de dominio y agregados UI, pero debe declarar la fuente en `machine/analytics_events.json`.

Cualquier nueva métrica basada en pantallas debe pasar por el catálogo de analítica y, si afecta negocio, activación o gamificación, por un evento de dominio con action contract.
