locals {
  project_type = "service"
  project_name = "rbac"
  environment  = "DEV"
  snowflake_username  = "TERRAFORM"
  snowflake_account   = "VIDEOAMP_DISNEY_CR"
  snowflake_region    = "us-east-1"
  snowflake_role      = "OKTA_PROVISIONER" 
  snowflake_rsa_key   = "SNOWFLAKE_RSA_KEY" 
  okta_path           = "secrets/v2/service/okta/dev"  

# end of local"
}    