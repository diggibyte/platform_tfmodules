variable "vm_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
  type    = string
  default = "Central India"
}
variable "size" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "network_interface_ids" {
  type = list(string)
}
variable "username" {
  type = string
}
variable "disk_caching" {
  type = string
}
variable "disk_storage_account_type" {
  type = string
}
variable "publisher" {
  type = string
}
variable "offer" {
  type = string
}
variable "sku" {
  type = string
}
variable "image_version" {
  type = string
}