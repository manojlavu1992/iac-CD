variable "resource_group_name" {
  description = "The name of the resource group where the virtual network will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual network will be deployed."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network to be created."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network, in CIDR notation."
  type        = string
}

variable "num_public_subnets" {
  description = "The number of public subnets to create within the virtual network."
  type        = number
}

variable "num_private_subnets" {
  description = "The number of private subnets to create within the virtual network."
  type        = number
}
