################################################################################
# s3 backend
################################################################################

terraform {
  backend "s3" {
    bucket  = "videoamp-terraform-state"
    key     = "atlantis/service/snowflake/dev/identity/terraform.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}