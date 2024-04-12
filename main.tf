resource "azurerm_resource_group" "default" {
  name     = "testcluster"
  location = "polandcentral"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "testcluster"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "test-cluster"

  default_node_pool {
    name       = "test"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}