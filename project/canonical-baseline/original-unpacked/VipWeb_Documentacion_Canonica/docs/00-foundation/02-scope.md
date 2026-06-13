# 02 Scope

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/product_mvp.json`, `machine/roadmap_gates.json`, ADR-008, ADR-025.

## Propósito
Separar con precisión qué entra en MVP, qué queda como stub y qué queda fuera hasta fases posteriores.

## Alcance MVP
- Login/logout local.
- Dashboard acompañado.
- Onboarding mínimo.
- Perfil/contexto de usuario.
- Notificaciones internas.
- Administración read-only.
- Gamificación basada en eventos.
- Doctor local y evidencias separadas.
- IA asistida para lectura, auditoría y propuestas.
- Integraciones declaradas como stub, sin proveedores reales.

## Fuera de alcance MVP
- Producción pública.
- Pagos reales.
- OAuth/proveedores reales.
- Automatización AI-4.
- API pública estable.
- Integraciones que requieran secretos reales.
- Subwebs activas no declaradas por contrato.

## Reglas canónicas
1. Una funcionalidad futura puede documentarse, pero no debe bloquear Sprint 0 salvo que afecte core.
2. Cualquier proveedor externo debe entrar primero como adapter/stub.
3. Todo cambio que toque permisos, módulos, datos o evidencias es cambio de arquitectura, no solo de UX.

## Criterios de validación
El scope es correcto si ninguna tarea MVP requiere proveedor real ni permiso IA no aprobado, y si cada módulo MVP tiene manifest y rollback.

## Riesgos si se incumple
Sobrealcance, dependencias externas prematuras o implementación de UI antes de permisos y datos seguros.
