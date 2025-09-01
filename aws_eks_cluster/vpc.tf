module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "dev-vpc"
  cidr = "10.1.0.0/16"

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.1.64.0/20", "10.1.96.0/20", "10.1.128.0/20"]
  public_subnets  = ["10.1.0.0/20", "10.1.32.0/20", "10.1.160.0/20"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
