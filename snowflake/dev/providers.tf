
################################################################################
# Declare Providers in Terraform
################################################################################
terraform {
  required_version = "1.3.7"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.55.1"
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
# Configure the Snowflake Provider
provider "snowflake" {
  username    = local.snowflake_username
  account     = local.snowflake_account
  region      = local.snowflake_region
  role        = local.snowflake_role
  private_key = data.vault_generic_secret.okta_rbac.data[local.snowflake_rsa_key]
}

