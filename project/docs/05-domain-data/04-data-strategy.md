# 04 Data Strategy

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Objetivo

Garantizar que el modelo de datos inicial permite identidad, permisos, módulos, eventos, auditoría, evidencias, IA, UX y gamificación sin rediseños tempranos.

## Fuente canónica

| Elemento | Fuente |
|---|---|
| Entidades | `machine/entities.json` |
| Eventos | `machine/events.json` |
| Permisos | `machine/permissions.json` |
| Módulos | `machine/modules.json` |
| Trazabilidad | `machine/traceability_matrix.json` |

## Estrategia MVP

1. Crear primero tablas core: usuarios, roles, permisos, módulos, eventos, auditoría, configuración y evidencias.
2. Añadir tablas MVP: perfil/contexto, onboarding, progreso, logros, notificaciones, IA e integraciones stub.
3. No crear tablas de proveedores externos reales en MVP.
4. Versionar eventos desde el primer diseño.
5. Mantener `DomainEvent`, `AuditLog`, `EvidenceReport` y `AIActionLog` como registros no destructivos.

## Reglas de migración

- Una migración no puede introducir entidad ausente en `machine/entities.json`.
- Una migración no puede crear columna sensible sin política de retención.
- Todo cambio de entidad debe actualizar trazabilidad.
- Toda tabla core requiere rollback documentado.
- Todo seed de permisos debe ser reproducible.
## Regla de prevalencia física

`machine/column_contracts.json` representa el DDL final de columnas. `machine/physical_constraints_matrix.json` valida relaciones físicas y debe coincidir con el DDL en `foreign_key`, `nullable`, `required`, `index_required` y `db_on_delete`. La política lógica de aplicación se declara por separado en `application_delete_policy` y no debe interpretarse como constraint SQL.

Cuando una relación sea polimórfica, `target_type + target_id` puede no declarar FK rígida en `references`; en ese caso `db_on_delete = NO_PHYSICAL_FK`, mientras la nullability de `target_id` debe seguir coincidiendo con `column_contracts.json`. Doctor valida esta regla con `FK_NULLABILITY_MATCHES_PHYSICAL_CONSTRAINTS`, `POLYMORPHIC_RELATIONS_DO_NOT_DECLARE_CONFLICTING_NULLABILITY`, `DELETE_POLICY_FIELDS_ARE_SEPARATED` y `DB_ON_DELETE_MATCHES_DDL`.

## Contrato de migraciones reversibles

Las migraciones WAMP se declaran en `machine/migration_contracts.json`. Cada entrada debe tener `up_ref`, `rollback_ref` separado bajo `database/rollbacks/`, checksum obligatorio y ledger local mediante `schema_migrations`. En Sprint 0 sin datos reales se permite rollback SQL directo; con datos reales futuros se usará migración compensatoria o restauración aprobada.

## Contrato canónico de checksum

Todo checksum usado en migraciones, rollbacks, evidencias y artifacts técnicos debe cumplir este contrato:

- algoritmo: `SHA-256`;
- formato: hexadecimal lowercase;
- longitud: 64 caracteres;
- entrada: bytes exactos del artifact final persistido;
- encoding para archivos de texto nuevos: UTF-8 sin BOM;
- salt: no permitido;
- normalización posterior al cálculo: no permitida.

Para artifacts JSON generados por scripts, el contenido debe serializarse de forma canónica antes de persistirse y calcularse:

- claves ordenadas;
- `ensure_ascii=false`;
- indentación estable de 2 espacios;
- salto final de línea.

Para SQL, el checksum se calcula sobre el archivo `.sql` final guardado en disco, sin reordenar sentencias ni normalizar el contenido.

Cuando el payload o entidad lo permita, debe registrarse además `checksum_algorithm = sha256`.

## Manifest de integridad SQL


### Ledger físico `schema_migrations`

El ledger local de migraciones es una tabla técnica obligatoria del entorno WAMP. Debe existir antes de ejecutar migraciones funcionales y debe registrar como mínimo `migration_id`, `up_ref`, `rollback_ref`, `checksum`, `checksum_algorithm`, `applied_at`, `applied_by`, `status` y `evidence_ref`.

El manifest SQL verifica integridad física de archivos; `schema_migrations` verifica estado aplicado en base local. Ambos son necesarios y no se sustituyen entre sí.

`database/manifest.json` registra la integridad física de `database/migrations/*.sql`, `database/rollbacks/*.sql` y `database/seeds/*.sql`. Cada entrada debe declarar ruta, tipo de artefacto, orden si aplica, algoritmo `sha256`, checksum lowercase, estado de artefacto y contrato fuente.

Doctor valida que el manifest cubre todos los SQL físicos, que no declara artefactos inexistentes y que cada hash coincide con los bytes exactos persistidos.

## Evidencia con manifest externo

Las evidencias canónicas no deben incluir un checksum autorreferencial dentro del propio archivo. La integridad de `evidence/sprint-0-local-execution.md` y de su reporte fechado se registra en `evidence/sprint-0-local-execution.md`, validado por `machine/schemas/evidence-manifest.schema.json`.

## Enforcement de constraints de dominio

Fuente canónica: `machine/domain_constraints_enforcement_matrix.json`.

No todas las reglas de dominio deben vivir en la base de datos. Cada constraint relevante debe declarar explícitamente dónde se aplica:

- **DB:** `NOT NULL`, FK, unique, tipo físico o `CHECK` si el target MySQL/MariaDB lo soporta de forma consistente.
- **Aplicación:** servicios, handlers, policies o `ApprovalService` que validan reglas runtime.
- **Doctor:** validación documental/machine-readable, coherencia cruzada y fixtures.

Regla: ninguna constraint crítica debe quedar solo en texto narrativo. Si una regla es crítica, debe tener enforcement fuerte en DB, aplicación o ambos, y Doctor debe comprobar que el contrato sigue declarado.

La gamificación persistente inaugura esta matriz: progreso, logros y cooldowns MVP requieren `user_id NOT NULL`; los eventos sin usuario resoluble son auditables, pero no generan estado gamificado persistente. La misma regla se aplica a contexto y onboarding persistentes del MVP: `UserContext` y `OnboardingSession` requieren usuario provisionado/autenticado, `user_id NOT NULL` y DCE propia (`DCE-009`/`DCE-010`). El onboarding persistente anónimo y el contexto persistente anónimo quedan fuera de alcance hasta ADR específica.
