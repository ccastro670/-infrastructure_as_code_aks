output "id" {
  value = module.aks_cluster.id
}

output "client_key" {
  value = module.aks_cluster.client_key
  sensitive = true
}

output "client_certificate" {
  value = module.aks_cluster.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value = module.aks_cluster.cluster_ca_certificate
  sensitive = true
}

output "kube_config" {
  value     =  module.aks_cluster.kube_config
  sensitive = true
}

output "host" {
  value = module.aks_cluster.host
  sensitive = true
}

output "virtual_network_name" {
  value = module.aks_network.virtual_network_name
}

output "address_space_vnet" {
  value = module.aks_network.address_space_vnet
}

output "vnet_id" {
  value = module.aks_network.vnet_id
}
output "subnet" {
  value = module.aks_network.subnet
}

output "subnet_id" {
  value = module.aks_network.subnet_id
}

output "address_space_subnet" {
  value = module.aks_network.address_space_subnet
}

output "key_vault_name" {
  value = module.aks_key_vault.key_vault_name
}

output "key_vault_id" {
  value = module.aks_key_vault.key_vault_id
}

output "key_vault_uri" {
  value = module.aks_key_vault.key_vault_uri
}