
################################################################################
# Declare Providers in Terraform
################################################################################
terraform {
    required_providers {
        okta = {
        source  = "okta/okta"
        version = "~>3.37.0"
        }
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.21.0"
        }
        vault = {
        source  = "hashicorp/vault"
        version = "3.8.2"
        }
    }
}
provider "vault" {
  address = "https://vault.videoamp.tools"

  # auth_login {
  #   path   = "auth/aws/login"
  #   method = "aws"
  #   parameters = {
  #     role   = "atlantis" # this is the vault role
  #     type   = "iam"
  #     region = "us-east-1"
  #   }
  # }
}
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      project_type = local.project_type
      project_name = local.project_name
      environment  = local.environment
    }
  }
}

#############################################
# Configure the Okta Provider
provider "okta" {
  org_name      = local.okta_org_name
  base_url      = local.okta_base_url
  api_token     = data.vault_generic_secret.okta_rbac.data["OKTA_API_TOKEN"]
}