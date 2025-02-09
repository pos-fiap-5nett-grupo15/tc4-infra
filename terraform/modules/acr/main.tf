terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.18.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_container_registry" "acr" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  sku = var.sku

  admin_enabled = var.admin_enabled
}