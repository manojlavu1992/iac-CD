# Resource group
resource_group_name = "IaC-ClearD-Internal-Resource-Group"
location            = "Canada Central"
tags = {
  environment = "Dev-&-QA"
}

# Virtual Network
vnet_name          = "IaC-ClearD-Internal-Virtual-Network"
vnet_address_space = "172.17.0.0/16"
private_subnets = [
  { name = "Subnet-1", address_prefix = "172.17.8.0/22" },
  { name = "Subnet-2", address_prefix = "172.17.20.0/22" },
  { name = "Subnet-3", address_prefix = "172.17.28.0/22" }
]
public_subnets = [
  { name = "ingress-appgateway-subnet", address_prefix = "172.17.1.0/24" },
  { name = "ingress-loadbalancer-subnet", address_prefix = "172.17.2.0/24" }
]


# Network peering
iac_to_cleard_peering = "IaC-to-ClearD-Peering"
existing_to_iac_peering = "ClearD-To-IaC-Peering"
iac_remote_network_id = "/subscriptions/14d226b1-056e-4c74-9ff0-2d2e4b6ed307/resourceGroups/IaC-ClearD-Internal-Resource-Group/providers/Microsoft.Network/virtualNetworks/IaC-Cleard-Internal-Virtual-Network"
existing_remote_network_id = "/subscriptions/14d226b1-056e-4c74-9ff0-2d2e4b6ed307/resourceGroups/ClearD-Internal-Resource-Group/providers/Microsoft.Network/virtualNetworks/Cleard-Internal-Virtual-Network"
existing_resource_group_name  = "ClearD-Internal-Resource-Group"
existing_vnet_name  = "ClearD-Internal-Virtual-Network"


# iac_tfstate = "iactfstate"
# container_name = "terraform-state"
# account_tier = "Standard"
# account_replication_type = "LRS"
