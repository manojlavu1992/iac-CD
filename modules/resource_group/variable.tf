variable "resource_group" {
  description = "name of Azure Resource Group."
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