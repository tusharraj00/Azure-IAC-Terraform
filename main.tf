
module "ResourceGroup" {
  source                  = "./Modules/ResourceGroup"
  resourcegroup_variables = var.resourcegroup_variables

}

module "Vnet" {
  source         = "./Modules/VirtuaNetwork"
  vnet_variables = var.vnet_variables

  depends_on = [module.ResourceGroup]
}

module "public_ip" {
  source             = "./Modules/PublicIp"
  publicip_variables = var.publicip_variables

  depends_on = [module.ResourceGroup]
}

module "subnet" {
  source           = "./Modules/Subnet"
  subnet_variables = var.subnet_variables
  depends_on       = [module.Vnet, module.ResourceGroup]
}

module "acr" {
  source        = "./Modules/ACR"
  acr_variables = var.acr_variables

  depends_on = [module.ResourceGroup]

}

module "AzureFirewallPolicy" {
  source               = "./Modules/AzureFirewallPolicy"
  AzfwPolicy_variables = var.AzfwPolicy_variables

  depends_on = [module.ResourceGroup]
}

module "vnetpeering" {
  source                 = "./Modules/vnetpeering"
  vnet_peering_variables = var.vnet_peering_variables

  depends_on = [module.Vnet]

}

module "AzureFirewall" {
  source             = "./Modules/AzureFirewall"
  firewall_variables = var.firewall_variables

  depends_on = [module.ResourceGroup, module.Vnet, module.subnet, module.public_ip, module.AzureFirewallPolicy]
}

module "BastionHost" {
  source                = "./Modules/BastionHost"
  bastionhost_variables = var.bastionhost_variables

  depends_on = [ module.ResourceGroup, module.Vnet, module.public_ip, module.subnet ]
}