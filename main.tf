resource "azurerm_resource_group" "default" {
  name     = "aks"
  location = var.region
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.cluster_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = "essdeployed"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}



data "azurerm_kubernetes_cluster" "credentials" {
  name                = azurerm_kubernetes_cluster.default.name
  resource_group_name = azurerm_resource_group.default.name
}