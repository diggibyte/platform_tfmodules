resource "azurerm_public_ip" "dgb_public_ip" {
  #  Required Parameters
  name                = var.public_ip_obj.name
  resource_group_name = var.public_ip_obj.resource_group_name
  location            = lookup(var.public_ip_obj, "location", "Central India")
  allocation_method   = lookup(var.public_ip_obj, "allocation_method", "Static")

  #  Optional Parameters
  zones                   = lookup(var.public_ip_obj, "zones", "") == "" ? null : var.public_ip_obj.zones
  domain_name_label       = lookup(var.public_ip_obj, "domain_name_label", "") == "" ? null : var.public_ip_obj.domain_name_label
  edge_zone               = lookup(var.public_ip_obj, "edge_zone", "") == "" ? null : var.public_ip_obj.edge_zone
  idle_timeout_in_minutes = lookup(var.public_ip_obj, "idle_timeout_in_minutes", "") == "" ? null : var.public_ip_obj.idle_timeout_in_minutes
  ip_tags                 = lookup(var.public_ip_obj, "ip_tags", "") == "" ? null : var.public_ip_obj.ip_tags
  ip_version              = lookup(var.public_ip_obj, "ip_version", "") == "" ? null : var.public_ip_obj.ip_version
  public_ip_prefix_id     = lookup(var.public_ip_obj, "public_ip_prefix_id", "") == "" ? null : var.public_ip_obj.public_ip_prefix_id
  reverse_fqdn            = lookup(var.public_ip_obj, "reverse_fqdn", "") == "" ? null : var.public_ip_obj.reverse_fqdn

  #  Optional with Default values
  sku      = lookup(var.public_ip_obj, "sku", "Basic")
  sku_tier = lookup(var.public_ip_obj, "sku_tier", "Regional")

}