variable "address_space" {
  type = list(string)
}
variable "rg_name" {
  type = string
}
variable "vn_location" {
  type    = string
  default = "Central India"
}
variable "vn_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}