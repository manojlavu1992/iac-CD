resource "azurerm_resource_group" "resource_group" {
  name      = var.resource_group
  location  = var.location
  tags      = var.tags
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "example-vnet"
  resource_group = azurerm_resource_group.example.name
  address_space       = ["${var.private_subnet_prefix}", "${var.public_subnet_prefix}"]

  subnet {
    name           = "private-subnet"
    address_prefix = var.private_subnet_prefix
  }

  subnet {
    name           = "public-subnet"
    address_prefix = var.public_subnet_prefix
  }
}

resource "azurerm_network_interface" "private_nics" {
  count               = var.private_ip_count
  name                = "private-nic-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "private-ip-config"
    subnet_id                     = azurerm_virtual_network.example.subnet[0].id
    private_ip_address_allocation = "Static"
    private_ip_address            = "172.17.1.${count.index + 10}"
  }
}

resource "azurerm_public_ip" "public_ips" {
  count                = var.public_ip_count
  name                 = "public-ip-${count.index}"
  location             = azurerm_resource_group.example.location
  resource_group  = azurerm_resource_group.example.name
  allocation_method    = "Static"
  idle_timeout_in_minutes = 4
  domain_name_label    = "public-ip-${count.index}"

  tags = var.tags
}
