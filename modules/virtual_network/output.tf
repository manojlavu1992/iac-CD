output "virtual_network_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the virtual network."
}

output "virtual_network_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the virtual network."
}

output "private_subnet_ids" {
  value = { for subnet in azurerm_subnet.private : subnet.name => subnet.id }
}

output "public_subnet_ids" {
  value = { for subnet in azurerm_subnet.public : subnet.name => subnet.id }
}

output "public_subnet_names" {
  value       = [for subnet in azurerm_subnet.public : subnet.name]
  description = "The list of names for the public subnets."
}

output "private_subnet_names" {
  value       = [for subnet in azurerm_subnet.private : subnet.name]
  description = "The list of names for the private subnets."
}
