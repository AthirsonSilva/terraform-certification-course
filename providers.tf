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
}
