variable "namespace" {
  description = "O namespace onde o Secret será criado"
  type        = string
}

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


variable "name" {
  description = "O nome do Secret"
  type        = string
}