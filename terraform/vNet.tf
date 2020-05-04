resource "azurerm_network_security_group" "nsg" {
  name                = "VM-CRAFTLABS-01-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["172.16.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  ddos_protection_plan {
    #id     = azurerm_network_ddos_protection_plan.ddos.id
    enable = false
  }

  subnet {
    name           = "default"
    address_prefix = "172.16.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  tags = {
    environment = "Production"
  }
}