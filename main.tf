module "Policy" {
  source = "./modules/alert_policy"
  policies = {for x,y in var.alerts: x=> y.policy}
}

module "condition" {
  source = "./modules/alert_conditions"
    conditions = merge([
    for policy_key, policy in var.alerts : {
      for condition_key, condition in policy.conditions : 
        condition_key => merge(
          condition,
          {
            policy_id = module.Policy.policy_id[policy_key]
          }
        )
    }
  ]...)
}

module "dashboard" {
  source = "./modules/Dashboards"
  dashboards = var.dashboards
}




