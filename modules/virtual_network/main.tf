# resource "azurerm_resource_group" "resource_group_name" {
#   name     = var.resource_group_name
#   location = var.location
# }

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name  = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "private" {
  for_each             = { for subnet in var.private_subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_subnet" "public" {
  for_each             = { for subnet in var.public_subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]
}