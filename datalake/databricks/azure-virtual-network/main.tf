resource "azurerm_virtual_network" "databricks-vnet" {
  name                = "${var.prefix}-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}
