data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg_key_vault" {
  name     = var.resource_group_name_key_vault
  location = var.location
}

resource "azurerm_key_vault" "aks_key_vault" {
  name                        = var.key_vault_name_aks
  location                    = var.location
  resource_group_name         = var.resource_group_name_key_vault
  enabled_for_disk_encryption = var.enabled_for_disk_encryption_vault
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name_key_vault
  tags                        = var.tags
  depends_on = [azurerm_resource_group.rg_key_vault]

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "Create",
      "Delete",
      "Encrypt",
      "List",
      "Import",
    ]
    certificate_permissions = [
      "Get",
      "Create",
      "Delete",
      "Update",
      "List",
      "Import",
    ]
 
    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete",
    ]    
  }
}