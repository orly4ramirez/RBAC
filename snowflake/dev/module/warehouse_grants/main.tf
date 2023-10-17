###########################################################
# Warehouse privileges
#I##########################################################
resource "snowflake_warehouse_grant" "this" {
  for_each = local.privilegemapwarehouses 
    warehouse_name      = each.value.warehouse  
    privilege           = each.value.privilege
    roles               = each.value.role
    with_grant_option   = false
    enable_multiple_grants = true       
}
