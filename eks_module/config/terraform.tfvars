aws_eks_cluster_config = {

      "my-cluster" = {

        eks_cluster_name         = "dev-cluster"
        eks_subnet_ids = ["subnet-a","subnet-b","subnet-c"]
        tags = {
             "Name" =  "dev-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "dev-cluster"
        node_group_name          = "devnode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-03c2e8983699847c0","subnet-035d4637087a1d1ee","subnet-04f47fe506b742e69"]

        tags = {
             "Name" =  "node1"
         } 
  }
}