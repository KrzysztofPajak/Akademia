variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
}

variable "location" {
  description = "Lokalizacja grupy zasobów"
  type        = string
}

variable "tags" {
  description = "Tagi przypisane do grupy zasobów"
  type        = map(string)
  default     = {}
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
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

variable "enable_key_vault" {
  description = "Enable or disable the Key Vault module."
  type        = bool
  default     = true
}

variable "enable_blob_storage" {
  description = "Enable or disable the Blob Storage module."
  type        = bool
  default     = true
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "container_name" {
  description = "The name of the blob container."
  type        = string
}