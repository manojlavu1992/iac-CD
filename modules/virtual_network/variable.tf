variable "resource_group_name" {
  description = "Name of Azure Resource Group."
  type        = string
}

variable "location" {
  description = "The region where the resources are located"
  type        = string
}

variable "private_subnet_prefix" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "public_subnet_prefix" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_ip_count" {
  description = "Number of private IPs"
  type        = number
}

variable "public_ip_count" {
  description = "Number of public IPs"
  type        = number
}
