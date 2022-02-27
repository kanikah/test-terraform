
provider "azurerm" {
  features {}

  subscription_id = "bd6ee0ff-4f06-4fe3-84e3-27aed0a21987"
  client_id       = "b3cf5a0b-55a5-4213-a1e2-f0e521d5c6a5"
  client_secret   = "y3SpWOdoDj9p6rLej99X0z~iIHDoSS1_Xz"
  tenant_id       = "6ee35b73-0893-46cb-86d7-ab62899cd7d6"
}

resource "azurerm_resource_group" "example" {
  name     = "RG1"
  location = var.loc_name
}

resource "azurerm_storage_account" "example" {
  name                     = "storage${count.index}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = var.rep_name
  count = var.servers

  tags = {
    environment = "staging"
  }
}