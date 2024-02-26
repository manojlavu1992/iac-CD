# # Contains variable declarations.

variable "resource_group_name" {
  description = "name of Azure Resource Group."
  default     = "IaC-ClearD-Internal-Resource-Group"
}

variable "location" {
  description = "The region where the resources are located"
  default     = "Canada Central"
}

variable "tags" {
  description = "Tags to be associated with the Azure Resource Group"
  default     = {
    environment = "Dev-&-QA"
  }
}

variable "vnet_name" {
  description = "The name of the virtual network"
  default     = "IaC-ClearD-Internal-Virtual-Network"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  default     = "172.17.0.0/16"
}

variable "num_public_subnets" {
  description = "Number of public subnets"
  default     = 3
}

variable "num_private_subnets" {
  description = "Number of private subnets"
  default     = 10
}