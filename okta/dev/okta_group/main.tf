

# Create Okta Group
resource "okta_group" "group" {
  for_each = var.okta_groups
  name           = each.key
  description    = each.value.okta_group_description
  skip_users     = each.value.okta_group_skip_users
}

