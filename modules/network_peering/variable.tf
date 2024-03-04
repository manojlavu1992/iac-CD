# Resource group
variable "resource_group_name" {
  description = "The name of the resource group where the virtual network will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual network will be deployed."
  type        = string
}

variable "tags" {
  description = "Tags to be associated with the Azure Resource Group"
  type = map(string)
}

# Virtual Network
variable "vnet_name" {
  description = "The name of the virtual network to be created."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network, in CIDR notation."
  type        = string
}

variable "private_subnets" {
  description = "The configuration for private subnets."
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "public_subnets" {
  description = "The configuration for public subnets."
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "private_subnet_ids" {
  description = "Map of private subnet names to their IDs"
  type        = map(string)
}

variable "public_subnet_ids" {
  description = "Map of public subnet names to their IDs"
  type        = map(string)
}

variable "private_subnet_names" {
  description = "List of private subnet names"
  type        = list(string)
}

variable "public_subnet_names" {
  description = "List of public subnet names"
  type        = list(string)
}

# Network peering
variable "iac_to_cleard_peering" {
  description = "This is to connect from Newly created network to existing network"
  type = string
}

variable "existing_remote_network_id" {
  description = "The remote network id"
  type = string
}

variable "iac_remote_network_id" {
  description = "Newly created virtyal network remote network id "
  type = string
}

variable "existing_to_iac_peering" {
  description = "Connect from Newly created network to existing network"
  type = string
}

variable "existing_resource_group_name" {
  description = "Exisitng network to which we wanted to peer"
  type = string
}

variable "exisitng_vnet_name" {
  description = "Existing network name to which we wanted to peer"
  type = string
}
