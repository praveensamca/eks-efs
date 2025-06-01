resource "aws_security_group" "efs_sg" {
  name        = "efs-security-group"
  description = "Allow NFS traffic for EFS"
  vpc_id      = module.vpc.vpc_id # 🔁 Replace with your actual VPC ID

  ingress {
    description = "Allow NFS from within VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.cidr] # 🔁 Use your VPC CIDR block or EC2 CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "efs-sg"
  }
}