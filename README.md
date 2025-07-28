# Azure IaC with Terraform 

This repository is created by Tushar Raj as a reference for a modular Terraform approach in Azure.
Please note that the Key Vault and NSG modules are currently under development and may not work as expected.
The rest of the modules are fully functional and can be used or referred to as needed.

If you need any help or have questions, feel free to reach out to me.(https://www.linkedin.com/in/tushar-azure-admin/)

---

## Table of Contents
- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Modules Overview](#modules-overview)
- [Contributing](#contributing)
- [License](#license)

---

## Features
- Modularized Terraform code for Azure resources
- Easy customization via variables and tfvars
- Supports Azure Container Registry, Firewall, Bastion Host, Key Vault, NSG, Public IP, Resource Group, Subnet, Virtual Network, and VNet Peering
- Output variables for integration and automation
- Follows best practices for security and maintainability

---

## Project Structure
```
Azure-IAC-Terraform-Github/
├── main.tf                # Root Terraform configuration
├── provider.tf            # Provider setup (Azure)
├── terraform.tfvars       # Variable values
├── variable.tf            # Root variables
├── Modules/               # Reusable Terraform modules
│   ├── ACR/               # Azure Container Registry
│   ├── AzureFirewall/     # Azure Firewall
│   ├── AzureFirewallPolicy/ # Firewall Policy
│   ├── BastionHost/       # Bastion Host
│   ├── keyVault/          # Key Vault
│   ├── NSG/               # Network Security Group
│   ├── PublicIp/          # Public IP
│   ├── ResourceGroup/     # Resource Group
│   ├── Subnet/            # Subnet
│   ├── VirtuaNetwork/     # Virtual Network
│   └── vnetpeering/       # VNet Peering
```

---

## Prerequisites
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure Subscription
- Git

---

## Getting Started
1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   ```
2. **Authenticate with Azure:**
   ```sh
   az login
   ```
3. **Initialize Terraform:**
   ```sh
   terraform init
   ```
4. **Review and update variables:**
   - Edit `terraform.tfvars` to set your desired values.

5. **Plan the deployment:**
   ```sh
   terraform plan
   ```
6. **Apply the configuration:**
   ```sh
   terraform apply
   ```

---

## Usage
- Modify `terraform.tfvars` or module variables as needed.
- Add or remove modules in `main.tf` to customize your infrastructure.
- Use `terraform output` to view output variables after deployment.

---

## Modules Overview
Each module in the `Modules/` directory encapsulates a specific Azure resource. Example modules include:
- **ACR**: Azure Container Registry
- **AzureFirewall**: Azure Firewall
- **AzureFirewallPolicy**: Firewall Policy
- **BastionHost**: Secure RDP/SSH access
- **keyVault**: Secure secrets management
- **NSG**: Network Security Groups
- **PublicIp**: Public IP addresses
- **ResourceGroup**: Resource Group management
- **Subnet**: Subnet configuration
- **VirtuaNetwork**: Virtual Network
- **vnetpeering**: VNet Peering

Each module contains its own `variable.tf`, main resource file, and (where applicable) `output.tf`.