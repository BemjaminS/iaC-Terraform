
resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "ben-postgres"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  version                = "13"
  delegated_subnet_id    = azurerm_subnet.Private_Subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.default.id
  administrator_login    = var.Postgres_UserName
  administrator_password = var.admin_password
  zone                   = "1"
  storage_mb            = 32768
  sku_name              = "B_Standard_B1ms"
  backup_retention_days = 7

  depends_on = [azurerm_private_dns_zone_virtual_network_link.default]
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "fwconfig" {
  name      = "example-fw"
  server_id = azurerm_postgresql_flexible_server.postgres.id

  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
#Create Postgres firewall rule
resource "azurerm_postgresql_flexible_server_configuration" "flexible_server_configuration" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  value     = "off"
}

resource "azurerm_private_dns_zone" "default" {
  name                = "Dns-pdz.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [azurerm_subnet_network_security_group_association.private]
}

resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = "Dns-pdzvnetlink.com"
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = azurerm_resource_group.rg.name
}