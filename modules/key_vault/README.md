<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.36.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.aks_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/key_vault) | resource |
| [azurerm_resource_group.rg_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled_for_disk_encryption_vault"></a> [enabled\_for\_disk\_encryption\_vault](#input\_enabled\_for\_disk\_encryption\_vault) | Enabled for disk encryption vault. | `bool` | n/a | yes |
| <a name="input_key_vault_name_aks"></a> [key\_vault\_name\_aks](#input\_key\_vault\_name\_aks) | Key Vault name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources. | `string` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Purge protection enabled key vault. | `bool` | n/a | yes |
| <a name="input_resource_group_name_key_vault"></a> [resource\_group\_name\_key\_vault](#input\_resource\_group\_name\_key\_vault) | Name azure Resource group for the key\_vault. | `string` | n/a | yes |
| <a name="input_sku_name_key_vault"></a> [sku\_name\_key\_vault](#input\_sku\_name\_key\_vault) | SKU azure key vault | `string` | n/a | yes |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Soft delete retention days key vault. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the AKS cluster resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | n/a |
<!-- END_TF_DOCS -->