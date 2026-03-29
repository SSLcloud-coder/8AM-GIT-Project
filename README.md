# Azure VM Terraform Configuration

This Terraform configuration creates an Ubuntu Linux virtual machine on Microsoft Azure with the following resources:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group (with SSH, HTTP, and HTTPS rules)
- Public IP Address
- Network Interface
- Linux Virtual Machine

## Prerequisites

1. **Terraform** installed (v1.0 or later)
2. **Azure CLI** installed and authenticated
3. **SSH Key Pair** - Generate if you don't have one:
   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
   ```

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Review the plan
```bash
terraform plan
```

### 3. Apply the configuration
```bash
terraform apply
```

### 4. Connect to the VM
After deployment, use the SSH command provided in the outputs:
```bash
ssh -i ~/.ssh/id_rsa azureuser@<public_ip_address>
```

## Configuration Variables

Edit `terraform.tfvars` to customize:

- `resource_group_name` - Azure resource group name
- `location` - Azure region (e.g., eastus, westus, canadacentral)
- `vm_name` - Name of the virtual machine
- `vm_size` - Azure VM size (e.g., Standard_B2s, Standard_B2ms)
- `admin_username` - SSH admin user
- `ssh_public_key_path` - Path to your public SSH key
- `tags` - Resource tags for organization

## VM Sizes

Common Azure VM sizes:
- `Standard_B1s` - 1 vCPU, 1 GB RAM (budget)
- `Standard_B2s` - 2 vCPU, 4 GB RAM (recommended for small workloads)
- `Standard_B2ms` - 2 vCPU, 8 GB RAM (moderate workloads)
- `Standard_B4ms` - 4 vCPU, 16 GB RAM (higher performance)

## Outputs

After successful deployment, Terraform will output:
- `public_ip_address` - Public IP to connect to the VM
- `private_ip_address` - Private IP within the VNet
- `ssh_command` - Ready-to-use SSH connection command
- `vm_id` - Azure resource ID of the VM
- `vm_name` - Name of the created VM

## Security Considerations

The Network Security Group allows:
- SSH (port 22) from anywhere - **Consider restricting this to your IP**
- HTTP (port 80) from anywhere
- HTTPS (port 443) from anywhere

To restrict SSH access, modify the security rule in `main.tf`:
```hcl
source_address_prefix = "YOUR_IP/32"  # Replace with your IP
```

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Troubleshooting

- **SSH key not found**: Ensure the path in `terraform.tfvars` is correct
- **Authentication failed**: Check Azure CLI login status with `az account show`
- **Quota exceeded**: Check your Azure subscription limits

## Support

For more information:
- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Virtual Machines Documentation](https://docs.microsoft.com/azure/virtual-machines/)
