
# ADR-027 — Contratos de lectura cross-module

## Estado

Aceptada.

## Contexto

VipWeb ya protege escrituras mutables mediante contratos de acción y `data_write`, pero las lecturas de entidades ajenas también pueden generar acoplamiento silencioso si quedan implícitas.

## Decisión

Toda entidad declarada en `data.read_entities` cuyo `owner_module` pertenezca a otro módulo debe tener un contrato `dependency_contracts.kind = data_read` en `machine/modules.json`.

El contrato debe declarar entidad, owner, propósito, campos permitidos, read model, permiso o contexto, redacción, fallback, evidencia, check Doctor y política de acceso IA.

## Consecuencias

- Ningún módulo puede leer tablas ajenas por convención informal.
- Doctor valida la existencia y completitud del contrato.
- La IA no puede recibir datos ajenos sin contrato compatible.
- Se reduce el riesgo de rediseño por dependencias invisibles.

## Documentos afectados

- `machine/modules.json`
- `machine/schemas/module.schema.json`
- `docs/04-architecture/03-module-contracts.md`
- `docs/05-domain-data/05-data-governance.md`
- `docs/05-domain-data/07-cross-module-read-contracts.md`
- `machine/doctor_checks.json`
