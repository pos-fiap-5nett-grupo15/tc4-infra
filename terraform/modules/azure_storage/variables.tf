variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_share_name" {
  type = string
}

variable "storage_share_quota" {
  type    = number
  default = 100
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "access_tier" {
  type = string
  default = "Cool"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}