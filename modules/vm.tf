

#Create public availability set
resource "azurerm_availability_set" "availability_set1" {
  name                = "public-aset"
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5

}


# Create a Linux virtual machine 1
resource "azurerm_virtual_machine" "vm" {
  name                  = "Vm1"
  location              = var.location
  resource_group_name   = var.resource_group_name
  availability_set_id   = azurerm_availability_set.availability_set1.id
  network_interface_ids  = [var.network_interface_ids[0]]
  vm_size               = var.public_vm_size
  #count = length(var.network_interface_ids)

  storage_os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_profile {
    computer_name  = "Vm1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}




# Create a Linux virtual machine 2
resource "azurerm_virtual_machine" "vm2" {
  name                  = "Vm2"
  location              = var.location
  resource_group_name   = var.resource_group_name
  availability_set_id   = azurerm_availability_set.availability_set1.id
  network_interface_ids  = [var.network_interface_ids[1]]
  vm_size               = var.public_vm_size
  #count = length(var.network_interface_ids)

  storage_os_disk {
    name              = "myOsDisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_profile {
    computer_name  = "Vm2"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


# Create a Linux virtual machine 3
resource "azurerm_virtual_machine" "vm3" {
  name                  = "Vm3"
  location              = var.location
  resource_group_name   = var.resource_group_name
  availability_set_id   = azurerm_availability_set.availability_set1.id
  network_interface_ids  = [var.network_interface_ids[2]]
  vm_size               = var.public_vm_size
  #count = length(var.network_interface_ids)

  storage_os_disk {
    name              = "myOsDisk3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_profile {
    computer_name  = "Vm3"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}