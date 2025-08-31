aws eks update-kubeconfig --region eu-central-1 --name dev-cluster

$ eksctl get cluster dev-cluster
NAME   VERSION STATUS CREATED   VPC   SUBNETS          SECURITYGROUPS  PROVIDER
dev-cluster 1.27 ACTIVE 2023-08-26T08:51:50Z vpc-1 subnet-1,subnet-2,subnet-3 sg-1 EKS