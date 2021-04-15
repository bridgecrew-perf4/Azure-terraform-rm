data "azurerm_resource_group" "main" {
  name = "${var.rgName}"

}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.region}"
  resource_group_name = "${data.azurerm_resource_group.main.name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "${data.azurerm_resource_group.main.name}"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = "${data.azurerm_resource_group.main.name}"
  location            = "${var.region}"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = "${data.azurerm_resource_group.main.name}"
  location                        = "${var.region}"
  admin_username                  = "adminuser"
  admin_password                  = "${var.password}"
  size                            = "Standard_F2"

  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]



  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  
 tags = {
    environment = "Production"
    name       = "${var.projectname}"
   teamName.   = "${var.teamName}"
    

}
