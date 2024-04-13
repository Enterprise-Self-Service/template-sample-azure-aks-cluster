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
    name       = "ess_deployed"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

variable "region" {
    type = string
    default = "West Europe"
    description = "Where would you like to deploy your cluster?"
}

variable "cluster_name" {
    type = string
    description = "What would you like your cluster to be?"
}
