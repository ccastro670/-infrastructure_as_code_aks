variable "version_release_argocd" {
  type        = string  
}

variable "application_name_argocd" {
  type    = string  
}

variable "chart_name_argocd" {
  type    = string  
}

variable "namespace_name_argocd" {
  type    = string 
}

variable "create_namespace_argocd" {
  type    = bool  
}

variable "repository_argocd" {
  description = "Helm repository"
  type        = string
}

variable "github_secret_name" {
  type        = string
  default = "github-entp"
}

variable "argocd_namespace" {
  type        = string
  default = "argocd"
}

variable "github_oauth_client_id" {
  type = string
  sensitive = true
  default = "bf1fc8b395531c0fbb5c"
}

variable "github_oauth_client_secret" {
  type = string
  sensitive = true
  default = "6afe87efd68b8f79ca84b6371f26505bb8f1821c"
}
