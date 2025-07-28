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