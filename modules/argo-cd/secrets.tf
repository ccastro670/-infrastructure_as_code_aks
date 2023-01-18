resource "kubernetes_secret" "github_oauth" {
  metadata {
    name = var.github_secret_name
    namespace = var.argocd_namespace
    labels = {
      "app.kubernetes.io/part-of" = "argocd"
    }
  }

  data = {
    "github.client.id" = var.github_oauth_client_id
    "github.client.secret" = var.github_oauth_client_secret
  }

  type = "Opaque"
}
