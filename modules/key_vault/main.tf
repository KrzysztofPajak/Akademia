variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "tenant_id" {
  description = "Azure Tenant ID for AAD integration"
  type        = string
}

variable "key_vault_secret_value" {
  type = string
}

variable "create" {
  type = bool
}

resource "random_id" "kv" {
  count       = var.create ? 1 : 0
  byte_length = 4
}

# Tworzenie Key Vault
resource "azurerm_key_vault" "key_vault" {
  count               = var.create ? 1 : 0
  name                = "kv${var.environment}${random_id.kv[0].hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = var.tenant_id    
    secret_permissions = ["get", "list", "set", "delete"]
  }
}

# Dodawanie sekretu do Key Vault
resource "azurerm_key_vault_secret" "secret" {
  count        = var.create ? 1 : 0
  name         = "MySecret"
  value        = var.key_vault_secret_value
  key_vault_id = azurerm_key_vault.key_vault[0].id
}