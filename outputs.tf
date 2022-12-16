output "id" {
  value = azurerm_kubernetes_cluster.aksgitops.id
}

output "client_key" {
  value = azurerm_kubernetes_cluster.aksgitops.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aksgitops.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aksgitops.kube_config.0.cluster_ca_certificate
}

output "host" {
  value = azurerm_kubernetes_cluster.aksgitops.kube_config.0.host
}