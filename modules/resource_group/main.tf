resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    service     = var.service
    department  = var.department
    environment = var.environment
  }
}
