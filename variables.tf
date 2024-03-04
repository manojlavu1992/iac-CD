# # Contains variable declarations.

variable "resource_group_name" {
  description = "name of Azure Resource Group."
  default     = ""
}

variable "location" {
  description = "The region where the resources are located"
  default     = ""
}

variable "tags" {
  description = "Tags to be associated with the Azure Resource Group"
  default = {
    environment = ""
  }
}

# #Storage account variables
# variable "iac_tfstate" {
#   description = "Storage account to store tfstate file"
#   default     = "iactfstate"
# }

# variable "container_name" {
#     description = "Blob container to store tfstatefile"
#     default =  "terraform-state"
# }

# variable "account_tier" {
#     description = "Storage account type to store tfstatefile"
#     default = "Standard"
# }

# variable "account_replication_type" {
#     description = "Storage account account replacation type"
#     default = "LRS"
# }



#Virtual Network variables
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  description = "The address space for the VNet"
  type        = string
  default     = ""
}


variable "private_subnets" {
  description = "A list of private subnets"
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [
    { name = "", address_prefix = "" },
    { name = "", address_prefix = "" },
    { name = "", address_prefix = "" }
  ]
}

variable "public_subnets" {
  description = "A list of public subnets"
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [
    { name = "", address_prefix = "" },
    { name = "", address_prefix = "" }
  ]
}


# variable "IaC_to_ClearD_Peering" {
#   description = "This is to connect from Newly created network to existing network"
#   type        = string
#   default     = "IaC-to-ClearD-Peering"
# }

# variable "iac_remote_network_id" {
#   description = "The remote network id"
#   type        = string
#   default     = "/subscriptions/14d226b1-056e-4c74-9ff0-2d2e4b6ed307/resourceGroups/IaC-ClearD-Internal-Resource-Group/providers/Microsoft.Network/virtualNetworks/IaC-Cleard-Internal-Virtual-Network"
# }

# variable "existing_remote_network_id" {
#   description = "The remote network id"
#   type        = string
#   default     = "/subscriptions/14d226b1-056e-4c74-9ff0-2d2e4b6ed307/resourceGroups/ClearD-Internal-Resource-Group/providers/Microsoft.Network/virtualNetworks/Cleard-Internal-Virtual-Network"
# }

# variable "existing_to_iac_peering" {
#   description = "This is to connect from Newly created network to existing network"
#   type        = string
#   default     = "ClearD-To-IaC-Peering"
# }

# variable "existing_resource_group_name" {
#   description = "This is an exisitng network to whcih we wanted to peer"
#   type        = string
#   default     = "ClearD-Internal-Resource-Group"
# }

# variable "existing_vnet_name" {
#   description = "Existing network name to which we wanted to peer"
#   type        = string
#   default     = "ClearD-Internal-Virtual-Network"
# }




variable "iac_to_cleard_peering" {
  description = "This is to connect from Newly created network to existing network"
  type        = string
  default     = ""
}

variable "iac_remote_network_id" {
  description = "The remote network id"
  type        = string
  default     = ""
}

variable "existing_remote_network_id" {
  description = "The remote network id"
  type        = string
  default     = ""
}

variable "existing_to_iac_peering" {
  description = "This is to connect from Newly created network to existing network"
  type        = string
  default     = ""
}

variable "existing_resource_group_name" {
  description = "This is an exisitng network to whcih we wanted to peer"
  type        = string
  default     = ""
}

variable "existing_vnet_name" {
  description = "Existing network name to which we wanted to peer"
  type        = string
  default     = ""
}
