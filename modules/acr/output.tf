output "private_endpoint_id" {
  value = azurerm_private_endpoint.acr_private_endpoint.id
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.acr_dns_zone.id
}


output "virtual_network_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the virtual network."
}