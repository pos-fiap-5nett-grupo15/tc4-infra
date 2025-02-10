output "secret_name" {
  description = "O nome do Secret criado"
  value       = kubernetes_secret.this.metadata[0].name
}