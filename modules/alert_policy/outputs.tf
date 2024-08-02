output "policy_id" {
  value = {for id, x in newrelic_alert_policy.Policy : id=>x.id}
}