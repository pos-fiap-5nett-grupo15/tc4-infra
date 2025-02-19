resource "azurerm_storage_account" "this" {
    name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  account_tier = "Standard"
  account_replication_type = "LRS"
  access_tier = "Cool"
}

resource "azurerm_storage_share" "this" {
  name = var.storage_share_name
  storage_account_id = azurerm_storage_account.this.id
  quota = var.storage_share_quota
}