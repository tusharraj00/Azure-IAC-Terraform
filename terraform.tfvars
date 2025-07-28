resourcegroup_variables = {
  "HUB-RG-CI" = {
    resource_group_name     = "HUB-RG-CI"
    resource_group_location = "centralindia"
  }
  "SPOKE-RG-CI" = {
    resource_group_name     = "SPOKE-RG-CI"
    resource_group_location = "centralindia"
  }
}

vnet_variables = {
  "HUB-VNET01" = {
    vnet_name           = "HUB-VNET01"
    resource_group_name = "HUB-RG-CI-CI"
    vnet_location       = "centralindia"
    vnet_address_space  = ["10.0.0.0/23"]
  }

  "SPOKE1-VNET" = {
    vnet_name           = "SPOKE1-VNET"
    resource_group_name = "SPOKE-RG-CI"
    vnet_location       = "centralindia"
    vnet_address_space  = ["10.0.2.0/24"]
  }
}

subnet_variables = {
  "AzureFirewallSubnet" = {
    name                    = "AzureFirewallSubnet"
    subnet_address_prefixes = ["10.0.0.0/26"]
    virtual_network_name    = "HUB-VNET01"
    resource_group_name     = "HUB-RG-CI"
  }

  "AzureBastionSubnet" = {
    name                    = "AzureBastionSubnet"
    subnet_address_prefixes = ["10.0.0.64/26"]
    virtual_network_name    = "HUB-VNET01"
    resource_group_name     = "HUB-RG-CI"
  }
  "GatewaySubnet" = {
    name                    = "GatewaySubnet"
    subnet_address_prefixes = ["10.0.0.128/26"]
    virtual_network_name    = "HUB-VNET01"
    resource_group_name     = "HUB-RG-CI"
  }


  "app-subnet" = {
    name                    = "app-subnet"
    subnet_address_prefixes = ["10.0.2.0/26"]
    virtual_network_name    = "SPOKE1-VNET"
    resource_group_name     = "SPOKE-RG-CI"
  }

  "db-subnet" = {
    name                    = "db-subnet"
    subnet_address_prefixes = ["10.0.2.64/26"]
    virtual_network_name    = "SPOKE1-VNET"
    resource_group_name     = "SPOKE-RG-CI"
  }
}


acr_variables = {
  "tushar-acr" = {
    name                = "tusharacr"
    resource_group_name = "SPOKE-RG-CI"
    location            = "centralindia"
    sku                 = "Basic"
    admin_enabled       = false
  }
}

publicip_variables = {
  "pip01" = {
    name                = "AzureFirewall-PIP01"
    resource_group_name = "HUB-RG-CI"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
    zones               = ["2"]

  },
  "pip02" = {
    name                = "BastionHost-PIP01"
    resource_group_name = "HUB-RG-CI"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
    zones               = ["1", "2", "3"]

  }
}


AzfwPolicy_variables = {
  "azfw_policy" = {
    name                     = "HUB-AzFirewall-Policy"
    resource_group_name      = "HUB-RG-CI"
    location                 = "centralindia"
    sku                      = "Standard"
    # threat_intelligence_mode = "Off"
    # proxy_enabled            = false
    # dns_servers              = []
  }
}


vnet_peering_variables = {
  "spoke1-to-hub" = {
    vnet_name              = "SPOKE1-VNET"
    resource_group_name    = "SPOKE-RG-CI"
    remote_virtual_network = "HUB-VNET01"
    remote_resource_group  = "HUB-RG-CI"
    allow_gateway_transit  = false
    use_remote_gateways    = false
  }

  "hub-to-spoke1" = {
    vnet_name              = "HUB-VNET01"
    resource_group_name    = "HUB-RG-CI"
    remote_virtual_network = "SPOKE1-VNET"
    remote_resource_group  = "SPOKE-RG-CI"
    allow_gateway_transit  = false
    use_remote_gateways    = false
  }
}

firewall_variables = {
  "AzureFirewall" = {
    name                = "HUB-AzFirewall"
    location            = "centralindia"
    resource_group_name = "HUB-RG-CI"
    sku_name            = "AZFW_VNet"
    sku_tier            = "Standard"
    ip_config_name      = "config01"
    subnet_name         = "AzureFirewallSubnet"
    vnet_name           = "HUB-VNET01"
    vnet_rg             = "HUB-RG-CI"
    pip_name            = "AzureFirewall-PIP01"
    pip_rg              = "HUB-RG-CI"
    fw_policy_name      = "HUB-AzFirewall-Policy"
    fw_policy_rg        = "HUB-RG-CI"
    zones               = ["2"]


  }
}

bastionhost_variables = {
  "bastionhost" = {
    name                  = "BastionHost-CI"
    location              = "centralindia"
    resource_group_name = "HUB-RG-CI"
    sku                   = "Basic"
    ip_config_name        = "config-1"
    subnet_name           = "AzureBastionSubnet"
    vnet_name             = "HUB-VNET01"
    pip_name              = "BastionHost-PIP01"

  }
}