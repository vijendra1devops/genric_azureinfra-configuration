dev-rgs = {
rg1 = {
    name     = "rg-vijendra1"
    location = "central India"
    tags     = { environment = "dev" }
  }
rg2 = {
    name     = "rg-vijendra2"
    location = "westeurope"
    
  }
}
dev-service_plans = {
  service_plans1={
  webapp-sp_name = "vijendrasp01"
 resource_group_name = "rg-vijendra1"
  location            = "Central India"
  sku_name             = "S1"
    os_type             = "Windows"
  }
}

dev-webapps = {
  webapp1 = {
    webapp_name         = "vijendrawebapp1"
    resource_group_name = "rg-vijendra1"
    location            = "Central India"
    webapp-sp_name = "vijendrasp01"
    service_plan_rg           = "rg-vijendra1"
    https_only               = true
    client_affinity_enabled  = false
    always_on                = true
    use_32_bit_worker        = false
    ftps_state               = "FtpsOnly"
    minimum_tls_version      = "1.2"
    # scm_type                 = "LocalGit"
    # health_check_path        = "/health"
    identity_type            = "SystemAssigned"
    WEBSITE_RUN_FROM_PACKAGE = "1"
    app_settings_environment = "dev"
    enviroment               = "dev"
    project                  = "demo-app"
  }
 }

dev-vnets = {
vnet1 = {
    name                = "vnet-vijendra1"
    location            = "Central India"
    resource_group_name = "rg-vijendra2"
    address_space       = ["10.0.0.0/16"]
    # dns_servers         = ["8.8.8.8", "8.8.4.4"]

    subnets = [
      {
        name             = "subnet-app"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "subnet-db"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

dev-win-vms = {
  vm1 = {
    vm_name              = "winvm01"
    location             = "Central India"
    resource_group_name  = "rg-vijendra2"
    size                 = "Standard_B2ms"

    # Optional (can be skipped if using default)
    allocation_method             = "Static"
    private_ip_address_allocation = "Dynamic"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"

    subnet_name          = "subnet-app"
    virtual_network_name = "vnet-vijendra1"
    nsg_name             = "nsg-windows"

    kv_name              = "kv-vijendra01"
  }
 }
dev-keyvaults = {
  kv1 = {
    name                       = "kv-vijendra01"
    location                   = "Central India"
    resource_group_name        = "rg-vijendra2"
    sku_name                   = "standard"

    soft_delete_retention_days = 7
    purge_protection_enabled   = false

    key_permissions         = ["Get", "List", "Create"]
    secret_permissions      = ["Get", "Set", "List", "Delete"]
    storage_permissions     = ["Get", "Set"]
    certificate_permissions = ["Get", "List"]
  }
    # Optional fields (use defaults if not provided)
    # key_permissions         = ["Get"]
    # secret_permissions      = ["Get", "List"]
    # certificate_permissions = []
  }

dev-nsgs = {
  nsg-app = {
    name                = "nsg-windows"
    location            = "Central India"
    resource_group_name = "rg-vijendra2"

    security_rules = [{
      # {
      #   name                       = "allow-http"
      #   priority                   = 110
      #   direction                  = "Inbound"
      #   access                     = "Allow"
      #   protocol                   = "Tcp"
      #   source_port_range          = "*"
      #   destination_port_range     = "80"
      #   source_address_prefix      = "*"
      #   destination_address_prefix = "*"
      # }
      # {
        name                       = "allow-RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix   = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

dev-acr = {
  dev-acr1 = {
    name                = "devacrgreenvasu1"
    resource_group_name = "dev-rg-greenvasu"
    location            = "Central India"
    sku                 = "Standard"
    tags = {
      environment = "dev"
      owner       = "greenvasuteam"
      application = "greenvasu"
      region      = "Central India"
      project     = "greenvasu"
} } }

dev-aks-clusters = {
  cluster = {
    vnet_name          = "dev-vnet-greenvasu-aks"
    vnet_address_space = ["10.0.0.0/8"]
    subnets = {
      subnet1 = {
        subnet_name             = "subnet-aks"
        subnet_address_prefixes = ["10.1.0.0/16"]
      }
      subnet2 = {
        subnet_name             = "ApplicationGateway"
        subnet_address_prefixes = ["10.3.0.0/16"]
      }
    }
    resource_group_name = "dev-rg-greenvasu"
    location            = "Central India"
    tags = {
      environment = "dev"
      owner       = "greenvasuteam"
      application = "greenvasu"
      region      = "Central India"
      project     = "greenvasu"
    }


    # Public IP configuration
    acr_name          = "devacrgreenvasu1"
    pip_name          = "dev-pip-greenvasu"
    allocation_method = "Static"
    sku               = "Standard"
    # Application Gateway configuration
    port                           = 80
    protocol                       = "Http"
    request_timeout                = 60
    cookie_based_affinity          = "Disabled"
    priority                       = 1
    rule_type                      = "Basic"
    tier                           = "Standard_v2"
    capacity                       = 2
    app_gway_name                  = "dev-app-gway-greenvasu"
    sku_tier                       = "Standard_v2"
    sku_name                       = "Standard_v2"
    gateway_ip_configuration       = "gway-ip-app-gway-greenvasu"
    frontend_port_name             = "fend-port-app-gway-greenvasu"
    frontend_ip_configuration_name = "fend-ip-app-gway-greenvasu"
    backend_address_pool_name      = "bend-pool-app-gway-greenvasu"
    backend_http_settings_name     = "bend-http-app-gway-greenvasu"
    request_routing_rule           = "bend-http-app-gway-greenvasu"
    http_listener_name             = "greenvasu"
    # AKS Cluster configuration
    cluster_name = "dev-aks-cluster-greenvasu"
    dns_prefix   = "aks1"
    node_count   = 2
    node_pool    = "greenvasu"
    vm_size      = "Standard_DS2_v2"


    agis_name      = "agic-aks"
    network_plugin = "azure"
    network_policy = "calico"
    service_cidr   = "10.2.0.0/16"
    dns_service_ip = "10.2.0.10"
  }

}

dev-mssql-server-with-db = {
  "mssql-server-1" = {
    sql_server_name              = "dev-greenvasu-server"
    resource_group_name          = "dev-rg-greenvasu"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "greenvasu"
    administrator_login_password = "GreenVasu@123!"
    minimum_tls_version          = "1.2"
    firewall_rule                = "allow-access-to-azure-services"
    db_name                      = "dev-greenvasu-database"
    storage_account_type         = "Local"
    tags = {
      environment = "dev"
      owner       = "greenvasuteam"
      application = "greenvasu"
      region      = "Central India"
      project     = "greenvasu"
    }
  }
}

