# Business overview

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Decisión de negocio vigente

VipWeb se construye como ecosistema modular con modelo **freemium progresivo**, no como una web aislada ni como marketplace complejo desde el MVP.

## Hipótesis de negocio MVP

El valor inicial no reside en cobrar, sino en demostrar que un usuario puede volver al ecosistema, entender su estado, activar módulos y sentir continuidad. La monetización se prepara mediante medición de uso modular, pero los pagos reales quedan fuera del MVP.

La validación inicial se centra en un owner-operador de ecosistema web modular, no en un usuario masivo generalista. El MVP debe demostrar continuidad, orientación y uso modular antes de abrir captación pública, pagos, marketplace o integraciones reales.

## Bloques obligatorios

- Problema: dispersión, falta de continuidad y dependencia de herramientas sueltas.
- Usuarios: visitante, usuario registrado, admin, owner, IA asistente, servicio externo futuro.
- Propuesta: punto común, modular, cómodo, guiado, auditable y gestionable por IA.
- Modelo: freemium modular progresivo.
- Métricas: activación, retorno, uso modular, onboarding, IA, Doctor y progreso.
- Riesgos: plataforma sin foco, dashboard técnico, IA sin guardrails, gamificación decorativa.

## Fuentes

- ADR-012, ADR-013, ADR-014, ADR-016, ADR-017, ADR-023.
- `machine/product_mvp.json`, `machine/metrics.json`, `machine/features.json`.
