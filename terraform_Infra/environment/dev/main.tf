module "module-rg" {
  source = "../../resource_modules/azurerm-resource_group"
  rgs    = var.dev-rgs
}

module "module-app-service_plans" {
  depends_on = [ module.module-rg ]
  source = "../../resource_modules/azurerm-service_plan"
  service_plans = var.dev-service_plans
}

module "module-webapp" {
  depends_on = [ module.module-rg, module.module-app-service_plans ]
  source = "../../resource_modules/azurerm-webapp"
  webapps = var.dev-webapps
}
module "module-vnets" {
  depends_on = [module.module-nsgs]
  source     = "../../resource_modules/azurerm-vnets"
  vnets      = var.dev-vnets

}
module "module-nsgs" {
  depends_on = [ module.module-rg ]
  source = "../../resource_modules/azurerm-nsgs"
  nsgs = var.dev-nsgs
}
# module "module-asgs" {
#   depends_on = [ module.module-rg ]
#   source = "../../modules/azurerm-asgs"
#   asgs = var.dev-asgs
# }
module "module-win-vms" {
  
  depends_on = [ module.module-vnets,module.module-keyvaults ] #module.var.dev-asgs 
  source = "../../resource_modules/azurerm-win-vms"
  window-vms = var.dev-win-vms
}
# module "module-bastions" {
#   depends_on = [ module.module-vnets ]
#   source = "../../modules/azurerm-bastions"
#   bastions = var.dev-bastions
# }
module "module-keyvaults" {
  depends_on = [ module.module-rg ]
  source = "../../resource_modules/azurerm-keyvault"
  keyvaults = var.dev-keyvaults
}

# module "module-linux-vms" {
  
#   depends_on = [ module.module-vnets,module.module-keyvaults ]#module.var.dev-asgs 
#   source = "../../modules/azurerm-linux-vms"
#   linux-vms=var.dev-linux-vms
# }
