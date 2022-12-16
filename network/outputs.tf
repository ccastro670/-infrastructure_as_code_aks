output "vnet" {
  value = azurerm_virtual_network.aksvnetgitops.name
}

output "address_space_vnet" {
  value = azurerm_virtual_network.aksvnetgitops.address_space
}

output "subnet" {
  value = azurerm_subnet.akssubnetgitops.name
}

output "subne_id" {
  value = azurerm_subnet.akssubnetgitops.id
}

output "address_space_vnet" {
  value = azurerm_subnet.akssubnetgitops.address_prefixes
}

