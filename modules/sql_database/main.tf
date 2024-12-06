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

variable "create" {
  type = bool
}

variable "aad_admin_login" {
  type        = string
  description = "Nazwa administratora AAD dla SQL Server"
  default     = "admin@domain.com"
}

resource "random_id" "sql" {
  count       = var.create ? 1 : 0
  byte_length = 4
}

# Tworzenie SQL Server
resource "azurerm_mssql_server" "sql_server" {
  count                         = var.create ? 1 : 0
  name                          = "sql_${var.environment}_sqlserver_${random_id.sql[0].hex}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = "sqladminuser"
  administrator_login_password  = "P@ssword1234!"
}

# Tworzenie SQL Database
resource "azurerm_mssql_database" "sql_db" {
  count               = var.create ? 1 : 0
  name                = "sqldb_${var.environment}"
  server_id           = azurerm_mssql_server.sql_server[0].id
}
