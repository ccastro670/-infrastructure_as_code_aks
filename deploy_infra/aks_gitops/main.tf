module "aks_network" {
  source = "../../modules/network"

  resource_group_name_vnet       = var.resource_group_name_vnet
  location                       = var.location
  virtual_network_name           = var.virtual_network_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  aks_subnet_name                = var.aks_subnet_name
  aks_subnet_address_prefix      = var.aks_subnet_address_prefix  
}

module "aks_cluster" {
  source = "../../modules/aks_cluster"

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
  max_surge_nodepool         = var.aks_mode_nodepool_system
  aks_agent_count            = var.aks_agent_count
  aks_gitops_vm_size         = var.aks_gitops_vm_size
  vnet_subnet_id             = var.vnet_subnet_id
  agents_max_pods_argocd     = var.agents_max_pods_argocd
  aks_availability_zones     = var.aks_availability_zones
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
}

module "aks_ingress_controller" {
  source = "../../modules/ingress-controller"
  
  version_release_ingress   = var.version_release_ingress
  application_name_ingress  = var.application_name_ingress
  chart_name_ingress        = var.chart_name_ingress
  namespace_name_ingress    = var.namespace_name_ingress
  create_namespace_ingress  = var.create_namespace_ingress 
}