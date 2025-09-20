# Azure Network Security Rule definition
resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = var.rule_name
  priority                    = var.priority       # Ex: 100
  direction                   = var.direction      # "Inbound" ou "Outbound"
  access                      = var.access         # "Allow" ou "Deny"
  protocol                    = var.protocol       # "Tcp", "Udp", "*" 
  source_port_range           = "*"
  destination_port_range      = "${var.from_port}-${var.to_port}"
  source_address_prefixes     = var.source_cidrs   # lista de CIDRs
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
}