resource "helm_release" "ingress_controller" {
name             = var.application_name_ingress
create_namespace = var.create_namespace_ingress
chart            = var.chart_name_ingress
namespace        = var.namespace_name_ingress
version          = var.version_release_ingress
repository       = "https://kubernetes.github.io/ingress-nginx"

values = [file("${path.module}/values-aks-ingress-nginx.yaml")]
}