# Serves as the central Terraform file from which modules are invoked.

#remove prevention deletion for safe in prod env
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# module "storage_account" {
#   source = "./modules/storage_account"
#   resource_group_name      = var.resource_group_name
#   location                 = var.location
#   account_tier             = var.account_tier
#   account_replication_type = var.account_replication_type
#   container_name           = var.container_name
#   tags                     = var.tags
#   iac_tfstate              = var.iac_tfstate
#   depends_on = [ module.resource_group ]
# }



module "virtual_network" {
  source              = "./modules/virtual_network"
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  depends_on          = [module.resource_group]
}



module "azure_vm" {
  source              = "./modules/virtual_machine"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  private_subnets     = var.private_subnets
  subnet_id           = module.virtual_network.private_subnet_ids["Subnet-1"]
  public_subnets      = var.public_subnets
  tags                = var.tags
  depends_on          = [module.virtual_network]
}


module "iac_to_cleard_peering" {
  source               = "./modules/network_peering"
  resource_group_name  = var.resource_group_name
  location             = var.location
  vnet_name            = var.vnet_name
  vnet_address_space   = var.vnet_address_space
  private_subnet_ids   = module.virtual_network.private_subnet_ids
  public_subnet_ids    = module.virtual_network.public_subnet_ids
  private_subnet_names = module.virtual_network.private_subnet_names
  public_subnet_names  = module.virtual_network.public_subnet_names
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  tags                 = var.tags
  # remote_virtual_network_id    = var.existing_remote_network_id
  existing_remote_network_id   = var.existing_remote_network_id
  iac_remote_network_id        = var.iac_remote_network_id
  iac_to_cleard_peering        = var.iac_to_cleard_peering
  exisitng_vnet_name           = var.existing_vnet_name
  existing_to_iac_peering      = var.existing_to_iac_peering
  existing_resource_group_name = var.existing_resource_group_name
  # allow_virtual_network_access = true
  # allow_forwarded_traffic      = true
  depends_on = [module.virtual_network]
}



module "acr_integration" {
  source   = "./modules/acr"
  acr_name = "cleard"
  # acr_resource_group_name = "ClearD-Admin-Resource-Group"
  resource_group_name = "ClearD-Admin-Resource-Group"
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  vnet_address_space  = var.vnet_address_space
  tags                = var.tags
  vnet_name           = var.vnet_name
  vnet_id             = module.virtual_network.vnet.id
  subnet_id           = module.virtual_network.private_subnet_ids["Subnet-1"]
  location            = module.resource_group.location
}
