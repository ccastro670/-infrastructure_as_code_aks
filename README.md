# Terraform Deployment AKS Cluster & ArgoCD
Deployment AKS Cluster

This module creates an Azure Kubernetes Service cluster and installs an nginx ingress controller and deploys the GitOps ArgoCD application.
This module has integration with Azure Key Vault enabled.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.8.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.36.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |



## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks_cluster"></a> [aks\_cluster](#module\_aks\_cluster) | ../../modules/aks_cluster | n/a |
| <a name="module_aks_gitops_argocd"></a> [aks\_gitops\_argocd](#module\_aks\_gitops\_argocd) | ../../modules/argo-cd | n/a |
| <a name="module_aks_ingress_controller"></a> [aks\_ingress\_controller](#module\_aks\_ingress\_controller) | ../../modules/ingress-controller | n/a |
| <a name="module_aks_key_vault"></a> [aks\_key\_vault](#module\_aks\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_aks_network"></a> [aks\_network](#module\_aks\_network) | ../../modules/network | n/a |

## Resources

 Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aksgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.argocdnode](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_resource_group.rgaksgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/resource_group) | resource |
| [local_file.kube_config_raw_aks](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [azurerm_key_vault.aks_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/key_vault) | resource |
| [azurerm_resource_group.rg_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.akssubnetgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.aksvnetgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/virtual_network) | resource |
| [helm_release.ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agents_max_count"></a> [agents\_max\_count](#input\_agents\_max\_count) | Maximum number of nodes in a pool | `number` | n/a | yes |
| <a name="input_agents_max_count_argocd"></a> [agents\_max\_count\_argocd](#input\_agents\_max\_count\_argocd) | Maximum number of nodes in a pool | `number` | n/a | yes |
| <a name="input_agents_max_pods"></a> [agents\_max\_pods](#input\_agents\_max\_pods) | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | n/a | yes |
| <a name="input_agents_max_pods_argocd"></a> [agents\_max\_pods\_argocd](#input\_agents\_max\_pods\_argocd) | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | n/a | yes |
| <a name="input_agents_min_count"></a> [agents\_min\_count](#input\_agents\_min\_count) | Minimum number of nodes in a pool | `number` | n/a | yes |
| <a name="input_agents_min_count_argocd"></a> [agents\_min\_count\_argocd](#input\_agents\_min\_count\_argocd) | Minimum number of nodes in a pool | `number` | n/a | yes |
| <a name="input_agents_pool_name"></a> [agents\_pool\_name](#input\_agents\_pool\_name) | The default Azure AKS agentpool (nodepool) name. | `string` | n/a | yes |
| <a name="input_agents_pool_name_gitops"></a> [agents\_pool\_name\_gitops](#input\_agents\_pool\_name\_gitops) | Name nodepool Gitops | `string` | n/a | yes |
| <a name="input_aks_agent_count"></a> [aks\_agent\_count](#input\_aks\_agent\_count) | The number of agent nodes for the cluster. | `number` | n/a | yes |
| <a name="input_aks_agent_labels"></a> [aks\_agent\_labels](#input\_aks\_agent\_labels) | (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created. | `map(string)` | n/a | yes |
| <a name="input_aks_agent_os_disk_size"></a> [aks\_agent\_os\_disk\_size](#input\_aks\_agent\_os\_disk\_size) | Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize. | `number` | n/a | yes |
| <a name="input_aks_agent_os_disk_type"></a> [aks\_agent\_os\_disk\_type](#input\_aks\_agent\_os\_disk\_type) | The type of disk which should be used for the Operating System. | `string` | n/a | yes |
| <a name="input_aks_agent_taints"></a> [aks\_agent\_taints](#input\_aks\_agent\_taints) | (Optional) A map of Kubernetes Taints which should be applied to nodes in the Default Node Pool. | `list(string)` | n/a | yes |
| <a name="input_aks_agent_vm_size"></a> [aks\_agent\_vm\_size](#input\_aks\_agent\_vm\_size) | VM size | `string` | n/a | yes |
| <a name="input_aks_argocd_count"></a> [aks\_argocd\_count](#input\_aks\_argocd\_count) | The number of agent nodes for the cluster. | `number` | n/a | yes |
| <a name="input_aks_dns_prefix"></a> [aks\_dns\_prefix](#input\_aks\_dns\_prefix) | Optional DNS prefix to use with hosted Kubernetes API server FQDN. | `string` | n/a | yes |
| <a name="input_aks_dns_service_ip"></a> [aks\_dns\_service\_ip](#input\_aks\_dns\_service\_ip) | DNS server IP address | `string` | n/a | yes |
| <a name="input_aks_docker_bridge_cidr"></a> [aks\_docker\_bridge\_cidr](#input\_aks\_docker\_bridge\_cidr) | CIDR notation IP for Docker bridge. | `string` | n/a | yes |
| <a name="input_aks_gitops_vm_size"></a> [aks\_gitops\_vm\_size](#input\_aks\_gitops\_vm\_size) | VM size | `string` | n/a | yes |
| <a name="input_aks_load_balancer_sku"></a> [aks\_load\_balancer\_sku](#input\_aks\_load\_balancer\_sku) | (Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are `basic` and `standard`. Defaults to `standard`. Changing this forces a new kubernetes cluster to be created. | `string` | n/a | yes |
| <a name="input_aks_mode_nodepool_system"></a> [aks\_mode\_nodepool\_system](#input\_aks\_mode\_nodepool\_system) | Nodepool mode system or User | `string` | n/a | yes |
| <a name="input_aks_mode_nodepool_user"></a> [aks\_mode\_nodepool\_user](#input\_aks\_mode\_nodepool\_user) | Nodepool mode system or User | `string` | n/a | yes |
| <a name="input_aks_name"></a> [aks\_name](#input\_aks\_name) | AKS cluster name | `string` | n/a | yes |
| <a name="input_aks_network_plugin"></a> [aks\_network\_plugin](#input\_aks\_network\_plugin) | Azure Container Networking Interface (CNI), every pod gets an IP address from the subnet and can be accessed directly. | `string` | n/a | yes |
| <a name="input_aks_network_policy"></a> [aks\_network\_policy](#input\_aks\_network\_policy) | Azure's own implementation, called Azure Network Policy Manager (NPM). | `string` | n/a | yes |
| <a name="input_aks_nodepool_os_type_linux"></a> [aks\_nodepool\_os\_type\_linux](#input\_aks\_nodepool\_os\_type\_linux) | OS type of Nodepool | `string` | n/a | yes |
| <a name="input_aks_service_cidr"></a> [aks\_service\_cidr](#input\_aks\_service\_cidr) | CIDR notation IP range from which to assign service cluster IPs | `string` | n/a | yes |
| <a name="input_aks_subnet_address_prefix"></a> [aks\_subnet\_address\_prefix](#input\_aks\_subnet\_address\_prefix) | Subnet address prefix. | `string` | n/a | yes |
| <a name="input_aks_subnet_name"></a> [aks\_subnet\_name](#input\_aks\_subnet\_name) | Subnet Name. | `string` | n/a | yes |
| <a name="input_application_name_argocd"></a> [application\_name\_argocd](#input\_application\_name\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_application_name_ingress"></a> [application\_name\_ingress](#input\_application\_name\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_chart_name_argocd"></a> [chart\_name\_argocd](#input\_chart\_name\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_chart_name_ingress"></a> [chart\_name\_ingress](#input\_chart\_name\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | (Optional) The Client ID (appId) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | (Optional) The Client Secret (password) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_create_namespace_argocd"></a> [create\_namespace\_argocd](#input\_create\_namespace\_argocd) | n/a | `bool` | n/a | yes |
| <a name="input_create_namespace_ingress"></a> [create\_namespace\_ingress](#input\_create\_namespace\_ingress) | n/a | `bool` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable node pool autoscaling | `bool` | n/a | yes |
| <a name="input_enabled_for_disk_encryption_vault"></a> [enabled\_for\_disk\_encryption\_vault](#input\_enabled\_for\_disk\_encryption\_vault) | Enabled for disk encryption vault. | `bool` | n/a | yes |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Enable HTTP Application Routing Addon (forces recreation). | `bool` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kubernetes Cluster. | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`(to enable both). If `UserAssigned` or `SystemAssigned, UserAssigned` is set, an `identity_ids` must be set as well. | `string` | `"SystemAssigned"` | no |
| <a name="input_key_vault_name_aks"></a> [key\_vault\_name\_aks](#input\_key\_vault\_name\_aks) | Key Vault name | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources. | `string` | n/a | yes |
| <a name="input_max_surge_nodepool"></a> [max\_surge\_nodepool](#input\_max\_surge\_nodepool) | The max surge value may be customized per node pool to enable a trade-off between upgrade speed and upgrade disruption. | `number` | n/a | yes |
| <a name="input_namespace_name_argocd"></a> [namespace\_name\_argocd](#input\_namespace\_name\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_namespace_name_ingress"></a> [namespace\_name\_ingress](#input\_namespace\_name\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_node_rg_aks"></a> [node\_rg\_aks](#input\_node\_rg\_aks) | Resource Group name Node AKS | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | If true cluster API server will be exposed only on internal IP address and available only in cluster vnet. | `bool` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Purge protection enabled key vault. | `bool` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | Helm repository | `string` | n/a | yes |
| <a name="input_repository_argocd"></a> [repository\_argocd](#input\_repository\_argocd) | Helm repository | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name azure Resource group for aks. | `string` | n/a | yes |
| <a name="input_resource_group_name_key_vault"></a> [resource\_group\_name\_key\_vault](#input\_resource\_group\_name\_key\_vault) | Name azure Resource group for the key\_vault. | `string` | n/a | yes |
| <a name="input_resource_group_name_vnet"></a> [resource\_group\_name\_vnet](#input\_resource\_group\_name\_vnet) | Name azure Resource group for aks vnet. | `string` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Enable Role Based Access Control. | `bool` | n/a | yes |
| <a name="input_sku_name_key_vault"></a> [sku\_name\_key\_vault](#input\_sku\_name\_key\_vault) | SKU azure key vault | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are `Free` and `Paid` | `string` | n/a | yes |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Soft delete retention days key vault. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the AKS cluster resources | `map(string)` | n/a | yes |
| <a name="input_version_release_argocd"></a> [version\_release\_argocd](#input\_version\_release\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_version_release_ingress"></a> [version\_release\_ingress](#input\_version\_release\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_virtual_network_address_prefix"></a> [virtual\_network\_address\_prefix](#input\_virtual\_network\_address\_prefix) | VNET address prefix | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Virtual network name | `string` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space_subnet"></a> [address\_space\_subnet](#output\_address\_space\_subnet) | n/a |
| <a name="output_address_space_vnet"></a> [address\_space\_vnet](#output\_address\_space\_vnet) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
<!-- END_TF_DOCS -->
