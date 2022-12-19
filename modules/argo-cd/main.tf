resource "helm_release" "argocd" {
name             = var.application_name_argocd
create_namespace = var.create_namespace_argocd
chart            = var.chart_name_argocd
namespace        = var.namespace_name_argocd
version          = var.version_release_argocd
repository       = var.repository_argocd

values = [file("${path.module}/argocd-values.yaml")]

}

