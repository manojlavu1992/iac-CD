output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = azurerm_virtual_network.example.subnet[0].id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = azurerm_virtual_network.example.subnet[1].id
}

output "private_nic_ids" {
  description = "List of IDs for the private network interfaces"
  value       = azurerm_network_interface.private_nics[*].id
}

output "public_ip_ids" {
  description = "List of IDs for the public IPs"
  value       = azurerm_public_ip.public_ips[*].id
}
