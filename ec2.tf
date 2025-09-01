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
  count                       = 2 # only launch in supported AZs
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.medium"
  key_name                    = "charlesjatto"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.default_public.id]

  # Only subnets in ca-central-1a and ca-central-1b
  subnet_id = element([
    "subnet-0dd079503e5205580", # ca-central-1a
    "subnet-0c1240ea729cce9b2"  # ca-central-1b
  ], count.index)

  tags = {
    Name        = "${var.project}-${count.index}"
    Description = "Managed by terraform"
  }
}

output "public_dns" {
  value = aws_instance.this[*].public_dns
}
