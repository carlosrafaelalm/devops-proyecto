resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment}-devops"
  location = var.location
  tags = {
    environment = var.environment
    project     = "devops-academia"
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.environment}-devops"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_storage_account" "main" {
  name                     = lower("st${var.environment}${substr(md5(azurerm_resource_group.main.id), 0, 6)}")
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.environment}-devops"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-${var.environment}-devops"
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_D2pds_v6"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
    project     = "devops-academia"
  }
}