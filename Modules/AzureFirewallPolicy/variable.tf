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