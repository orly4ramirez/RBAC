###########################################################
# DB
###########################################################
# create db
resource "snowflake_database" "this" {
  for_each = local.databases
  name     = each.value 
}
