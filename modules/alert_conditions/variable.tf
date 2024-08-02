variable "conditions" {
  type = map(object({
  
  
    account_id                     = number
    policy_id                      = string
    type                           = string
    name                           = string
    description                    = string
    runbook_url                    = string
    enabled                        = bool
    violation_time_limit_seconds   = number
    fill_option                    = string
    fill_value                     = number
    aggregation_window             = number
    aggregation_method             = string
    aggregation_delay              = number
    expiration_duration            = number
    open_violation_on_expiration   = bool
    close_violations_on_expiration = bool
    slide_by                       = number
    query                          = string
    critical                       = bool
    warning                        = bool
    warning_operator               = string
    warning_threshold_duration     = number
    warning_threshold_occurrence   = string 
    warning_threshold              = number
    critical_operator              = string
    critical_threshold_duration    = number
    critical_threshold_occurrence  = string 
    critical_threshold             = number
}))
}
