output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "Nombre del Resource Group"
}

output "storage_account_name" {
  value       = azurerm_storage_account.main.name
  description = "Nombre del Storage Account"
}

output "vnet_id" {
  value       = azurerm_virtual_network.main.id
  description = "ID de la Virtual Network"
}

output "aks_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "Nombre del clúster AKS"
}

output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
