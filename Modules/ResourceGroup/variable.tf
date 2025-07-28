variable "resourcegroup_variables" {
  description = "Map of resource group variables"
  type = map(object({
    resource_group_name     = string
    resource_group_location = string
    # resource_group_tags     = map(string)
  }))
  default = {}
}
