# Configure new Okta Group
module "create_new_okta_group" {
    source              = "./okta_group" 
    okta_groups    = local.okta_group_names   
}