variable "subnet_variables" {
  description = "Map of subnet objects. name, address_prefixes, and delegation supported"

  type = map(object({
    name                    = string
    resource_group_name     = string
    subnet_address_prefixes = list(string)
    virtual_network_name    = string
  }))
}
  