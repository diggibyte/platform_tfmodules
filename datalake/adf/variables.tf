variable "adf_name" {
  type        = string
  description = "Name of ADF instance"
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
  default     = "DGB-RG-DL-DEV-001"
}

variable "location" {
  type        = string
  description = "location of data-center where resource instance will created"
  default     = "Central India"
}

variable "git_config" {
  type        = string
  description = "denotes whether need to set up git configuration or not"
  default     = "None"
}

variable "vsts_account_name" {
  type        = string
  description = "Specifies the VSTS account name"
  default     = "None"
}

variable "vsts_branch_name" {
  type        = string
  description = "Specifies the branch of the repository to get code from"
  default     = "None"
}

variable "vsts_project_name" {
  type        = string
  description = "Specifies the name of the VSTS project"
  default     = "None"
}

variable "vsts_repository_name" {
  type        = string
  description = "Specifies the name of the git repository"
  default     = "None"
}

variable "vsts_root_folder" {
  type        = string
  description = "Specifies the root folder within the repository. Set to / for the top level."
  default     = "None"
}

variable "vsts_tenant_id" {
  type        = string
  description = "Specifies the Tenant ID associated with the VSTS account"
  default     = "None"
}

variable "github_account_name" {
  type        = string
  description = "Specifies the GitHub account name"
  default     = "None"
}

variable "github_branch_name" {
  type        = string
  description = "Specifies the branch of the repository to get code from"
  default     = "None"
}

variable "github_url" {
  type        = string
  description = "Specifies the GitHub Enterprise host name. For example: https://github.mydomain.com. Use https://github.com for open source repositories."
  default     = "None"
}

variable "github_repository_name" {
  type        = string
  description = "Specifies the name of the git repository"
  default     = "None"
}

variable "github_root_folder" {
  type        = string
  description = "Specifies the root folder within the repository. Set to / for the top level."
  default     = "None"
}

variable "public_network_enable" {
  type    = bool
  default = true
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to Databricks workspace"
  default     = {}
}

