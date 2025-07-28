resource "azurerm_public_ip" "publicip" {
  for_each            = var.publicip_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  allocation_method   = each.value.allocation_method
  zones               = each.value.zones
}