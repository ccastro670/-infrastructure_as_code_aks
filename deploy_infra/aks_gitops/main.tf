module "aks_network" {
  source = "../../modules/network"

  resource_group_name_vnet       = var.resource_group_name_vnet
  location                       = var.location
  virtual_network_name           = var.virtual_network_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  aks_subnet_name                = var.aks_subnet_name
  aks_subnet_address_prefix      = var.aks_subnet_address_prefix 
  tags                           = var.tags
}

module "aks_cluster" {
  source = "../../modules/aks_cluster"
  depends_on = [module.aks_network]

  resource_group_name        = var.resource_group_name
  location                   = var.location
  aks_name                   = var.aks_name
  node_rg_aks                = var.node_rg_aks
  kubernetes_version         = var.kubernetes_version
  aks_dns_prefix             = var.aks_dns_prefix
  aks_load_balancer_sku      = var.aks_load_balancer_sku
  sku_tier                   = var.sku_tier
  private_cluster_enabled    = var.private_cluster_enabled
  aks_service_cidr           = var.aks_service_cidr
  aks_dns_service_ip         = var.aks_dns_service_ip
  aks_docker_bridge_cidr     = var.aks_docker_bridge_cidr
  aks_network_plugin         = var.aks_network_plugin  
  agents_max_count_argocd    = var.agents_max_count_argocd
  aks_mode_nodepool_system   = var.aks_mode_nodepool_system
  max_surge_nodepool         = var.max_surge_nodepool
  aks_agent_count            = var.aks_agent_count
  aks_gitops_vm_size         = var.aks_gitops_vm_size
  vnet_subnet_id             = module.aks_network.subnet_id
  agents_max_pods_argocd     = var.agents_max_pods_argocd
  agents_pool_name_gitops    = var.agents_pool_name_gitops  
  agents_max_count           = var.agents_max_count
  aks_agent_os_disk_type     = var.aks_agent_os_disk_type 
  aks_argocd_count           = var.aks_argocd_count
  agents_min_count_argocd    = var.agents_min_count_argocd
  enable_auto_scaling        = var.enable_auto_scaling
  agents_min_count           = var.agents_min_count
  aks_agent_labels           = var.aks_agent_labels
  aks_agent_taints           = var.aks_agent_taints
  aks_network_policy         = var.aks_network_policy
  role_based_access_control_enabled = var.role_based_access_control_enabled
  aks_nodepool_os_type_linux = var.aks_nodepool_os_type_linux
  aks_agent_vm_size          = var.aks_agent_vm_size
  agents_pool_name           = var.agents_pool_name
  agents_max_pods            = var.agents_max_pods
  http_application_routing_enabled = var.http_application_routing_enabled
  aks_mode_nodepool_user     = var.aks_mode_nodepool_user
  aks_agent_os_disk_size     = var.aks_agent_os_disk_size 
  kube_config_path           = var.kube_config_path 
  tags                       = var.tags
}

module "aks_ingress_controller" {
  source = "../../modules/ingress-controller"
  depends_on                = [module.aks_cluster]
  version_release_ingress   = var.version_release_ingress
  application_name_ingress  = var.application_name_ingress
  chart_name_ingress        = var.chart_name_ingress
  namespace_name_ingress    = var.namespace_name_ingress
  create_namespace_ingress  = var.create_namespace_ingress
  repository                = var.repository 
}

module "aks_gitops_argocd" {
  source = "../../modules/argo-cd"
  depends_on                  = [module.aks_ingress_controller]
  version_release_argocd      = var.version_release_argocd
  application_name_argocd     = var.application_name_argocd
  chart_name_argocd           = var.chart_name_argocd
  namespace_name_argocd       = var.namespace_name_argocd
  create_namespace_argocd     = var.create_namespace_argocd
  repository_argocd           = var.repository_argocd
  github_oauth_client_id      = var.github_oauth_client_id
  github_oauth_client_secret  = var.github_oauth_client_secret
}

module "aks_key_vault" {
  source = "../../modules/key_vault"
  depends_on                        = [module.aks_gitops_argocd]
  resource_group_name_key_vault     = var.resource_group_name_key_vault
  key_vault_name_aks                = var.key_vault_name_aks
  enabled_for_disk_encryption_vault = var.enabled_for_disk_encryption_vault
  soft_delete_retention_days        = var.soft_delete_retention_days
  purge_protection_enabled          = var.purge_protection_enabled
  sku_name_key_vault                = var.sku_name_key_vault
  location                          = var.location
  tags                              = var.tags 
}
