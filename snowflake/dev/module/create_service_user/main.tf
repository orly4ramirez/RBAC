###########################################################
# Create User in Snowflake
###########################################################
resource "snowflake_user" "this" {  
  for_each       = local.serviceusers
    login_name   = each.value.login_name
    default_role = lookup(each.value, "default_role", "NONE") == "NONE" ?  "PUBLIC" : each.value.default_role
    name         = each.value.login_name
}

