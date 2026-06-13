# ADR-003 — Stack inicial reversible

**Estado:** Aceptada  
**Área:** Técnica  
**Bloqueante:** Sí  
**Recomendación:** Target PHP 8.4+, MySQL/MariaDB, PDO, HTML, CSS y JS vanilla sobre WAMP local, con mínimo operativo verificado en Sprint 0 mediante `php -v`.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb se implementará inicialmente con target PHP 8.4+, MySQL/MariaDB, PDO, HTML, CSS y JavaScript vanilla, pero se documentará como ecosistema modular web con primera implementación en PHP/MySQL, no como producto definido por el stack. El mínimo operativo de Sprint 0 será la versión PHP instalada en WAMP local y registrada en evidencia mediante `php -v`. Hasta verificar el entorno, no se usará sintaxis específica de PHP 8.4 ni features superiores a la versión mínima detectada.

## Motivo

El stack es simple, compatible con WAMP local, fácil de auditar por IA y reversible si se mantienen capas y adaptadores.

## Consecuencias

- La lógica de negocio no vive en controladores.
- La persistencia se encapsula.
- No se introduce framework pesado al inicio.

## Dependencias

- ADR-001
- ADR-002

## Documentos afectados

- `docs/06-technical/01-stack.md`
- `docs/06-technical/02-project-structure.md`

## Riesgos mitigados o residuales

- Monolito PHP si no se separan capas.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.

## Contrato de versiones runtime

- `runtime_target_php_version`: PHP 8.4+.
- `runtime_minimum_php_version`: versión instalada en WAMP local y registrada en evidencia durante Sprint 0.
- `runtime_verified_php_version`: valor de `php -v` capturado antes de escribir código runtime.
- Regla de compatibilidad: no usar sintaxis específica de PHP 8.4 ni features superiores al mínimo verificado hasta confirmar el entorno local.
