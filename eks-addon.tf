resource "aws_eks_addon" "efs_csi" {
  cluster_name             = var.cluster_name
  addon_name               = "aws-efs-csi-driver"
  addon_version            = var.efs_csi_addon_version # Optional: get latest via data source if needed
  service_account_role_arn = aws_iam_role.efs_csi_driver_role.arn

  tags = {
    "terraform" = "true"
    "addon"     = "efs-csi"
  }


  timeouts {
    create = "2m"
    update = "2m"
    delete = "2m"
  }
}