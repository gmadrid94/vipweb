# ADR-030 — Modelo de ejecución AI-first con tools externas locales

**Estado:** Aceptada  
**Área:** IA/Operación local/Roadmap  
**Bloqueante:** Sí  
**Recomendación:** Ejecutar el roadmap mediante GPT + Codex + tools externas locales, con Git obligatorio en el repo oficial, backups externos y logs revisables.

## Contexto

El owner quiere que el roadmap esté diseñado para ejecución 100% asistida por IA, entendiendo por IA la combinación práctica de chats GPT, Codex y tools ejecutables por el owner cuando la IA no pueda operar directamente sobre el entorno local.

Hay operaciones que GPT/Codex no pueden hacer por sí solos:

- consultar WAMP real;
- ejecutar comandos en Windows local;
- crear backups físicos;
- exportar SQL local;
- ejecutar migraciones/seeds contra MySQL/MariaDB local;
- comprobar exposición real de carpetas por Apache;
- obtener logs reales de ejecución.

## Decisión

VipWeb adoptará un modelo de ejecución local AI-first:

```txt
GPT analiza, planifica y revisa.
Codex prepara cambios dentro del repo oficial cuando el gate lo permita.
Tools externas ejecutan operaciones locales reales mediante .bat/.cmd.
El owner humano lanza tools, aporta secretos localmente, aprueba gates y registra evidencia.
```

La estructura local canónica es:

```txt
C:/wamp64/www/
  vipweb/          # proyecto oficial, repo Git, APP_ROOT
  vipweb_backups/  # backups externos del proyecto
  vipweb_tools/    # tools externas de ejecución del roadmap
    logs/          # logs por ejecución
```

`C:/wamp64/www/vipweb/tools` sigue existiendo y queda reservado para tools internas del producto. No compite con `C:/wamp64/www/vipweb_tools`.

## Public root

El owner ha declarado que WAMP ya está configurado para servir:

```txt
C:/wamp64/www/vipweb/public
```

Sprint 0 debe verificar y preservar esta configuración.

## Git

`C:/wamp64/www/vipweb` debe estar enlazado a Git en el modelo AI-first.

Git no sustituye backups, export SQL, Doctor/validador ni evidencia. Añade diff, baseline y control de cambios para modificaciones preparadas por IA.

ADR-026 sigue regulando la activación verificable del gate para aplicar cambios protegidos preparados por IA. ADR-030 no autoriza a la IA a inventar commit baseline, ApprovalRecord ni activación humana.

## Logs externos

Cada tool externa debe generar una carpeta única por ejecución:

```txt
C:/wamp64/www/vipweb_tools/logs/YYYY-MM-DD_HHMMSS__TASK-ID__tool-name/
```

Los logs anteriores no se eliminan automáticamente y pueden ser leídos por futuras tools como contexto operativo.

## Consecuencias

- El roadmap debe indicar qué hace GPT, qué hace Codex y qué hace una tool externa.
- Sprint 0 debe registrar logs externos relevantes en evidencia.
- Las fases que requieran acceso local real deben tener tool `.bat/.cmd` o contrato equivalente.
- `vipweb_tools` no debe exponer secretos ni escribir fuera de raíces permitidas.
- Las tools no validan estados humanos ni desbloquean desarrollo visible por sí mismas.

## Dependencias

- ADR-003
- ADR-005
- ADR-007
- ADR-009
- ADR-021
- ADR-024
- ADR-026
- ADR-029

## Documentos afectados

- `CURRENT_STATUS.md`
- `docs/06-technical/02-project-structure.md`
- `docs/06-technical/08-deployment.md`
- `docs/06-technical/10-wamp-local-workflow.md`
- `docs/06-technical/12-external-roadmap-tools.md`
- `docs/09-ai-operations/11-ai-first-execution-model.md`
- `docs/10-roadmap/09-ai-first-roadmap-execution.md`
- `docs/11-backlog/06-sprint-0-ejecutable.md`
- `machine/external_tool_contracts.json`

## Riesgos mitigados o residuales

- Riesgo mitigado: roadmap dependiente de acciones manuales no especificadas.
- Riesgo mitigado: falta de logs verificables para GPT.
- Riesgo mitigado: confusión entre tools internas y externas.
- Riesgo residual: una tool local puede fallar por diferencias del entorno Windows/WAMP real.
- Riesgo residual: logs pueden contener datos sensibles si una tool está mal diseñada; deben filtrarse y tratarse como contexto no confiable.

## Criterio de validación

- Existe contrato machine-readable de tools externas.
- Sprint 0 referencia logs externos donde aplica.
- `CURRENT_STATUS.md` declara raíces externas y public root.
- `vipweb_tools/logs` existe en el paquete de instalación o se crea mediante bootstrap.
- GPT revisa logs antes de avanzar gates.
