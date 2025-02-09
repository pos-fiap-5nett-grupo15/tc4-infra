terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.18.0"
    }
  }
  required_version = ">=1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "../modules/resource-group"
  name     = var.resource_group_name
  location = var.resource_group_location
  subscription_id = var.subscription_id
}

module "acr" {
  source              = "../modules/acr"
  name                = var.acr_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  subscription_id = var.subscription_id
}

module "aks" {
  source              = "../modules/aks"
  dns_prefix          = "fiapakstech4"
  cluster_name        = "fiapaks"
  cluster_location    = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = { "env" = "dev" }
  subscription_id = var.subscription_id
}