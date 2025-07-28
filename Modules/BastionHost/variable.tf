variable "bastionhost_variables" {
  type = map(object({
    name                  = string
    location              = string
    sku                    = string
    resource_group_name = string
    ip_config_name        = string
    subnet_name           = string
    vnet_name             = string
    pip_name              = string
  }))
  default = {}
}