resource "newrelic_alert_policy" "Policy" {
  for_each = var.policies
  name = each.value.name
  incident_preference = each.value.incident_preference
}