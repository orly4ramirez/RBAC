# Create Okta User  
resource "okta_user" "user" {
  for_each = var.okta_user_names
  first_name           = each.value.first_name
  last_name            = each.value.last_name
  login                = each.key
  email                = each.value.email
  password_inline_hook = each.value.password_inline_hook
}


