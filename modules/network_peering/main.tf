resource "azurerm_virtual_network_peering" "iac_to_cleard_peering" {
  name                      = var.iac_to_cleard_peering
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_name
  remote_virtual_network_id = var.existing_remote_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic     = true
}

resource "azurerm_virtual_network_peering" "existing_to_iac_peering" {
  name                      = var.existing_to_iac_peering
  resource_group_name       = var.existing_resource_group_name
  virtual_network_name      = var.exisitng_vnet_name
  remote_virtual_network_id = var.iac_remote_network_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
