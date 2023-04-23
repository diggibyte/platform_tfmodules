resource "random_password" "vm_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_linux_virtual_machine" "example" {
  name                            = var.vm_name
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = var.size
  disable_password_authentication = false
  admin_username                  = var.admin_username
  admin_password                  = random_password.vm_admin_password.result
  network_interface_ids           = var.network_interface_ids

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.disk_storage_account_type
  }
  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }

}