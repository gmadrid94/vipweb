# VipWeb — Documentación canónica

Este paquete contiene la documentación canónica vigente de VipWeb para construir el proyecto desde Sprint 0.

## Estado operativo

- **documentation_baseline:** `1.0`
- **Estado final:** `READY_FOR_SPRINT_0`
- **Estado no alcanzado:** `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`
- **Uso previsto:** ejecutar Sprint 0 en entorno local WAMP, validar runtime, base de datos, migraciones, seeds y evidencias locales antes de iniciar desarrollo visible.

`READY_FOR_SPRINT_0` no equivale a `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

El desarrollo visible de Dashboard, Onboarding, UI visible, módulos funcionales, integraciones reales e IA operativa avanzada queda bloqueado hasta completar Sprint 0 con ejecución local real y confirmación humana del gate correspondiente.

## Fuentes canónicas principales

1. `CURRENT_STATUS.md`: estado operativo, restricciones y lectura del paquete.
2. `docs/00-foundation/`: visión, alcance, núcleo y criterios de decisión.
3. `docs/01-business/` y `docs/02-product/`: propuesta de valor, usuarios, MVP y capas de producto.
4. `docs/03-functional/`: requisitos, reglas funcionales, criterios de aceptación y contratos de acción.
5. `docs/04-architecture/`: arquitectura, módulos, contratos e integraciones.
6. `docs/05-domain-data/`: modelo de datos, entidades, relaciones, eventos y gobierno de datos.
7. `docs/06-technical/`: stack, estructura, seguridad, testing, observabilidad, despliegue local y runtime.
8. `docs/07-design-ux/`: navegación, pantallas, componentes, estados, accesibilidad y responsive.
9. `docs/09-ai-operations/`: modelo operativo IA, permisos, guardrails, runbooks y política de aprobación.
10. `docs/10-roadmap/` y `docs/11-backlog/`: roadmap, backlog y Sprint 0 ejecutable.
11. `database/`: migraciones, rollbacks, seeds y manifest técnico de artefactos SQL.
12. `machine/`: contratos y catálogos machine-readable vigentes.
13. `evidence/sprint-0-local-execution.md`: registro operativo pendiente de ejecución local real.


## Validador actual y contrato Doctor

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

Doctor permanece como módulo, catálogo y contrato runtime futuro en `machine/doctor_checks.json`; los checks realmente emitidos hoy por `scripts/update_script.py` están catalogados explícitamente. `update_script.py` no modifica archivos ni genera evidencia.

## Cómo validar la documentación

```bash
python scripts/update_script.py
```

El script valida estructura, JSON, schemas machine-readable listados, referencias internas, identidad de proyecto, checksums SQL, ausencia de nomenclatura retirada y estado operativo. No modifica archivos ni genera evidencia.

## Cómo empezar

1. Leer `CURRENT_STATUS.md`.
2. Revisar `docs/00-foundation/99-ready-to-build-status.md`.
3. Ejecutar Sprint 0 desde `docs/11-backlog/06-sprint-0-ejecutable.md`.
4. Completar `evidence/sprint-0-local-execution.md` con evidencia local real.
5. Ejecutar `python scripts/update_script.py`.
6. Mantener bloqueado el desarrollo visible hasta cerrar Sprint 0.

## Restricciones activas

- No iniciar UI visible antes de completar Sprint 0.
- No iniciar Dashboard, Onboarding, módulos funcionales, integraciones reales ni IA operativa avanzada antes del gate operativo posterior a Sprint 0.
- No declarar migraciones ni seeds como ejecutados hasta validación local real.
- El seed local owner contiene placeholders por seguridad y debe sustituirse localmente antes de desarrollo visible.
- La documentación canónica está lista; la ejecución local todavía debe realizarse.
