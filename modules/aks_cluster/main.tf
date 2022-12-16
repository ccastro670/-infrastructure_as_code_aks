resource "azurerm_resource_group" "rgaksgitops" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aksgitops" {
  name                = var.aks_name
  location            = var.location
  dns_prefix          = var.aks_dns_prefix
  node_resource_group = var.node_rg_aks
  resource_group_name = var.resource_group_name
  http_application_routing_enabled = var.http_application_routing_enabled
  private_cluster_enabled = var.private_cluster_enabled
  kubernetes_version = var.kubernetes_version  
  sku_tier = var.sku_tier
  role_based_access_control_enabled = var.role_based_access_control_enabled
  tags = var.tags
  

  default_node_pool {
    name                  = var.agents_pool_name
    node_count            = var.aks_agent_count
    vm_size               = var.aks_agent_vm_size
    os_disk_size_gb       = var.aks_agent_os_disk_size
    os_disk_type          = var.aks_agent_os_disk_type
    vnet_subnet_id        = var.vnet_subnet_id
    max_pods              = var.agents_max_pods
    #availability_zones    = var.aks_availability_zones
    enable_auto_scaling   = var.enable_auto_scaling
    min_count             = var.agents_min_count
    max_count             = var.agents_max_count
    orchestrator_version  = var.kubernetes_version
    tags = var.tags
    
  upgrade_settings {
    max_surge = var.max_surge_nodepool
    ## or max_surge = 50%
  }

  #lifecycle {
  #  ignore_changes = [node_count]
  #}

  }  

dynamic "identity" {
    for_each = var.client_id == "" || var.client_secret == "" ? ["identity"] : []

    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }
  network_profile {
    network_plugin     = var.aks_network_plugin
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
    load_balancer_sku  = var.aks_load_balancer_sku
    network_policy     = var.aks_network_policy
  }  
}

resource "azurerm_kubernetes_cluster_node_pool" "argocdnode" {
  name                  = var.agents_pool_name_gitops
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aksgitops.id
  vm_size               = var.aks_argo_vm_size
  node_count            = var.aks_argo_count
  os_disk_size_gb       = var.aks_agent_os_disk_size
  os_disk_type          = var.aks_agent_os_disk_type
  node_labels           = var.aks_agent_labels
  node_taints           = var.aks_agent_taints
  mode                  = var.aks_mode_nodepool_user
  max_pods              = var.gents_max_pods_argocd
  os_type               = var.aks_nodepool_os_type_linux
  vnet_subnet_id        = var.vnet_subnet_id
  availability_zones    = var.aks_availability_zones
  enable_auto_scaling   = var.enable_auto_scaling
  min_count             = var.agents_min_count_argocd
  max_count             = var.agents_max_count_argocd
  orchestrator_version  = var.kubernetes_version
  tags = var.tags

upgrade_settings {
    max_surge = var.max_surge_nodepool
    ## or max_surge = 50%
  }

lifecycle {
    ignore_changes = [node_count]
  }
}
