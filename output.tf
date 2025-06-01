
### Added for trouble shooting , feel free to disable if it's annoying

output "vpc" {
    value = module.vpc.vpc_id
}

output "subnet" {
    value = module.vpc.private_subnets
}

output "subnet_public" {
    value = module.vpc.public_subnets
}

output "eks" {
    value = module.eks.cluster_security_group_id
}

output "subnets" {
    value = concat(module.vpc.public_subnets, module.vpc.private_subnets)
}

output "oidc" {
    value = module.eks.oidc_provider
}

output "efs_fs" {
    value = aws_efs_file_system.efs.id
}