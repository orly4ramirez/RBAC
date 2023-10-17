###########################################################
# Create Role in Snowflake
###########################################################
resource "snowflake_role" "this" {
  for_each  = local.roles
  # comment   = var.comment
  name      = each.value
}
