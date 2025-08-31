provider "aws" {
  region = "ca-central-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-eks-state1986"
    key    = "aws/opsbridge-cluster/terraform.tfstate"
    region = "ca-central-1"
  }
}