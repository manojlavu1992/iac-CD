# Serves as the central Terraform file from which modules are invoked.

provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "virtual_network" {
  source                = "./modules/virtual_network"
  resource_group_name   = var.resource_group_name
  location              = var.location
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  num_public_subnets    = var.num_public_subnets
  num_private_subnets   = var.num_private_subnets
}
