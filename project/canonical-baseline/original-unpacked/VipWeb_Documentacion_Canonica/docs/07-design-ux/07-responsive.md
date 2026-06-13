# 07 Responsive

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/screen_responsive_behavior.json`.

## Estrategia

MVP debe funcionar en desktop, tablet y mobile sin crear productos separados. AppShell adapta navegación, panel de progreso, panel IA y módulos visibles. Cada pantalla MVP declara comportamiento específico por breakpoint antes de implementación visual.

## Reglas generales

- Mobile prioriza siguiente paso, progreso y acciones principales.
- Desktop puede mostrar panel lateral, progreso y módulos relacionados.
- Ninguna acción crítica debe quedar oculta solo por breakpoint.
- Tablas administrativas deben degradar a tarjetas o listas en mobile.
- Paneles IA/progreso pueden colapsarse, pero no bloquear acciones principales.
- Toda pantalla MVP debe existir en `machine/screen_responsive_behavior.json`.

## Matriz responsive MVP

| Pantalla | Mobile | Tablet | Desktop |
|---|---|---|---|
| public_entry | single_column_entry: value_statement, login_cta | centered_entry_with_context: value_statement, login_cta | two_column_public_entry: value_statement, login_cta |
| login | single_card_centered: login_form, password_recovery, submit_action | centered_card_with_context: login_form, submit_action | two_column_auth: login_form, submit_action |
| onboarding | single_step: current_step, progress_indicator, continue_action | step_plus_summary: current_step, continue_action | stepper_with_side_panel: current_step, stepper, continue_action |
| dashboard | single_column: next_step, progress_summary, module_cards | two_column_adaptive: next_step, progress_summary | app_shell_with_side_panel: next_step, module_grid |
| profile | single_column_sections: profile_sections, save_action | form_plus_summary: profile_form, save_action | wide_form_with_context_panel: profile_form, save_action |
| notifications | single_column_cards: notification_cards, mark_read_action | list_with_top_filters: notification_list | list_with_filter_panel: notification_table_or_list |
| admin | read_only_cards: admin_summary_cards | grouped_cards_and_compact_tables: admin_groups | admin_shell_with_tables: admin_tables |
| doctor_evidence | status_first_cards: overall_status, failed_checks_cards | checks_grouped_by_layer: overall_status, checks_groups | table_plus_metadata_panel: checks_table, overall_status |
| modules_catalog | single_column_cards: module_cards, next_step | two_column_adaptive: module_cards_grid | grid_with_context_panel: module_grid |
| progress | single_column_progress: current_progress, next_step | two_column_progress: progress_summary, next_step | dashboard_panel_layout: progress_summary, achievement_grid |
| ai_workspace | single_column_readonly: ai_status, suggestions | two_column_readonly: suggestions, drafts | workspace_with_guardrail_panel: suggestions, drafts, context_summary |

## Criterios de validación

Doctor valida `RESPONSIVE_BEHAVIOR_EXISTS_FOR_ALL_MVP_SCREENS`, `RESPONSIVE_BREAKPOINTS_ARE_COMPLETE`, `RESPONSIVE_CRITICAL_ACTIONS_ARE_VISIBLE`, `ADMIN_TABLES_DEGRADE_ON_MOBILE` y `RESPONSIVE_SCHEMA_VALID`.
