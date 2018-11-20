

resource "azurerm_resource_group" "rg" {
  name     = "thomas-test-deleteme"
  location = "East US"
  tags {
    environment = "thomas/test"
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "thomassadeleteme"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_account" "sa2" {
  name                     = "thomassadeleteme2"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}


resource "azurerm_monitor_activity_log_alert" "logalert" {
  name                = "sa-Delete2"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  scopes              = ["/subscriptions/0fbf2902-88ee-416e-a94a-40846db5f2f8/resourceGroups/thomas-test-deleteme"]
  description         = "Alert for monitoring storage account test."

  criteria {
    resource_id    = "/subscriptions/0fbf2902-88ee-416e-a94a-40846db5f2f8/resourceGroups/thomas-test-deleteme/providers/Microsoft.Storage/storageAccounts/thomassadeleteme"
    operation_name = "Microsoft.Storage/storageAccounts/Delete"
    category       = "Administrative"
  }

  action {
    action_group_id = "/subscriptions/0fbf2902-88ee-416e-a94a-40846db5f2f8/resourceGroups/thomas-test-deleteme/providers/microsoft.insights/actionGroups/tjb-test"

    webhook_properties {
      from = "terraform"
    }
  }
}

