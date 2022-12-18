variable "resource_group_name_key_vault" {
  type    = string  
  description = "Name azure Resource group for the key_vault."
}

variable "location" {
  type    = string 
  description = "Location of the resources."
}

variable "key_vault_name_aks" {
  type    = string
  description = "Key Vault name"  
}

variable "sku_name_key_vault" {
  type    = string
  description = "SKU azure key vault"  
}

variable "enabled_for_disk_encryption_vault" {
   type    = bool
  description = "Enabled for disk encryption vault."  
}
variable "soft_delete_retention_days" {
  type    = number
  description = "Soft delete retention days key vault."   
}

variable "purge_protection_enabled" {
  type    = bool
  description = "Purge protection enabled key vault."   
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the AKS cluster resources"
}
