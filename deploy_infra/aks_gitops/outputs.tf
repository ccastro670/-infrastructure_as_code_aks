output "id" {
  value = module.aks_cluster.id
}

output "client_key" {
  value = module.aks_cluster.client_key
}

output "client_certificate" {
  value = module.aks_cluster.client_certificate
}

output "cluster_ca_certificate" {
  value = module.aks_cluster.cluster_ca_certificate
}

output "host" {
  value = module.aks_cluster.host
}