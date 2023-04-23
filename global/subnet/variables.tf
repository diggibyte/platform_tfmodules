variable "subnet_name" {
  default = ""
}
variable "rg_name" {
  type = string
}
variable "vn_name" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
}

variable "service_endpoints" {
  type    = list(string)
  default = []
}

variable "service_endpoints_plicy_ids" {
  type    = list(string)
  default = []
}