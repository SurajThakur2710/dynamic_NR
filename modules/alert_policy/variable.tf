variable "policies" {
  type = map(object({
    name = string
    incident_preference = string
  }))
}