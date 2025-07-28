
variable "publicip_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    allocation_method   = string
    zones               = list(string)
  }))

}