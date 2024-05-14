terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "joeyrg" {
   name     = "testing-rg"
   location = "UK South"
 }
 resource "azurerm_virtual_network" "joeyvnet" {
   name                = "testing-vnet"
   address_space       = ["10.0.0.0/16"]
   location            = azurerm_resource_group.Joeyrg.location
   resource_group_name = azurerm_resource_group.Joeyrg.name
 }
 resource "azurerm_subnet" "joeysubnet" {
   name                 = "testing-sub"
   resource_group_name  = azurerm_resource_group.joeyrg.name
   virtual_network_name = azurerm_virtual_network.joeyvnet.name
   address_prefixes     = ["10.0.2.0/24"]
 }