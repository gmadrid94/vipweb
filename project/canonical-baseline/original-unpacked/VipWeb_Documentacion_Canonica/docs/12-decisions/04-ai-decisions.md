# Decisiones de IA, seguridad, calidad y documentación

| ID | Decisión | Resultado cerrado |
| --- | --- | --- |
| ADR-004 | Identidad, roles y permisos base | VipWeb tendrá autenticación básica, roles, permisos explícitos, guards y auditoría desde el primer desarrollo funcional. |
| ADR-005 | Modelo de autonomía IA operativa | VipWeb arrancará con IA-0, preparará IA-1 y permitirá IA-2 solo con permisos, auditoría, tests, rollback local y aprobación. IA-3 queda para escalado futuro e IA-4 no se aprueba para el inicio. |
| ADR-007 | Canon documental y fuente de verdad | VipWeb usará documentación modular como fuente principal, ADRs como máxima autoridad para decisiones críticas y catálogos machine-readable para IA y scripts. |
| ADR-009 | Sistema Doctor, evidencias y validación real | VipWeb tendrá Doctor, evidencias y estados estrictos. Ningún bloque se marcará como validated sin pruebas, reporte o evidencia. |
| ADR-020 | Testing y criterios de calidad | VipWeb usará tests unitarios, integración, contratos, permisos, eventos, gamificación, IA guardrails, documentación y UX básica. Lo crítico tendrá cobertura fuerte. |
| ADR-028 | Runbooks IA machine-readable | Los runbooks IA operativos tienen catálogo JSON validable con permisos, acciones prohibidas, ApprovalRecord, evidencias, tests y fallback. |
