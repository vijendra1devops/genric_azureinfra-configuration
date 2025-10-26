data "azurerm_container_registry" "data-acr" {
  for_each            = var.aks-clusters
  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "appgwy-sub-data" {
  depends_on           = [azurerm_virtual_network.vnet]
  for_each             = var.aks-clusters
  name                 = each.value.subnets.subnet2.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}
data "azurerm_subnet" "cluster-sub-data" {
  depends_on           = [azurerm_virtual_network.vnet]
  for_each             = var.aks-clusters
  name                 = each.value.subnets.subnet1.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}
data "azurerm_user_assigned_identity" "ingress" {
  depends_on          = [azurerm_kubernetes_cluster.aks]
  for_each            = var.aks-clusters
  name                = "ingressapplicationgateway-${each.value.cluster_name}"
  resource_group_name = azurerm_kubernetes_cluster.aks[each.key].node_resource_group
}
