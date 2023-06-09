module "vpc" {
  // Source of the module
  source = "terraform-aws-modules/vpc/aws"
  providers = {
    aws = aws.sa
  }

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  // Availability Zones
  azs = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]

  // CIDR Blocks for Subnets (must be within VPC CIDR block)
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  // NAT gateway on public subnets (default true)
  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}