variable "version_release_ingress" {
  type        = string  
}

variable "application_name_ingress" {
  type    = string  
}

variable "chart_name_ingress" {
  type    = string  
}

variable "namespace_name_ingress" {
  type    = string 
}

variable "create_namespace_ingress" {
  type    = bool  
}

variable "repository" {
  description = "Helm repository"
  type        = string
}