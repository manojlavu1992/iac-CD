# Includes output value definitions.
# terraform output private_subnet_id
# Use output cmd to get private id's

output "private_subnet_id" {
  description = module.virtual_network.private_subnet_id
}

output "public_subnet_id" {
  description = module.virtual_network.public_subnet_id
}

output "private_nic_ids" {
  description = module.virtual_network.private_nic_ids
}

output "public_ip_ids" {
  description = module.virtual_network.public_ip_ids
}


