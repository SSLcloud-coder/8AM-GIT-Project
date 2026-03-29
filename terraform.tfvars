# Configuration file for Terraform variables

resource_group_name = "rg-vm-terraform"
location            = "eastus"
vm_name             = "vm-terraform"
vm_size             = "Standard_B2s"
admin_username      = "azureuser"
ssh_public_key_path = "~/.ssh/id_rsa.pub"

address_space           = ["10.0.0.0/16"]
subnet_address_prefix   = ["10.0.1.0/24"]

tags = {
  environment = "dev"
  managed_by  = "terraform"
  project     = "vm-deployment"
}
