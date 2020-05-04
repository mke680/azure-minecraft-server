resource "azurerm_network_security_group" "nsg" {
  name                = "vm-craftlabs-02-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-craftlabs-02"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["172.16.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  tags = {
    environment = "Production"
  }
}