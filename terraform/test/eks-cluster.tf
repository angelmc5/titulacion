module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.15.4"
    cluster_name = "myapp-eks-cluster-test"
    cluster_version = "1.27"

    cluster_endpoint_public_access  = true

    vpc_id = module.myapp-vpc.vpc_id
    subnet_ids = module.myapp-vpc.private_subnets

    tags = {
        environment = "test"
        application = "myapp"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 1
            desired_size = 1

            instance_types = ["t2.small"]
        }
    }
}
