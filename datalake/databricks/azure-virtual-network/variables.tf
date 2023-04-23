variable "prefix" {
  type        = string
  description = "Prefix for the names of the resources created by this module"
}

variable "location" {
  type        = string
  description = "Location in which Databricks will be deployed"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group into which Vnet will be deployed"
}
variable "address_space" {
  type        = list(string)
  description = "Address space for private Databricks subnet"
}