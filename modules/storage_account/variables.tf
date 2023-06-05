variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "resource_group_name" { type = string }

variable "location" {
  description = "The location/region where the storage account is to be created"
}

variable "service" {
  description = "The service tag"
}

variable "department" {
  description = "The department tag"
  type        = string
}

variable "environment" {
  description = "The environment tag"
  type        = string
}
