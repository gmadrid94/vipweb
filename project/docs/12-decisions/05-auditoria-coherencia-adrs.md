# Coherencia cruzada de ADRs

**Resultado:** coherente.  
**Contradicciones abiertas:** 0.  
**Riesgos residuales:** controlados mediante backups locales, validación canónica, evidencias locales y documentación.

## Regla principal

La decisión ADR-021 establece el entorno local Windows/WAMP como flujo base. ADR-026 permanece como decisión propuesta condicional y se activa únicamente cuando un cambio protegido preparado por IA requiere baseline, diff, rollback, ApprovalRecord y evidencia.

## Matriz de impactos revisados

| ADR origen | ADR afectada | Resultado |
| --- | --- | --- |
| ADR-021 | ADR-003 | Compatible: WAMP local implementa el stack PHP/MySQL/PDO. |
| ADR-021 | ADR-008 | Compatible: el roadmap actual opera sobre entorno local y backup manual. |
| ADR-021 | ADR-020 | Compatible: testing y validación canónica se ejecutan localmente. |
| ADR-021 | ADR-024 | Compatible: Sprint 0 incluye backup local, registro de ejecución local y configuración WAMP. |
| ADR-021 | ADR-025 | Compatible: la primera fase técnica es protección local. |
| ADR-026 | ADR-021 | Compatible: Git local mínimo no sustituye WAMP/local; actúa solo como control obligatorio cuando se activa un trigger de cambios protegidos preparados por IA. |
| ADR-026 | ADR-005 | Compatible: limita acciones IA sensibles con baseline, diff, rollback y aprobación humana. |
| ADR-026 | ADR-024 | Compatible: `S0-000A` funciona como preflight condicional dentro de Sprint 0. |
| ADR-029 | ADR-007 | Compatible: mantiene el canon modular y machine-readable bajo `PROJECT_CONTROL_ROOT` sin alterar rutas internas relativas. |
| ADR-029 | ADR-021 | Compatible: adapta WAMP local a una raíz limpia con `public/`, `app/`, `config/`, `project/`, `tools/`, `logs/` y `tmp/`. |
| ADR-029 | ADR-024 | Compatible: Sprint 0 valida la estructura mediante `PROJECT_CLEAN_ROOT_LAYOUT_DECLARED`. |
| ADR-010 | ADR-006 | Compatible: gamificación consume eventos, no lógica interna. |
| ADR-010 | ADR-016 | Compatible: Dashboard muestra progreso, pero no contiene reglas de gamificación. |
| ADR-005 | ADR-004 | Compatible: IA tiene rol y permisos propios, no privilegios admin. |
| ADR-005 | ADR-009 | Compatible: IA no puede marcar validated sin evidencia. |
| ADR-015 | ADR-014 | Compatible: integraciones entran como capa/catálogo, no como dependencia externa real del MVP. |
| ADR-022 | ADR-003 | Compatible: UI inicial con HTML/CSS/JS vanilla. |
| ADR-023 | ADR-014 | Compatible: el catálogo de módulos materializa el MVP guiado. |
| ADR-019 | ADR-006 | Compatible: migraciones físicas derivan del dominio. |
| ADR-007 | ADR-009 | Compatible: documentación y machine-readable se validan con `scripts/update_script.py`. |
| ADR-012 | ADR-013 | Compatible: ecosistema modular escalable encaja con freemium modular progresivo. |

## Reglas vigentes

1. El roadmap se interpreta como roadmap local hasta que una ADR active otro entorno.
2. El rollback local se basa en restauración de carpeta y restauración SQL.
3. Sprint 0 debe empezar por backup local.
4. El registro operativo se centraliza en `evidence/sprint-0-local-execution.md`.
5. La validación canónica se ejecuta con `scripts/update_script.py` bajo `PROJECT_CONTROL_ROOT`.
6. El stack PHP/MySQL/PDO queda alineado con WAMP y con la separación `APP_ROOT` / `PROJECT_CONTROL_ROOT`.
7. No se introduce Git obligatorio universal, CI/CD, staging real ni producción remota en la fase actual.
8. Git local mínimo se activa si aplica un trigger ADR-026 antes de cambios protegidos preparados por IA.

## Veredicto

Las ADRs aceptadas son compatibles si se respetan estas reglas:

- no empezar por UI antes de Sprint 0;
- no introducir despliegue externo ni Git obligatorio universal en la fase actual;
- no conectar APIs externas críticas en MVP;
- no dar permisos administrativos a la IA;
- no marcar nada como `validated` sin evidencia;
- no introducir módulos fuera del catálogo MVP sin ADR nueva;
- activar `S0-000A` y Git local mínimo cuando un cambio protegido preparado por IA dispare ADR-026.
