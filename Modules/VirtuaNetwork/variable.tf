variable "vnet_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"

  type = map(object({
    vnet_name           = string
    vnet_location       = string
    vnet_address_space  = list(string)
    resource_group_name = string
  }))
}