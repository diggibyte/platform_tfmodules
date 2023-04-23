variable "workspace_name" {
  type        = string
  description = "Name of Databricks workspace"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group into which Databricks will be deployed"
  default     = "DGB-RG-DL-DEV-001"
}

variable "location" {
  type        = string
  description = "Location in which Databricks will be deployed"
  default     = "Central India"
}

variable "sku" {
  type        = string
  description = "SKU of the databricks workspace"
  default     = "standard"
}

variable "vnet_id" {
  type        = string
  description = "ID of existing virtual network into which Databricks will be deployed"
  default     = "None"
}

variable "private_subnet_name" {
  type        = string
  description = "Name of the private subnet"
  default     = "None"
}

variable "public_subnet_name" {
  type        = string
  description = "Name of the public subnet"
  default     = "None"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}

variable "advanced_config" {
  type        = string
  description = "Check if advance configuration need to be set up or not"
  default     = "false"
}