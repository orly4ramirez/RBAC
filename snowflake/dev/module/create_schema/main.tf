###########################################################
# Schema
###########################################################
# create schema
resource "snowflake_schema" "this" {
  for_each            = local.schemas
  database            = each.value.database
  name                = each.value.schema
  is_managed          = true
}

