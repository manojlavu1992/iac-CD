resource "azurerm_resource_group" "resource_group_name" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group_name.name
}

resource "azurerm_subnet" "public" {
  count                = var.num_public_subnets
  name                 = "PublicSubnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.resource_group_name.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["172.17.${count.index + 1}.0/24"]
}

resource "azurerm_subnet" "private" {
  count                = var.num_private_subnets
  name                 = "PrivateSubnet-${count.index + 1}"
  resource_group_name  = azurerm_resource_group.resource_group_name.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["172.17.${10 + count.index + 1}.0/24"]
}
