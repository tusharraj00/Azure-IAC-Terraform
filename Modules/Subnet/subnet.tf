
resource "azurerm_subnet" "example" {
  for_each             = var.subnet_variables
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.subnet_address_prefixes
}