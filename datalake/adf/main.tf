resource "azurerm_data_factory" "adfInstnace" {
  count                  = var.git_config == "None" ? 1 : 0
  name                   = var.adf_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  public_network_enabled = var.public_network_enable
  tags                   = var.tags
}

resource "azurerm_data_factory" "adfGitInstance" {
  count                  = var.git_config == "github" ? 1 : 0
  name                   = var.adf_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  public_network_enabled = var.public_network_enable
  tags                   = var.tags

  github_configuration {
    account_name    = var.github_account_name
    branch_name     = var.github_branch_name
    git_url         = var.github_url
    repository_name = var.github_repository_name
    root_folder     = var.github_root_folder
  }
}

resource "azurerm_data_factory" "adfVstsInstance" {
  count                  = var.git_config == "vsts" ? 1 : 0
  name                   = var.adf_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  public_network_enabled = var.public_network_enable
  tags                   = var.tags

  vsts_configuration {
    account_name    = var.vsts_account_name
    branch_name     = var.vsts_branch_name
    project_name    = var.vsts_project_name
    repository_name = var.vsts_repository_name
    root_folder     = var.vsts_root_folder
    tenant_id       = var.vsts_tenant_id
  }
}