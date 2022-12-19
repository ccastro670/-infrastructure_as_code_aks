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

