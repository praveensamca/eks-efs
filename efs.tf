resource "aws_efs_file_system" "efs" {
  creation_token = "frompraveen"
  encrypted      = true
  throughput_mode = "bursting"

}
#, module.vpc.private_subnets
locals {
  indexed_tuple = { for idx, val in concat(module.vpc.private_subnets) : idx => val }
}

resource "aws_efs_mount_target" "efs_mount_targets" {
  for_each = local.indexed_tuple
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = each.value
  security_groups = [aws_security_group.efs_sg.id]
}