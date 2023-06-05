variable "resource_group_name" { type = string }

variable "location" {
  description = "The location/region where the storage account is to be created"
  type        = string
}

variable "service" {
  description = "The service tag"
}

variable "department" {
  description = "The department tag"
}

variable "environment" {
  description = "The department tag"
}
