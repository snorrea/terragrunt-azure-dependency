locals {
  environment = "dev"
  common_config = read_terragrunt_config(find_in_parent_folders("common.hcl")).locals.common_config
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

  # Hacky workaround to address this issue: https://github.com/gruntwork-io/terragrunt/issues/1330
  disable_dependency_optimization = true 
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
    provider "azurerm" {
      subscription_id = "${local.common_config.backend.devtest.subscription_id}"
      features {}
    }
  EOF
}
