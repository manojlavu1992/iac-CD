data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
}

# Private DNS Zone for Azure Container Registry
resource "azurerm_private_dns_zone" "acr_dns_zone" {
  name                = "privatelink.azurecr.io"
  resource_group_name = var.resource_group_name
}

# Link the Private DNS Zone to the VNet
resource "azurerm_private_dns_zone_virtual_network_link" "acr_dns_zone_link" {
  name                  = "${var.vnet_name}-acr-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.acr_dns_zone.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
}

# Private Endpoint for the Azure Container Registry
resource "azurerm_private_endpoint" "acr_private_endpoint" {
  name                = "acr-private-endpoint-${var.acr_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "acrPrivateConnection-${var.acr_name}"
    private_connection_resource_id = data.azurerm_container_registry.acr.id
    is_manual_connection           = false
    subresource_names              = ["registry"]
  }

  private_dns_zone_group {
    name                 = "acrPrivateDnsZoneGroup-${var.acr_name}"
    private_dns_zone_ids = [azurerm_private_dns_zone.acr_dns_zone.id]
  }
}
