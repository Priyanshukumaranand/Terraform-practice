module "eks" {
  #import module template
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  #cluster info (Control plane )
  name                   = "${local.name}-vpc"
  kubernetes_version     = "1.33"
  endpoint_public_access = true
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.vpc.private_subnets

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  #   enable_cluster_creator_admin_permissions = true

  #   compute_config = {
  #     enabled    = true
  #     node_pools = ["general-purpose"]
  #   }


  control_plane_subnet_ids = module.vpc.intra_subnets

  addons = {
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
  }
  # EKS Managed Node Group(s)
  # attach_cluster_primary_security_group = true
  eks_managed_node_groups = {

    tws_cluster = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups

      instance_types = ["t3.micro"]
      ami_type       = "AL2023_x86_64_STANDARD"

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }


  }

  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
