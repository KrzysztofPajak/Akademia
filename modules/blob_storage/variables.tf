variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "container_name" {
  description = "The name of the blob container."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where the Key Vault will be created."
  type        = string
}