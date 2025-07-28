
resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
  lower   = true
}

resource "azurerm_container_registry" "acr" {
  for_each            = var.acr_variables
  name                = "${each.value.name}${random_string.random.result}"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  admin_enabled       = each.value.admin_enabled
  sku                 = each.value.sku
}