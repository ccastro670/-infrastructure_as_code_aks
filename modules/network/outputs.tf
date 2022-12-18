output "virtual_network_name" {
  value = azurerm_virtual_network.aksvnetgitops.name
}

output "address_space_vnet" {
  value = azurerm_virtual_network.aksvnetgitops.address_space
}

output "vnet_id" {
  value = azurerm_virtual_network.aksvnetgitops.id
}
output "subnet" {
  value = azurerm_subnet.akssubnetgitops.name
}

output "subnet_id" {
  value = azurerm_subnet.akssubnetgitops.id
}

output "address_space_subnet" {
  value = azurerm_subnet.akssubnetgitops.address_prefixes
}

