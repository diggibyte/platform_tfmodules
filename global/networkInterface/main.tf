resource "azurerm_network_interface" "dgb_network_interface" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_allocation
    private_ip_address_version    = var.ip_version
    public_ip_address_id          = var.public_ip == "" ? null : var.public_ip
    private_ip_address            = var.private_ip == "" ? null : var.private_ip
  }
}