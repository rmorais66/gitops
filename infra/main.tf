resource "azurerm_resource_group" "rg" {
  name     = "rg-free-vm"
  location = "East US"

  tags = {
    Environment = "Staging"
    Project     = "TerraformDemo"
  }
}

# Public IP (para acesso SSH)
resource "azurerm_public_ip" "pip" {
  name                = "pip-free-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}

# Network Interface (inclui subnet mínima criada automaticamente)
resource "azurerm_network_interface" "nic" {
  name                = "nic-free-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "default" # Subnet mínima criada automaticamente
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# VM Linux Free Tier
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-free-tier"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}