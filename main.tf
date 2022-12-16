module "aks_network" {
  source = "./network"

  resource_group_name_vnet       = var.resource_group_name_vnet
  location                       = var.location
  virtual_network_name           = var.virtual_network_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  aks_subnet_name                = var.aks_subnet_name
  aks_subnet_address_prefix      = var.aks_subnet_address_prefix
  tags                           = var.tags

}

module "aks_cluster" {
  source = "./aks_cluster"

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
  tags                       = var.tags 
  depends_on                 = [module.aks_network]


}

module "aks_ingress_controller" {
  source = "./ingress-controller"
  
  version_release_ingress   = var.version_release_ingress
  application_name_ingress  = var.application_name_ingress
  chart_name_ingress        = var.chart_name_ingress
  namespace_name_ingress    = var.namespace_name_ingress
  create_namespace_ingress  = var.create_namespace_ingress
  depends_on                 = [module.aks_cluster]
}