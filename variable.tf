variable "location" {
  description = "Region to build into"
  default     = "australia east"

}


variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "Terraform-Week-6"
}

variable "public_vm_size" {
  type        = string
  description = "Vm-Size Config"
  default     = "Standard_B1s"
}

variable "vnet-cidr" {
  type        = string
  description = "Vnet address space(CIDR)"
  default     = "10.0.0.0/16"
}



variable "Public_subnet_name" {
  default = "Public_Subnet"
}

variable "Public_subnet_prefix" {
  default = ["10.0.1.0/24"]
}
variable "Private_subnet_name" {
  default = "Private_Subnet"
}

variable "Private_subnet_prefix" {
  default = ["10.0.2.0/24"]
}

variable "Postgres_UserName" {
  default = "postgres"
}

variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

variable "my_ip" {
  type        = string
  description = "ip user"
}