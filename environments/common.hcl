locals {
  common_config = {
    backend = {
        devtest = {
            subscription_id = "xxx"
            resource_group_name  = "rgdevtest"
            storage_account_name = "sadevtest"
            container_name       = "tfstate"
        }
        prod = {
            subscription_id = "yyy"
            resource_group_name  = "rgprod"
            storage_account_name = "saprod"
            container_name       = "tfstate"
        }
    }
  }
}
