terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
     }
   backend "azurerm" {
      resource_group_name  = "gitlab-backend-rg"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
      storage_account_name = "backendstg12"                # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
      container_name       = "my-cnt"                         # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
      key                  = "terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    }

}


provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    
  }
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
  subscription_id = var.ARM_SUBSCRIPTION_ID
 
}

provider "random" {
 
}

