variable "name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Enable admin user for the Azure Container Registry"
  type        = bool
  default     = false
}

variable "subscription_id" {
  description = "Azure subscription id"
  type = string
}