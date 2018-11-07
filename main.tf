resource "azurerm_resource_group" "rg" {
  name     = "thomas-test-deleteme"
  location = "East US"
  tags {
    environment = "thomas/test"
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "thomas-test-sa-deleteme"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}