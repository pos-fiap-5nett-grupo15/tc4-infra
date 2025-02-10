resource "kubernetes_secret" "this" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  data = {
    MSSQL_SA_PASSWORD = var.mssql_sa_password
    SVC_PASS          = base64encode(var.svc_pass)
  }
}