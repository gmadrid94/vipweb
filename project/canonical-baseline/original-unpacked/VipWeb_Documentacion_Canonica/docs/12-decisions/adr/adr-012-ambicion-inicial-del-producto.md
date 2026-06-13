# ADR-012 — Ambición inicial del producto

**Estado:** Aceptada  
**Área:** Producto/Negocio  
**Bloqueante:** Sí  
**Recomendación:** Opción B confirmada por usuario.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb será un ecosistema modular escalable, inicialmente controlado, preparado para convertirse en plataforma comercial sin cargar el MVP con SaaS completo.

## Motivo

Equilibra visión ambiciosa y ejecución realista.

## Consecuencias

- Arquitectura escalable desde el inicio.
- No entran pagos ni soporte comercial en MVP.
- El modelo comercial puede activarse después.

## Dependencias

- ADR-001
- ADR-002

## Documentos afectados

- `docs/02-product/00-product-map.md`
- `docs/01-business/04-business-model.md`

## Riesgos mitigados o residuales

- Roadmap confuso si se tratara como herramienta personal o SaaS completo prematuro.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
