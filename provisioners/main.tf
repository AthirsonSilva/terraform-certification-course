terraform {
  cloud {
    organization = "Athirson"

    workspaces {
      name = "demo"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

data "aws_vpc" "main" {
  id = "vpc-00a12dfcfe3b04bda"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer_key"
  public_key = file("~/.ssh/terraform.pub")
}

resource "aws_instace" "my_server" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "my_server"
  }
}

output "aws_instance_public_id" {
  value = aws_instance.my_server.public_ip
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description      = "HTTP for VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}