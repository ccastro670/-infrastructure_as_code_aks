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
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aksgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.argocdnode](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_resource_group.rgaksgitops](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/resource_group) | resource |
| [local_file.kube_config_raw_aks](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

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
| <a name="input_aks_agent_taints"></a> [aks\_agent\_taints](#input\_aks\_agent\_taints) | (Optional) A map of Kubernetes taints which should be applied to nodes in the Default Node Pool. | `list(string)` | n/a | yes |
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
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | (Optional) The Client ID (appId) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | (Optional) The Client Secret (password) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable node pool autoscaling | `bool` | n/a | yes |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Enable HTTP Application Routing Addon (forces recreation). | `bool` | n/a | yes |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`(to enable both). If `UserAssigned` or `SystemAssigned, UserAssigned` is set, an `identity_ids` must be set as well. | `string` | `"SystemAssigned"` | no |
| <a name="input_key_vault_secrets_provider_enabled"></a> [key\_vault\_secrets\_provider\_enabled](#input\_key\_vault\_secrets\_provider\_enabled) | (Optional) Whether to use the Azure Key Vault Provider for Secrets Store CSI Driver in an AKS cluster. For more details: https://docs.microsoft.com/en-us/azure/aks/csi-secrets-store-driver | `bool` | `true` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources. | `string` | n/a | yes |
| <a name="input_max_surge_nodepool"></a> [max\_surge\_nodepool](#input\_max\_surge\_nodepool) | The max surge value may be customized per node pool to enable a trade-off between upgrade speed and upgrade disruption. | `number` | n/a | yes |
| <a name="input_node_rg_aks"></a> [node\_rg\_aks](#input\_node\_rg\_aks) | Resource Group name Node AKS | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | If true cluster API server will be exposed only on internal IP address and available only in cluster vnet. | `bool` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name azure Resource group for aks. | `string` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Enable Role Based Access Control. | `bool` | n/a | yes |
| <a name="input_secret_rotation_enabled"></a> [secret\_rotation\_enabled](#input\_secret\_rotation\_enabled) | Is secret rotation enabled? This variable is only used when `key_vault_secrets_provider_enabled` is `true` and defaults to `false` | `bool` | `true` | no |
| <a name="input_secret_rotation_interval"></a> [secret\_rotation\_interval](#input\_secret\_rotation\_interval) | The interval to poll for secret rotation. This attribute is only set when `secret_rotation` is `true` and defaults to `2m` | `string` | `"2m"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are `Free` and `Paid` | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the AKS cluster resources | `map(string)` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
<!-- END_TF_DOCS -->