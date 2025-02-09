variable "resource_group_name" {
  default = "fiap-tech-4"
}
variable "resource_group_location" {
  default = "eastus"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "fiapacrtech4"
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Enable admin user for the Azure Container Registry"
  type        = bool
  default     = false
}

variable "subscription_id" {
  description = "Azure subscription id"
  type        = string
  default     = "7d56ed09-a476-4593-9fbf-0927c0c53f5e"
}