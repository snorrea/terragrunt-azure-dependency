terraform {
  source = "../../../modules/resource_group"
}

include {
  path = find_in_parent_folders()
}

locals {
  global = read_terragrunt_config(find_in_parent_folders("global.hcl")).locals
  environment = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl")).locals.environment
  common_config = read_terragrunt_config(find_in_parent_folders("common.hcl")).locals.common_config
}

inputs = {
  resource_group_name = format("foobar-%s", local.environment)
  location = local.global.common_parameters.location
  department = local.global.tags.department
  environment = local.environment
  service = local.global.tags.service
}

remote_state {
  backend = "azurerm"
  config = {
    subscription_id      = local.common_config.backend.devtest.subscription_id
    resource_group_name  = local.common_config.backend.devtest.resource_group_name
    storage_account_name = local.common_config.backend.devtest.storage_account_name
    container_name       = local.common_config.backend.devtest.container_name
    key                  = "state-${local.environment}"
  }
  generate = { 
    # This tells Terragrunt how to generate a Terraform file based on this HCL file
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}