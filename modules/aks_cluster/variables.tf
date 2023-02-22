variable "resource_group_name" {
  type = string  
  description = "Name azure Resource group for aks."
}
variable "location" {
  type = string  
  description = "Location of the resources."
}
variable "aks_name" {
  type = string
  description = "AKS cluster name"  
}

variable "node_rg_aks" {
  type = string
  description = "Resource Group name Node AKS"
  
}

variable "aks_dns_prefix" {
  type = string
  description = "Optional DNS prefix to use with hosted Kubernetes API server FQDN." 
}

variable "aks_agent_os_disk_type" {
  type = string
  description = " The type of disk which should be used for the Operating System." 
}
variable "aks_agent_os_disk_size" {
  type        = number
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize." 
}

variable "aks_agent_count" {
  type        = number
  description = "The number of agent nodes for the cluster." 
}

variable "aks_argocd_count" {
  type        = number
  description = "The number of agent nodes for the cluster." 
}

variable "aks_agent_vm_size" {
  type = string
  description = "VM size"  
}

variable "aks_gitops_vm_size" {
  type = string
  description = "VM size"  
}
variable "kubernetes_version" {
  type = string
  description = "Kubernetes version"  
}

variable "aks_service_cidr" {
  type = string
  description = "CIDR notation IP range from which to assign service cluster IPs"  
}

variable "aks_dns_service_ip" {
  type = string
  description = "DNS server IP address" 
}

variable "aks_docker_bridge_cidr" {
  type = string
  description = "CIDR notation IP for Docker bridge."  
}

#variable "aks_availability_zones" {
#  type        = list(string)
#  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created." 
#}

variable "aks_agent_labels" {
  type        = map(string)
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created."  
}

variable "aks_agent_taints" {
  type        = list(string)
  description = "(Optional) A map of Kubernetes taints which should be applied to nodes in the Default Node Pool." 
}

variable "agents_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"  
}

variable "agents_max_pods" {
  type        = number
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created." 
}

variable "agents_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool" 
}

variable "agents_pool_name" {
  type        = string
  description = "The default Azure AKS agentpool (nodepool) name."    
}

variable "agents_pool_name_gitops" {
  type        = string
  description = "Name nodepool Gitops"  
}

variable "vnet_subnet_id" {
  type        = string
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."  
}

variable "sku_tier" {
  type        = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are `Free` and `Paid`" 
}

variable "private_cluster_enabled" {
  type        = bool
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet." 
}

variable "identity_type" {
  type        = string
  description = "(Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`(to enable both). If `UserAssigned` or `SystemAssigned, UserAssigned` is set, an `identity_ids` must be set as well."
  default     = "SystemAssigned"

  validation {
    condition     = var.identity_type == "SystemAssigned" || var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned"
    error_message = "`identity_type`'s possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`(to enable both)."
  }
}

variable "max_surge_nodepool" {
  type        = number
  description = "The max surge value may be customized per node pool to enable a trade-off between upgrade speed and upgrade disruption."    
}

variable "agents_max_count_argocd" {
  type        = number
  description = "Maximum number of nodes in a pool"  
}

variable "agents_max_pods_argocd" {
  type        = number
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created." 
}

variable "agents_min_count_argocd" {
  type        = number
  description = "Minimum number of nodes in a pool" 
}

variable "http_application_routing_enabled" {
  type        = bool
  description = "Enable HTTP Application Routing Addon (forces recreation)."  
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable node pool autoscaling"  
}

variable "client_id" {
  type        = string
  description = "(Optional) The Client ID (appId) for the Service Principal used for the AKS deployment"
  default     = ""  
}

variable "client_secret" {
  type        = string
  description = "(Optional) The Client Secret (password) for the Service Principal used for the AKS deployment"
  default     = ""  
}

variable "aks_load_balancer_sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are `basic` and `standard`. Defaults to `standard`. Changing this forces a new kubernetes cluster to be created." 
}

variable "aks_network_policy" {
  type        = string
  description = "Azure's own implementation, called Azure Network Policy Manager (NPM)."  
}

variable "aks_network_plugin" {
  type        = string
  description = "Azure Container Networking Interface (CNI), every pod gets an IP address from the subnet and can be accessed directly." 
}

variable "role_based_access_control_enabled" {
  type        = bool
  description = "Enable Role Based Access Control."  
}

variable "aks_mode_nodepool_user" {
  type        = string
  description = "Nodepool mode system or User" 
}

variable "aks_mode_nodepool_system" {
  type        = string
  description = "Nodepool mode system or User" 
}

variable "aks_nodepool_os_type_linux" {
  type        = string
  description = "OS type of Nodepool" 
}

variable "tags" { 
  type        = map(string)
  description = "Any tags that should be present on the AKS cluster resources"
}

variable "key_vault_secrets_provider_enabled" {
  type        = bool
  description = "(Optional) Whether to use the Azure Key Vault Provider for Secrets Store CSI Driver in an AKS cluster. For more details: https://docs.microsoft.com/en-us/azure/aks/csi-secrets-store-driver"
  default     = true
  nullable    = false
}

variable "secret_rotation_enabled" {
  type        = bool
  description = "Is secret rotation enabled? This variable is only used when `key_vault_secrets_provider_enabled` is `true` and defaults to `false`"
  default     = true
  nullable    = false
}

variable "secret_rotation_interval" {
  type        = string
  description = "The interval to poll for secret rotation. This attribute is only set when `secret_rotation` is `true` and defaults to `2m`"
  default     = "2m"
  nullable    = false
}

variable "kube_config_path" {
  type    = string
  description = "kubeconfig path helm authentication"  
}

variable "appgw_subnet_id" {
  type    = string
  description = "Subnet id appgw"  
}

variable "gateway_id" {
  type    = string
  description = "Appgw id" 
}
