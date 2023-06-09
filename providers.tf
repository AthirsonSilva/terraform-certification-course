terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "athirson"

  #   workspaces {
  #     name = "getting-started"
  #   }
  # }
}

provider "aws" {
  profile                  = "course"
  region                   = "sa-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  alias                    = "sa"
}

provider "aws" {
  profile                  = "course"
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  alias                    = "us"
}

provider "aws" {
  profile                  = "course"
  region                   = "eu-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  alias                    = "eu"
}