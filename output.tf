#Print public ip
output "public_ip_address" {
  value = data.azurerm_public_ip.ip.ip_address
}

output "username" {
  value = var.admin_username
}

output "password" {
  value = var.admin_password
}

