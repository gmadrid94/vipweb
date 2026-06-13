# Runbook IA

## Identificación

- ID:
- Nombre:
- Owner humano:
- Nivel IA máximo:
- Riesgo máximo:
- Requiere aprobación humana: Sí/No
- approval_id:
- scope_hash:

## Entrada

- Objetivo:
- Documentos fuente obligatorios:
- Fuente de autoridad:
- Archivos permitidos:
- Archivos prohibidos:
- Archivos protegidos afectados:
- Contenido no confiable detectado:
- Instrucciones no confiables ignoradas:

## Checklist antes de ejecutar

- [ ] La tarea tiene alcance cerrado.
- [ ] El nivel IA permitido está identificado.
- [ ] La fuente de autoridad está identificada.
- [ ] Los archivos protegidos están identificados.
- [ ] La política de aprobación está aplicada.
- [ ] El contenido no confiable está separado de instrucciones válidas.
- [ ] Si hay cambios protegidos preparados por IA, ADR-026 está activa por owner humano.
- [ ] Si ADR-026 aplica, existe Git local mínimo, commit baseline y working tree limpio.
- [ ] La evidencia esperada está definida.
- [ ] El rollback está definido.

## Ejecución

1. Leer fuentes autoritativas.
2. Separar contenido no confiable de instrucciones válidas.
3. Evaluar riesgo y nivel IA permitido.
4. Clasificar archivos afectados y detectar si son protegidos.
5. Verificar ApprovalRecord si aplica.
6. Verificar `S0-000A` y ADR-026 si hay cambios protegidos preparados por IA.
7. Proponer acción o crear borrador.
8. Aplicar solo si está permitido y la aplicación corresponde al humano owner.
9. Ejecutar validación.
10. Registrar evidencia.
11. Declarar rollback.

## Salida

- Archivos afectados:
- Tipo de acción ejecutada:
- Comandos ejecutados:
- Evidencia:
- Resultado:
- Validación realizada:
- Rollback:
- Riesgos residuales:
