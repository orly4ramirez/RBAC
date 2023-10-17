

data "vault_generic_secret" "okta_rbac" {
  path = local.okta_path
}

