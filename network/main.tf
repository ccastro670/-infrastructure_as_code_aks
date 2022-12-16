resource "azurerm_resource_group" "rg_vnet" {
  name     = var.resource_group_name_vnet
  location = var.location
}

resource "azurerm_virtual_network" "aksvnetgitops" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name_vnet
  address_space       = [var.virtual_network_address_prefix] 
  depends_on           = [azurerm_resource_group.rg_vnet]
  tags = var.tags
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_subnet" "akssubnetgitops" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name_vnet
  address_prefixes     = var.aks_subnet_address_prefix

  lifecycle {
    prevent_destroy = true
  }
}
