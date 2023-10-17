###########################################################
# Masking policy privileges
#I##########################################################
# Masking policy privileges
resource "snowflake_masking_policy_grant" "this" {
  for_each             = local.maskingpolicy_maps
  database_name        = each.value.database
  masking_policy_name  = each.value.masking_policy_name
  schema_name          = each.value.schema 
  privilege            = each.value.privilege
  roles                = each.value.role
  with_grant_option = false
  enable_multiple_grants = true     
}
