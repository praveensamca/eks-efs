# module "efs_irsa" {
#   source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"

#   create_role = true
#   role_name   = "AmazonEKS_EFS_CSI_Driver"

#   provider_url = module.eks.oidc_provider
#   oidc_fully_qualified_subjects = [
#     "system:serviceaccount:kube-system:efs-csi-controller-sa"
#   ]

#   role_policy_arns = [
#     "arn:aws:iam::aws:policy/AmazonEFSCSIDriverPolicy"
#   ]
# }