terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.36.0"
    }
  }  
  #backend "azurerm" {
  #  resource_group_name  = "RG-AZ-STORAGE_ACC"
  #  storage_account_name = "terraform0003"
  #  container_name       = "tfstateaksmodule"
  #  key                  = "aksmodule.terraform.tfstate"
  #}
}

provider "azurerm" {
  features {}
  
}