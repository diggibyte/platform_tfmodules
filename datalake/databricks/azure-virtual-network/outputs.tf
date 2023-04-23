output "databricks-vnet-id" {
  value       = azurerm_virtual_network.databricks-vnet.id
  description = "The virtual network created for databricks"
}
