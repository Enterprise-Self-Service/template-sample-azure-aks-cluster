output "resource_group_name" {
  value = azurerm_resource_group.default.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name
}

output "host" {
    value = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
}

output "client_certificate" {
    value = data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate
}

output "client_key" {
    value = data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key
}

output "cluster_ca_certificate" {
    value = data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate
}