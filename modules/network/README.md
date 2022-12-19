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
| [azurerm_resource_group.rg_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.akssubnetgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.aksvnetgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_subnet_address_prefix"></a> [aks\_subnet\_address\_prefix](#input\_aks\_subnet\_address\_prefix) | Subnet address prefix aks. | `string` | `""` | no |
| <a name="input_aks_subnet_name"></a> [aks\_subnet\_name](#input\_aks\_subnet\_name) | Subnet name aks. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources. | `string` | n/a | yes |
| <a name="input_resource_group_name_vnet"></a> [resource\_group\_name\_vnet](#input\_resource\_group\_name\_vnet) | Name azure Resource group for the vnet. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the AKS cluster resources | `map(string)` | n/a | yes |
| <a name="input_virtual_network_address_prefix"></a> [virtual\_network\_address\_prefix](#input\_virtual\_network\_address\_prefix) | VNET address prefix | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Virtual network name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space_subnet"></a> [address\_space\_subnet](#output\_address\_space\_subnet) | n/a |
| <a name="output_address_space_vnet"></a> [address\_space\_vnet](#output\_address\_space\_vnet) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
<!-- END_TF_DOCS -->