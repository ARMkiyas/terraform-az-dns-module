terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.1.0"
    }
  }
  required_version = ">= 1.1.0"

}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  # skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}


# create the public and private DNS zones in existing resource group
resource "azurerm_dns_zone" "public_dns_zone" {
  count               = var.create_dns_zone && !var.private_dns_zone ? 1 : 0
  name                = var.zone_name
  resource_group_name = var.resource_group_name
  tags                = var.zone_tags


}

resource "azurerm_private_dns_zone" "private_dns_zone" {
  count               = var.create_dns_zone && var.private_dns_zone ? 1 : 0
  name                = var.zone_name
  resource_group_name = var.resource_group_name
  tags                = var.zone_tags

}





