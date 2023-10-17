
###########################################################
# Grant schema roles to a functional role in Snowflake
###########################################################
resource "snowflake_role_grants" "to_role" {
  for_each  = local.rolemaps
  role_name = each.value.grantee
  roles     = each.value.role
}


###########################################################
# Grant functional role to user
###########################################################
resource "snowflake_role_grants" "to_user" {
  for_each  = local.serviceuser_rolemaps
  role_name = each.value.grantee
  users     = each.value.user
}