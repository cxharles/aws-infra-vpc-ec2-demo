# Terraform vpc introduction

# This repository is Terraform project for article: https://aku.dev/terraform-vpc-introduction/

terraform {
  backend "local" {
    path          = "terraform.tfstate"
    workspace_dir = "workspace"
  }
}

terraform init
terraform workspace new dev # Do same thing in # prod terraform workspace new prod

.
├── dev.tfvars
├── ec2.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── workspace
    └── dev

---

# recreate both dev and prod tfvars them move it to the vars folder
mkdir vars
mv dev.tfvars vars
mv prod.tfvars vars

terraform plan -var-file=vars/dev.tfvars
terraform apply -var-file=vars/dev.tfvars -auto-approve

# Create vars/prod.tfvars
project        = "akudev"
env            = "prod"
region         = "ap-southeast-1"
cidr_block     = "10.0.0.0/16"
public_subnets = ["10.0.32.0/20", "10.0.96.0/20", "10.0.160.0/20"]
azs            = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
vpn_cidr_block = ["203.81.204.171/32"]

.
├── ec2.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── vars
│   ├── dev.tfvars
│   └── prod.tfvars
└── workspace
    ├── dev
    │   └── terraform.tfstate
    └── prod
        └── terraform.tfstate
4 directories, 10 files

terraform workspace new prod
terraform workspace select prod
terraform plan -var-file=vars/prod.tfvars
terraform apply -var-file=vars/prod.tfvars -auto-approve

terraform apply -var-file=vars/dev.tfvars -auto-approve

# Create the key pair manually (CLI):
aws ec2 create-key-pair \
  --key-name <name of key> \
  --query "KeyMaterial" \
  --output text > charlesjatto.pem
chmod 400 charlesjatto.pem

curl ifconfig.me

ssh -i "charlesjatto.pem" ubuntu@ec2-15-222-11-22.ca-central-1.compute.amazonaws.com