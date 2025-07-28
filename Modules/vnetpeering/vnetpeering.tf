data "azurerm_virtual_network" "remote_vnet" {
  for_each = var.vnet_peering_variables

  name                = each.value.remote_virtual_network
  resource_group_name = each.value.remote_resource_group
}

resource "azurerm_virtual_network_peering" "vnet_peering" {
  for_each = var.vnet_peering_variables

  name                      = "${each.value.vnet_name}-to-${each.value.remote_virtual_network}-peering"
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.remote_vnet[each.key].id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = each.value.allow_gateway_transit
  use_remote_gateways          = each.value.use_remote_gateways
}
