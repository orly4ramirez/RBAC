
##################################################################
# Okta
##################################################################
# Assign okta user to okta group (Functional role) and application (snowflake)
module "assign_user_to_group" {
    source          = "./assign"
    for_each        = local.assign

    okta_user_names = each.value.employees
    group_name      = each.value.groupname
    app_name        = each.value.app
}
