data "azurerm_public_ip" "pip" {
  for_each            = var.firewall_variables
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.firewall_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_firewall_policy" "fwpolicy" {
  for_each            = var.firewall_variables
  name                = each.value.fw_policy_name
  resource_group_name = each.value.fw_policy_rg

}

resource "azurerm_firewall" "firewall" {
  for_each            = var.firewall_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier
  zones               = each.value["zones"]
  firewall_policy_id  = data.azurerm_firewall_policy.fwpolicy[each.key].id

  ip_configuration {
    name                 = each.value.ip_config_name
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}