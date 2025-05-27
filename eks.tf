provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.vpc
  cidr = var.cidr

  azs             = var.azs
  public_subnets  = var.public_availability_zone
  private_subnets = var.private_availability_zone

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"  # latest as of now

  cluster_name    = var.cluster_name
  cluster_version = "1.32"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size = var.desired_size
      max_size     = var.max_size
      min_size     = var.max_size

      instance_types = var.instance_types
      capacity_type  = var.capacity_type
    }
  }
  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
}

