variable "network_interface_name" {
  type = string
}

variable "location" {
  type    = string
  default = "Central India"
}

variable "rg_name" {
  type = string
}

variable "ip_config_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ip_allocation" {
  type    = string
  default = "Dynamic"
}

variable "ip_version" {
  type    = string
  default = "IPv4"
}

variable "public_ip" {
  type    = string
  default = ""
}

variable "private_ip" {
  type    = string
  default = ""
}