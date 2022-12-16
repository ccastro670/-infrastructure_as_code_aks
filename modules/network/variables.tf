variable "resource_group_name_vnet" {
  type    = string  
  description = "Name azure Resource group for the vnet."
}

variable "location" {
  type    = string 
  description = "Location of the resources."
}


variable "virtual_network_name" {
  type    = string
  description = "Virtual network name"  
}

variable "virtual_network_address_prefix" {
  type    = string
  description = "VNET address prefix"  
}

variable "aks_subnet_name" {
   type    = string
  description = "Subnet name aks."  
}

variable "aks_subnet_address_prefix" {
  type    = list(any)
  description = "Subnet address prefix aks." 
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the AKS cluster resources"
}
