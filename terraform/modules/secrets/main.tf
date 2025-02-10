resource "kubernetes_secret" "this" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  data = {
    MSSQL_SA_PASSWORD = base64encode(var.mssql_sa_password)
    SVC_PASS          = base64encode(var.svc_pass)
  }
}