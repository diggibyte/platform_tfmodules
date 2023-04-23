resource "azurerm_virtual_network" "dgb_virtual_network" {
  name                = var.vn_name
  location            = var.vn_location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  tags                = var.tags
}