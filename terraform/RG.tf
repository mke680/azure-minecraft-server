provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
  subscription_id = "faaae9cc-6d6c-4370-adab-afc917594c0d"
}

resource "azurerm_resource_group" "rg" {
  name     = "SR-CRAFTLAB-01"
  location = "australiaeast"
}