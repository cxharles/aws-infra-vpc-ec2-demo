project        = "akudev"
env            = "prod"
region         = "ca-central-1"
cidr_block     = "10.0.0.0/16"
public_subnets = ["10.0.32.0/20", "10.0.96.0/20", "10.0.160.0/20"]
azs            = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
vpn_cidr_block = ["70.53.99.161/32"]