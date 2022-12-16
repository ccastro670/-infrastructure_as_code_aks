terraform {

  required_version = ">=0.12"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-AZ-STORAGE_ACC"
    storage_account_name = "terraform0003"
    container_name       = "tfstateaksmodule"
    key                  = "aksmodule.terraform.tfstate"
  }
}
provider "helm" {
  kubernetes {
    host = "module.aks_cluster.host"
    client_certificate = "base64decode(module.aks_cluster.client_certificate)"
    client_key = "base64decode(module.aks_cluster.client_key)"
    cluster_ca_certificate = "base64decode(module.aks_cluster.cluster_ca_certificate)"
  }
}