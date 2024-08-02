variable "alerts" {
  type = map(object({
    policy=object({
    name = string
    incident_preference = string
    })
    
    conditions = map(object({
    account_id = number
    
    type = string
    name = string
    description = string
    runbook_url = string
    enabled = bool
    violation_time_limit_seconds = number
    fill_option = string
    fill_value = number
    aggregation_window = number
    aggregation_method = string
    aggregation_delay = number
    expiration_duration = number
    open_violation_on_expiration = bool
    close_violations_on_expiration = bool
    slide_by = number
    query = string
    critical = bool
    warning = bool
    warning_operator = string
    warning_threshold_duration = number
    warning_threshold_occurrence = string 
    warning_threshold = number
    critical_operator = string
    critical_threshold_duration = number
    critical_threshold_occurrence = string 
    critical_threshold = number
    }))
  }))
}


variable "dashboards" {
  description = "Map of dashboards with their respective pages and widgets"
  type = map(object({
    name        = string
    description = string
    pages       = map(object({
      name    = string
      widgets = map(object({
        type     = string
        title    = string
        row      = number
        column   = number
        settings = map(any)
      }))
    }))
  }))
}




