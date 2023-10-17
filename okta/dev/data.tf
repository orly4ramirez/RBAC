# Get Platform Remote State
# data "terraform_remote_state" "rbac" {
#   backend = "s3"
#   config = {
#     bucket  = "videoamp-terraform-state"
#     key     = "atlantis/service/okta/${local.environment}/terraform.tfstate"
#     region  = "us-east-1"
#     encrypt = "true"
#   }
# }

data "vault_generic_secret" "okta_rbac" {
  path = local.okta_path
}
