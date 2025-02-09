variable "resource_group_name" {
  description = "O nome do grupo de recursos no qual o AKS será criado."
  type        = string
}

variable "cluster_location" {
  description = "A localização do grupo de recursos."
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "O nome do cluster AKS."
  type        = string
}

variable "dns_prefix" {
  description = "O prefixo DNS para o cluster AKS."
  type        = string
}

variable "node_count" {
  description = "O número de nós no pool padrão."
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "O tamanho da VM para os nós do AKS."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "tags" {
  description = "Tags para o recurso."
  type        = map(string)
  default     = {}
}

variable "subscription_id" {
  description = "Azure subscription id"
  type = string
}