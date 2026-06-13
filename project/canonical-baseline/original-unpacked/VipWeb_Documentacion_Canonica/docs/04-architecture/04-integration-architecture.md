# 04 Integration Architecture

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Decisión

Las integraciones externas no forman parte del MVP como conexión real. El módulo `integrations` existe en MVP solo como catálogo/stub para preparar contratos futuros sin introducir dependencia de proveedores.

## Incluido en MVP

- Registro de integraciones disponibles.
- Estado `planned`, `stub`, `configured`, `disabled`.
- Permisos `integration.view` e `integration.configure`.
- Evento `integration.configured`.
- Manifiesto de integración sin credenciales reales.
- Documentación de riesgos por proveedor futuro.

## Excluido del MVP

- OAuth real.
- API keys reales.
- Webhooks productivos.
- Sincronización automática externa.
- Dependencia crítica de terceros.
- Promesas comerciales basadas en proveedores concretos.

## Contrato futuro de integración

Toda integración real deberá declarar:

| Campo | Obligatorio |
|---|---:|
| Provider | Sí |
| Scopes | Sí |
| Datos entrantes/salientes | Sí |
| Secretos necesarios | Sí, sin valores reales |
| Eventos emitidos | Sí |
| Rate limits | Sí |
| Fallback manual | Sí |
| Riesgos | Sí |
| Permisos | Sí |
| Evidencia de sandbox | Sí |


## Fuente canónica futura

Las integraciones reales se declaran en:

- `machine/integration_contracts.json`
- `machine/schemas/integration-contract.schema.json`
- `templates/integration-contract.json`

El MVP mantiene `machine/integration_contracts.json` como lista vacía. Esto significa que no hay integraciones reales activas, pero el contrato existe para impedir integraciones ad hoc.

## Estados de integración real

| Estado | Significado | Requisitos mínimos |
|---|---|---|
| `planned` | Integración prevista o placeholder | Puede tener arrays vacíos |
| `stub` | Catálogo visible sin conexión real | Debe tener permisos y fallback |
| `sandbox_ready` | Probada en sandbox | Requiere scopes, sandbox evidence y rate limits |
| `active` | Operativa real | Requiere permisos, eventos, secretos sin valores reales, fallback, sandbox y rollback |
| `disabled` | Desactivada | Conserva contrato consolidado |
| `deprecated` | Sustituida o retirada | Conserva motivo y alternativa |

## Regla de seguridad

Ninguna integración `active` puede existir sin evidencia de sandbox, política de rate limit, fallback manual, rollback declarado y prohibición explícita de valores reales de secretos en el contrato.

## Gate obligatorio antes de la primera integración real

Antes de implementar una integración concreta, crear conectores, guardar configuración runtime o exponer acciones de proveedor debe existir una entrada en `machine/integration_contracts.json` con estado `planned` o `stub`.

El contrato mínimo debe declarar:

- provider previsto o placeholder interno;
- owner/module responsable;
- permisos requeridos;
- datos entrantes/salientes previstos;
- secretos necesarios sin valores reales;
- fallback manual;
- rollback;
- riesgo de proveedor;
- evidencia requerida para avanzar a `sandbox_ready` o `active`.

El catálogo puede permanecer vacío en Sprint 0. Lo que queda prohibido es iniciar la primera integración real sin contrato machine-readable previo.
