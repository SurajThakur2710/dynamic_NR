#---------------------------------------------------------Alerts-------------------------------------------------------------------------------------
alerts = {
  frontend_policy = {
    policy = {
      name                = "Frontend Policy"
      incident_preference = "PER_POLICY"
    }
    conditions = {
      frontend_condition_1 = {
        account_id                     = 4438269
        type                           = "static"
        name                           = "Frontend Condition 1"
        description                    = "Condition for frontend metric 1."
        runbook_url                    = "http://example.com/frontend-runbook-1"
        enabled                        = true
        violation_time_limit_seconds   = 3600
        fill_option                    = "static"
        fill_value                     = 0
        aggregation_window             = 60
        aggregation_method             = "EVENT_FLOW"
        aggregation_delay              = 120
        expiration_duration            = 50
        open_violation_on_expiration   = true
        close_violations_on_expiration = true
        slide_by                       = 50
        query                          = "SELECT count(*) FROM Transaction WHERE appName = 'FrontendApp'"
        critical                       = true
        warning                        = true
        warning_operator               = "above"
        warning_threshold_duration     = 300
        warning_threshold_occurrence   = "all"
        warning_threshold              = 10
        critical_operator              = "above"
        critical_threshold_duration    = 300
        critical_threshold_occurrence  = "all"
        critical_threshold             = 20
      },
      frontend_condition_2 = {
        account_id                     = 4438269
        type                           = "static"
        name                           = "Frontend Condition 2"
        description                    = "Condition for frontend metric 2."
        runbook_url                    = "http://example.com/frontend-runbook-2"
        enabled                        = true
        violation_time_limit_seconds   = 3600
        fill_option                    = "static"
        fill_value                     = 0
        aggregation_window             = 60
        aggregation_method             = "EVENT_FLOW"
        aggregation_delay              = 120
        expiration_duration            = 50
        open_violation_on_expiration   = true
        close_violations_on_expiration = true
        slide_by                       = 50
        query                          = "SELECT average(duration) FROM Transaction WHERE appName = 'FrontendApp'"
        critical                       = true
        warning                        = true
        warning_operator               = "above"
        warning_threshold_duration     = 300
        warning_threshold_occurrence   = "all"
        warning_threshold              = 5
        critical_operator              = "above"
        critical_threshold_duration    = 300
        critical_threshold_occurrence  = "all"
        critical_threshold             = 10
      },
      frontend_condition_3 = {
        account_id                     = 4438269
        type                           = "static"
        name                           = "Frontend Condition 3"
        description                    = "Condition for frontend metric 3."
        runbook_url                    = "http://example.com/frontend-runbook-3"
        enabled                        = true
        violation_time_limit_seconds   = 3600
        fill_option                    = "static"
        fill_value                     = 0
        aggregation_window             = 60
        aggregation_method             = "EVENT_FLOW"
        aggregation_delay              = 120
        expiration_duration            = 50
        open_violation_on_expiration   = true
        close_violations_on_expiration = true
        slide_by                       = 50
        query                          = "SELECT percentile(duration, 95) FROM Transaction WHERE appName = 'FrontendApp'"
        critical                       = true
        warning                        = true
        warning_operator               = "above"
        warning_threshold_duration     = 300
        warning_threshold_occurrence   = "all"
        warning_threshold              = 2
        critical_operator              = "above"
        critical_threshold_duration    = 300
        critical_threshold_occurrence  = "all"
        critical_threshold             = 5
      }
    }
  },
  backend_policy = {
    policy = {
      name                = "Backend Policy"
      incident_preference = "PER_POLICY"
    }
    conditions = {
      backend_condition_1 = {
        account_id                     = 4438269
        type                           = "static"
        name                           = "Backend Condition 1"
        description                    = "Condition for backend metric 1."
        runbook_url                    = "http://example.com/backend-runbook-1"
        enabled                        = true
        violation_time_limit_seconds   = 7200
        fill_option                    = "none"
        fill_value                     = 0
        aggregation_window             = 120
        aggregation_method             = "EVENT_FLOW"
        aggregation_delay              = 60
        expiration_duration            = 50
        open_violation_on_expiration   = false
        close_violations_on_expiration = false
        slide_by                       = 100
        query                          = "SELECT count(*) FROM Transaction WHERE appName = 'BackendApp'"
        critical                       = true
        warning                        = false
        warning_operator               = "below"
        warning_threshold_duration     = 600
        warning_threshold_occurrence   = "at_least_once"
        warning_threshold              = 100
        critical_operator              = "below"
        critical_threshold_duration    = 600
        critical_threshold_occurrence  = "at_least_once"
        critical_threshold             = 50
      },
      backend_condition_2 = {
        account_id                     = 4438269
        type                           = "static"
        name                           = "Backend Condition 2"
        description                    = "Condition for backend metric 2."
        runbook_url                    = "http://example.com/backend-runbook-2"
        enabled                        = true
        violation_time_limit_seconds   = 7200
        fill_option                    = "none"
        fill_value                     = 0
        aggregation_window             = 120
        aggregation_method             = "EVENT_FLOW"
        aggregation_delay              = 60
        expiration_duration            = 50
        open_violation_on_expiration   = false
        close_violations_on_expiration = false
        slide_by                       = 100
        query                          = "SELECT average(duration) FROM Transaction WHERE appName = 'BackendApp'"
        critical                       = true
        warning                        = false
        warning_operator               = "below"
        warning_threshold_duration     = 600
        warning_threshold_occurrence   = "at_least_once"
        warning_threshold              = 200
        critical_operator              = "below"
        critical_threshold_duration    = 600
        critical_threshold_occurrence  = "at_least_once"
        critical_threshold             = 100
      },
      backend_condition_3 = {
        account_id                =   4438269
        type                           = "static"
        name                           = "Backend Condition 3"
        description                    = "Condition for backend metric 3."
        runbook_url                    = "http://example.com/backend-runbook-3"
        enabled                        = true
        violation_time_limit_seconds   = 7200
        fill_option                    = "none"
        fill_value                     = 0
        aggregation_window             = 120
        aggregation_method             = "EVENT_FLOW"
        aggregation_delay              = 60
        expiration_duration            = 50
        open_violation_on_expiration   = false
        close_violations_on_expiration = false
        slide_by                       = 100
        query                          = "SELECT percentile(duration, 95) FROM Transaction WHERE appName = 'BackendApp'"
        critical                       = true
        warning                        = false
        warning_operator               = "below"
        warning_threshold_duration     = 600
        warning_threshold_occurrence   = "at_least_once"
        warning_threshold              = 300
        critical_operator              = "below"
        critical_threshold_duration    = 600
        critical_threshold_occurrence  = "at_least_once"
        critical_threshold             = 200
      }
    }
  }
}

#---------------------------------------------------------Dashboards---------------------------------------------------------------------------------
dashboards = {
  "dashboard_1" = {
    name        = "Dashboard 1"
    description = "HotelBooking-Dynamic-Dash"
    pages = {
      "page_1" = {
        name = "Browser"
        widgets = {
          "widget_1" = {
            type     = "nrql"
            title    = "NRQL Widget"
            row      = 1
            column   = 1
            settings = {
              query      = "SELECT average(newrelic.timeslice.value) AS 'Ajax/ResponseTime' FROM Metric WHERE metricTimesliceName = 'Ajax/ResponseTime' AND `entity.guid` IN ('NDQzODI2OXxCUk9XU0VSfEFQUExJQ0FUSU9OfDEzODYxODk1NTg') FACET `entity.guid`"
              account_id = 4438269
            }
          }
         
          "widget_3" = {
            type     = "line"
            title    = "Line Chart"
            row      = 2
            column   = 1
            settings = {
              query      = "SELECT count(newrelic.timeslice.value) AS 'Browser/Apdex' FROM Metric WHERE metricTimesliceName = 'Browser/Apdex' AND `entity.guid` IN ('NDQzODI2OXxCUk9XU0VSfEFQUExJQ0FUSU9OfDEzODYxODk1NTg') FACET `entity.guid`"
              account_id = 4438269
            }
          }
          "widget_4" = {
            type     = "bar"
            title    = "Bar Chart"
            row      = 2
            column   = 2
            settings = {
              query      = "SELECT rate(count(*), 1 minute) FROM PageView WHERE entityGuid IN ('NDQzODI2OXxCUk9XU0VSfEFQUExJQ0FUSU9OfDEzODYxODk1NTg') FACET appName"
              account_id = 4438269
            }
          }
        }
      }
      "page_2" = {
        name = "APM"
        widgets = {
          "widget_5" = {
            type     = "pie"
            title    = "Pie Chart"
            row      = 1
            column   = 1
            settings = {
              query      = "SELECT (count(apm.service.error.count) / count(apm.service.transaction.duration)) * 100 AS 'Error %' FROM Metric WHERE entity.guid IN ('NDQzODI2OXxBUE18QVBQTElDQVRJT058MTM2NzMyMzg0Mg') FACET appName"
              account_id = 4438269
            }
          }
          "widget_6" = {
            type     = "table"
            title    = "Table Chart"
            row      = 1
            column   = 2
            settings = {
              query      = "SELECT average(apm.service.transaction.duration) * 1000 AS 'Response time (ms)' FROM Metric WHERE entity.guid IN ('NDQzODI2OXxBUE18QVBQTElDQVRJT058MTM2NzMyMzg0Mg') FACET appName"
              account_id = 4438269
            }
          }
          "widget_7" = {
            type     = "area"
            title    = "Area Chart"
            row      = 2
            column   = 1
            settings = {
              query      = "SELECT average(`apm.key.transaction.duration`) FROM Metric WHERE `entity.guid` IN ('NDQzODI2OXxBUE18QVBQTElDQVRJT058MTM2NzMyMzg0Mg') FACET `entity.guid`"
              account_id = 4438269
            }
          }
          "widget_8" = {
            type     = "heatmap"
            title    = "Heatmap"
            row      = 2
            column   = 2
            settings = {
              query      = "SELECT count(*) FROM Transaction FACET appName SINCE 1 day ago"
              account_id = 4438269
            }
          }
        }
      }
    }
  }
}





