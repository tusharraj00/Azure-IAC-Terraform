variable "resourcegroup_variables" {
  description = "Map of resource group variables"
  type = map(object({
    resource_group_name     = string
    resource_group_location = string
    # resource_group_tags     = map(string)
  }))
  default = {}
}



variable "vnet_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"

  type = map(object({
    vnet_name           = string
    vnet_location       = string
    vnet_address_space  = list(string)
    resource_group_name = string
  }))
}

variable "subnet_variables" {
  description = "Map of subnet objects. name, address_prefixes, and delegation supported"

  type = map(object({
    name                    = string
    resource_group_name     = string
    subnet_address_prefixes = list(string)
    virtual_network_name    = string
  }))
}

variable "acr_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  }))
}

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


variable "AzfwPolicy_variables" {
  description = "Map of Azure Firewall Policy variables"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    sku                      = string
    # threat_intelligence_mode = string
    # proxy_enabled            = bool
    # dns_servers              = list(string)
  }))
  default = {}

}

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


variable "firewall_variables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    sku_tier            = string
    ip_config_name      = string
    subnet_name         = string
    vnet_name           = string
    vnet_rg             = string
    pip_name            = string
    pip_rg              = string
    fw_policy_name      = string
    fw_policy_rg        = string
    zones               = list(string)
  }))
  default = {}
}


variable "bastionhost_variables" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name = string
    sku                    = string
    ip_config_name        = string
    subnet_name           = string
    vnet_name             = string
    pip_name              = string
  }))
  default = {}
}