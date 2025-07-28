data "azurerm_public_ip" "pip" {
  for_each            = var.bastionhost_variables
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_subnet" "subnet" {
  for_each             = var.bastionhost_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_bastion_host" "bastionhost" {
  for_each            = var.bastionhost_variables
  name                = each.value.name
  location            = each.value.location
  sku                  = each.value.sku 
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_config_name
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}