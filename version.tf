# Establishes Terraform version compatibility.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
  backend "azurerm" {
  }
}