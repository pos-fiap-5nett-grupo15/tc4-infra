terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.18.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
  required_version = ">=1.1.0"
}


provider "kubernetes" {
  config_path = "~/.kube/config" # Caminho para o arquivo kubeconfig
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

module "resource_group" {
  source          = "../../modules/resource-group"
  name            = var.resource_group_name
  location        = var.resource_group_location
  subscription_id = var.subscription_id
}

module "acr" {
  source              = "../../modules/acr"
  name                = var.acr_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  subscription_id     = var.subscription_id
}

module "aks" {
  source              = "../../modules/aks"
  dns_prefix          = "fiapakstech4"
  cluster_name        = "fiapaks"
  cluster_location    = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = { "env" = "dev" }
  subscription_id     = var.subscription_id
  node_count          = 1
  vm_size             = "Standard_D2pls_v6"
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = module.aks.kubelet_identity_object_id
  role_definition_name = "AcrPull"
  scope                = module.acr.acr_id
}

