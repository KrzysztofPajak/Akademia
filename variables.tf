variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "deploy_storage_account" {
  description = "Flag to deploy Storage Account"
  type        = bool
}

variable "deploy_sql_db" {
  description = "Flag to deploy SQL Database"
  type        = bool
}

variable "deploy_service_bus" {
  description = "Flag to deploy Service Bus"
  type        = bool
}

variable "deploy_key_vault" {
  description = "Flag to deploy Key Vault"
  type        = bool
}

variable "key_vault_secret_value" {
  description = "The value of the Key Vault secret"
  type        = string
}