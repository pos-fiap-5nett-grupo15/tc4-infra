variable "subscription_id" {
  description = "Azure subscription id"
  type        = string
  default     = "7d56ed09-a476-4593-9fbf-0927c0c53f5e"
}


variable "resource_group_name" {
  default = "fiap-tech-4"
}
variable "resource_group_location" {
  default = "eastus"
}

//Secret
variable "mssql_sa_password" {
  description = "sql server sa password"
  type        = string
  sensitive   = true
}

variable "svc_pass" {
  description = "service user password"
  type        = string
  sensitive   = true
}

variable "db_connection" {
  description = "Sql Server Connection String - encrypted"
  type        = string
  sensitive   = true
}


variable "storage_account_name" {
  description = "Azure storage accout name."
  type        = string
  default     = "tc4storage"
}

variable "storage_share_name" {
  type    = string
  default = "sql-server-fileshare"

}


variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "access_tier" {
  type    = string
  default = "Cool"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "kube_namespace" {
  type        = string
  default     = "tc4"
  description = "Kubernetes configmap namespace"
}

