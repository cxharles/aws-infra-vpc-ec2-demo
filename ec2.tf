data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id# Ubuntu 22.04 LTS in us-east-1
  instance_type               = "t2.medium"
  key_name                    = "charlesjatto"
  associate_public_ip_address = true
  security_groups             = ["sg-01262f2f8606e02de"]
  subnet_id                   = "subnet-06f602316819ea07f"
  tags = {
    Name        = var.project
    Description = "Managed by terraform"
  }
}

output "public_dns" {
  value = aws_instance.this.public_dns
}