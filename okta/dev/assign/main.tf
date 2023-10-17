# lookup user
data "okta_user" "lookup_user" {
  for_each = var.okta_user_names
  search {
    name  = "profile.login"
    value = each.key
  }
}
# lookup group
data "okta_group" "lookup_group" {
    name = var.group_name
}
# Lookup Okta application
data "okta_app" "lookup_app" {
  label = var.app_name
}


# Assign Group to an Application
resource "okta_app_group_assignment" "assign_group_to_app" {
  app_id = data.okta_app.lookup_app.id
  group_id = data.okta_group.lookup_group.id
}
# Assign User to an Application
resource "okta_app_user" "assign_user_to_app" {
  app_id = data.okta_app.lookup_app.id
  for_each = data.okta_user.lookup_user
  user_id   = each.value.id
  username  = each.key
    depends_on = [
        okta_group_memberships.user_to_group
    ]
}
# Assign user to Group
resource "okta_group_memberships" "user_to_group" {
  for_each = data.okta_user.lookup_user
  group_id = data.okta_group.lookup_group.id
  users  = [each.value.id]
}