output "resource_group_id" {
  description = "ID grupy zasobów"
  value       = azurerm_resource_group.resource_group.id
}

output "resource_group_name" {
  description = "Nazwa grupy zasobów"
  value       = azurerm_resource_group.resource_group.name
}
