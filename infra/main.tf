resource "azurerm_resource_group" "rg" {
  name     = "rg-exemplo"
  location = "East US"

  tags = {
    Environment = "Staging"
    Project     = "TerraformDemo"
  }
}