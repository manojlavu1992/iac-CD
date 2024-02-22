# Serves as the central Terraform file from which modules are invoked.

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"
}

# module "network" {
#   source              = "./modules/network"
# }


provider "azurerm" {
  features = {}
}

module "virtual_network" {
  source = "./modules/virtual_network"

  resource_group_name    = var.resource_group
  location               = var.location
  private_subnet_prefix  = var.private_subnet_prefix
  public_subnet_prefix   = var.public_subnet_prefix
  private_ip_count       = var.private_ip_count
  public_ip_count        = var.public_ip_count
  tags                   = var.tags
}
