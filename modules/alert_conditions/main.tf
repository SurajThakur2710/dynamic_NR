resource "newrelic_nrql_alert_condition" "condition" {
  
  for_each =var.conditions
  account_id = each.value.account_id
  policy_id                      = each.value.policy_id
  type                           = each.value.type
  name                           = each.value.name
  description                    = each.value.description
  runbook_url                    = each.value.runbook_url
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by

  nrql {
    query = each.value.query
  }

  dynamic "critical" {
    for_each = each.value.critical ? [each.value]:[]
    content {
    operator              = each.value.critical_operator
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_threshold_duration
    threshold_occurrences = each.value.critical_threshold_occurrence
    }
  }
  dynamic "warning" {
    for_each = each.value.warning ? [each.value]:[]
    content{
    operator              = each.value.warning_operator
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.warning_threshold_duration
    threshold_occurrences = each.value.warning_threshold_occurrence
    }
    
  }
}

  
