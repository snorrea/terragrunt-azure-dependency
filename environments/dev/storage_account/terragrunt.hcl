terraform {
  source = "../../../modules/storage_account"
}

include {
  path = find_in_parent_folders()
}

locals {
  global = read_terragrunt_config(find_in_parent_folders("global.hcl")).locals
  environment = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).locals.environment
}

dependency "resource_group" {
  config_path = "../resource_group"
  skip_outputs = false
  mock_outputs = {
    resource_group_name = "mock-rg-name"
  }
  mock_outputs_allowed_terraform_commands = ["init", "plan", "validate"]
}

dependencies {
  paths = ["../resource_group"]
}

inputs = {
  storage_account_name = format("qmwnebrt%s", local.environment)
  resource_group_name = dependency.resource_group.outputs.resource_group_name
  location = local.global.common_parameters.location
  department = local.global.tags.department
  environment = local.environment
  service = local.global.tags.service
}
