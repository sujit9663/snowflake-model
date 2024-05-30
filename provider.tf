terraform {
  required_version = ">= 1.5.5"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "snowflake" {
  role     = "SYSADMIN"
  account  = var.account
  region   = var.region
  user     = "SUGHADEI"
  password = "Sujitraja@9663"
  alias    = "sysadmin"

}
provider "snowflake" {
  role     = "SECURITYADMIN"
  account  = var.account
  region   = var.region
  user     = "SUGHADEI"
  password = "Sujitraja@9663"
  alias    = "securityadmin"

}
provider "snowflake" {
  role     = "ACCOUNTADMIN"
  account  = var.account
  region   = var.region
  user     = "SUGHADEI"
  password = "Sujitraja@9663"
  alias    = "accountadmin"

}
