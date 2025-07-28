
resource "azurerm_firewall_policy" "AzfwPolicy" {
  for_each = var.AzfwPolicy_variables

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  sku                      = each.value.sku
  # threat_intelligence_mode = each.value.threat_intelligence_mode

  # dns {
  #   servers       = each.value.dns_servers
  #   proxy_enabled = each.value.proxy_enabled
  # }

}