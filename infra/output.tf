# Output the Public IP Address
output "rg_name" {
  value = azurerm_resource_group.rg.name
}

# Uncomment for Section 6.4.1 - New Feature Request
// output "ip_address_1" {
//   value = aws_instance.apache2_server_1.public_ip
// }