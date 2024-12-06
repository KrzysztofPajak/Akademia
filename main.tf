# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used

terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Tworzenie grupy zasobów
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Moduł Storage Account
module "storage_account" {
  source              = "./modules/storage_account"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = var.environment
  create              = var.deploy_storage_account
  
}

# Moduł SQL Database z AAD
module "sql_database" {
  source              = "./modules/sql_database"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = var.environment
  create              = var.deploy_sql_db
  tenant_id   = var.tenant_id
}

# Moduł Service Bus
module "service_bus" {
  source              = "./modules/service_bus"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  environment         = var.environment
  create              = var.deploy_service_bus
  tenant_id           = var.tenant_id
}

# Moduł Key Vault
module "key_vault" {
  source                  = "./modules/key_vault"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  environment             = var.environment
  key_vault_secret_value  = var.key_vault_secret_value
  create                  = var.deploy_key_vault
  tenant_id               = var.tenant_id
}