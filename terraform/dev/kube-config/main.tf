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

module "storage" {
  source                   = "../../modules/azure_storage"
  storage_account_name     = "fiaptc4storage"
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.resource_group_location
  account_tier             = "Standard"
  access_tier              = "Cool"
  account_replication_type = "LRS"
  storage_share_name       = var.storage_share_name
  storage_share_quota      = 10
}

module "sql_server_config_map" {
  source    = "../../modules/configmap"
  name      = "sql-server-config-map"
  namespace = var.kube_namespace
  data = {
    ACCEPT_EULA = "Y"
  }
}

module "sql_server_secret" {
  source            = "../../modules/secrets"
  name              = "sql-server-secret"
  namespace         = var.kube_namespace
  mssql_sa_password = var.mssql_sa_password
  svc_pass          = var.svc_pass
}

resource "kubernetes_secret" "sql_connection_string" {
  metadata {
    name      = "db-connection"
    namespace = var.kube_namespace
  }

  data = {
    ConnectionStrings__DefaultConnection  = var.db_connection
  }
}