variable "name" {
  description = "O nome do ConfigMap"
  type        = string
}

variable "namespace" {
  description = "O namespace onde o ConfigMap será criado"
  type        = string
}

variable "data" {
  description = "Os dados a serem armazenados no ConfigMap"
  type        = map(string)
}