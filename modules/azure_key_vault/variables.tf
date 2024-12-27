variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The location where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
}

variable "tags" {
  description = "Tagi przypisane do grupy zasobów"
  type        = map(string)
  default     = {}
}

variable "sku_name" {
  description = "The SKU name of the Key Vault."
  type        = string
  
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID."
  type        = string
}

variable "object_id" {
  description = "The object ID of the user or service principal that will have access to the Key Vault."
  type        = string
}

variable "secret_name" {
  description = "The name of the secret to be stored in the Key Vault."
  type        = string
}

variable "secret_value" {
  description = "The value of the secret to be stored in the Key Vault."
  type        = string
}