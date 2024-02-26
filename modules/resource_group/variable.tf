variable "resource_group_name" {
  description = "name of Azure Resource Group."
  type        = string
}

variable "location" {
  description = "The region where the resources are located"
  type        = string
}

variable "tags" {
  description = "Tags to be associated with the Azure Resource Group"
  type        = map(string)
}