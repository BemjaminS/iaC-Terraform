resource "azurerm_postgresql_flexible_server_database" "default" {
  name      = "APFSD-db"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "en_US.UTF8"
  charset   = "UTF8"
}