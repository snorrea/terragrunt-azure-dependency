terraform {
  source = "../../../modules/resource_group"
}

include {
  path = find_in_parent_folders()
}

locals {
  global = read_terragrunt_config(find_in_parent_folders("global.hcl")).locals
  environment = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).locals.environment
}

inputs = {
  resource_group_name = format("foobar-%s", local.environment)
  location = local.global.common_parameters.location
  department = local.global.tags.department
  environment = local.environment
  service = local.global.tags.service
}
