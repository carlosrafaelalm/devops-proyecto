terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatedevops2911"
    container_name       = "tfstate"
    key                  = "devops-academia.tfstate"
  }
}

provider "azurerm" {
  features {}
}