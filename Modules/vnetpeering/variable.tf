variable "vnet_peering_variables" {
  description = "Map of VNet peering configurations"
  type = map(object({
    vnet_name              = string
    resource_group_name    = string
    remote_virtual_network = string
    remote_resource_group  = string
    allow_gateway_transit  = optional(bool, false)
    use_remote_gateways    = optional(bool, false)
  }))
}
