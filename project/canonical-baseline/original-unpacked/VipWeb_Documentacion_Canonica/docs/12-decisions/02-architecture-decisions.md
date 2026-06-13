# Decisiones de arquitectura y técnica

| ID | Decisión | Resultado cerrado |
| --- | --- | --- |
| ADR-001 | Definición del núcleo común | VipWeb usará un núcleo común mínimo, modular y agnóstico, encargado solo de identidad, sesión, permisos base, navegación global, configuración común, registro de módulos, contratos, eventos, auditoría, observabilidad y documentación operativa para IA. |
| ADR-002 | Modelo modular del ecosistema | VipWeb crecerá por módulos independientes conectados al núcleo mediante manifiestos, contratos, eventos y permisos. Ningún módulo dependerá de la implementación interna de otro. |
| ADR-003 | Stack inicial reversible | VipWeb se implementará inicialmente con PHP 8.4+, MySQL/MariaDB, PDO, HTML, CSS y JavaScript vanilla, pero se documentará como ecosistema modular web con primera implementación en PHP/MySQL, no como producto definido por el stack. |
| ADR-006 | Modelo de dominio, datos y eventos | VipWeb diseñará primero entidades, relaciones, eventos y reglas de dominio; después migraciones físicas. |
| ADR-015 | Estrategia de integraciones externas | VipWeb tendrá arquitectura de integración desde el inicio, pero el MVP no dependerá de proveedores externos críticos. |
| ADR-021 | Entorno local Windows/WAMP y recuperación manual | VipWeb se desarrollará inicialmente en Windows con WAMP, sin Git ni despliegue externo. La protección operativa será mediante copias completas, exportaciones SQL, Doctor, evidencias y evidence/sprint-0-local-execution.md. |
| ADR-025 | Orden final de implementación técnica | VipWeb se implementará en local WAMP siguiendo este orden: backup, estructura, documentación, catálogos, scripts, configuración, migraciones, seeds, core, identidad/permisos, admin, dashboard, onboarding, perfil/notificaciones, gamificación, IA, integraciones, validación. |
| ADR-027 | Contratos de lectura cross-module | Toda lectura de entidades propiedad de otro módulo requiere contrato data_read con owner, campos permitidos, permiso, redacción, fallback, evidencia y Doctor. |
