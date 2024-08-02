variable "dashboard" {
  type = map(object({
    name = string
    permissions = string

    pages = map(object({
      name = string

      widget = list(object({
        type  = string
        title = string
        x     = number
        y     = number
        width = number
        height= number
      }))
    }))
  }))
}