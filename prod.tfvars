resource_group_name = "prod-my-resource-group"
location   = "West Europe"
tags = {
    environment = "prod"
    owner       = "team"
  }

# Nazwa Key Vault
key_vault_name = "my-key-vault"

# Tenant ID dla Azure Active Directory
tenant_id = "52351a5c-f840-4a8e-981a-45a6d6d3f82a"

# Object ID dla uprawnień do Key Vault (np. ID użytkownika lub aplikacji)
object_id = "217d87c4-4351-47f7-82e9-bcad2b8eac9f"

# Nazwa testowego klucza
secret_name = "my-test-key"
secret_value = "my-test-value"
sku_name = "standard"


storage_account_name = "mystorageaccount"
container_name      = "mycontainer"


enable_key_vault = true
enable_blob_storage = true