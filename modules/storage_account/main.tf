variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "create" {
  type = bool
}

resource "random_id" "random" {
  byte_length = 4
  count       = var.create ? 1 : 0
}

# Tworzenie Storage Account
resource "azurerm_storage_account" "storage" {
  count                    = var.create ? 1 : 0
  name                     = "storage_${var.environment}${random_id.random[0].hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
