terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
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