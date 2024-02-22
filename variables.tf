# Contains variable declarations.

variable "resource_group" {
  description = "Name of Azure Resource Group."
  type        = string
  default     = "IaC-ClearD-Internal-Resource-Group"
}

variable "location" {
  description = "The region where the resources are located"
  type        = string
  default     = "Canada Central"
}

variable "tags" {
  description = "Tags to be associated with the Azure Resource Group"
  type        = map(string)
  default     = {
    environment = "Dev-&-QA"
  }
}

variable "private_subnet_prefix" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "172.17.1.0/24"
}

variable "public_subnet_prefix" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "172.17.2.0/24"
}

variable "private_ip_count" {
  description = "Number of private IPs"
  type        = number
  default     = 10
}

variable "public_ip_count" {
  description = "Number of public IPs"
  type        = number
  default     = 3
}
