# Configure new Okta Users
module "create_new_okta_user" {
    providers = {
        okta = okta
    }
    source      = "./okta_user"
    okta_user_names = local.okta_add_users_map
}