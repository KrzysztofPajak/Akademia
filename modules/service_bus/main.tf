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

resource "random_id" "sb" {
  count       = var.create ? 1 : 0
  byte_length = 4
}

# Tworzenie Service Bus Namespace
resource "azurerm_servicebus_namespace" "sb_namespace" {
  count               = var.create ? 1 : 0
  name                = "sb_${var.environment}${random_id.sb[0].hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
}
