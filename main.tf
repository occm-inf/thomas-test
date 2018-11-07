resource "azurerm_resource_group" "rg" {
  name     = "thomas-test-deleteme"
  location = "East US"
  tags {
    environment = "thomas/test"
  }
}