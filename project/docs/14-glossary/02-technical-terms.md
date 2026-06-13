# 02 Technical Terms

| Término | Definición | Regla |
|---|---|---|
| Route Permission Matrix | Mapa ruta → método → permiso → roles → mutabilidad. | Toda ruta debe aparecer. |
| Module Schema | JSON Schema que valida manifiestos de módulos. | Debe validar objetos anidados. |
| Physical Constraints Matrix | Mapa relación → FK/índice/nullability/delete behavior. | Toda relación debe aparecer. |
| Rollback | Acción para desactivar, revertir o restaurar cambio. | Obligatorio en módulos y backlog. |
| Stub | Adaptador declarado sin proveedor real. | No usa secretos en MVP. |
| ApprovalService | Servicio runtime de `core.audit` que valida, consume y audita `ApprovalRecord`. | Toda acción con aprobación runtime debe usarlo. |
| Provisionamiento controlado | Alta interna de usuarios sin auto-registro público. | En MVP solo `owner` puede crear `registered_user` mediante `USER_PROVISION_CONTROLLED`. |
| Core Runtime Skeleton | Estructura mínima de clases, servicios y flujo de acción para iniciar programación PHP/WAMP. | Vive en `docs/06-technical/11-core-runtime-skeleton.md`. |
