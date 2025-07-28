resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_variables
  name                = each.value.vnet_name
  location            = each.value.vnet_location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.vnet_address_space

}