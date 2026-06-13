# Usuarios objetivo

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Segmento inicial de validación

El MVP se valida inicialmente con un perfil owner-operador de ecosistema web modular: una persona o equipo pequeño que necesita centralizar módulos, servicios, webs, estado, progreso, evidencias e IA asistida desde un punto común.

Este segmento no representa un rol técnico interno del sistema, sino el primer contexto de mercado/producto que VipWeb debe demostrar que puede acompañar.

| Campo | Definición |
|---|---|
| ICP inicial | Owner, creador o gestor técnico-operativo de un ecosistema web modular en fase inicial. |
| Contexto de uso | Gestiona o prepara varios módulos, servicios, webs, automatizaciones o áreas conectadas. |
| Dolor principal | Fragmentación operativa: múltiples piezas sin continuidad, estado común ni siguiente paso claro. |
| Necesidad principal | Entrar en un punto común, entender el estado del ecosistema, continuar donde lo dejó, activar módulos y recibir acompañamiento básico. |
| Usuario MVP | Cuenta provisionada con rol `registered_user`; no hay auto-registro público. |
| Criterio de éxito | Completa onboarding, llega al dashboard, entiende el siguiente paso y usa al menos un módulo inicial. |

## Roles operativos MVP

| Usuario | Rol en MVP | Necesidad | Módulos principales |
|---|---|---|---|
| Visitante | Explora entrada pública | Entender VipWeb sin datos privados desde `/` y acceder a `/login` con cuenta provisionada | `core.identity` |
| Usuario registrado | Usa el ecosistema | Ver estado, módulos, progreso y próximos pasos | `dashboard`, `onboarding`, `profile`, `gamification` |
| Admin | Opera en lectura | Revisar módulos, auditoría, evidencias y Doctor | `admin`, `core.audit`, `core.doctor` |
| Owner | Controla decisiones | Aprobar cambios críticos, roles, permisos y roadmap | `core.permissions`, `core.config`, `core.doctor` |
| IA asistente | Apoyo operativo | Leer contexto, auditar, proponer cambios y ejecutar Doctor no destructivo | `ai_assistant`, `core.doctor` |
| Servicio externo | Futuro/stub | Integrarse sin acoplar proveedor | `integrations` |

## Anti-ICP MVP

| Perfil excluido del MVP | Motivo |
|---|---|
| Usuario final masivo sin cuenta provisionada | El MVP no incluye auto-registro público. |
| Cliente que solo necesita una landing aislada | VipWeb se define como ecosistema modular. |
| Organización que requiere multi-tenant avanzado | Multi-tenant avanzado queda fuera del MVP. |
| Usuario que necesita pagos o marketplace desde el inicio | Pagos y marketplace son post-MVP. |
| Usuario que espera IA autónoma | AI-4 está prohibido y AI-2 requiere aprobación/control. |
| Proyecto que depende de integraciones externas reales inmediatas | El MVP solo contempla integraciones stub. |

## Roles no incluidos como rol operativo MVP

- `Usuario avanzado`: queda para post-MVP.
- `Operador`: se absorbe en `admin` hasta que haya operación avanzada.
- `Servicio externo`: existe como principal técnico futuro, no como usuario humano.

Fuente canónica: `machine/roles.json`.

## Regla de interpretación del piloto inicial

El segmento inicial puede generar una muestra cuantitativa baja. En ese caso, las métricas de éxito se tratan como baseline no concluyente y se combinan con el protocolo cualitativo MVP. La falta de 30 usuarios no invalida el piloto si existen sesiones observadas suficientes y no aparecen fallos críticos de comprensión, acompañamiento, continuidad, permisos, IA o módulos.
