
locals {
  #  Read Config files
  user_aadg_mpg        = jsondecode(file(var.user_aadg_mpg_path))
  aadg_rbac            = jsondecode(file(var.aadg_rbac_path))
  aad_role_definations = jsondecode(file(var.aad_role_definitions_path))
  #  Fetch azure resource information
  resources = flatten([for type, objects in local.aadg_rbac : [for object in objects : object.resource]])
  #  Fetch all user list for DL
  user_list = flatten([for type, objects in local.user_aadg_mpg : [for object in objects : object.user_list]])
  #  Fetch all AAD Group Names
  all_aad_groups = flatten([for type, objects in local.user_aadg_mpg : [for object in objects : object.aad_group_name]])
  #  Fetch AAD group mapping with user
  user_group_mapping = flatten([for aad_info in flatten([for environment, aad_groups in local.user_aadg_mpg : [for aad_group in aad_groups : aad_group]]) : [for user in aad_info.user_list : { group_name = aad_info.aad_group_name, user = user }]])
  #  Default RBAC information
  default_aad_rbac_mapping = flatten([for rule in local.aadg_rbac.default : [for role in rule.roles : { resource = rule.resource, user_group = rule.user_group, role = role }]])
  #  Custom RBAC information
  custom_aad_rbac_mapping = flatten([for rule in local.aadg_rbac.custom : rule])
}


data "azuread_client_config" "current" {}

data "azuread_user" "dgb_users" {
  for_each            = toset(local.user_list)
  user_principal_name = each.value
}

data "azurerm_resource_group" "dgb_resource_groups" {
  for_each = toset(local.resources)
  name     = each.key
}

resource "azuread_group" "dgb_ad_group" {
  for_each         = toset(local.all_aad_groups)
  display_name     = each.value
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_group_member" "dgb_user_group_mapping" {
  for_each         = { for inst in local.user_group_mapping : "${inst.group_name}-${inst.user}" => inst }
  group_object_id  = azuread_group.dgb_ad_group[each.value.group_name].object_id
  member_object_id = data.azuread_user.dgb_users[each.value.user].id
}

resource "azurerm_role_definition" "dgb_role_definition" {
  for_each = { for inst in local.aad_role_definations : inst.definition_name => inst }
  name     = each.value.definition_name
  scope    = data.azurerm_resource_group.dgb_resource_groups[each.value.scope].id

  permissions {
    actions          = each.value.actions
    not_actions      = each.value.notActions
    data_actions     = each.value.dataActions
    not_data_actions = each.value.notDataActions
  }
}

resource "azurerm_role_assignment" "dgb_role_assignment_default" {
  for_each = { for inst in local.default_aad_rbac_mapping : "${inst.user_group}-${inst.role}" => inst }

  scope                = data.azurerm_resource_group.dgb_resource_groups[each.value.resource].id
  role_definition_name = each.value.role
  principal_id         = azuread_group.dgb_ad_group[each.value.user_group].object_id
}

resource "azurerm_role_assignment" "dgb_role_assignment_custom" {
  for_each = { for inst in local.custom_aad_rbac_mapping : "${inst.user_group}-${inst.role_definition_name}" => inst }

  scope              = data.azurerm_resource_group.dgb_resource_groups[each.value.resource].id
  role_definition_id = azurerm_role_definition.dgb_role_definition[each.value.role_definition_name].role_definition_resource_id
  principal_id       = azuread_group.dgb_ad_group[each.value.user_group].object_id
}