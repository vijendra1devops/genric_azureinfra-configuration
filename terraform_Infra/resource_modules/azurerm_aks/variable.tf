
variable "aks-clusters" {
  description = "Map of AKS clusters configuration."
  type = map(object({
    # Network configuration
    vnet_name           = string
    vnet_address_space  = list(string)
    location            = string
    resource_group_name = string
    tags                = map(string)
    subnets = map(object({
      subnet_name             = string
      subnet_address_prefixes = list(string)
    }))
    acr_name = string
    # Public IP configuration
    pip_name          = string
    allocation_method = string
    sku               = string
    # Application Gateway configuration
    app_gway_name                  = string
    sku_tier                       = string
    sku_name                       = string
    capacity                       = number
    gateway_ip_configuration       = string
    frontend_port_name             = string
    port                           = number
    frontend_ip_configuration_name = string
    backend_address_pool_name      = string
    backend_http_settings_name     = string
    cookie_based_affinity          = string
    protocol                       = string
    request_timeout                = number
    request_routing_rule           = string
    priority                       = number
    rule_type                      = string
    http_listener_name             = string
    # AKS Cluster configuration
    node_pool      = string
    cluster_name=string
    vm_size        = string
    node_count     = number
    dns_prefix     = string
    agis_name      = string
    network_plugin = string
    network_policy = string
    service_cidr   = string
    dns_service_ip = string
  }))
}
