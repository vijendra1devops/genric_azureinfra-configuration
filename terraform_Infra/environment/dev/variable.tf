variable "dev-rgs" {}
variable "dev-service_plans" {}
variable "dev-webapps" {}
variable "dev-vnets" {}
variable "dev-nsgs" {}
variable "dev-win-vms" {}
variable "dev-keyvaults" {}
variable "ARM_CLIENT_ID" {
  description = "Azure Service Principal Client ID"
  type        = string
  sensitive   = true
}

variable "ARM_CLIENT_SECRET" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}
variable "dev-acr" {}
variable "dev-aks-clusters" {}
variable "dev-mssql-server-with-db" {}
