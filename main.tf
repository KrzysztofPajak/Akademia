terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "resource_group" {
  source = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  resource_location   = var.location
  tags                = var.tags
}

# Conditionally include the Key Vault module
module "key_vault" {
  count                  = var.enable_key_vault ? 1 : 0
  source                 = "./modules/azure_key_vault"
  key_vault_name         = var.key_vault_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  tenant_id              = var.tenant_id
  object_id              = var.object_id
  secret_name            = var.secret_name
  secret_value           = var.secret_value
  sku_name               = var.sku_name
}

# Conditionally include the Blob Storage module
module "blob_storage" {
  count                = var.enable_blob_storage ? 1 : 0
  source               = "./modules/blob_storage"
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
  resource_group_name  = var.resource_group_name
  location             = var.location
}