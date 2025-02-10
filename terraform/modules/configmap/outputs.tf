output "config_map_name" {
  description = "O nome do ConfigMap criado"
  value       = kubernetes_config_map.this.metadata[0].name
}