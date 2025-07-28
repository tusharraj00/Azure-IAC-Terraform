output "vnetid_output" {
  value = [
    azurerm_virtual_network.vnet["spoke1-vnet"].id,
    azurerm_virtual_network.vnet["hub-vnet"].id
  ]
}
