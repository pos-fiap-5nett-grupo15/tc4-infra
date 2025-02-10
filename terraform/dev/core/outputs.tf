output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.resource_group_name
}

# output "acr_name" {
#   description = "The name of the Azure Container Registry"
#   value       = module.acr.acr_name
# }

# output "acr_login_server" {
#   description = "The login server of the Azure Container Registry"
#   value       = module.acr.acr_login_server
# }
